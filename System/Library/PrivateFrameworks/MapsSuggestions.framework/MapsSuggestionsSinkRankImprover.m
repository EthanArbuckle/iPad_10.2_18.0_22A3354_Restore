@implementation MapsSuggestionsSinkRankImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t Integer;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSinkRankImprover.m";
      v12 = 1024;
      v13 = 32;
      v14 = 2082;
      v15 = "-[MapsSuggestionsSinkRankImprover improveEntry:]";
      v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v10, 0x26u);
    }

    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "containsKey:", CFSTR("MapsSuggestionsSinkRankKey")) & 1) != 0)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_10;
    case 9:
      Integer = GEOConfigGetInteger();
      if ((objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsRidesharingIsActiveRideKey")) & 1) == 0)
LABEL_10:
        Integer = GEOConfigGetInteger();
      goto LABEL_11;
    default:
      Integer = 0;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", Integer);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNumber:forKey:", v8, CFSTR("MapsSuggestionsSinkRankKey"));

      v5 = 1;
      break;
  }
LABEL_12:

  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
