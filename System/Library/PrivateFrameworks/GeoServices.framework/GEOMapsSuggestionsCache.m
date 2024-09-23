@implementation GEOMapsSuggestionsCache

+ (id)defaultCacheDir
{
  if (qword_1ECDBC6B8 != -1)
    dispatch_once(&qword_1ECDBC6B8, &__block_literal_global_158);
  return (id)_MergedGlobals_295;
}

void __42__GEOMapsSuggestionsCache_defaultCacheDir__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  unsigned __int8 v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_295;
  _MergedGlobals_295 = v0;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", _MergedGlobals_295, &v9);
  v4 = v9;

  if ((v3 & 1) == 0 && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _MergedGlobals_295, 1, 0, &v8);
    v6 = v8;

    if (v6)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = _MergedGlobals_295;
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Cannot create cache dir at: %{public}@, error: %{public}@", buf, 0x16u);
      }

    }
  }
}

+ (id)defaultPathForProcessName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__GEOMapsSuggestionsCache_defaultPathForProcessName___block_invoke;
  v11[3] = &unk_1E1BFF6D0;
  v12 = v4;
  v13 = a1;
  v5 = qword_1ECDBC6C8;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&qword_1ECDBC6C8, v11);
    v8 = v12;
  }
  v9 = (id)qword_1ECDBC6C0;

  return v9;
}

void __53__GEOMapsSuggestionsCache_defaultPathForProcessName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "defaultCacheDir");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MapsSuggestionsManager_%@.storage"), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECDBC6C0;
    qword_1ECDBC6C0 = v3;

  }
}

+ (id)defaultSuppressedEntriesPath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEOMapsSuggestionsCache_defaultSuppressedEntriesPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC6D8 != -1)
    dispatch_once(&qword_1ECDBC6D8, block);
  return (id)qword_1ECDBC6D0;
}

void __55__GEOMapsSuggestionsCache_defaultSuppressedEntriesPath__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultCacheDir");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suppressedEntries.data"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1ECDBC6D0;
    qword_1ECDBC6D0 = v2;

  }
}

+ (void)pruneOldCacheAtPath:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -GEOConfigGetDouble(GeoServicesConfig_MapsSuggestionsCacheFileMaxAge, (uint64_t)off_1EDF4D258));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "maxAllowedAge was nil", buf, 2u);
      }
      goto LABEL_20;
    }
    v14 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    objc_msgSend(v6, "fileModificationDate");
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8 || v7)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = v3;
        v17 = 2114;
        v18 = v7;
        v12 = "Could not stat file at path: %{public}@, error: %{public}@";
LABEL_17:
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else
    {
      if (-[NSObject compare:](v8, "compare:", v5) != -1)
      {
LABEL_20:

        goto LABEL_21;
      }
      v13 = 0;
      v9 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v13);
      v7 = v13;
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 && !v7)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v16 = v3;
          _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Successfully removed old MapsSuggestions cache at: %{private}@", buf, 0xCu);
        }
        v7 = v11;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = v3;
        v17 = 2114;
        v18 = v7;
        v12 = "Could not remove file at path: %{public}@, error: %{public}@";
        goto LABEL_17;
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapsSuggestionsCache");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v16 = v3;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "No need to purge unexisting MapsSuggestions cache at: %{private}@", buf, 0xCu);
  }
LABEL_21:

}

@end
