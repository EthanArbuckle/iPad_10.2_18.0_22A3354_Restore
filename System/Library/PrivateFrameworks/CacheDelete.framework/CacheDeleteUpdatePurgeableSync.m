@implementation CacheDeleteUpdatePurgeableSync

uint64_t __CacheDeleteUpdatePurgeableSync_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientUpdatePurgeable:", *(_QWORD *)(a1 + 32));
}

void __CacheDeleteUpdatePurgeableSync_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "Failed to update purgeable with CACHE_DELETE_PUSHED_KEY:YES %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
