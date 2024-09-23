@implementation MLCEmbeddingGPUDeviceOps

+ (id)deviceOps
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithForwardKernel:gradientKernel:", 0, 0);
}

- (MLCEmbeddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  MLCEmbeddingGPUDeviceOps *v4;
  MLCEmbeddingGPUDeviceOps *v5;
  NSNumber *paddingIndex;
  NSArray *embeddingParams;
  id gradientForWeights;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLCEmbeddingGPUDeviceOps;
  v4 = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v10, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, a3, a4, 0, 0, 0);
  v5 = v4;
  if (v4)
  {
    paddingIndex = v4->_paddingIndex;
    v4->_paddingIndex = 0;

    embeddingParams = v5->_embeddingParams;
    v5->_embeddingParams = 0;

    v5->_scaleGradientByFrequency = 0;
    gradientForWeights = v5->_gradientForWeights;
    v5->_gradientForWeights = 0;

  }
  return v5;
}

- (id)gradientForWeights
{
  return self->_gradientForWeights;
}

- (void)setGradientForWeights:(id)a3
{
  objc_storeStrong(&self->_gradientForWeights, a3);
}

- (NSNumber)paddingIndex
{
  return self->_paddingIndex;
}

- (void)setPaddingIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSArray)embeddingParams
{
  return self->_embeddingParams;
}

- (void)setEmbeddingParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (BOOL)scaleGradientByFrequency
{
  return self->_scaleGradientByFrequency;
}

- (void)setScaleGradientByFrequency:(BOOL)a3
{
  self->_scaleGradientByFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingParams, 0);
  objc_storeStrong((id *)&self->_paddingIndex, 0);
  objc_storeStrong(&self->_gradientForWeights, 0);
}

@end
