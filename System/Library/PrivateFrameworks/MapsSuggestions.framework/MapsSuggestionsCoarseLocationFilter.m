@implementation MapsSuggestionsCoarseLocationFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    if (v5 > 0x18)
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCoarseLocationFilter.m";
        v12 = 1024;
        v13 = 62;
        v14 = 2082;
        v15 = "-[MapsSuggestionsCoarseLocationFilter shouldKeepEntry:]";
        v16 = 2082;
        v17 = "YES";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v10, 0x26u);
      }

    }
    else if (((1 << v5) & 0x1D7FD69) == 0)
    {
      if (((1 << v5) & 0x200290) != 0)
      {
        LODWORD(v6) = MapsSuggestionsIsInCoarseLocation() ^ 1;
        goto LABEL_12;
      }
      if (MapsSuggestionsIsInCoarseLocation())
      {
        objc_msgSend(v4, "originatingSourceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v6) = objc_msgSend(v7, "containsString:", CFSTR("RoutineSource")) ^ 1;

        goto LABEL_12;
      }
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCoarseLocationFilter.m";
      v12 = 1024;
      v13 = 22;
      v14 = 2082;
      v15 = "-[MapsSuggestionsCoarseLocationFilter shouldKeepEntry:]";
      v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v10, 0x26u);
    }

    LOBYTE(v6) = 0;
  }
LABEL_12:

  return (char)v6;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
