@implementation VNGenerateImageFeaturePrintRequestConfiguration

- (VNGenerateImageFeaturePrintRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateImageFeaturePrintRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateImageFeaturePrintRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_imageCropAndScaleOption = 2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNGenerateImageFeaturePrintRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 18) = self->_imageCropAndScaleOption;
  return result;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

@end
