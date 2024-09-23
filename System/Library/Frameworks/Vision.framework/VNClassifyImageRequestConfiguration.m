@implementation VNClassifyImageRequestConfiguration

- (VNClassifyImageRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNClassifyImageRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNClassifyImageRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_maximumLeafObservations = 0x7FFFFFFFFFFFFFFFLL;
    result->_maximumHierarchicalObservations = 0x7FFFFFFFFFFFFFFFLL;
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
  v7.super_class = (Class)VNClassifyImageRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setCustomHierarchy:", self->_customHierarchy);
    objc_msgSend(v5, "setMaximumLeafObservations:", self->_maximumLeafObservations);
    objc_msgSend(v5, "setMaximumHierarchicalObservations:", self->_maximumHierarchicalObservations);
    objc_msgSend(v5, "setImageCropAndScaleOption:", self->_imageCropAndScaleOption);
  }
  return v5;
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (void)setCustomHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->_customHierarchy, a3);
}

- (unint64_t)maximumLeafObservations
{
  return self->_maximumLeafObservations;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  self->_maximumLeafObservations = a3;
}

- (unint64_t)maximumHierarchicalObservations
{
  return self->_maximumHierarchicalObservations;
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  self->_maximumHierarchicalObservations = a3;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHierarchy, 0);
}

@end
