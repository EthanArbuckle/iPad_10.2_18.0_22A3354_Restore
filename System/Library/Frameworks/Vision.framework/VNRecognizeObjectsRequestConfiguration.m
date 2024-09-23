@implementation VNRecognizeObjectsRequestConfiguration

- (VNRecognizeObjectsRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRecognizeObjectsRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNRecognizeObjectsRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_imageCropAndScaleOption = 2;
    result->_modelMinimumDetectionConfidence = 0.1;
    result->_modelNonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNRecognizeObjectsRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setImageCropAndScaleOption:", self->_imageCropAndScaleOption);
    objc_msgSend(v5, "setUseImageAnalyzerScaling:", self->_useImageAnalyzerScaling);
    *(float *)&v6 = self->_modelMinimumDetectionConfidence;
    objc_msgSend(v5, "setModelMinimumDetectionConfidence:", v6);
    *(float *)&v7 = self->_modelNonMaximumSuppressionThreshold;
    objc_msgSend(v5, "setModelNonMaximumSuppressionThreshold:", v7);
  }
  return v5;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (BOOL)useImageAnalyzerScaling
{
  return self->_useImageAnalyzerScaling;
}

- (void)setUseImageAnalyzerScaling:(BOOL)a3
{
  self->_useImageAnalyzerScaling = a3;
}

- (float)modelMinimumDetectionConfidence
{
  return self->_modelMinimumDetectionConfidence;
}

- (void)setModelMinimumDetectionConfidence:(float)a3
{
  self->_modelMinimumDetectionConfidence = a3;
}

- (float)modelNonMaximumSuppressionThreshold
{
  return self->_modelNonMaximumSuppressionThreshold;
}

- (void)setModelNonMaximumSuppressionThreshold:(float)a3
{
  self->_modelNonMaximumSuppressionThreshold = a3;
}

@end
