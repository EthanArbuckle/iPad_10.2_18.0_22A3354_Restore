@implementation MapsSuggestionsVehicleSetupResumeRouteDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
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
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVehicleSetupResumeRouteDeduper.m";
      v17 = 1024;
      v18 = 24;
      v19 = 2082;
      v20 = "-[MapsSuggestionsVehicleSetupResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      v21 = 2082;
      v22 = "nil == (originalEntry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_15:
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 38;
LABEL_16:
      _os_log_impl(&dword_1A427D000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
LABEL_17:

LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVehicleSetupResumeRouteDeduper.m";
      v17 = 1024;
      v18 = 25;
      v19 = 2082;
      v20 = "-[MapsSuggestionsVehicleSetupResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      v21 = 2082;
      v22 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v5, "hasMultipleWaypointsLeft") & 1) != 0
    || (objc_msgSend(v7, "hasMultipleWaypointsLeft") & 1) != 0
    || !MapsSuggestionsEntriesShouldBeOfOneOfEachType(20, 11, v5, v7))
  {
    goto LABEL_18;
  }
  if ((objc_msgSend(v7, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 1) & 1) == 0
    && (objc_msgSend(v5, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 1) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v15) = 0;
    v10 = "Neither entries have MapsSuggestionsIsResumingAnEVRoute key so we should return";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 2;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "type") != 11)
    objc_msgSend(v5, "replaceByEntry:", v7);
  v8 = 1;
LABEL_19:

  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
