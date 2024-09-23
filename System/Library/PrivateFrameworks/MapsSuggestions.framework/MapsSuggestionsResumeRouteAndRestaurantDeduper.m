@implementation MapsSuggestionsResumeRouteAndRestaurantDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const char *v13;
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
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteAndRestaurantDeduper.m";
      v17 = 1024;
      v18 = 24;
      v19 = 2082;
      v20 = "-[MapsSuggestionsResumeRouteAndRestaurantDeduper dedupeByEnrichingEntry:withEntry:]";
      v21 = 2082;
      v22 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteAndRestaurantDeduper.m";
      v17 = 1024;
      v18 = 25;
      v19 = 2082;
      v20 = "-[MapsSuggestionsResumeRouteAndRestaurantDeduper dedupeByEnrichingEntry:withEntry:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!MapsSuggestionsEntriesShouldBeOfOneOfEachType(11, 8, v5, v6))
    goto LABEL_18;
  objc_msgSend(v5, "geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_19;
  objc_msgSend(v7, "geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_18;
  objc_msgSend(v5, "geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MapsSuggestionsMapItemsAreEqual(v8, v10, 0, 0, 0);

  LOBYTE(v8) = 0;
  if (!v11)
    goto LABEL_19;
  if ((objc_msgSend(v5, "hasMultipleWaypointsLeft") & 1) != 0
    || (objc_msgSend(v7, "hasMultipleWaypointsLeft") & 1) != 0)
  {
LABEL_18:
    LOBYTE(v8) = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v5, "type") != 8)
    objc_msgSend(v5, "replaceByEntry:", v7);
  LOBYTE(v8) = 1;
LABEL_19:

  return (char)v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
