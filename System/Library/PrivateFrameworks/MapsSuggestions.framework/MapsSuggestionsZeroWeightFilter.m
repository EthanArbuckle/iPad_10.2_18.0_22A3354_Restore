@implementation MapsSuggestionsZeroWeightFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  double v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "weight");
    return v3 > 0.0;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsZeroWeightFilter.m";
      v8 = 1024;
      v9 = 21;
      v10 = 2082;
      v11 = "-[MapsSuggestionsZeroWeightFilter shouldKeepEntry:]";
      v12 = 2082;
      v13 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v6, 0x26u);
    }

    return 0;
  }
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
