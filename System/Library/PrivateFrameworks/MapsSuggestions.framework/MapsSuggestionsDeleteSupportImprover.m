@implementation MapsSuggestionsDeleteSupportImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t Integer;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDeleteSupportImprover.m";
      v11 = 1024;
      v12 = 24;
      v13 = 2082;
      v14 = "-[MapsSuggestionsDeleteSupportImprover improveEntry:]";
      v15 = 2082;
      v16 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v9, 0x26u);
    }

    goto LABEL_7;
  }
  if (objc_msgSend(v3, "availableRemovalBehaviors"))
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
    case 4:
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
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_10;
    case 3:
      Integer = GEOConfigGetInteger();
      if ((objc_msgSend(v4, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsCalendarEventIsRecurringKey"), 1) & 1) != 0)
LABEL_10:
        Integer = GEOConfigGetInteger();
      goto LABEL_11;
    default:
      Integer = 0;
LABEL_11:
      objc_msgSend(v4, "setAvailableRemovalBehavior:", Integer);
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
