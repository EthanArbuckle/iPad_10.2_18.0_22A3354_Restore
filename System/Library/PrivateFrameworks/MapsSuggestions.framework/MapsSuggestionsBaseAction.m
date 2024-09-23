@implementation MapsSuggestionsBaseAction

- (MapsSuggestionsBaseAction)initWithName:(id)a3
{
  id v4;
  MapsSuggestionsBaseAction *v5;
  uint64_t v6;
  NSString *name;
  MapsSuggestionsBaseAction *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsBaseAction;
    v5 = -[MapsSuggestionsBaseAction init](&v11, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseAction.m";
      v14 = 1024;
      v15 = 24;
      v16 = 2082;
      v17 = "-[MapsSuggestionsBaseAction initWithName:]";
      v18 = 2082;
      v19 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)actWithHandler:(id)a3
{
  id v5;

  v5 = a3;
  -[MapsSuggestionsBaseAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
