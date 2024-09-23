@implementation MapsSuggestionsBlockAction

- (MapsSuggestionsBlockAction)initWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsBlockAction *v9;
  uint64_t v10;
  id block;
  MapsSuggestionsBlockAction *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockAction.m";
      v19 = 1024;
      v20 = 27;
      v21 = 2082;
      v22 = "-[MapsSuggestionsBlockAction initWithName:block:]";
      v23 = 2082;
      v24 = "nil == (name)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockAction.m";
      v19 = 1024;
      v20 = 28;
      v21 = 2082;
      v22 = "-[MapsSuggestionsBlockAction initWithName:block:]";
      v23 = 2082;
      v24 = "nil == (block)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action block";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsBlockAction;
  v9 = -[MapsSuggestionsBaseAction initWithName:](&v16, sel_initWithName_, v6);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    block = v9->_block;
    v9->_block = (id)v10;

  }
  self = v9;
  v12 = self;
LABEL_12:

  return v12;
}

- (void)actWithHandler:(id)a3
{
  (*((void (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
