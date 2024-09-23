@implementation VNGenerateInstanceMaskGatingRequestConfiguration

- (VNGenerateInstanceMaskGatingRequestConfiguration)initWithRequestClass:(Class)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateInstanceMaskGatingRequestConfiguration;
  return -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateInstanceMaskGatingRequestConfiguration;
  return -[VNImageBasedRequestConfiguration copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
