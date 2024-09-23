@implementation LoadCoreSuggestions

void __LoadCoreSuggestions_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadCoreSuggestions_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions", 1);
  if (!LoadCoreSuggestions_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadCoreSuggestions_block_invoke_47529()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadCoreSuggestions_frameworkLibrary_47530 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions", 1);
  if (!LoadCoreSuggestions_frameworkLibrary_47530 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions (%d)", (uint8_t *)v1, 8u);
  }
}

@end
