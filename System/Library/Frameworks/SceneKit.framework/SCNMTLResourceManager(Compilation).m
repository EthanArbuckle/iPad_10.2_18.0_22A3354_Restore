@implementation SCNMTLResourceManager(Compilation)

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Metal renderer does not support nil vertex function name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Metal renderer does not support other shaders than Metal", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_createPipelineStateWithDescriptor:()Compilation desc:pipeline:.cold.1(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown compilation mode %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)_newComputeDescriptorForPipelineDesc:()Compilation library:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Failed to find compute function '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_newComputeDescriptorForPipelineDesc:()Compilation library:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Failed to create compute function '%@', error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_configureComputePipeline:()Compilation withDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Failed creating ComputePipelineState, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_computePipelineStateForKernel:()Compilation constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Caching requires a constant hash to be provided when using constants", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)computePipelineStateForKernel:()Compilation withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, a2, a3, "Error: Could not create color space from %@ and %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Unreachable code: Unsupported pixel buffer YCbCr matrix %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Unreachable code: Unsupported pixel buffer format %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
