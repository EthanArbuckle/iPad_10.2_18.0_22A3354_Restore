@implementation MLCDeviceANE(MLCLayerOperations)

- (void)convolutionTransposeLayerWithDescriptor:()MLCLayerOperations weights:biasTerms:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unimplemented", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)lossLayerWithDescriptor:()MLCLayerOperations .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unsupported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: graphLayerList is either nil or empty", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: ANE and secondary devices must be provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.3(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "canMergeANESubgraphs";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: Graph has been partitioned incorrectly", a1);
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.4()
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Cannot build ANE subgraph from a layer = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no plist builder instance found", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.2()
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to compute liveInputs of a graph with rootLayer  = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.3()
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: tensor = %@ was not defined by any layer and cannot be used as liveout", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.4()
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to build the ANEC IR network and procedure for layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

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

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: unsupported deviceOpType=%d", v4, v5, v6, v7, 2u);

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

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v2, v3, "%@: failed to compile a layer. deviceOpType=%d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_1();
}

@end
