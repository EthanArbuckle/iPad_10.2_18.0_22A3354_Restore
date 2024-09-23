@implementation MapsSuggestionsNoTitleFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
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
  if (!v3)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoTitleFilter.m";
      v14 = 1024;
      v15 = 21;
      v16 = 2082;
      v17 = "-[MapsSuggestionsNoTitleFilter shouldKeepEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v3, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v4, "title"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        !v8))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
