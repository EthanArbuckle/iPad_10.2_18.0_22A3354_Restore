@implementation SKPhysicsJointLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointLimit)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointLimit *)objc_msgSend(MEMORY[0x1E0D7D320], "allocWithZone:", a3);
}

+ (SKPhysicsJointLimit)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB
{
  double y;
  double x;
  double v8;
  double v9;
  SKPhysicsBody *v11;
  SKPhysicsBody *v12;
  void *v13;
  void *v14;
  void *v15;

  y = anchorB.y;
  x = anchorB.x;
  v8 = anchorA.y;
  v9 = anchorA.x;
  v11 = bodyA;
  v12 = bodyB;
  -[SKPhysicsBody node](v11, "node");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatePhysicsPositionAndScaleFromSprite");

  -[SKPhysicsBody node](v12, "node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePhysicsPositionAndScaleFromSprite");

  objc_msgSend(MEMORY[0x1E0D7D320], "jointWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKPhysicsJointLimit *)v15;
}

- (CGFloat)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(CGFloat)maxLength
{
  self->_maxLength = maxLength;
}

@end
