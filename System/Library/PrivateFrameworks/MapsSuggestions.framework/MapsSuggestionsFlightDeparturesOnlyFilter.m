@implementation MapsSuggestionsFlightDeparturesOnlyFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
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
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeparturesOnlyFilter.m";
      v14 = 1024;
      v15 = 22;
      v16 = 2082;
      v17 = "-[MapsSuggestionsFlightDeparturesOnlyFilter shouldKeepEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v12, 0x26u);
    }

LABEL_9:
    v9 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "type") != 15)
  {
    v9 = 1;
    goto LABEL_13;
  }
  if (!objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")))
    goto LABEL_9;
  objc_msgSend(v4, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = MapsSuggestionsSecondsSince(v5);
    GEOConfigGetDouble();
    v9 = v7 <= v8;
  }
  else
  {
    v9 = 0;
  }

LABEL_13:
  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
