@implementation MapsSuggestionsAlreadyThereFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    if (v5 > 0x18)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 136446978;
        v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAlreadyThereFilter.m";
        v11 = 1024;
        v12 = 59;
        v13 = 2082;
        v14 = "-[MapsSuggestionsAlreadyThereFilter shouldKeepEntry:]";
        v15 = 2082;
        v16 = "YES";
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v9, 0x26u);
      }

      goto LABEL_14;
    }
    if (((1 << v5) & 0x1827FF9) == 0 && (((1 << v5) & 0x4C0006) == 0 || (objc_msgSend(v4, "isShortcut") & 1) != 0))
    {
LABEL_14:
      LOBYTE(v6) = 1;
      goto LABEL_15;
    }
    LODWORD(v6) = objc_msgSend(v4, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsAlreadyThereKey"), 1) ^ 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAlreadyThereFilter.m";
      v11 = 1024;
      v12 = 21;
      v13 = 2082;
      v14 = "-[MapsSuggestionsAlreadyThereFilter shouldKeepEntry:]";
      v15 = 2082;
      v16 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v9, 0x26u);
    }

    LOBYTE(v6) = 0;
  }
LABEL_15:

  return (char)v6;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
