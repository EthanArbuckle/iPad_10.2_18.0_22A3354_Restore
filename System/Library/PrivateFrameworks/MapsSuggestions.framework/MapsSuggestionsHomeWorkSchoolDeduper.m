@implementation MapsSuggestionsHomeWorkSchoolDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  const char *v18;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _BYTE v24[12];
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136446978;
      *(_QWORD *)&v24[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkSchoolDeduper.m";
      v25 = 1024;
      v26 = 51;
      v27 = 2082;
      v28 = "-[MapsSuggestionsHomeWorkSchoolDeduper dedupeByEnrichingEntry:withEntry:]";
      v29 = 2082;
      v30 = "nil == (originalEntry)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_19:
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, v18, v24, 0x26u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136446978;
      *(_QWORD *)&v24[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHomeWorkSchoolDeduper.m";
      v25 = 1024;
      v26 = 52;
      v27 = 2082;
      v28 = "-[MapsSuggestionsHomeWorkSchoolDeduper dedupeByEnrichingEntry:withEntry:]";
      v29 = 2082;
      v30 = "nil == (entry)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "hasMultipleWaypointsLeft") & 1) != 0
    || (objc_msgSend(v7, "hasMultipleWaypointsLeft") & 1) != 0)
  {
    goto LABEL_21;
  }
  v8 = objc_msgSend(v7, "type");
  LOBYTE(v9) = 0;
  if (v8 > 0x13 || ((1 << v8) & 0x80006) == 0)
    goto LABEL_22;
  v10 = objc_msgSend(v5, "type");
  if (v10 != objc_msgSend(v7, "type"))
    goto LABEL_21;
  objc_msgSend(v5, "geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_22;
  objc_msgSend(v7, "geoMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (*(_QWORD *)v24 = 0, (MapsSuggestionsDistanceBetweenEntries(v5, v7, v24) & 1) == 0)
    && (v12 = *(double *)v24, GEOConfigGetDouble(), v12 > v13))
  {
LABEL_21:
    LOBYTE(v9) = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "geoMapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "geoMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MapsSuggestionsMapItemsAreEqual(v14, v15, 0, 0, 0);

  if ((v16 & 1) != 0)
    goto LABEL_13;
  objc_msgSend(v5, "geoMapItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shortAddress");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "geoMapItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "shortAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || !v22)
  {

    goto LABEL_20;
  }
  v23 = -[NSObject isEqualToString:](v17, "isEqualToString:", v22);

  if (!v23)
    goto LABEL_21;
LABEL_13:
  LOBYTE(v9) = 1;
  if ((MapsSuggestionsMergeAsShortcut(v5, v7) & 1) == 0)
    objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:", v7, 1);
LABEL_22:

  return (char)v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
