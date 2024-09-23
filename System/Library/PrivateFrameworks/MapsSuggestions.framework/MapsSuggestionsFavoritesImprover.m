@implementation MapsSuggestionsFavoritesImprover

- (BOOL)improveEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFavoritesImprover.m";
      v12 = 1024;
      v13 = 23;
      v14 = 2082;
      v15 = "-[MapsSuggestionsFavoritesImprover improveEntry:]";
      v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", (uint8_t *)&v10, 0x26u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "type") != 6)
  {
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "undecoratedSubtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "geoMapItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUndecoratedSubtitle:", v7);

      LOBYTE(v5) = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return (char)v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
