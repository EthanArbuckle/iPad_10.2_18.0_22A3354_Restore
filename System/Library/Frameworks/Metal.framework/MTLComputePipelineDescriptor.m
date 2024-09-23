@implementation MTLComputePipelineDescriptor

+ (MTLComputePipelineDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLComputePipelineDescriptor *)+[MTLComputePipelineDescriptor allocWithZone:](MTLComputePipelineDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLComputePipelineDescriptor;
  return (MTLComputePipelineDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSArray)insertLibraries
{
  return self->_insertLibraries;
}

- (void)setInsertLibraries:(NSArray *)insertLibraries
{
  objc_setProperty_nonatomic_copy(self, a2, insertLibraries, 8);
}

@end
