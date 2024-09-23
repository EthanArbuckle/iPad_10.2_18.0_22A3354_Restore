@implementation VCAVFoundationLoadARKit

void __VCAVFoundationLoadARKit_block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;

  v0 = dlopen("/System/Library/Frameworks/ARKit.framework/ARKit", 2);
  VCAVFoundationLoadARKit_frameworkLibrary = (uint64_t)v0;
  if (v0)
  {
    sVC_ARAdjustIntrinsicsForViewportSize = dlsym(v0, "ARAdjustIntrinsicsForViewportSize");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v1 = VRTraceErrorLogLevelToCSTR();
    v2 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VCAVFoundationLoadARKit_block_invoke_cold_1(v1, v2);
  }
}

void __VCAVFoundationLoadARKit_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dlerror();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  v7 = 149;
  v8 = v3;
  v9 = v4;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a2, v5, " [%s] %s:%d Failed to soft link ARKit.framework: %s", v6);
  OUTLINED_FUNCTION_3_0();
}

@end
