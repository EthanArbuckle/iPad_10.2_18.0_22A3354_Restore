@implementation VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration

- (VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration)initWithRequestClass:(Class)a3
{
  VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_imageCropAndScaleOption = 2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setImageCropAndScaleOption:", self->_imageCropAndScaleOption);
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

@end
