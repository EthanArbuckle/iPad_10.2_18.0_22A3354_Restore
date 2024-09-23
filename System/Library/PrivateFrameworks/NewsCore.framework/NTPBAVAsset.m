@implementation NTPBAVAsset

- (id)resolvedCacheURL
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "bookmark");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v1 = 0;
LABEL_11:

      return v1;
    }
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v2, 0, 0, 0, &v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;
    v5 = v4;
    if (v3)
    {
      if ((objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
      {
        v1 = v3;
LABEL_10:

        goto LABEL_11;
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_125;
      v8[3] = &unk_1E463D4B8;
      v8[4] = v1;
      v9 = v5;
      __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_125((uint64_t)v8);
      v1 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v9;
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2;
      v10[3] = &unk_1E463D4B8;
      v10[4] = v1;
      v11 = v4;
      __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2((uint64_t)v10);
      v1 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v11;
    }

    goto LABEL_10;
  }
  return v1;
}

uint64_t __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "AV asset cache failed to turn bookmark data into bookmark for %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

uint64_t __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_125(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "AV asset cache found bookmark whose file isn't reachable for %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

@end
