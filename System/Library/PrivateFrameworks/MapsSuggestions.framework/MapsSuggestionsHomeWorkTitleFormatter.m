@implementation MapsSuggestionsHomeWorkTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkTitleFormatter.m";
    v22 = 1024;
    v23 = 23;
    v24 = 2082;
    v25 = "-[MapsSuggestionsHomeWorkTitleFormatter formatTitlesForEntry:eta:]";
    v26 = 2082;
    v27 = "nil == (entry)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_16:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, 0x26u);
    goto LABEL_17;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkTitleFormatter.m";
    v22 = 1024;
    v23 = 24;
    v24 = 2082;
    v25 = "-[MapsSuggestionsHomeWorkTitleFormatter formatTitlesForEntry:eta:]";
    v26 = 2082;
    v27 = "nil == (eta)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "type") == 1 || objc_msgSend(v6, "type") == 2)
  {
    objc_msgSend(v8, "seconds");
    NSStringFromMapsSuggestionsShortETA(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v15 = 0;
LABEL_26:

      goto LABEL_27;
    }
    if (objc_msgSend(v6, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel")))
    {
      objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineCustomLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        MapsSuggestionsLocalizedETAToDestinationString(v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
    }
    else
    {
      v11 = 0;
    }
    v16 = objc_msgSend(v6, "type");
    if (v16 == 2)
    {
      MapsSuggestionsLocalizedETAToWorkString(v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16 != 1)
      {
        v15 = 0;
        goto LABEL_25;
      }
      MapsSuggestionsLocalizedETAToHomeString(v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
LABEL_23:
    v17 = (void *)v12;
    objc_msgSend(v8, "trafficString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v17, v18, 1);

LABEL_25:
    goto LABEL_26;
  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkTitleFormatter.m";
    v22 = 1024;
    v23 = 26;
    v24 = 2082;
    v25 = "-[MapsSuggestionsHomeWorkTitleFormatter formatTitlesForEntry:eta:]";
    v26 = 2082;
    v27 = "MapsSuggestionsEntryTypeHome != entry.type && MapsSuggestionsEntryTypeWork != entry.type";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be either Home or Work";
    goto LABEL_16;
  }
LABEL_17:

  v15 = 0;
LABEL_27:

  return v15;
}

@end
