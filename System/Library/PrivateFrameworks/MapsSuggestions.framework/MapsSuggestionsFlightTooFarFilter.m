@implementation MapsSuggestionsFlightTooFarFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  _BOOL4 v7;
  BOOL v8;
  NSObject *v9;
  _BYTE v11[12];
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
  if (v3)
  {
    if (objc_msgSend(v3, "type") == 15)
    {
      GEOConfigGetDouble();
      v6 = v5;
      *(_QWORD *)v11 = 0;
      v7 = !MapsSuggestionsDistanceFromHereToEntry(v4, v11);
      v8 = *(double *)v11 <= v6 || v7;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136446978;
      *(_QWORD *)&v11[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightTooFarFilter.mm";
      v12 = 1024;
      v13 = 22;
      v14 = 2082;
      v15 = "-[MapsSuggestionsFlightTooFarFilter shouldKeepEntry:]";
      v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", v11, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
