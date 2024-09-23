@implementation MapsSuggestionsLowVisitsImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
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
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLowVisitsImprover.m";
      v13 = 1024;
      v14 = 60;
      v15 = 2082;
      v16 = "-[MapsSuggestionsLowVisitsImprover improveEntry:]";
      v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_13;
  }
  objc_msgSend(v3, "weight");
  if (v5 > 0.00001)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  v6 = objc_msgSend(v4, "type");
  v7 = 0;
  if (v6 <= 4 && ((1 << v6) & 0x16) != 0)
  {
    if (objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineVisitsCountKey")))
    {
      v8 = objc_msgSend(v4, "integerForKey:", CFSTR("MapsSuggestionsCoreRoutineVisitsCountKey"));
      if (_MergedGlobals_48 != -1)
        dispatch_once(&_MergedGlobals_48, &__block_literal_global_35);
      if (v8 <= qword_1ED22F148)
      {
        objc_msgSend(v4, "setInteger:forKey:", -1, CFSTR("MapsSuggestionsSinkRankKey"));
        objc_msgSend(v4, "setBoolean:forKey:", 0, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
        v7 = 1;
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
