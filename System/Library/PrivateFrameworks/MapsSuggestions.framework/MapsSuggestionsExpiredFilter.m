@implementation MapsSuggestionsExpiredFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "expires");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "expires");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MapsSuggestionsIsInThePast(v6);

      v8 = !v7;
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412290;
        v13 = (const char *)v4;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "This entry did not have an expiration: %@", (uint8_t *)&v12, 0xCu);
      }

      v8 = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsExpiredFilter.m";
      v14 = 1024;
      v15 = 21;
      v16 = 2082;
      v17 = "-[MapsSuggestionsExpiredFilter shouldKeepEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v12, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
