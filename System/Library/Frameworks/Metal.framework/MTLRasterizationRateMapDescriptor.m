@implementation MTLRasterizationRateMapDescriptor

+ (MTLRasterizationRateMapDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLRasterizationRateMapDescriptor *)+[MTLRasterizationRateMapDescriptor allocWithZone:](MTLRasterizationRateMapDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLRasterizationRateMapDescriptor;
  return (MTLRasterizationRateMapDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize
{
  MTLSize v4;

  v4 = *screenSize;
  return +[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:](MTLRasterizationRateMapDescriptor, "rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:", &v4, 0, 0);
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layer:(MTLRasterizationRateLayerDescriptor *)layer
{
  MTLSize v5;
  MTLRasterizationRateLayerDescriptor *v6;

  v6 = layer;
  v5 = *screenSize;
  return +[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:](MTLRasterizationRateMapDescriptor, "rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:", &v5, 1, &v6);
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layerCount:(NSUInteger)layerCount layers:(MTLRasterizationRateLayerDescriptor *const *)layers
{
  MTLRasterizationRateMapDescriptorInternal *v8;
  MTLRasterizationRateMapDescriptorInternal *v9;
  NSUInteger v10;
  MTLSize v12;

  v8 = [MTLRasterizationRateMapDescriptorInternal alloc];
  v12 = *screenSize;
  v9 = -[MTLRasterizationRateMapDescriptorInternal initWithScreenSize:](v8, "initWithScreenSize:", &v12);
  if (layerCount)
  {
    v10 = layerCount - 1;
    do
    {
      -[MTLRasterizationRateMapDescriptorInternal setLayer:atIndex:](v9, "setLayer:atIndex:", layers[v10], v10);
      --v10;
    }
    while (v10 != -1);
  }
  return (MTLRasterizationRateMapDescriptor *)v9;
}

- (MTLRasterizationRateLayerDescriptor)layerAtIndex:(NSUInteger)layerIndex
{
  return 0;
}

@end
