@implementation MapsSuggestionsNearbyFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MapsSuggestionsCurrentBestLocation();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      MapsSuggestionsLocationForEntry(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v4, "distanceFromLocation:", v5);
        v7 = v6;
        objc_msgSend(v3, "type");
        GEOConfigGetDouble();
        v9 = v8;
        objc_msgSend(v4, "horizontalAccuracy");
        v11 = v7 >= v9 + v10;
      }
      else
      {
        v11 = 1;
      }

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNearbyFilter.m";
      v16 = 1024;
      v17 = 27;
      v18 = 2082;
      v19 = "-[MapsSuggestionsNearbyFilter shouldKeepEntry:]";
      v20 = 2082;
      v21 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v14, 0x26u);
    }

    v11 = 0;
  }

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
