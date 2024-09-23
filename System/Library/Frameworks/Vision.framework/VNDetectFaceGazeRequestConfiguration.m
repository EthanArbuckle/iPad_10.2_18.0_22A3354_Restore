@implementation VNDetectFaceGazeRequestConfiguration

- (VNDetectFaceGazeRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectFaceGazeRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNDetectFaceGazeRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_gazeHeatMapThreshold = 0.2;
    result->_minimumFaceDimension = 0.03;
    result->_commonGazeLocationRadius = 0.01;
    result->_resolveSomewhereElseDirection = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNDetectFaceGazeRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v10, sel_copyWithZone_, a3);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = self->_gazeHeatMapThreshold;
    objc_msgSend(v4, "setGazeHeatMapThreshold:", v5);
    *(float *)&v7 = self->_minimumFaceDimension;
    objc_msgSend(v6, "setMinimumFaceDimension:", v7);
    *(float *)&v8 = self->_commonGazeLocationRadius;
    objc_msgSend(v6, "setCommonGazeLocationRadius:", v8);
    objc_msgSend(v6, "setResolveSomewhereElseDirection:", self->_resolveSomewhereElseDirection);
  }
  return v6;
}

- (float)gazeHeatMapThreshold
{
  return self->_gazeHeatMapThreshold;
}

- (void)setGazeHeatMapThreshold:(float)a3
{
  self->_gazeHeatMapThreshold = a3;
}

- (float)minimumFaceDimension
{
  return self->_minimumFaceDimension;
}

- (void)setMinimumFaceDimension:(float)a3
{
  self->_minimumFaceDimension = a3;
}

- (float)commonGazeLocationRadius
{
  return self->_commonGazeLocationRadius;
}

- (void)setCommonGazeLocationRadius:(float)a3
{
  self->_commonGazeLocationRadius = a3;
}

- (BOOL)resolveSomewhereElseDirection
{
  return self->_resolveSomewhereElseDirection;
}

- (void)setResolveSomewhereElseDirection:(BOOL)a3
{
  self->_resolveSomewhereElseDirection = a3;
}

@end
