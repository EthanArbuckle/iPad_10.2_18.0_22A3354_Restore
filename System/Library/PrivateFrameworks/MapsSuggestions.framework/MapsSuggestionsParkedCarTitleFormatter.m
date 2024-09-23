@implementation MapsSuggestionsParkedCarTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  const char *v16;
  int v18;
  double v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarTitleFormatter.m");
      v20 = 1024;
      v21 = 24;
      v22 = 2082;
      v23 = "-[MapsSuggestionsParkedCarTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      v24 = 2082;
      v25 = "nil == (entry)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v8, "type");
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 != 7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446978;
      v19 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarTitleFormatter.m");
      v20 = 1024;
      v21 = 25;
      v22 = 2082;
      v23 = "-[MapsSuggestionsParkedCarTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      v24 = 2082;
      v25 = "MapsSuggestionsEntryTypeParkedCar != entry.type";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a ParkedCar entry";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a4;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "Parked Car CLLocationDistance: %g", (uint8_t *)&v18, 0xCu);
  }

  MapsSuggestionsDistanceString();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", CFSTR("MapsSuggestionsParkedCarNearLocationStringKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLocalizedParkedCarAtLocationString(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v8, 0, v14, 0);

LABEL_12:
  return v15;
}

@end
