@implementation MapsSuggestionsAppConnectionFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
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
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionFilter.m";
      v14 = 1024;
      v15 = 21;
      v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionFilter shouldKeepEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      v9 = v7;
      v10 = 38;
LABEL_13:
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    }
LABEL_14:

    v6 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "type") != 12)
  {
    v6 = 1;
    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v8 = "Filtered an AppConnection suggestion entry that did not have an origin bundle ID";
      v9 = v7;
      v10 = 2;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("com.apple.mobilecal"))
    && objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("com.apple.Maps"))
    && objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("com.apple.springboard"))
    && objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("com.apple.datadetectors.DDActionsService")) != 0;

LABEL_17:
  return v6;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
