@implementation LoadSocial

void __LoadSocial_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSocial_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  if (!LoadSocial_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Social.framework/Social (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadSocial_block_invoke_21565()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSocial_frameworkLibrary_21566 = (uint64_t)dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  if (!LoadSocial_frameworkLibrary_21566 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Social.framework/Social (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadSocial_block_invoke_55716()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSocial_frameworkLibrary_55717 = (uint64_t)dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  if (!LoadSocial_frameworkLibrary_55717 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Social.framework/Social (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadSocial_block_invoke_60531()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadSocial_frameworkLibrary_60532 = (uint64_t)dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  if (!LoadSocial_frameworkLibrary_60532 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Social.framework/Social (%d)", (uint8_t *)v1, 8u);
  }
}

@end
