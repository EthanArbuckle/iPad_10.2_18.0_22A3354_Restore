@implementation MLCMultiGPUDeviceOps

+ (id)multiGPUDeviceOpsWithGPUDeviceOps:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGPUDevicOps:", v4);

  return v5;
}

- (MLCMultiGPUDeviceOps)initWithGPUDevicOps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MLCMultiGPUDeviceOps *v10;
  uint64_t v11;
  NSMutableArray *rnnTrainableWeightGradients;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "forwardKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientKernel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryGradientKernel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forwardStatisticsKernel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientStatisticsKernel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)MLCMultiGPUDeviceOps;
  v10 = -[MLCGPUDeviceOps initWithForwardKernel:gradientKernel:secondaryGradientKernel:forwardStatistics:gradientStatistics:](&v14, sel_initWithForwardKernel_gradientKernel_secondaryGradientKernel_forwardStatistics_gradientStatistics_, v5, v6, v7, v8, v9);

  if (v10)
  {
    v10->_multiGPUReduction = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "rnnTrainableWeightGradients");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    }
    rnnTrainableWeightGradients = v10->_rnnTrainableWeightGradients;
    v10->_rnnTrainableWeightGradients = (NSMutableArray *)v11;

  }
  return v10;
}

- (int)multiGPUReduction
{
  return self->_multiGPUReduction;
}

- (void)setMultiGPUReduction:(int)a3
{
  self->_multiGPUReduction = a3;
}

- (NSArray)localGradientMatrices
{
  return self->_localGradientMatrices;
}

- (void)setLocalGradientMatrices:(id)a3
{
  objc_storeStrong((id *)&self->_localGradientMatrices, a3);
}

- (NSArray)remoteGradientBuffers
{
  return self->_remoteGradientBuffers;
}

- (void)setRemoteGradientBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_remoteGradientBuffers, a3);
}

- (NSArray)receivedGradientMatrices
{
  return self->_receivedGradientMatrices;
}

- (void)setReceivedGradientMatrices:(id)a3
{
  objc_storeStrong((id *)&self->_receivedGradientMatrices, a3);
}

- (NSArray)matrixSumKernels
{
  return self->_matrixSumKernels;
}

- (void)setMatrixSumKernels:(id)a3
{
  objc_storeStrong((id *)&self->_matrixSumKernels, a3);
}

- (NSMutableArray)allReducedGradientMatrices
{
  return self->_allReducedGradientMatrices;
}

- (void)setAllReducedGradientMatrices:(id)a3
{
  objc_storeStrong((id *)&self->_allReducedGradientMatrices, a3);
}

- (NSMutableArray)rnnTrainableWeightGradients
{
  return self->_rnnTrainableWeightGradients;
}

- (void)setRnnTrainableWeightGradients:(id)a3
{
  objc_storeStrong((id *)&self->_rnnTrainableWeightGradients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rnnTrainableWeightGradients, 0);
  objc_storeStrong((id *)&self->_allReducedGradientMatrices, 0);
  objc_storeStrong((id *)&self->_matrixSumKernels, 0);
  objc_storeStrong((id *)&self->_receivedGradientMatrices, 0);
  objc_storeStrong((id *)&self->_remoteGradientBuffers, 0);
  objc_storeStrong((id *)&self->_localGradientMatrices, 0);
}

@end
