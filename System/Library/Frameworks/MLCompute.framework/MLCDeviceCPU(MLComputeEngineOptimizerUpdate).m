@implementation MLCDeviceCPU(MLComputeEngineOptimizerUpdate)

- (void)updateBatchNormalizationLayer:()MLComputeEngineOptimizerUpdate optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for batch normalization layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateFullyConnectedLayer:()MLComputeEngineOptimizerUpdate optimizer:weightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for fully connected layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateRNNLayer:()MLComputeEngineOptimizerUpdate optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for LSTM with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateMultiheadAttentionLayer:()MLComputeEngineOptimizerUpdate optimizer:weightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for multi head attention layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateAllParametersWithOptimizer:()MLComputeEngineOptimizerUpdate arrayOfParameters:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for all parameters with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateTensorParameter:()MLComputeEngineOptimizerUpdate optimizer:gradient:arrayOfParams:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Optimizer update for tensor parameters with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:()MLComputeEngineOptimizerUpdate .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218240;
  v7 = a2;
  v8 = 2048;
  v9 = objc_msgSend(v5, "length");
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "Tensor size does not match expected size. Expected %lu size in bytes but tensor was %lu size in bytes", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4_1();
}

@end
