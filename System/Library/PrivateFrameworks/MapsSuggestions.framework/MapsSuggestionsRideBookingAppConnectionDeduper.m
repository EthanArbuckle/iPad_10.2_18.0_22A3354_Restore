@implementation MapsSuggestionsRideBookingAppConnectionDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
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
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRideBookingAppConnectionDeduper.m";
      v16 = 1024;
      v17 = 22;
      v18 = 2082;
      v19 = "-[MapsSuggestionsRideBookingAppConnectionDeduper dedupeByEnrichingEntry:withEntry:]";
      v20 = 2082;
      v21 = "nil == (originalEntry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires original suggestion entry";
LABEL_12:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRideBookingAppConnectionDeduper.m";
      v16 = 1024;
      v17 = 23;
      v18 = 2082;
      v19 = "-[MapsSuggestionsRideBookingAppConnectionDeduper dedupeByEnrichingEntry:withEntry:]";
      v20 = 2082;
      v21 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires new suggestion entry";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!MapsSuggestionsEntriesShouldBeOfOneOfEachType(12, 9, v5, v6))
  {
LABEL_14:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);
  if (v10 && objc_msgSend(v5, "type") == 12)
    objc_msgSend(v5, "replaceByEntry:", v7);

LABEL_15:
  return v10;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
