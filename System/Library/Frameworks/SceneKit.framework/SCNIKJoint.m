@implementation SCNIKJoint

- (SCNNode)joint
{
  return self->joint;
}

- (void)setJoint:(id)a3
{
  self->joint = (SCNNode *)a3;
}

- (double)maxAllowedRotationAngle
{
  return self->maxAllowedRotationAngle;
}

- (void)setMaxAllowedRotationAngle:(double)a3
{
  self->maxAllowedRotationAngle = a3;
}

@end
