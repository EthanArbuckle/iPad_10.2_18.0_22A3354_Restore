@implementation VNCreateSceneprintRequestConfiguration

- (VNCreateSceneprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNCreateSceneprintRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCreateSceneprintRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_returnAllResults = 0;
    result->_useCenterTileOnly = 0;
    result->_imageCropAndScaleOption = 2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCreateSceneprintRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setReturnAllResults:", self->_returnAllResults);
    objc_msgSend(v5, "setUseCenterTileOnly:", self->_useCenterTileOnly);
    objc_msgSend(v5, "setImageCropAndScaleOption:", self->_imageCropAndScaleOption);
  }
  return v5;
}

- (BOOL)returnAllResults
{
  return self->_returnAllResults;
}

- (void)setReturnAllResults:(BOOL)a3
{
  self->_returnAllResults = a3;
}

- (BOOL)useCenterTileOnly
{
  return self->_useCenterTileOnly;
}

- (void)setUseCenterTileOnly:(BOOL)a3
{
  self->_useCenterTileOnly = a3;
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
