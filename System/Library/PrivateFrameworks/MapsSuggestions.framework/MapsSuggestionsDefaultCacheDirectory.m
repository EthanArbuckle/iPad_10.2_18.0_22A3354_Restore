@implementation MapsSuggestionsDefaultCacheDirectory

void __MapsSuggestionsDefaultCacheDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D270B0], "pathFor:", 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", _MergedGlobals_37, 0);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _MergedGlobals_37, 1, 0, &v7);
    v5 = v7;

    if (v5)
    {
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v9 = _MergedGlobals_37;
        v10 = 2114;
        v11 = v5;
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_FAULT, "Cannot create cache dir at: %{public}@, error: %{public}@", buf, 0x16u);
      }

    }
  }
}

@end
