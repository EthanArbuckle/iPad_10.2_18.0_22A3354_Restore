@implementation VNImageBasedRequestConfiguration

- (VNImageBasedRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNImageBasedRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNImageBasedRequestConfiguration;
  result = -[VNRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_regionOfInterest = VNNormalizedIdentityRect;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDetectedObjectObservations, 0);
  objc_storeStrong((id *)&self->_inputFaceObservations, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageBasedRequestConfiguration;
  v4 = -[VNRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRegionOfInterest:", self->_regionOfInterest.origin.x, self->_regionOfInterest.origin.y, self->_regionOfInterest.size.width, self->_regionOfInterest.size.height);
    objc_msgSend(v5, "setInputFaceObservations:", self->_inputFaceObservations);
    objc_msgSend(v5, "setInputDetectedObjectObservations:", self->_inputDetectedObjectObservations);
  }
  return v5;
}

- (void)setInputFaceObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (void)setInputDetectedObjectObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (NSArray)inputDetectedObjectObservations
{
  return self->_inputDetectedObjectObservations;
}

@end
