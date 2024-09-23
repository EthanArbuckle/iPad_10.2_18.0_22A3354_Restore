@implementation MapsSuggestionsRatingRequestImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  char v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestImprover.m";
      v16 = 1024;
      v17 = 47;
      v18 = 2082;
      v19 = "-[MapsSuggestionsRatingRequestImprover improveEntry:]";
      v20 = 2082;
      v21 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v14, 0x26u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") != 21)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_14;
  }
  v6 = v5;
  if ((objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineLastVisit")) & 1) != 0)
  {
    objc_msgSend(v6, "dateForKey:", CFSTR("MapsSuggestionsCoreRoutineLastVisit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MapsSuggestionsSecondsSince(v7);
    v9 = v8 + 86400.0 - MapsSuggestionsTimeSinceMidnight();
    if (v9 >= 86400.0)
      MapsSuggestionsLocalizedVisitedTimeAgo(v9);
    else
      MapsSuggestionsLocalizedVisitedToday();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MapsSuggestionsLocalizedSubtitleForRatingRequest();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v12, v6);
LABEL_14:

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
