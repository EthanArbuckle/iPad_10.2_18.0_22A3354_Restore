@implementation CacheDeletePurgeSpaceWithInfo

void __CacheDeletePurgeSpaceWithInfo_block_invoke(uint64_t a1)
{
  _CacheDeletePurgeSpaceWithInfo(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void ___CacheDeletePurgeSpaceWithInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___CacheDeletePurgeSpaceWithInfo_block_invoke_2;
  v6[3] = &unk_1E4A32868;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "clientPurge:replyBlock:", v3, v6);

}

void ___CacheDeletePurgeSpaceWithInfo_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "_CacheDeletePurgeSpaceWithInfo purged: %{public}@ bytes from %{public}@", (uint8_t *)&v8, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void ___CacheDeletePurgeSpaceWithInfo_block_invoke_234(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Failed to purge space: %{public}@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = CFSTR("CACHE_DELETE_ERROR");
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
