@implementation LoadAvatarPersistence

void __LoadAvatarPersistence_block_invoke()
{
  LoadAvatarPersistence_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AvatarPersistence.framework/AvatarPersistence", 1);
  if (!LoadAvatarPersistence_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAvatarPersistence_block_invoke_cold_1();
}

void __LoadAvatarPersistence_block_invoke_0()
{
  LoadAvatarPersistence_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AvatarPersistence.framework/AvatarPersistence", 1);
  if (!LoadAvatarPersistence_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAvatarPersistence_block_invoke_cold_1_0();
}

void __LoadAvatarPersistence_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/AvatarPersistence.framework/AvatarPersistence (%d)", v1, v2, v3, v4, 0);
}

void __LoadAvatarPersistence_block_invoke_cold_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/AvatarPersistence.framework/AvatarPersistence (%d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_4();
}

@end
