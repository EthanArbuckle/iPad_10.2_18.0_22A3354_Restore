@implementation CM3DLiftedSkeletonTransform

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

- (void)setPosition:(CM3DLiftedSkeletonTransform *)self
{
  __int128 v2;

  *(_OWORD *)&self->_position[4] = v2;
}

@end
