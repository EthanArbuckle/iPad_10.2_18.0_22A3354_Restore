@implementation CacheDeleteCancelPurge

void __CacheDeleteCancelPurge_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("CACHE_DELETE_TOKEN");
  v7[0] = v2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientCancelPurge:", v5);

}

void __CacheDeleteCancelPurge_block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "Failed to cancel purge: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
