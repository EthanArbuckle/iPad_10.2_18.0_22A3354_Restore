@implementation MapsSuggestionsDefaultTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  char v24;
  void *v25;
  void *v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v6, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      v11 = v8;
      v12 = v11;
      if (!self)
      {
        v21 = 0;
        goto LABEL_38;
      }
      objc_msgSend(v11, "seconds");
      NSStringFromMapsSuggestionsShortETA(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "undecoratedSubtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length")
        && -[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:](self, "shouldDecorateEntry:withETA:", v10, v12))
      {
        objc_msgSend(v10, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsCalendarAllDayEventKey"), 1) & 1) != 0
          || MapsSuggestionsIsInThePast(v16))
        {
          v32 = v9;
          MapsSuggestionsLocalizedStringFromGEOTransportType(objc_msgSend(v12, "transportType"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MapsSuggestionsLocalizedETAFormatString(v14, v17);
          v18 = (char *)objc_claimAutoreleasedReturnValue();

          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v19 = v16;
          if (s_verbose)
          {
            GEOFindOrCreateLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v18;
              _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
            }

          }
          v21 = v18;
          v9 = v32;
LABEL_15:

LABEL_37:
LABEL_38:

          v24 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v9, v21, 0);
          goto LABEL_39;
        }
        if (v16)
        {
          v33 = v16;
          NSStringFromMapsSuggestionsEventTime(v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          MapsSuggestionsLocalizedStringFromGEOTransportType(objc_msgSend(v12, "transportType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v25;
          MapsSuggestionsLocalizedETAFormatStringWithTime(v25, v14, v26);
          v27 = (char *)objc_claimAutoreleasedReturnValue();

          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v19 = v33;
          if (s_verbose)
          {
            GEOFindOrCreateLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v27;
              _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
            }

          }
          v21 = v27;

          goto LABEL_15;
        }
      }
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (const char *)v15;
          _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
        }

      }
      v21 = v15;
      goto LABEL_37;
    }
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefaultTitleFormatter.m";
      v36 = 1024;
      v37 = 25;
      v38 = 2082;
      v39 = "-[MapsSuggestionsDefaultTitleFormatter formatTitlesForEntry:eta:]";
      v40 = 2082;
      v41 = "nil == (eta)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
      goto LABEL_20;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefaultTitleFormatter.m";
      v36 = 1024;
      v37 = 24;
      v38 = 2082;
      v39 = "-[MapsSuggestionsDefaultTitleFormatter formatTitlesForEntry:eta:]";
      v40 = 2082;
      v41 = "nil == (entry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_20:
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
  }

  v24 = 0;
LABEL_39:

  return v24;
}

@end
