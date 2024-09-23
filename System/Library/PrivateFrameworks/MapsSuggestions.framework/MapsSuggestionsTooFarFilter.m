@implementation MapsSuggestionsTooFarFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BYTE v12[12];
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (MapsSuggestionsIsShortcutEntry(v3))
    {
LABEL_3:
      v5 = 1;
      goto LABEL_13;
    }
    v7 = objc_msgSend(v4, "type");
    if (v7 > 0x18)
    {
      v9 = 0.0;
    }
    else
    {
      if (v7 == 11)
        goto LABEL_3;
      GEOConfigGetDouble();
      v9 = v8;
    }
    *(_QWORD *)v12 = 0;
    v10 = !MapsSuggestionsDistanceFromHereToEntry(v4, v12);
    v5 = *(double *)v12 <= v9 || v10;
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136446978;
      *(_QWORD *)&v12[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooFarFilter.m";
      v13 = 1024;
      v14 = 25;
      v15 = 2082;
      v16 = "-[MapsSuggestionsTooFarFilter shouldKeepEntry:]";
      v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", v12, 0x26u);
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
