@implementation MapsSuggestionsShortcutDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
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
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    v21 = 1024;
    v22 = 22;
    v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    v25 = 2082;
    v26 = "nil == (originalEntry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
    _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_17;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    v21 = 1024;
    v22 = 23;
    v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    v25 = 2082;
    v26 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_16;
  }
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    v21 = 1024;
    v22 = 24;
    v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    v25 = 2082;
    v26 = "0u == originalEntry.uniqueIdentifier.length";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
    goto LABEL_16;
  }
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
      v21 = 1024;
      v22 = 25;
      v23 = 2082;
      v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
      v25 = 2082;
      v26 = "0u == entry.uniqueIdentifier.length";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(18, v5, v7))
    goto LABEL_18;
  objc_msgSend(v5, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (!v14)
    goto LABEL_18;
  objc_msgSend(v5, "replaceByEntry:forceDecoratedOverwrites:", v7, 0);
  v15 = 1;
LABEL_19:

  return v15;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
