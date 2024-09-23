@implementation CacheDeleteRegisterCallbacksForProcess

uint64_t __CacheDeleteRegisterCallbacksForProcess_block_invoke(void **a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEFAULT, "re-registering %@, deleted has been relaunched", (uint8_t *)&v5, 0xCu);
  }

  return _CacheDeleteRegisterLegacyCallbacks(a1[4], a1[5], a1[6], a1[7], a1[8], 1);
}

@end
