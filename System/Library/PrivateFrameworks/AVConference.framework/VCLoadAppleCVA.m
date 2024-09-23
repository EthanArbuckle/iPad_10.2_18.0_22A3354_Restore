@implementation VCLoadAppleCVA

void __VCLoadAppleCVA_block_invoke()
{
  uint64_t v0;
  NSObject *v1;

  sVCAppleCVAFrameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AppleCVA.framework/AppleCVA", 2);
  if (!sVCAppleCVAFrameworkLibrary && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VCLoadAppleCVA_block_invoke_cold_1(v0, v1);
  }
}

void __VCLoadAppleCVA_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "VCLoadAppleCVA_block_invoke";
  v7 = 1024;
  v8 = 48;
  v9 = 2080;
  v10 = dlerror();
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to soft link AppleCVA.framework: %s", (uint8_t *)&v3, 0x26u);
}

@end
