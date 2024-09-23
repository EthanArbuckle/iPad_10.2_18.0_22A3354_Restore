@implementation LoadCoreText

void __LoadCoreText_block_invoke()
{
  LoadCoreText_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreText.framework/CoreText", 1);
  if (!LoadCoreText_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadCoreText_block_invoke_cold_1();
}

void __LoadCoreText_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_3(&dword_18F80C000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/Frameworks/CoreText.framework/CoreText (%d)", v1, v2, v3, v4, 0);
}

@end
