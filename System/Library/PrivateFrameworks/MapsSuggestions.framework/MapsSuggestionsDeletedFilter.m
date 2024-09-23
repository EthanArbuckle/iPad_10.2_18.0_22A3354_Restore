@implementation MapsSuggestionsDeletedFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "containsKey:", CFSTR("MapsSuggestionsIsSuppressedKey")))
      LODWORD(v5) = objc_msgSend(v4, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsSuppressedKey"), 1) ^ 1;
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDeletedFilter.m";
      v9 = 1024;
      v10 = 21;
      v11 = 2082;
      v12 = "-[MapsSuggestionsDeletedFilter shouldKeepEntry:]";
      v13 = 2082;
      v14 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v7, 0x26u);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
