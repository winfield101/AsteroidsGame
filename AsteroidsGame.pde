SpaceShip bob;
Star[] galaxy;

ArrayList <Asteroid> rocks;
int numberAsteroids = 50;

public void setup() {
  size(600,600);
 bob = new SpaceShip();

 galaxy = new Star[100];
 for (int i = 0; i < galaxy.length; i++) {
    galaxy[i] = new Star();
 }
 rocks = new ArrayList <Asteroid>();
 for (int i = 0; i < numberAsteroids; i++) {
    rocks.add(new Asteroid());
    rocks.get(i).accelerate(Math.random() * 0.5);    
 }

}
public void draw()

{
 background(0,25,25);
 for (int i = 0; i < galaxy.length; i++) {
    galaxy[i].show();
 }

 bob.move();
 bob.show();

 for (int i = 0; i < rocks.size(); i++) {
    rocks.get(i).show();
    rocks.get(i).rotate(1);
    rocks.get(i).move();
 }
 for (int i = rocks.size() - 1; i >= 0; i--) {
    if (dist(bob.getX(), bob.getY(), rocks.get(i).getX(), rocks.get(i).getY()) <= 16) {
     rocks.remove(i);
    }
 }

}

public void keyPressed()
{
  if (key == 'p') //hyperspace

  {
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
    bob.setDirectionX(0.0);
    bob.setDirectionY(0.0);
    bob.setPointDirection((int)(Math.random()*360));

  }

  if (key == 'a')  {bob.rotate(-10);}
  if (key == 'd')  {bob.rotate(10);}
  if (key == 'w')  {bob.accelerate(.2);}

}

class Star

{
  private int starX, starY;
  public Star()

  {
    starX = (int)(Math.random() *600);
    starY = (int)(Math.random()* 600);
  }

    public void show()

    {
      fill(255 );
      ellipse(starX,starY,3,3);
    }

}

class SpaceShip extends Floater 

{  

  //your code here
  public SpaceShip()
  {

    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;



    myColor = color(200,200,200);
    myCenterX = 100;
    myCenterY = (int)(Math.random()*600);
    myDirectionX = 0.0;
    myDirectionY = 0.0;
    myPointDirection = 0;

  }

  public void setX(int x){myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}

class Asteroid extends Floater


{
  private int asteroidX;
  private int asteroidY;
  private int speedRotate;
   public Asteroid()

  {

    asteroidX = (int)(Math.random()*800);
    asteroidY = (int)(Math.random()*800);
    speedRotate = (int)((Math.random()*14)-7);
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 7;
    yCorners[0] = -14;
    xCorners[1] = 14;
    yCorners[1] = -7;
    xCorners[2] = 14;
    yCorners[2] = 7;
    xCorners[3] = 7;
    yCorners[3] = 14;
    xCorners[4] = -7;
    yCorners[4] = 14;
    xCorners[5] = -14;
    yCorners[5] = 7;
    xCorners[6] = -14;
    yCorners[6] = -7;
    xCorners[7] = -7;
    yCorners[7] = -14;

    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myDirectionX =(int)(Math.random()*4)-1;
    myDirectionY = (int)(Math.random()*4)-1;
    myPointDirection = (int)(Math.random()*360);

  }

    public void move()

    {

      rotate(speedRotate);

      super.move();

    }

  public void setX(int x){myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

}





abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class

{  

  protected int corners;  //the number of corners, a triangular floater has 3  
  protected int[] xCorners;  
  protected int[] yCorners;  
  protected int myColor;  
  protected double myCenterX, myCenterY; //holds center coordinates  
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel  
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x); 
  abstract public int getX();  
  abstract public void setY(int y);  
  abstract public int getY();  
  abstract public void setDirectionX(double x);  
  abstract public double getDirectionX();  
  abstract public void setDirectionY(double y);  
  abstract public double getDirectionY();  
  abstract public void setPointDirection(int degrees);  
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)  

  public void accelerate (double dAmount)  

  {          

    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     

    //change coordinates of direction of travel   
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       

  }  

  public void rotate (int nDegreesOfRotation)  

  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;  
  }  

  public void move ()   //move the floater in the current direction of travel

  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    //wrap around screen    

    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    

    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    

    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }  

    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }  

  }  

  public void show ()  //Draws the floater at the current position 

  {             

    fill(myColor);  
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }  
    endShape(CLOSE); 
  }  

}
