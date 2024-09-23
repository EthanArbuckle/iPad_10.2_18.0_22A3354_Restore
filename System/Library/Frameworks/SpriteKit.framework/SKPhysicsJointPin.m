@implementation SKPhysicsJointPin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointPin)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointPin *)objc_msgSend(MEMORY[0x1E0D7D318], "allocWithZone:", a3);
}

+ (SKPhysicsJointPin)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor
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

  objc_msgSend(MEMORY[0x1E0D7D318], "jointWithBodyA:bodyB:anchor:", v8, v9, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKPhysicsJointPin *)v12;
}

- (BOOL)shouldEnableLimits
{
  return self->_shouldEnableLimits;
}

- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits
{
  self->_shouldEnableLimits = shouldEnableLimits;
}

- (CGFloat)lowerAngleLimit
{
  return self->_lowerAngleLimit;
}

- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit
{
  self->_lowerAngleLimit = lowerAngleLimit;
}

- (CGFloat)upperAngleLimit
{
  return self->_upperAngleLimit;
}

- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit
{
  self->_upperAngleLimit = upperAngleLimit;
}

- (CGFloat)frictionTorque
{
  return self->_frictionTorque;
}

- (void)setFrictionTorque:(CGFloat)frictionTorque
{
  self->_frictionTorque = frictionTorque;
}

- (CGFloat)rotationSpeed
{
  return self->_rotationSpeed;
}

- (void)setRotationSpeed:(CGFloat)rotationSpeed
{
  self->_rotationSpeed = rotationSpeed;
}

- (CGPoint)anchor
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_anchor, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

@end
