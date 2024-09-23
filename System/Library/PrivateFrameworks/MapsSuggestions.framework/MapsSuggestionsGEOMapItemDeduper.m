@implementation MapsSuggestionsGEOMapItemDeduper

- (MapsSuggestionsGEOMapItemDeduper)initWithSacrificedType:(int64_t)a3
{
  MapsSuggestionsGEOMapItemDeduper *v4;
  MapsSuggestionsGEOMapItemDeduper *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsGEOMapItemDeduper;
  v4 = -[MapsSuggestionsGEOMapItemDeduper init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsEntryType(v5->_type);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@_%@"), v7, v8);
    name = v5->_name;
    v5->_name = (NSString *)v9;

  }
  return v5;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsTooEarlyFilter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = (MapsSuggestionsTooEarlyFilter *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsGEOMapItemDeduper.m";
    v25 = 1024;
    v26 = 51;
    v27 = 2082;
    v28 = "-[MapsSuggestionsGEOMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
    v29 = 2082;
    v30 = "nil == (originalEntry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_26:
    _os_log_impl(&dword_1A427D000, &v9->super.super, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 0x26u);
    goto LABEL_27;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v9 = (MapsSuggestionsTooEarlyFilter *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsGEOMapItemDeduper.m";
    v25 = 1024;
    v26 = 52;
    v27 = 2082;
    v28 = "-[MapsSuggestionsGEOMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
    v29 = 2082;
    v30 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_26;
  }
  if ((objc_msgSend(v6, "hasMultipleWaypointsLeft") & 1) == 0
    && (objc_msgSend(v8, "hasMultipleWaypointsLeft") & 1) == 0
    && MapsSuggestionsEntriesAtLeastOneIsOfType(self->_type, v6, v8))
  {
    v9 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
    if (-[MapsSuggestionsTooEarlyFilter shouldKeepEntry:](v9, "shouldKeepEntry:", v6)
      && -[MapsSuggestionsTooEarlyFilter shouldKeepEntry:](v9, "shouldKeepEntry:", v8)
      && !MapsSuggestionsEntriesAtLeastOneIsOfType(24, v6, v8)
      && !MapsSuggestionsAtLeastOneEntryIsShortcut(v8, v6)
      && !MapsSuggestionsEntriesAreBothOfType(23, v6, v8))
    {
      objc_msgSend(v6, "geoMapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(v8, "geoMapItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (objc_msgSend(v6, "type") == self->_type && objc_msgSend(v8, "type") == 15)
        {
          objc_msgSend(v6, "geoMapItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "geoFenceMapRegion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          GEOMapRectForMapRegion();

          objc_msgSend(v8, "geoMapItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "geoFenceMapRegion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          GEOMapRectForMapRegion();

          if ((GEOMapRectIsEmpty() & 1) == 0
            && (GEOMapRectIsEmpty() & 1) == 0
            && GEOMapRectIntersectsRect())
          {
            GEOFindOrCreateLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v23) = 0;
              _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Dropping the CalendarEvent in favor of the Flight entry", (uint8_t *)&v23, 2u);
            }

            goto LABEL_37;
          }
        }
        objc_msgSend(v6, "geoMapItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "geoMapItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = MapsSuggestionsMapItemsAreEqual(v19, v20, 0, 0, 0);

        if (v21)
        {
          v22 = objc_msgSend(v6, "type");
          if (v22 == objc_msgSend(v8, "type"))
          {
            if (objc_msgSend(v6, "hasStartTime")
              && objc_msgSend(v8, "hasStartTime")
              && (objc_msgSend(v6, "startsBeforeEntry:", v8) & 1) != 0)
            {
              goto LABEL_38;
            }
          }
          else if (objc_msgSend(v6, "type") != self->_type)
          {
LABEL_38:
            LOBYTE(v10) = 1;
            goto LABEL_28;
          }
LABEL_37:
          objc_msgSend(v6, "replaceByEntry:", v8);
          goto LABEL_38;
        }
      }
    }
LABEL_27:
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  LOBYTE(v10) = 0;
LABEL_29:

  return (char)v10;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
