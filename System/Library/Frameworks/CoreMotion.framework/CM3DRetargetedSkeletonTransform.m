@implementation CM3DRetargetedSkeletonTransform

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (__n128)position
{
  return a1[1];
}

- (void)setPosition:(CM3DRetargetedSkeletonTransform *)self
{
  __int128 v2;

  *(_OWORD *)&self->_position[4] = v2;
}

- (__n128)quaternion
{
  return a1[2];
}

- (__n128)setQuaternion:(__n128 *)result
{
  result[2] = a2;
  return result;
}

@end
