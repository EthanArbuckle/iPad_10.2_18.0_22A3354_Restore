@implementation MLCPaddingGPUDeviceOps

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

- (MLCPaddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  MLCPaddingGPUDeviceOps *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCPaddingGPUDeviceOps;
  result = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v5, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, a3, a4, 0, 0, 0);
  if (result)
  {
    result->_paddingType = 0;
    result->_paddingValue = 0.0;
  }
  return result;
}

- (int)paddingType
{
  return self->_paddingType;
}

- (void)setPaddingType:(int)a3
{
  self->_paddingType = a3;
}

- (float)paddingValue
{
  return self->_paddingValue;
}

- (void)setPaddingValue:(float)a3
{
  self->_paddingValue = a3;
}

- (id)paddingGradientAccumulateKernel
{
  return self->_paddingGradientAccumulateKernel;
}

- (void)setPaddingGradientAccumulateKernel:(id)a3
{
  objc_storeStrong(&self->_paddingGradientAccumulateKernel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_paddingGradientAccumulateKernel, 0);
}

@end
