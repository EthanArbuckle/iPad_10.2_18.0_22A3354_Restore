@implementation CMSkeletonCollection

- (double)localMachtime
{
  return self->_localMachtime;
}

- (void)setLocalMachtime:(double)a3
{
  self->_localMachtime = a3;
}

- (double)globalMachtime
{
  return self->_globalMachtime;
}

- (void)setGlobalMachtime:(double)a3
{
  self->_globalMachtime = a3;
}

- (NSArray)skeleton2D
{
  return self->_skeleton2D;
}

- (void)setSkeleton2D:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)skeleton3DLifted
{
  return self->_skeleton3DLifted;
}

- (void)setSkeleton3DLifted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)skeleton3DRetargeted
{
  return self->_skeleton3DRetargeted;
}

- (void)setSkeleton3DRetargeted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
