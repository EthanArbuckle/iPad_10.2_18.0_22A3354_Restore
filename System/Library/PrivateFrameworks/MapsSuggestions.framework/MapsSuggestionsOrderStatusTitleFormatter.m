@implementation MapsSuggestionsOrderStatusTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  char v16;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
    v33 = 1024;
    v34 = 25;
    v35 = 2082;
    v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
    v37 = 2082;
    v38 = "nil == (entry)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_15:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_16;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
    v33 = 1024;
    v34 = 26;
    v35 = 2082;
    v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
    v37 = 2082;
    v38 = "nil == (eta)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "type") != 23)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
      v33 = 1024;
      v34 = 27;
      v35 = 2082;
      v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
      v37 = 2082;
      v38 = "MapsSuggestionsEntryTypeOrderStatus != entry.type";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be OrderStatus";
      goto LABEL_15;
    }
LABEL_16:

    v16 = 0;
    goto LABEL_17;
  }
  v9 = v6;
  v10 = v9;
  if (!self)
  {
    v24 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v9, "containsKey:", CFSTR("MapsSuggestionsOrderPickupStartDate")))
  {
    objc_msgSend(v10, "dateForKey:", CFSTR("MapsSuggestionsOrderPickupStartDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && MapsSuggestionsIsInTheFuture(v11))
    {
      MapsSuggestionsLocalizedOrderPickupReadyAt(v12);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v24 = (void *)v13;

      goto LABEL_24;
    }

  }
  objc_msgSend(v10, "expires");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v10, "expires");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MapsSuggestionsSecondsTo(v20);
    GEOConfigGetDouble();
    v23 = v22;

    if (v21 <= v23)
    {
      objc_msgSend(v10, "expires");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsLocalizedOrderPickupReadyUntil(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  MapsSuggestionsLocalizedOrderPickupReady();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  objc_msgSend(v8, "seconds");
  NSStringFromMapsSuggestionsShortETA(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLocalizedStringFromGEOTransportType(objc_msgSend(v8, "transportType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLocalizedETAFormatString(v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(" • %1$@"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v29;
  }

  objc_msgSend(v10, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v30, v24, 0);

LABEL_17:
  return v16;
}

@end
