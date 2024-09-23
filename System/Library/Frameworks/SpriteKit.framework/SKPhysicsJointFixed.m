@implementation SKPhysicsJointFixed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointFixed)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointFixed *)objc_msgSend(MEMORY[0x1E0D7D328], "allocWithZone:", a3);
}

+ (SKPhysicsJointFixed)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor
{
  double y;
  double x;
  SKPhysicsBody *v8;
  SKPhysicsBody *v9;
  void *v10;
  void *v11;
  void *v12;

  y = anchor.y;
  x = anchor.x;
  v8 = bodyA;
  v9 = bodyB;
  -[SKPhysicsBody node](v8, "node");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatePhysicsPositionAndScaleFromSprite");

  -[SKPhysicsBody node](v9, "node");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatePhysicsPositionAndScaleFromSprite");

  objc_msgSend(MEMORY[0x1E0D7D328], "jointWithBodyA:bodyB:anchor:", v8, v9, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKPhysicsJointFixed *)v12;
}

@end
