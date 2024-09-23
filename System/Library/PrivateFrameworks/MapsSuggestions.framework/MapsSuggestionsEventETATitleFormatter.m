@implementation MapsSuggestionsEventETATitleFormatter

- (BOOL)shouldDecorateEntry:(id)a3 withETA:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  const __CFString *v23;
  const char *v24;
  NSObject *v26;
  int v27;
  double v28;
  __int16 v29;
  _BYTE v30[28];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v27 = 136446978;
    v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
    v29 = 1024;
    *(_DWORD *)v30 = 18;
    *(_WORD *)&v30[4] = 2082;
    *(_QWORD *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:]";
    *(_WORD *)&v30[14] = 2082;
    *(_QWORD *)&v30[16] = "nil == (entry)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_18:
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v27, 0x26u);
    goto LABEL_19;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v27 = 136446978;
    v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
    v29 = 1024;
    *(_DWORD *)v30 = 19;
    *(_WORD *)&v30[4] = 2082;
    *(_QWORD *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:]";
    *(_WORD *)&v30[14] = 2082;
    *(_QWORD *)&v30[16] = "nil == (eta)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsAlreadyThereKey"), 1) & 1) != 0)
    goto LABEL_20;
  LOBYTE(v9) = 1;
  if ((objc_msgSend(v6, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsWithinImminentTimeWindowKey"), 1) & 1) == 0)
  {
    objc_msgSend(v6, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "seconds");
      v11 = v10;
      v12 = v6;
      v13 = v12;
      if (self)
      {
        if ((objc_msgSend(v12, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")) & 1) != 0)
        {
          objc_msgSend(v13, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MapsSuggestionsNow();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceDate:", v15);
          v17 = v16;

          objc_msgSend(v13, "type");
          GEOConfigGetDouble();
          v19 = v11 * v18;
          GEOConfigGetDouble();
          v21 = fmax(v19, v20);
          GEOFindOrCreateLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = CFSTR("NO");
            v29 = 2048;
            v27 = 134218754;
            v28 = v17 / 60.0;
            *(double *)v30 = v11 / 60.0;
            if (v17 <= v21)
              v23 = CFSTR("Yes");
            *(_WORD *)&v30[8] = 2112;
            *(_QWORD *)&v30[10] = v14;
            *(_WORD *)&v30[18] = 2112;
            *(_QWORD *)&v30[20] = v23;
            _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "timeToEvent: %f min, eta: %f min, scheduledTime %@, meetsThreshold: %@", (uint8_t *)&v27, 0x2Au);
          }

          if (v17 <= v21)
          {
            LOBYTE(v9) = 1;
            objc_msgSend(v13, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsWithinImminentTimeWindowKey"));
            goto LABEL_21;
          }
LABEL_20:
          LOBYTE(v9) = 0;
          goto LABEL_21;
        }
        GEOFindOrCreateLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = 136446978;
          v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
          v29 = 1024;
          *(_DWORD *)v30 = 41;
          *(_WORD *)&v30[4] = 2082;
          *(_QWORD *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter _etaDuration:meetsThresholdForEntry:]";
          *(_WORD *)&v30[14] = 2082;
          *(_QWORD *)&v30[16] = "[entry containsKey:MapsSuggestionsScheduledTimeKey] == NO";
          _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry doesn't have a value for MapsSuggestionsScheduledTimeKey to verify if we are in the time window", (uint8_t *)&v27, 0x26u);
        }

      }
LABEL_19:

      goto LABEL_20;
    }
  }
LABEL_21:

  return (char)v9;
}

@end
