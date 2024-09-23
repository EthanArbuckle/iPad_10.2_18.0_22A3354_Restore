@implementation LoadCoreLocation

void __LoadCoreLocation_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadCoreLocation_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 1);
  if (!LoadCoreLocation_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/CoreLocation.framework/CoreLocation (%d)", (uint8_t *)v1, 8u);
  }
}

@end
