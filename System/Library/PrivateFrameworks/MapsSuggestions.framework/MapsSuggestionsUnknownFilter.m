@implementation MapsSuggestionsUnknownFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUnknownFilter.m";
      v13 = 1024;
      v14 = 21;
      v15 = 2082;
      v16 = "-[MapsSuggestionsUnknownFilter shouldKeepEntry:]";
      v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "type"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithFormat:", CFSTR("Trapped an Unknown SuggestionsEntry: %@"), v8);

    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = (const char *)v6;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = 1;
LABEL_10:

  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
