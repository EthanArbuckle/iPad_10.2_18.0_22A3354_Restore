@implementation GKOctreeNode

- (GKBox)box
{
  return self;
}

- (void)cOctreeNode
{
  return self->_cOctreeNode;
}

- (void)setCOctreeNode:(void *)a3
{
  self->_cOctreeNode = a3;
}

@end
