@implementation MapsSuggestionsReservationDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int ShouldBeOfOneOfEachType;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationDeduper.m";
      v54 = 1024;
      v55 = 70;
      v56 = 2082;
      v57 = "-[MapsSuggestionsReservationDeduper dedupeByEnrichingEntry:withEntry:]";
      v58 = 2082;
      v59 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_14:
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x26u);
    }
LABEL_15:
    LOBYTE(v11) = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationDeduper.m";
      v54 = 1024;
      v55 = 71;
      v56 = 2082;
      v57 = "-[MapsSuggestionsReservationDeduper dedupeByEnrichingEntry:withEntry:]";
      v58 = 2082;
      v59 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "hasMultipleWaypointsLeft") & 1) == 0
    && (objc_msgSend(v7, "hasMultipleWaypointsLeft") & 1) == 0
    && MapsSuggestionsEntriesAtLeastOneIsOfType(8, v5, v7)
    && !MapsSuggestionsAtLeastOneEntryIsShortcut(v7, v5))
  {
    ShouldBeOfOneOfEachType = MapsSuggestionsEntriesShouldBeOfOneOfEachType(8, 3, v5, v7);
    v9 = MapsSuggestionsEntriesAreBothOfType(8, v5, v7);
    v10 = v9;
    if ((ShouldBeOfOneOfEachType & 1) != 0 || v9)
    {
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsCoreSuggestionsOpaqueKey"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringForKey:", CFSTR("MapsSuggestionsCoreSuggestionsOpaqueKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v12, "isEqualToString:", v15))
      {
        v16 = v5;
        v17 = v7;
LABEL_20:
        v18 = v17;
        if (-[NSObject type](v16, "type") == 3)
        {
          -[NSObject replaceByEntry:](v16, "replaceByEntry:", v18);
        }
        else
        {
          if (objc_msgSend(v18, "type") == 3
            || -[NSObject type](v16, "type") == 8
            && (-[NSObject originatingSourceName](v16, "originatingSourceName"),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("MapsSuggestionsReservationsSource")),
                v38,
                v39))
          {
            v28 = v16;
            v29 = v18;
            v30 = 0;
          }
          else
          {
            v28 = v16;
            v29 = v18;
            v30 = 1;
          }
          -[NSObject mergeFromSuggestionEntry:behavior:](v28, "mergeFromSuggestionEntry:behavior:", v29, v30);
        }

        LOBYTE(v11) = 1;
        goto LABEL_48;
      }
      if (ShouldBeOfOneOfEachType)
      {
        v19 = v5;
        v20 = v7;
        if (-[NSObject containsKey:](v19, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey"))
          && (objc_msgSend(v20, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")) & 1) != 0)
        {
          -[NSObject dateForKey:](v19, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "compare:", v22);

          if (!v23)
          {
            -[NSObject geoMapItem](v19, "geoMapItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11)
            {
LABEL_48:

              goto LABEL_16;
            }
            objc_msgSend(v20, "geoMapItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              -[NSObject geoMapItem](v19, "geoMapItem");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "geoMapItem");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = MapsSuggestionsMapItemsAreEqual(v25, v26, 1, 0, 0);

              if ((v27 & 1) == 0)
              {
                GEOFindOrCreateLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "GEOMapItems were not Equal. So cannot dupe entries", buf, 2u);
                }
                goto LABEL_41;
              }
LABEL_58:
              v16 = v19;
              v17 = v20;
              goto LABEL_20;
            }
          }
LABEL_42:
          LOBYTE(v11) = 0;
          goto LABEL_48;
        }
        goto LABEL_40;
      }
      if (!v10)
        goto LABEL_42;
      v19 = v5;
      v20 = v7;
      if (!-[NSObject containsKey:](v19, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey"))
        || (objc_msgSend(v20, "containsKey:", CFSTR("MapsSuggestionsScheduledTimeKey")) & 1) == 0)
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      -[NSObject dateForKey:](v19, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "compare:", v32);

      if (v33)
        goto LABEL_42;
      -[NSObject title](v19, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "title");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v34 == (void *)v35)
      {
        v49 = (void *)v35;
        v50 = v34;
      }
      else
      {
        -[NSObject title](v19, "title");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "title");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v37;
        if (!objc_msgSend(v37, "isEqualToString:", v47))
        {
          v51 = 0;
          goto LABEL_55;
        }
        v49 = v36;
        v50 = v34;
      }
      -[NSObject subtitle](v19, "subtitle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "subtitle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40 == v41)
      {
        v51 = 1;
      }
      else
      {
        -[NSObject subtitle](v19, "subtitle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "subtitle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v42, "isEqualToString:", v43);

      }
      v36 = v49;
      v34 = v50;
      if (v50 == v49)
      {
LABEL_56:

        -[NSObject geoMapItem](v19, "geoMapItem");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "geoMapItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = MapsSuggestionsMapItemsAreEqual(v44, v45, 1, 0, 0);

        if (!v51)
        {
          LOBYTE(v11) = 0;
          if (!v46)
            goto LABEL_48;
        }
        goto LABEL_58;
      }
LABEL_55:

      goto LABEL_56;
    }
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return (char)v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
