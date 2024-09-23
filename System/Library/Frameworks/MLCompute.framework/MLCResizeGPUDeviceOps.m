@implementation MLCResizeGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", v7, v6);

  return v8;
}

- (MLCResizeGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  MLCResizeGPUDeviceOps *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCResizeGPUDeviceOps;
  result = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v5, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, a3, a4, 0, 0, 0);
  if (result)
  {
    result->_scaleFactorX = 0.0;
    result->_scaleFactorY = 0.0;
  }
  return result;
}

- (float)scaleFactorX
{
  return self->_scaleFactorX;
}

- (void)setScaleFactorX:(float)a3
{
  self->_scaleFactorX = a3;
}

- (float)scaleFactorY
{
  return self->_scaleFactorY;
}

- (void)setScaleFactorY:(float)a3
{
  self->_scaleFactorY = a3;
}

- (BOOL)alignCorners
{
  return self->_alignCorners;
}

- (void)setAlignCorners:(BOOL)a3
{
  self->_alignCorners = a3;
}

- (BOOL)isSpecialCasedNearestForwardKernel
{
  return self->_isSpecialCasedNearestForwardKernel;
}

- (void)setIsSpecialCasedNearestForwardKernel:(BOOL)a3
{
  self->_isSpecialCasedNearestForwardKernel = a3;
}

@end
