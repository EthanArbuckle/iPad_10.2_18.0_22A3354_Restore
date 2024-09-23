@implementation MapsSuggestionsFrequentLocationTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  char v17;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFrequentLocationTitleFormatter.m";
    v25 = 1024;
    v26 = 23;
    v27 = 2082;
    v28 = "-[MapsSuggestionsFrequentLocationTitleFormatter formatTitlesForEntry:eta:]";
    v29 = 2082;
    v30 = "nil == (entry)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_18:
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, 0x26u);
    goto LABEL_19;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFrequentLocationTitleFormatter.m";
    v25 = 1024;
    v26 = 24;
    v27 = 2082;
    v28 = "-[MapsSuggestionsFrequentLocationTitleFormatter formatTitlesForEntry:eta:]";
    v29 = 2082;
    v30 = "nil == (eta)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "type") != 4)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFrequentLocationTitleFormatter.m";
      v25 = 1024;
      v26 = 25;
      v27 = 2082;
      v28 = "-[MapsSuggestionsFrequentLocationTitleFormatter formatTitlesForEntry:eta:]";
      v29 = 2082;
      v30 = "MapsSuggestionsEntryTypeFrequentLocation != entry.type";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be FrequentLocation";
      goto LABEL_18;
    }
LABEL_19:

    v17 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v8, "seconds");
  NSStringFromMapsSuggestionsShortETA(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsFrequentLocationTitleWithoutNearKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoMapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", CFSTR("MapsSuggestionsCoreRoutineLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length") && objc_msgSend(v12, "_hasMUID") && objc_msgSend(v12, "_muid"))
  {
    objc_msgSend(v12, "name");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  if (objc_msgSend(v11, "length") && objc_msgSend(v10, "length"))
  {
    if (objc_msgSend(v13, "length"))
      MapsSuggestionsLocalizedFrequentLocationTitleString(v11, v10);
    else
      MapsSuggestionsLocalizedFrequentLocationNearTitleString(v11, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if ((v21 & 1) == 0)
      objc_msgSend(v6, "setTitle:", v19);
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v8, "trafficString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v19, v22, 0);

LABEL_20:
  return v17;
}

@end
