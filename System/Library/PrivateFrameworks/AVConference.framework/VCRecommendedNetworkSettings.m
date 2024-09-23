@implementation VCRecommendedNetworkSettings

- (VCRecommendedNetworkSettings)initWithTargetBitrateCap:(unsigned int)a3
{
  VCRecommendedNetworkSettings *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCRecommendedNetworkSettings;
  result = -[VCRecommendedNetworkSettings init](&v5, sel_init);
  if (result)
    result->_targetBitrateCap = a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCRecommendedNetworkSettings;
  -[VCRecommendedNetworkSettings dealloc](&v2, sel_dealloc);
}

- (unsigned)targetBitrateCap
{
  return self->_targetBitrateCap;
}

@end
