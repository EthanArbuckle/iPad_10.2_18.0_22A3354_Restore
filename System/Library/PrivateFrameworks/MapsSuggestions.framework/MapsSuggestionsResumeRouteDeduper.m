@implementation MapsSuggestionsResumeRouteDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  void *v13;
  void *v14;
  int v15;
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
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteDeduper.m";
      v19 = 1024;
      v20 = 22;
      v21 = 2082;
      v22 = "-[MapsSuggestionsResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      v23 = 2082;
      v24 = "nil == (originalEntry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_12:
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteDeduper.m";
      v19 = 1024;
      v20 = 23;
      v21 = 2082;
      v22 = "-[MapsSuggestionsResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      v23 = 2082;
      v24 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(11, v6, v5))
  {
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "expiresBeforeEntry:", v5))
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "originalEntry expires after entry", buf, 2u);
    }

    goto LABEL_19;
  }
  objc_msgSend(v7, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v15)
  {
    objc_msgSend(v5, "replaceByEntry:", v7);
LABEL_19:
    v11 = 1;
    goto LABEL_15;
  }
  LOWORD(v16) = 0;
  v11 = 1;
  objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
  objc_msgSend(v7, "weight");
  objc_msgSend(v5, "setWeight:");
LABEL_15:

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
