@implementation MLCDeviceCPU(MLCEngineDispatch)

- (void)allocateResultTensor:()MLCEngineDispatch .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: result tensor has unknown type of existing deviceMemory", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchForwardSplitLayer:()MLCEngineDispatch sourceTensor:resultTensors:forConcat:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Gradient Split Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardSliceLayer:()MLCEngineDispatch sourceTensor:resultTensor:forTraining:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@:dispatch forward slice layer with BNNS failed: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardMatMulLayer:()MLCEngineDispatch sourceTensors:resultTensor:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: dispatch forward layer with BNNS failed for matrix multiply:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardMHALayer:()MLCEngineDispatch sourceTensors:resultTensor:resultStateIsTemporary:forTraining:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch forward layer with states with BNNS failed for multihead attention layer:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardMHALayer:()MLCEngineDispatch sourceTensors:resultTensor:resultStateIsTemporary:forTraining:.cold.2()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Error in obtaining backprop cache/workspace sizes: %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardLayer:()MLCEngineDispatch sourceTensor:resultTensor:resultStateIsTemporary:forTraining:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Forward Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardLossLayer:()MLCEngineDispatch sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Forward Loss Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchGradientLayer:()MLCEngineDispatch sourceGradientTensor:resultGradientTensor:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Gradient Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchGradientMatMulLayer:()MLCEngineDispatch sourceGradientTensor:resultGradientTensors:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: dispatch gradient layer with BNNS failed for matrix multiply:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchGradientMHALayer:()MLCEngineDispatch sourceGradientTensor:resultGradientTensors:resultStateIsTemporary:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Gradient Layer with BNNS failed for multihead attention:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchGradientLossLayer:()MLCEngineDispatch sourceGradientTensor:labelsTensor:labelsTensorStride:weightsTensor:resultGradientTensor:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Gradient Loss Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchForwardAndGradientLossLayer:()MLCEngineDispatch sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultGradientTensor:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch Forward + Gradient Loss Layer with BNNS failed:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchRNNForwardLayer:()MLCEngineDispatch sourceTensors:resultTensors:resultStateIsTemporary:forTraining:.cold.1()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch RNN Forward with States failed with error %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)dispatchRNNForwardLayer:()MLCEngineDispatch sourceTensors:resultTensors:resultStateIsTemporary:forTraining:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "Dispatch RNN Forward with States failed. LSTM expects input to be 3D tensor with shape [sequenceLength, batchSize, inputSize]", v1, 2u);
}

- (void)dispatchRNNForwardLayer:()MLCEngineDispatch sourceTensors:resultTensors:resultStateIsTemporary:forTraining:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Source tensor must be a 3D tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchRNNGradientLayer:()MLCEngineDispatch sourceGradientTensors:resultGradientTensors:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Missing gradient data for parameters.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchRNNGradientLayer:()MLCEngineDispatch sourceGradientTensors:resultGradientTensors:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Missing gradient data for stacked input weights.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchRNNGradientLayer:()MLCEngineDispatch sourceGradientTensors:resultGradientTensors:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Missing gradient data for bias.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchRNNGradientLayer:()MLCEngineDispatch sourceGradientTensors:resultGradientTensors:.cold.4()
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
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Dispatch RNN Gradient failed with error %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

@end
