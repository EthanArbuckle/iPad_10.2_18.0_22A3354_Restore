@implementation MapsSuggestionsUniqueIdentifierDeduper

- (MapsSuggestionsUniqueIdentifierDeduper)initWithType:(int64_t)a3
{
  MapsSuggestionsUniqueIdentifierDeduper *v4;
  MapsSuggestionsUniqueIdentifierDeduper *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsUniqueIdentifierDeduper;
  v4 = -[MapsSuggestionsUniqueIdentifierDeduper init](&v12, sel_init);
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  uint64_t v20;
  uint8_t buf[4];
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
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    v23 = 1024;
    v24 = 46;
    v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    v27 = 2082;
    v28 = "nil == (originalEntry)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
    _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x26u);
    goto LABEL_17;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    v23 = 1024;
    v24 = 47;
    v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    v27 = 2082;
    v28 = "nil == (entry)";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_16;
  }
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136446978;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
    v23 = 1024;
    v24 = 48;
    v25 = 2082;
    v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
    v27 = 2082;
    v28 = "0u == originalEntry.uniqueIdentifier.length";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
    goto LABEL_16;
  }
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUniqueIdentifierDeduper.m";
      v23 = 1024;
      v24 = 49;
      v25 = 2082;
      v26 = "-[MapsSuggestionsUniqueIdentifierDeduper dedupeByEnrichingEntry:withEntry:]";
      v27 = 2082;
      v28 = "0u == entry.uniqueIdentifier.length";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(self->_type, v6, v8))
    goto LABEL_18;
  objc_msgSend(v6, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v15)
    goto LABEL_18;
  LOWORD(v20) = 256;
  v16 = 1;
  objc_msgSend(v6, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v8, 1, 0, 1, 0, 0, v20);
LABEL_19:

  return v16;
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
