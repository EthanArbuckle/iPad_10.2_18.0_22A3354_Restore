@implementation LoadPrivacyAccounting

void __LoadPrivacyAccounting_block_invoke()
{
  LoadPrivacyAccounting_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PrivacyAccounting.framework/PrivacyAccounting", 1);
  if (!LoadPrivacyAccounting_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPrivacyAccounting_block_invoke_cold_1();
}

void __LoadPrivacyAccounting_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/PrivacyAccounting.framework/PrivacyAccounting (%d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_4();
}

@end
