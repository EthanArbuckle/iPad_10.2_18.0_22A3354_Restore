@implementation LoadCrashReporterSupport

void __LoadCrashReporterSupport_block_invoke()
{
  LoadCrashReporterSupport_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (!LoadCrashReporterSupport_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadCrashReporterSupport_block_invoke_cold_1();
}

void __LoadCrashReporterSupport_block_invoke_0()
{
  LoadCrashReporterSupport_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (!LoadCrashReporterSupport_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadCrashReporterSupport_block_invoke_cold_1();
}

void __LoadCrashReporterSupport_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_18F80C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport (%d)", (uint8_t *)v1, 8u);
}

@end
