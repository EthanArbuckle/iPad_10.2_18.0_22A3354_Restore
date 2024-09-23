@implementation VNGenerateSkySegmentationRequestConfiguration

- (VNGenerateSkySegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateSkySegmentationRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateSkySegmentationRequestConfiguration;
  result = -[VNGenerateSegmentationRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_qualityLevel = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNGenerateSkySegmentationRequestConfiguration;
  v4 = -[VNGenerateSegmentationRequestConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQualityLevel:", self->_qualityLevel);
  return v4;
}

- (int64_t)qualityLevel
{
  return self->_qualityLevel;
}

- (void)setQualityLevel:(int64_t)a3
{
  self->_qualityLevel = a3;
}

@end
