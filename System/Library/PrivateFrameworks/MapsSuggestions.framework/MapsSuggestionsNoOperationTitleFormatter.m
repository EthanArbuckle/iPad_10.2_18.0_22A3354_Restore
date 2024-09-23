@implementation MapsSuggestionsNoOperationTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
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
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoOperationTitleFormatter.m";
      v14 = 1024;
      v15 = 22;
      v16 = 2082;
      v17 = "-[MapsSuggestionsNoOperationTitleFormatter formatTitlesForEntry:eta:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoOperationTitleFormatter.m";
      v14 = 1024;
      v15 = 23;
      v16 = 2082;
      v17 = "-[MapsSuggestionsNoOperationTitleFormatter formatTitlesForEntry:eta:]";
      v18 = 2082;
      v19 = "nil == (eta)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

@end
