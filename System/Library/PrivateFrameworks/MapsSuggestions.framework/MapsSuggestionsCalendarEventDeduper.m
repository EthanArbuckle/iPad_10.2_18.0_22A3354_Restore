@implementation MapsSuggestionsCalendarEventDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  const char *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventDeduper.m";
      v26 = 1024;
      v27 = 22;
      v28 = 2082;
      v29 = "-[MapsSuggestionsCalendarEventDeduper dedupeByEnrichingEntry:withEntry:]";
      v30 = 2082;
      v31 = "nil == (originalEntry)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_19:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v24, 0x26u);
    }
LABEL_21:

LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventDeduper.m";
      v26 = 1024;
      v27 = 23;
      v28 = 2082;
      v29 = "-[MapsSuggestionsCalendarEventDeduper dedupeByEnrichingEntry:withEntry:]";
      v30 = 2082;
      v31 = "nil == (entry)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(3, v6, v5)
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(13, 3, v5, v7) & 1) == 0
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(14, 3, v5, v7) & 1) == 0
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(15, 3, v5, v7) & 1) == 0
    && !MapsSuggestionsEntriesShouldBeOfOneOfEachType(16, 3, v5, v7))
  {
    goto LABEL_22;
  }
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_10:
    objc_msgSend(v7, "stringForKey:", CFSTR("MapsSuggestionsEventIDKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsEventIDKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && -[NSObject isEqualToString:](v13, "isEqualToString:", v14))
    {

      goto LABEL_13;
    }

    goto LABEL_21;
  }
LABEL_13:
  if (objc_msgSend(v7, "type") == 3)
  {
    v15 = objc_msgSend(v7, "type");
    v16 = v15 == objc_msgSend(v5, "type");
  }
  else
  {
    v16 = 1;
  }
  objc_msgSend(v7, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:", v7, v16);
  if (v20 && (objc_msgSend(v20, "isEqualToDate:", v21) & 1) == 0)
  {
    objc_msgSend(v7, "undecoratedSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUndecoratedSubtitle:", v22);

    objc_msgSend(v7, "subtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v23);

  }
  v18 = 1;
LABEL_23:

  return v18;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
