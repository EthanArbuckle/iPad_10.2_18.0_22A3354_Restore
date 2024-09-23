@implementation LoadSiriActivation

void __LoadSiriActivation_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSiriActivation_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation", 1);
  if (!LoadSiriActivation_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadSiriActivation_block_invoke_51367()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSiriActivation_frameworkLibrary_51369 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation", 1);
  if (!LoadSiriActivation_frameworkLibrary_51369 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation (%d)", (uint8_t *)v1, 8u);
  }
}

@end
