@implementation MLCDeviceGPU(MLCEngineDispatch)

- (void)dispatchRNNForwardLayer:()MLCEngineDispatch sourceTensors:resultTensors:resultStateIsTemporary:forTraining:.cold.1(uint8_t *a1, SEL aSelector, _QWORD *a3, NSObject *a4)
{
  void *v7;

  NSStringFromSelector(aSelector);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D4999000, a4, OS_LOG_TYPE_ERROR, "%@: LSTM input tensor is not 3-dimensional with NTC layout", a1, 0xCu);

}

- (void)updateWithOptimizer:()MLCEngineDispatch arrayOfParams:commandBuffer:deviceParameter:source:gradient:result:momentumIndex:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v4, "%@: Unsupported optimizer type, only SGD, Adam and RMSProp optimizers are supported.", (uint8_t *)&v5);

}

- (void)updateAllParametersWithOptimizer:()MLCEngineDispatch arrayOfParameters:.cold.1(uint8_t *a1, SEL aSelector, _QWORD *a3, NSObject *a4)
{
  void *v7;

  NSStringFromSelector(aSelector);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D4999000, a4, OS_LOG_TYPE_ERROR, "%@: Unsupported optimizer type, only SGD, Adam and RMSProp optimizers are supported.", a1, 0xCu);

}

- (void)convertUpdatesToTensorDataForLayer:()MLCEngineDispatch .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) convertUpdatesToTensorDataForLayer:]";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: failed to convert weight gradient layout for a convolution layer", a1);
}

- (void)convertUpdatesToTensorDataForLayer:()MLCEngineDispatch .cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) convertUpdatesToTensorDataForLayer:]";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: failed to convert weight layout from OIHW to IOHW for a convolution transpose layer", a1);
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:()MLCEngineDispatch .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) reloadParameterDataFromHostToDeviceMemoryForTensor:]";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: failed to convert weight layout for a convolution layer", a1);
}

@end
