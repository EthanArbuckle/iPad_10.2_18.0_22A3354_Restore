@implementation MTLRasterizationRateLayerArray

- (MTLRasterizationRateLayerArray)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerArray;
  return -[MTLRasterizationRateLayerArray init](&v3, sel_init);
}

- (MTLRasterizationRateLayerDescriptor)objectAtIndexedSubscript:(NSUInteger)layerIndex
{
  return 0;
}

@end
