@implementation CNUILikenessCache

void __25___CNUILikenessCache_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "likeness-cache");
  v1 = (void *)log_cn_once_object_1_1;
  log_cn_once_object_1_1 = (uint64_t)v0;

}

void __42___CNUILikenessCache_setUpEvictionHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42___CNUILikenessCache_setUpEvictionHandler__block_invoke_2;
  v8[3] = &unk_1EA6042B8;
  v8[4] = WeakRetained;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __42___CNUILikenessCache_setUpEvictionHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEvictCacheEntry:", *(_QWORD *)(a1 + 40));
}

void __48___CNUILikenessCache_setUpMemoryPressureWatcher__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "receiveMemoryPressureSignal");

}

id __47___CNUILikenessCache_objectForKey_onCacheMiss___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

    objc_msgSend(v5, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __33___CNUILikenessCache_emptyCache___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1DD140000, v4, OS_LOG_TYPE_DEFAULT, "Evicting %lu likenesses from the cache", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33___CNUILikenessCache_emptyCache___block_invoke_11;
  v9[3] = &unk_1EA6042B8;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(v6, v9);

}

void __33___CNUILikenessCache_emptyCache___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "didEvictCacheEntry:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

@end
