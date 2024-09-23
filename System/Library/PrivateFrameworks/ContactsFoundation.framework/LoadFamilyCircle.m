@implementation LoadFamilyCircle

void __LoadFamilyCircle_block_invoke()
{
  LoadFamilyCircle_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  if (!LoadFamilyCircle_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadFamilyCircle_block_invoke_cold_1();
}

void __LoadFamilyCircle_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_18F80C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle (%d)", (uint8_t *)v1, 8u);
}

@end
