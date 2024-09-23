@implementation LoadAvatarKit

void __LoadAvatarKit_block_invoke()
{
  LoadAvatarKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit", 1);
  if (!LoadAvatarKit_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAvatarKit_block_invoke_cold_1();
}

void __LoadAvatarKit_block_invoke_0()
{
  LoadAvatarKit_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit", 1);
  if (!LoadAvatarKit_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAvatarKit_block_invoke_cold_1_0();
}

void __LoadAvatarKit_block_invoke_1()
{
  LoadAvatarKit_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit", 1);
  if (!LoadAvatarKit_frameworkLibrary_1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAvatarKit_block_invoke_cold_1_1();
}

void __LoadAvatarKit_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_18F8BD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit (%d)", (uint8_t *)v1, 8u);
}

void __LoadAvatarKit_block_invoke_cold_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit (%d)", v1, v2, v3, v4, 0);
}

void __LoadAvatarKit_block_invoke_cold_1_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/AvatarKit.framework/AvatarKit (%d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_4();
}

@end
