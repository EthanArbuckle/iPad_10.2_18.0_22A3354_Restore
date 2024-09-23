@implementation VNGenerateSegmentationRequestConfiguration

- (VNGenerateSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateSegmentationRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateSegmentationRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_outputPixelFormat = 1278226488;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNGenerateSegmentationRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOutputPixelFormat:", self->_outputPixelFormat);
  return v4;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

@end
