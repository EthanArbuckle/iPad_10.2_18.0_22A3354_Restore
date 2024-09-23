@implementation MLCDeviceCPU(MLCLayerOperations)

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.1()
{
  void *v0;
  SEL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: NULL filter deviceOpTyp=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.2()
{
  void *v0;
  SEL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: Unsupported deviceOpTyp=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.3()
{
  void *v0;
  SEL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: -compileWithDevice:... failed. deviceOpType=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.17()
{
  void *v0;
  SEL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: -compileWithDevice:... failed. deviceOpTyp=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)embeddingWeightsGradients:()MLCLayerOperations embeddingCount:embeddingDimension:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: -embeddingWeightsGradients:... failed. Can not malloc the size of weight table", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate weight gradients for embedding layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate weight gradients for convolution layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate bias gradients for convolution layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
