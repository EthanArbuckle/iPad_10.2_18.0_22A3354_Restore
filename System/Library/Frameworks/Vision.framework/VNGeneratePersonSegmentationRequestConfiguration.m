@implementation VNGeneratePersonSegmentationRequestConfiguration

- (VNGeneratePersonSegmentationRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGeneratePersonSegmentationRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGeneratePersonSegmentationRequestConfiguration;
  result = -[VNStatefulRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_qualityLevel = 0;
    result->_outputPixelFormat = 1278226488;
    result->_useTiling = 0;
    result->_keepRawOutputMask = 0;
    result->_minimumConfidence = 0.9;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNGeneratePersonSegmentationRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQualityLevel:", self->_qualityLevel);
  objc_msgSend(v4, "setOutputPixelFormat:", self->_outputPixelFormat);
  objc_msgSend(v4, "setUseTiling:", self->_useTiling);
  objc_msgSend(v4, "setKeepRawOutputMask:", self->_keepRawOutputMask);
  *(float *)&v5 = self->_minimumConfidence;
  objc_msgSend(v4, "setMinimumConfidence:", v5);
  return v4;
}

- (unint64_t)qualityLevel
{
  return self->_qualityLevel;
}

- (void)setQualityLevel:(unint64_t)a3
{
  self->_qualityLevel = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (BOOL)useTiling
{
  return self->_useTiling;
}

- (void)setUseTiling:(BOOL)a3
{
  self->_useTiling = a3;
}

- (BOOL)keepRawOutputMask
{
  return self->_keepRawOutputMask;
}

- (void)setKeepRawOutputMask:(BOOL)a3
{
  self->_keepRawOutputMask = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

@end
