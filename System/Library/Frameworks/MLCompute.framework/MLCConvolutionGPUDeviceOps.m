@implementation MLCConvolutionGPUDeviceOps

+ (id)deviceOpsWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardMPSGraph:gradientMPSGraph:", v7, v6);

  return v8;
}

- (MLCConvolutionGPUDeviceOps)initWithForwardMPSGraph:(id)a3 gradientMPSGraph:(id)a4
{
  id v7;
  id v8;
  MLCConvolutionGPUDeviceOps *v9;
  MLCConvolutionGPUDeviceOps *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *descriptorsForMPSGraph;
  uint64_t v14;
  NSMutableArray *mpsGraphTensors;
  id convolutionMultiGPUChildOps;
  id transposeDeviceOps;
  NSMutableArray *transposedTensors;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MLCConvolutionGPUDeviceOps;
  v9 = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v20, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, 0, 0, 0, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_forwardMPSGraph, a3);
    objc_storeStrong(&v10->_gradientMPSGraph, a4);
    v10->_depthWiseConvolution = 0;
    v10->_convolutionTranspose = 0;
    v10->_hasBias = 0;
    v10->_biasChannelCount = 0;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    v12 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    descriptorsForMPSGraph = v10->_descriptorsForMPSGraph;
    v10->_descriptorsForMPSGraph = (NSMutableArray *)v12;

    v14 = objc_msgSend(v11, "mutableCopy");
    mpsGraphTensors = v10->_mpsGraphTensors;
    v10->_mpsGraphTensors = (NSMutableArray *)v14;

    convolutionMultiGPUChildOps = v10->_convolutionMultiGPUChildOps;
    v10->_convolutionMultiGPUChildOps = 0;

    transposeDeviceOps = v10->_transposeDeviceOps;
    v10->_transposeDeviceOps = 0;

    transposedTensors = v10->_transposedTensors;
    v10->_transposedTensors = 0;

  }
  return v10;
}

- (id)forwardMPSGraph
{
  return self->_forwardMPSGraph;
}

- (void)setForwardMPSGraph:(id)a3
{
  objc_storeStrong(&self->_forwardMPSGraph, a3);
}

- (id)gradientMPSGraph
{
  return self->_gradientMPSGraph;
}

- (void)setGradientMPSGraph:(id)a3
{
  objc_storeStrong(&self->_gradientMPSGraph, a3);
}

- (BOOL)depthWiseConvolution
{
  return self->_depthWiseConvolution;
}

- (void)setDepthWiseConvolution:(BOOL)a3
{
  self->_depthWiseConvolution = a3;
}

- (BOOL)convolutionTranspose
{
  return self->_convolutionTranspose;
}

- (void)setConvolutionTranspose:(BOOL)a3
{
  self->_convolutionTranspose = a3;
}

- (BOOL)hasBias
{
  return self->_hasBias;
}

- (void)setHasBias:(BOOL)a3
{
  self->_hasBias = a3;
}

- (unint64_t)biasChannelCount
{
  return self->_biasChannelCount;
}

- (void)setBiasChannelCount:(unint64_t)a3
{
  self->_biasChannelCount = a3;
}

- (NSMutableArray)descriptorsForMPSGraph
{
  return self->_descriptorsForMPSGraph;
}

- (void)setDescriptorsForMPSGraph:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorsForMPSGraph, a3);
}

- (NSMutableArray)mpsGraphTensors
{
  return self->_mpsGraphTensors;
}

- (void)setMpsGraphTensors:(id)a3
{
  objc_storeStrong((id *)&self->_mpsGraphTensors, a3);
}

- (id)transposeDeviceOps
{
  return self->_transposeDeviceOps;
}

- (void)setTransposeDeviceOps:(id)a3
{
  objc_storeStrong(&self->_transposeDeviceOps, a3);
}

- (NSMutableArray)transposedTensors
{
  return self->_transposedTensors;
}

- (void)setTransposedTensors:(id)a3
{
  objc_storeStrong((id *)&self->_transposedTensors, a3);
}

- (id)convolutionMultiGPUChildOps
{
  return self->_convolutionMultiGPUChildOps;
}

- (void)setConvolutionMultiGPUChildOps:(id)a3
{
  objc_storeStrong(&self->_convolutionMultiGPUChildOps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_convolutionMultiGPUChildOps, 0);
  objc_storeStrong((id *)&self->_transposedTensors, 0);
  objc_storeStrong(&self->_transposeDeviceOps, 0);
  objc_storeStrong((id *)&self->_mpsGraphTensors, 0);
  objc_storeStrong((id *)&self->_descriptorsForMPSGraph, 0);
  objc_storeStrong(&self->_gradientMPSGraph, 0);
  objc_storeStrong(&self->_forwardMPSGraph, 0);
}

@end
