@implementation ARSkeleton

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARSkeleton;
  return -[ARSkeleton init](&v3, sel_init);
}

- (BOOL)isJointTracked:(NSInteger)jointIndex
{
  return 0;
}

- (ARSkeletonDefinition)definition
{
  return self->_definition;
}

- (NSUInteger)jointCount
{
  return self->_jointCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
