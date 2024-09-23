@implementation LoadCoreAnalytics

void __LoadCoreAnalytics_block_invoke()
{
  int v0;
  char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_68 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  if (!_MergedGlobals_68 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v0 = 136315138;
    v1 = dlerror();
    _os_log_fault_impl(&dword_18A253000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "### Failed to Soft Link: /System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics\n%s", (uint8_t *)&v0, 0xCu);
  }
}

@end
