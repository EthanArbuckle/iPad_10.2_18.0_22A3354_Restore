@implementation MapsSuggestionsCarRentalTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  const char *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v21 = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
    v23 = 1024;
    v24 = 24;
    v25 = 2082;
    v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
    v27 = 2082;
    v28 = "nil == (entry)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_17:
    _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x26u);
    goto LABEL_18;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v21 = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
    v23 = 1024;
    v24 = 25;
    v25 = 2082;
    v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
    v27 = 2082;
    v28 = "nil == (eta)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "type") != 14)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalTitleFormatter.m";
      v23 = 1024;
      v24 = 26;
      v25 = 2082;
      v26 = "-[MapsSuggestionsCarRentalTitleFormatter formatTitlesForEntry:eta:]";
      v27 = 2082;
      v28 = "entry.type != MapsSuggestionsEntryTypeCarRental";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a Car Rental entry";
      goto LABEL_17;
    }
LABEL_18:

    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v8, "seconds");
  NSStringFromMapsSuggestionsShortETA(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undecoratedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLeanForKey:", CFSTR("MapsSuggestionsCalendarCarRentalIsPickupDayKey")) & 1) == 0
    && -[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:](self, "shouldDecorateEntry:withETA:", v6, v8)&& objc_msgSend(v10, "length"))
  {
    MapsSuggestionsLocalizedStringFromGEOTransportType(objc_msgSend(v8, "transportType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = qword_1ED22EF70;
    v14 = v10;
    if (v13 != -1)
      dispatch_once(&qword_1ED22EF70, &__block_literal_global_10);
    (*(void (**)(uint64_t, id, void *))(_MergedGlobals_36 + 16))(_MergedGlobals_36, v14, v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v6, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v16, v11, 0);

LABEL_19:
  return v17;
}

@end
