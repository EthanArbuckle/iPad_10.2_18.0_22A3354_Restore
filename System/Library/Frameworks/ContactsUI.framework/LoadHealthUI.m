@implementation LoadHealthUI

void __LoadHealthUI_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadHealthUI_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/HealthUI.framework/HealthUI", 1);
  if (!LoadHealthUI_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/HealthUI.framework/HealthUI (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadHealthUI_block_invoke_30320()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadHealthUI_frameworkLibrary_30322 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/HealthUI.framework/HealthUI", 1);
  if (!LoadHealthUI_frameworkLibrary_30322 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/HealthUI.framework/HealthUI (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadHealthUI_block_invoke_39359()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadHealthUI_frameworkLibrary_39360 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/HealthUI.framework/HealthUI", 1);
  if (!LoadHealthUI_frameworkLibrary_39360 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/HealthUI.framework/HealthUI (%d)", (uint8_t *)v1, 8u);
  }
}

@end
