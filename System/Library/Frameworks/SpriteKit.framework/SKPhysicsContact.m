@implementation SKPhysicsContact

+ (SKPhysicsContact)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsContact *)objc_msgSend(MEMORY[0x1E0D7D298], "allocWithZone:", a3);
}

- (SKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (SKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (CGPoint)contactPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_contactPoint.x;
  y = self->_contactPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGVector)contactNormal
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_contactNormal.dx;
  dy = self->_contactNormal.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGFloat)collisionImpulse
{
  return self->_collisionImpulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);
  objc_storeStrong((id *)&self->_bodyA, 0);
}

@end
