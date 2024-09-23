@implementation VNGenerateAnimalSegmentationRequestConfiguration

- (VNGenerateAnimalSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateAnimalSegmentationRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateAnimalSegmentationRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_qualityLevel = 0;
    result->_outputPixelFormat = 1278226488;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNGenerateAnimalSegmentationRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 19) = self->_qualityLevel;
    *((_DWORD *)result + 36) = self->_outputPixelFormat;
  }
  return result;
}

@end
