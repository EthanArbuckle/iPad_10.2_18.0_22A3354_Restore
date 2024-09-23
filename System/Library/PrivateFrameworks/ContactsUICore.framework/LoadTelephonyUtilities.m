@implementation LoadTelephonyUtilities

void __LoadTelephonyUtilities_block_invoke()
{
  LoadTelephonyUtilities_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_0()
{
  LoadTelephonyUtilities_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_1()
{
  LoadTelephonyUtilities_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1_0();
}

void __LoadTelephonyUtilities_block_invoke_2()
{
  LoadTelephonyUtilities_frameworkLibrary_2 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_3()
{
  LoadTelephonyUtilities_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_4()
{
  LoadTelephonyUtilities_frameworkLibrary_4 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_5()
{
  LoadTelephonyUtilities_frameworkLibrary_5 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 1);
  if (!LoadTelephonyUtilities_frameworkLibrary_5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadTelephonyUtilities_block_invoke_cold_1();
}

void __LoadTelephonyUtilities_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1DD140000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities (%d)", (uint8_t *)v1, 8u);
}

void __LoadTelephonyUtilities_block_invoke_cold_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_2(&dword_1DD140000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities (%d)", v1, v2, v3, v4, 0);
}

@end
