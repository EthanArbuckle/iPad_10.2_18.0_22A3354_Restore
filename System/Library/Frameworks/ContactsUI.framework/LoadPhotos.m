@implementation LoadPhotos

void __LoadPhotos_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadPhotos_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 1);
  if (!LoadPhotos_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Photos.framework/Photos (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadPhotos_block_invoke_36394()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadPhotos_frameworkLibrary_36396 = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 1);
  if (!LoadPhotos_frameworkLibrary_36396 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Photos.framework/Photos (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadPhotos_block_invoke_42128()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadPhotos_frameworkLibrary_42130 = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 1);
  if (!LoadPhotos_frameworkLibrary_42130 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Photos.framework/Photos (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadPhotos_block_invoke_44963()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadPhotos_frameworkLibrary_44964 = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 1);
  if (!LoadPhotos_frameworkLibrary_44964 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Photos.framework/Photos (%d)", (uint8_t *)v1, 8u);
  }
}

@end
