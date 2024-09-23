@implementation SKPhysicsJointSliding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointSliding)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointSliding *)objc_msgSend(MEMORY[0x1E0D7D310], "allocWithZone:", a3);
}

+ (SKPhysicsJointSliding)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor axis:(CGVector)axis
{
  double dy;
  double dx;
  double y;
  double x;
  SKPhysicsBody *v11;
  SKPhysicsBody *v12;
  void *v13;
  void *v14;
  void *v15;

  dy = axis.dy;
  dx = axis.dx;
  y = anchor.y;
  x = anchor.x;
  v11 = bodyA;
  v12 = bodyB;
  -[SKPhysicsBody node](v11, "node");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatePhysicsPositionAndScaleFromSprite");

  -[SKPhysicsBody node](v12, "node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePhysicsPositionAndScaleFromSprite");

  objc_msgSend(MEMORY[0x1E0D7D310], "jointWithBodyA:bodyB:anchor:axis:", v11, v12, x, y, dx, dy);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKPhysicsJointSliding *)v15;
}

- (BOOL)shouldEnableLimits
{
  return self->_shouldEnableLimits;
}

- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits
{
  self->_shouldEnableLimits = shouldEnableLimits;
}

- (CGFloat)lowerDistanceLimit
{
  return self->_lowerDistanceLimit;
}

- (void)setLowerDistanceLimit:(CGFloat)lowerDistanceLimit
{
  self->_lowerDistanceLimit = lowerDistanceLimit;
}

- (CGFloat)upperDistanceLimit
{
  return self->_upperDistanceLimit;
}

- (void)setUpperDistanceLimit:(CGFloat)upperDistanceLimit
{
  self->_upperDistanceLimit = upperDistanceLimit;
}

@end
