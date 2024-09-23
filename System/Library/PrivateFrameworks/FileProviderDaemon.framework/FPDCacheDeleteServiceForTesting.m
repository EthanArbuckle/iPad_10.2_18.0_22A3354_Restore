@implementation FPDCacheDeleteServiceForTesting

+ (id)testingInstance
{
  void *v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FPDCacheDeleteServiceForTesting_testingInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (testingInstance_once != -1)
    dispatch_once(&testingInstance_once, block);
  v2 = *(void **)(testingInstance_testingInstance + 8);
  *(_QWORD *)(testingInstance_testingInstance + 8) = CFSTR("com.apple.FileProvider.cache-delete-testing");

  return (id)testingInstance_testingInstance;
}

void __50__FPDCacheDeleteServiceForTesting_testingInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)testingInstance_testingInstance;
  testingInstance_testingInstance = (uint64_t)v1;

}

- (void)registerCacheDeleteCallbacks
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke;
  v8 = &unk_1E8C76E18;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1D17D1C84](&v5);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CACHE_DELETE_CACHE_ENABLED"), 0, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("CACHE_DELETE_NOTIFICATIONS");
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  if (CacheDeleteRegisterForProcess())
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FPDCacheDeleteService registerCacheDeleteCallbacks].cold.2();
  }
  else
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FPDCacheDeleteService registerCacheDeleteCallbacks].cold.1();
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  NSObject **v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject **v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(a2, "objectForKey:", CFSTR("CACHE_DELETE_CACHE_ENABLED"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = (NSObject **)WeakRetained;
    objc_sync_enter(v6);
    if (*((unsigned __int8 *)v6 + 32) != v5)
    {
      *((_BYTE *)v6 + 32) = v5;
      v7 = v6[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke_2;
      block[3] = &unk_1E8C75E48;
      v9 = v6;
      dispatch_async(v7, block);

    }
    objc_sync_exit(v6);

  }
}

void __63__FPDCacheDeleteServiceForTesting_registerCacheDeleteCallbacks__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

@end
