@implementation MTLTileRenderPipelineDescriptor

+ (MTLTileRenderPipelineDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLTileRenderPipelineDescriptor *)+[MTLTileRenderPipelineDescriptor allocWithZone:](MTLTileRenderPipelineDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLTileRenderPipelineDescriptor;
  return (MTLTileRenderPipelineDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSArray)preloadedLibraries
{
  return self->_preloadedLibraries;
}

- (void)setPreloadedLibraries:(NSArray *)preloadedLibraries
{
  objc_setProperty_nonatomic_copy(self, a2, preloadedLibraries, 16);
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_supportAddingBinaryFunctions;
}

- (void)setSupportAddingBinaryFunctions:(BOOL)supportAddingBinaryFunctions
{
  self->_supportAddingBinaryFunctions = supportAddingBinaryFunctions;
}

- (NSUInteger)maxCallStackDepth
{
  return self->_maxCallStackDepth;
}

- (void)setMaxCallStackDepth:(NSUInteger)maxCallStackDepth
{
  self->_maxCallStackDepth = maxCallStackDepth;
}

@end
