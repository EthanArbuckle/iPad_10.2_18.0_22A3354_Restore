@implementation NTKGPUIsEnabled

void __NTKGPUIsEnabled_block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(off_1E6BCA700, "sharedDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NTKGPUIsEnabled_gpuIsEnabled = v0 != 0;
  if (!v0)
  {
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __NTKGPUIsEnabled_block_invoke_cold_1();

  }
}

void __NTKGPUIsEnabled_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "GPU is NOT enabled. Faces will not load properly.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end
