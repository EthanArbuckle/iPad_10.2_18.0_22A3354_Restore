@implementation LoadPeopleSuggester

void __LoadPeopleSuggester_block_invoke()
{
  LoadPeopleSuggester_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPeopleSuggester_block_invoke_cold_1();
}

void __LoadPeopleSuggester_block_invoke_0()
{
  LoadPeopleSuggester_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPeopleSuggester_block_invoke_cold_1();
}

void __LoadPeopleSuggester_block_invoke_1()
{
  LoadPeopleSuggester_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPeopleSuggester_block_invoke_cold_1();
}

void __LoadPeopleSuggester_block_invoke_2()
{
  LoadPeopleSuggester_frameworkLibrary_2 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPeopleSuggester_block_invoke_cold_1();
}

void __LoadPeopleSuggester_block_invoke_3()
{
  LoadPeopleSuggester_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadPeopleSuggester_block_invoke_cold_1();
}

void __LoadPeopleSuggester_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1B9950000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester (%d)", (uint8_t *)v1, 8u);
}

@end
