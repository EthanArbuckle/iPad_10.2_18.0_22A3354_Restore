@implementation MapsSuggestionsHotelTitleFormatter

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
  void *v14;
  char v15;
  NSObject *v16;
  const char *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
    v21 = 1024;
    v22 = 21;
    v23 = 2082;
    v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
    v25 = 2082;
    v26 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_14:
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_15;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
    v21 = 1024;
    v22 = 22;
    v23 = 2082;
    v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
    v25 = 2082;
    v26 = "nil == (eta)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "type") != 13)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelTitleFormatter.m";
      v21 = 1024;
      v22 = 23;
      v23 = 2082;
      v24 = "-[MapsSuggestionsHotelTitleFormatter formatTitlesForEntry:eta:]";
      v25 = 2082;
      v26 = "entry.type != MapsSuggestionsEntryTypeHotel";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Hotel entry";
      goto LABEL_14;
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v8, "seconds");
  NSStringFromMapsSuggestionsShortETA(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undecoratedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length")
    && -[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:](self, "shouldDecorateEntry:withETA:", v6, v8))
  {
    MapsSuggestionsLocalizedStringFromGEOTransportType(objc_msgSend(v8, "transportType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MapsSuggestionsLocalizedETAFormatString(v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  objc_msgSend(v6, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v14, v11, 0);

LABEL_16:
  return v15;
}

@end
