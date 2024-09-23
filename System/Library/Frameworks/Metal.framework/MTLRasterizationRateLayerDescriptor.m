@implementation MTLRasterizationRateLayerDescriptor

+ (MTLRasterizationRateLayerDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLRasterizationRateLayerDescriptor *)+[MTLRasterizationRateLayerDescriptor allocWithZone:](MTLRasterizationRateLayerDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLRasterizationRateLayerDescriptor;
  return (MTLRasterizationRateLayerDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (MTLRasterizationRateLayerDescriptor)init
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  return -[MTLRasterizationRateLayerDescriptor initWithSampleCount:](self, "initWithSampleCount:", v3);
}

- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLRasterizationRateLayerDescriptor;
  return -[MTLRasterizationRateLayerDescriptor init](&v4, sel_init, sampleCount);
}

- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount horizontal:(const float *)horizontal vertical:(const float *)vertical
{
  MTLSize v6;

  v6 = *sampleCount;
  return -[MTLRasterizationRateLayerDescriptor initWithSampleCount:](self, "initWithSampleCount:", &v6, horizontal, vertical);
}

@end
