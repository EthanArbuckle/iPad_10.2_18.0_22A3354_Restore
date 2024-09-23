@implementation AppleIDGetLogHandle

void __AppleIDGetLogHandle_block_invoke()
{
  uint64_t v0;
  uint8_t v1[16];

  AppleIDGetLogHandle::sHandle = (uint64_t)os_log_create("com.apple.AppleIDAuth", "core");
  if (!AppleIDGetLogHandle::sHandle)
  {
    v0 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_182882000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "### AppleIDAuth create log handle failed\n", v1, 2u);
    }
    AppleIDGetLogHandle::sHandle = v0;
  }
}

@end
