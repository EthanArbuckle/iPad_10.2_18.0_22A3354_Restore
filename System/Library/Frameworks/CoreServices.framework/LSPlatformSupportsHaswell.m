@implementation LSPlatformSupportsHaswell

void ___LSPlatformSupportsHaswell_block_invoke()
{
  int v0;
  NSObject *v1;
  size_t v2;
  int v3;

  v3 = 0;
  v2 = 4;
  if (sysctlbyname("hw.optional.avx2_0", &v3, &v2, 0, 0))
  {
    v0 = *__error();
    _LSDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      ___LSPlatformSupportsHaswell_block_invoke_cold_1(v0, v1);

  }
  else
  {
    _LSPlatformSupportsHaswell::canRun = v3 > 0;
  }
}

void ___LSPlatformSupportsHaswell_block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "could not check sysctl hw.optional.avx2_0: %d", (uint8_t *)v2, 8u);
}

@end
