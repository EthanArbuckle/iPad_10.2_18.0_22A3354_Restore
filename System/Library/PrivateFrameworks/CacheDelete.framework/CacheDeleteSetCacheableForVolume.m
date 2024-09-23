@implementation CacheDeleteSetCacheableForVolume

void ___CacheDeleteSetCacheableForVolume_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C9AAA0];
  if (*(_BYTE *)(a1 + 48))
    v3 = MEMORY[0x1E0C9AAB0];
  v26[0] = CFSTR("CACHE_DELETE_CACHE_ENABLED");
  v26[1] = CFSTR("CACHE_DELETE_CACHEABLE_DURATION");
  v4 = *(_QWORD *)(a1 + 32);
  v27[0] = v3;
  v27[1] = v4;
  v26[2] = CFSTR("CACHE_DELETE_TIMESTAMP");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a2;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "clientSetState:key:", v9, *(_QWORD *)(a1 + 40));
  CDGetLogHandle((uint64_t)"client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 48))
      v11 = "TRUE";
    else
      v11 = "FALSE";
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    days_hours_mins(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    objc_msgSend(v16, "dateWithTimeIntervalSinceNow:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315906;
    v19 = v11;
    v20 = 2048;
    v21 = v13;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1A3662000, v10, OS_LOG_TYPE_DEFAULT, "_CacheDeleteSetCacheableForVolume setting cacheable to %s, with a duration of: %f (%@), expiring on: %@", (uint8_t *)&v18, 0x2Au);

  }
}

void ___CacheDeleteSetCacheableForVolume_block_invoke_242(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "_CacheDeleteSetCacheableForVolume CallCacheD error: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
