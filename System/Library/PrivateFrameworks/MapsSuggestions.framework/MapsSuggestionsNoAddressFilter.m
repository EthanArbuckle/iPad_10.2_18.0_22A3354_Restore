@implementation MapsSuggestionsNoAddressFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  BOOL v7;
  NSObject *v8;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
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
    v5 = objc_msgSend(v3, "type");
    if (v5 - 5 < 0x13 || v5 < 4)
    {
LABEL_6:
      v7 = 1;
      goto LABEL_10;
    }
    if (v5 == 4)
    {
      objc_msgSend(v4, "geoMapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsMapItemStreetName(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "length") != 0;
    }
    else
    {
      if (v5 != 24)
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v15 = 136446978;
          v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoAddressFilter.m";
          v17 = 1024;
          v18 = 57;
          v19 = 2082;
          v20 = "-[MapsSuggestionsNoAddressFilter shouldKeepEntry:]";
          v21 = 2082;
          v22 = "YES";
          _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v15, 0x26u);
        }

        goto LABEL_6;
      }
      objc_msgSend(v4, "geoMapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsMapItemStreetWithNumber(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "geoMapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        MapsSuggestionsMapItemAreaOfInterest(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v14, "length") != 0;

      }
    }

    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoAddressFilter.m";
    v17 = 1024;
    v18 = 21;
    v19 = 2082;
    v20 = "-[MapsSuggestionsNoAddressFilter shouldKeepEntry:]";
    v21 = 2082;
    v22 = "nil == (entry)";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", (uint8_t *)&v15, 0x26u);
  }

  v7 = 0;
LABEL_10:

  return v7;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
