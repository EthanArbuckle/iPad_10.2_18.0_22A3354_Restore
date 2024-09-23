@implementation VNDetectHumanHandPoseRequestConfiguration

- (VNDetectHumanHandPoseRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectHumanHandPoseRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectHumanHandPoseRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
    result->_maximumHandCount = 2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectHumanHandPoseRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setMaximumHandCount:", self->_maximumHandCount);
  return v5;
}

- (unint64_t)maximumHandCount
{
  return self->_maximumHandCount;
}

- (void)setMaximumHandCount:(unint64_t)a3
{
  self->_maximumHandCount = a3;
}

@end
