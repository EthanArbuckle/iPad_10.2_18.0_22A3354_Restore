@implementation MapsSuggestionsParkedCarDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarDeduper.m";
      v19 = 1024;
      v20 = 23;
      v21 = 2082;
      v22 = "-[MapsSuggestionsParkedCarDeduper dedupeByEnrichingEntry:withEntry:]";
      v23 = 2082;
      v24 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_13:
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x26u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarDeduper.m";
      v19 = 1024;
      v20 = 24;
      v21 = 2082;
      v22 = "-[MapsSuggestionsParkedCarDeduper dedupeByEnrichingEntry:withEntry:]";
      v23 = 2082;
      v24 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(7, v6, v5))
  {
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  v8 = objc_msgSend(v5, "BOOLeanForKey:", CFSTR("MapsSuggestionsRoutineIsBackedByVehicleEventKey"));
  v9 = objc_msgSend(v7, "BOOLeanForKey:", CFSTR("MapsSuggestionsRoutineIsBackedByVehicleEventKey"));
  if (v8 && v9)
  {
    objc_msgSend(v5, "dateForKey:", CFSTR("MapsSuggestionsWhenItHappenedKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateForKey:", CFSTR("MapsSuggestionsWhenItHappenedKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v10, "compare:", v11) + 1) <= 1)
    {
      LOWORD(v16) = 257;
      objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
    }

  }
  else if ((v8 & 1) == 0)
  {
    if (v9)
    {
      LOWORD(v16) = 257;
      objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
    }
    objc_msgSend(v5, "replaceByEntry:", v7);
  }
  v14 = 1;
LABEL_16:

  return v14;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
