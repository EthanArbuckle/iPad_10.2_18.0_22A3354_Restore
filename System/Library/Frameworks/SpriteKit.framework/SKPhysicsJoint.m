@implementation SKPhysicsJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPhysicsJoint)initWithCoder:(id)a3
{

  return 0;
}

+ (SKPhysicsJoint)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJoint *)objc_msgSend(MEMORY[0x1E0D7D300], "allocWithZone:", a3);
}

- (SKPhysicsBody)bodyA
{
  return self->bodyA;
}

- (void)setBodyA:(SKPhysicsBody *)bodyA
{
  objc_storeStrong((id *)&self->bodyA, bodyA);
}

- (SKPhysicsBody)bodyB
{
  return self->bodyB;
}

- (void)setBodyB:(SKPhysicsBody *)bodyB
{
  objc_storeStrong((id *)&self->bodyB, bodyB);
}

- (CGVector)reactionForce
{
  double dx;
  double dy;
  CGVector result;

  dx = self->reactionForce.dx;
  dy = self->reactionForce.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGFloat)reactionTorque
{
  return self->reactionTorque;
}

- (BOOL)_implicit
{
  return self->__implicit;
}

- (void)set_implicit:(BOOL)a3
{
  self->__implicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bodyB, 0);
  objc_storeStrong((id *)&self->bodyA, 0);
}

@end
