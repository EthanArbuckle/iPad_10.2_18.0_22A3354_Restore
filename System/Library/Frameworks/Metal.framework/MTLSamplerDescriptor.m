@implementation MTLSamplerDescriptor

+ (MTLSamplerDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLSamplerDescriptor *)+[MTLSamplerDescriptor allocWithZone:](MTLSamplerDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLSamplerDescriptor;
  return (MTLSamplerDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)lodAverage
{
  return self->_lodAverage;
}

- (void)setLodAverage:(BOOL)lodAverage
{
  self->_lodAverage = lodAverage;
}

- (float)lodBias
{
  return self->_lodBias;
}

- (void)setLodBias:(float)a3
{
  self->_lodBias = a3;
}

@end
