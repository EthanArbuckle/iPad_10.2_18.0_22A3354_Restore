@implementation MapsSuggestionsBlockDeduper

+ (id)deduperWithBlock:(id)a3
{
  id v3;
  MapsSuggestionsBlockDeduper *v4;

  v3 = a3;
  v4 = -[MapsSuggestionsBlockDeduper initWithBlock:]([MapsSuggestionsBlockDeduper alloc], "initWithBlock:", v3);

  return v4;
}

- (MapsSuggestionsBlockDeduper)initWithBlock:(id)a3
{
  id v4;
  MapsSuggestionsBlockDeduper *v5;
  void *v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBlockDeduper;
  v5 = -[MapsSuggestionsBlockDeduper init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    block = v5->_block;
    v5->_block = v6;

  }
  return v5;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockDeduper.m";
      v15 = 1024;
      v16 = 41;
      v17 = 2082;
      v18 = "-[MapsSuggestionsBlockDeduper dedupeByEnrichingEntry:withEntry:]";
      v19 = 2082;
      v20 = "nil == (originalEntry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original entry";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x26u);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockDeduper.m";
      v15 = 1024;
      v16 = 42;
      v17 = 2082;
      v18 = "-[MapsSuggestionsBlockDeduper dedupeByEnrichingEntry:withEntry:]";
      v19 = 2082;
      v20 = "nil == (entry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a entry";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = (*((uint64_t (**)(void))self->_block + 2))();
LABEL_10:

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
