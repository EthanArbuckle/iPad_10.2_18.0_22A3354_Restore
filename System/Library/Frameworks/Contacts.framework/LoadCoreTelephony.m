@implementation LoadCoreTelephony

void __LoadCoreTelephony_block_invoke()
{
  LoadCoreTelephony_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  if (!LoadCoreTelephony_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadCoreTelephony_block_invoke_cold_1();
}

void __LoadCoreTelephony_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/Frameworks/CoreTelephony.framework/CoreTelephony (%d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_4();
}

@end
