@implementation AAURLSessionSharedCache

void ___AAURLSessionSharedCache_block_invoke(uint64_t a1)
{
  int v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = objc_alloc(MEMORY[0x1E0C92C50]);
  if (v1)
    v3 = 20971520;
  else
    v3 = 0;
  v4 = objc_msgSend(v2, "_initWithMemoryCapacity:diskCapacity:relativePath:", 0x400000, v3, CFSTR("com.apple.AppleAccount"));
  v5 = (void *)_AAURLSessionSharedCache_sharedCache;
  _AAURLSessionSharedCache_sharedCache = v4;

  objc_msgSend((id)_AAURLSessionSharedCache_sharedCache, "_CFURLCache");
  v6 = _CFURLCacheCopyCacheDirectory();
  if (v6)
  {
    v7 = (const void *)v6;
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      ___AAURLSessionSharedCache_block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    CFRelease(v7);
  }
}

void ___AAURLSessionSharedCache_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a2, a3, "Using shared cache at path: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

@end
