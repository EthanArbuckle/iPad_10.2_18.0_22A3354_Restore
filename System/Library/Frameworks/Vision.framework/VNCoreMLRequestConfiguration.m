@implementation VNCoreMLRequestConfiguration

- (VNCoreMLRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNCoreMLRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCoreMLRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_imageCropAndScaleOption = 0;
  return result;
}

- (void)updateWithPropertiesOfModel:(id)a3
{
  id v4;

  objc_msgSend(a3, "cachingIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VNCoreMLRequestConfiguration setModelCachingIdentifier:](self, "setModelCachingIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCoreMLRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setImageCropAndScaleOption:", self->_imageCropAndScaleOption);
    objc_msgSend(v5, "setModelCachingIdentifier:", self->_modelCachingIdentifier);
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

- (NSObject)modelCachingIdentifier
{
  return self->_modelCachingIdentifier;
}

- (void)setModelCachingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCachingIdentifier, 0);
}

@end
