@implementation MapsSuggestionsShortcutFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutFilter.m";
      v10 = 1024;
      v11 = 21;
      v12 = 2082;
      v13 = "-[MapsSuggestionsShortcutFilter shouldKeepEntry:]";
      v14 = 2082;
      v15 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v8, 0x26u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "type") == 18
    || objc_msgSend(v4, "containsKey:", CFSTR("MapsSuggestionsShortcutOnlyKey"))
    && (objc_msgSend(v4, "BOOLeanForKey:", CFSTR("MapsSuggestionsShortcutOnlyKey")) & 1) != 0)
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = 1;
LABEL_10:

  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
