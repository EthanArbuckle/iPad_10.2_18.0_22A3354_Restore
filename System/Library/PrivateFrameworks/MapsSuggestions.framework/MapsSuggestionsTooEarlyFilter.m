@implementation MapsSuggestionsTooEarlyFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
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
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = 1;
    switch(objc_msgSend(v3, "type"))
    {
      case 0:
      case 1:
      case 5:
      case 6:
      case 7:
      case 10:
      case 11:
      case 12:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        break;
      case 2:
      case 3:
      case 4:
      case 8:
      case 9:
      case 13:
      case 14:
      case 15:
      case 16:
      case 23:
      case 24:
        GEOConfigGetDouble();
        v9 = v8;
        v10 = v4;
        if (objc_msgSend(v10, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
        {
          objc_msgSend(v10, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          MapsSuggestionsNow();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceDate:", v12);
          v5 = v13 < v9;

        }
        break;
      default:
        GEOFindOrCreateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v15 = 136446978;
          v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooEarlyFilter.m";
          v17 = 1024;
          v18 = 99;
          v19 = 2082;
          v20 = "-[MapsSuggestionsTooEarlyFilter shouldKeepEntry:]";
          v21 = 2082;
          v22 = "YES";
          _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v15, 0x26u);
        }

        v5 = 1;
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooEarlyFilter.m";
      v17 = 1024;
      v18 = 41;
      v19 = 2082;
      v20 = "-[MapsSuggestionsTooEarlyFilter shouldKeepEntry:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v15, 0x26u);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
