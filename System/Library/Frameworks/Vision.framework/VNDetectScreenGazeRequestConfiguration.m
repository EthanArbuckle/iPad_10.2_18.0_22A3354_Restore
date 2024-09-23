@implementation VNDetectScreenGazeRequestConfiguration

- (int64_t)temporalSmoothingFrameCount
{
  return self->_temporalSmoothingFrameCount;
}

- (void)setTemporalSmoothingFrameCount:(int64_t)a3
{
  if (a3 >= 1)
    self->_temporalSmoothingFrameCount = a3;
}

- (VNDetectScreenGazeRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectScreenGazeRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectScreenGazeRequestConfiguration;
  result = -[VNStatefulRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_temporalSmoothingFrameCount = 1;
    result->_screenSize = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectScreenGazeRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTemporalSmoothingFrameCount:", self->_temporalSmoothingFrameCount);
    objc_msgSend(v5, "setScreenSize:", self->_screenSize);
  }
  return v5;
}

- (unint64_t)screenSize
{
  return self->_screenSize;
}

- (void)setScreenSize:(unint64_t)a3
{
  self->_screenSize = a3;
}

@end
