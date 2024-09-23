@implementation MapsSuggestionsTooFewVisitsFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  uint64_t Integer;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    if (GEOConfigGetBOOL() && (objc_msgSend(v3, "isShortcut") & 1) == 0)
    {
      v4 = 1;
      switch(objc_msgSend(v3, "type"))
      {
        case 0:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          goto LABEL_9;
        case 1:
        case 2:
        case 4:
        case 19:
          Integer = GEOConfigGetInteger();
          goto LABEL_12;
        default:
          Integer = 0;
LABEL_12:
          objc_msgSend(v3, "originatingSourceName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("MapsSuggestionsRoutineSource"));

          if (!v9)
            break;
          if ((objc_msgSend(v3, "containsKey:", CFSTR("MapsSuggestionsCoreRoutineVisitsCountKey")) & 1) != 0)
          {
            objc_msgSend(v3, "numberForKey:", CFSTR("MapsSuggestionsCoreRoutineVisitsCountKey"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v10, "integerValue") >= Integer;

            goto LABEL_9;
          }
          GEOFindOrCreateLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = 138412290;
            v13 = (const char *)v3;
            _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Weird that we didn't have a MapsSuggestionsCoreRoutineVisitsCountKey: %@", (uint8_t *)&v12, 0xCu);
          }

          break;
      }
    }
    v4 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooFewVisitsFilter.m";
      v14 = 1024;
      v15 = 24;
      v16 = 2082;
      v17 = "-[MapsSuggestionsTooFewVisitsFilter shouldKeepEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v12, 0x26u);
    }

    v4 = 0;
  }
LABEL_9:

  return v4;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
