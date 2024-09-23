@implementation MapsSuggestionsShortcutTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  const char *v16;
  id v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _BYTE v25[12];
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v7, "seconds");
      v10 = v9;
      GEOConfigGetDouble();
      v12 = v11;
      *(_QWORD *)v25 = 0;
      if (MapsSuggestionsDistanceFromHereToEntry(v6, v25) && (v13 = *(double *)v25, GEOConfigGetDouble(), v13 < v14))
      {
        objc_msgSend(v6, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsAlreadyThereKey"));
      }
      else
      {
        objc_msgSend(v6, "setBoolean:forKey:", v10 < v12, CFSTR("MapsSuggestionsAlreadyThereKey"));
        if (v10 >= v12)
        {
          objc_msgSend(v8, "seconds");
          v20 = v19;
          objc_msgSend(v8, "seconds");
          if (v20 >= 3600.0)
            NSStringFromMapsSuggestionsAbbreviatedETA(v21);
          else
            NSStringFromMapsSuggestionsShortETA(v21);
          v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
          v22 = v17;
          objc_msgSend(v6, "undecoratedTitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 1;
          -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v23, v22, 1);

          goto LABEL_21;
        }
      }
      if (qword_1ED22EEF0 != -1)
        dispatch_once(&qword_1ED22EEF0, &__block_literal_global_5);
      v17 = (id)_MergedGlobals_30;
      goto LABEL_20;
    }
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136446978;
      *(_QWORD *)&v25[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      v26 = 1024;
      v27 = 35;
      v28 = 2082;
      v29 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:eta:]";
      v30 = 2082;
      v31 = "nil == (eta)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
      goto LABEL_14;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136446978;
      *(_QWORD *)&v25[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      v26 = 1024;
      v27 = 34;
      v28 = 2082;
      v29 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:eta:]";
      v30 = 2082;
      v31 = "nil == (entry)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
LABEL_14:
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, v16, v25, 0x26u);
    }
  }

  v18 = 0;
LABEL_21:

  return v18;
}

- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5
{
  id v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    GEOConfigGetDouble();
    v9 = v8;
    objc_msgSend(v7, "setBoolean:forKey:", v8 > a4, CFSTR("MapsSuggestionsAlreadyThereKey"));
    if (v9 <= a4)
    {
      MapsSuggestionsDistanceString();
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (qword_1ED22EEF0 != -1)
        dispatch_once(&qword_1ED22EEF0, &__block_literal_global_5);
      v10 = (id)_MergedGlobals_30;
    }
    v12 = v10;
    objc_msgSend(v7, "undecoratedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v7, v13, v12, 1);

  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      v17 = 1024;
      v18 = 71;
      v19 = 2082;
      v20 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v15, 0x26u);
    }

  }
  return v7 != 0;
}

@end
