@implementation MapsSuggestionsBaseSource

+ (BOOL)isEnabled
{
  BOOL result;

  result = objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

+ (unint64_t)disposition
{
  unint64_t result;

  result = objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (MapsSuggestionsBaseSource)initWithDelegate:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsBaseSource *v8;
  MapsSuggestionsBaseSource *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsBaseSource;
  v8 = -[MapsSuggestionsBaseSource init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

  }
  return v9;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  id result;

  v7 = a3;
  v8 = a4;
  result = (id)-[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MapsSuggestionsBaseSource initFromResourceDepot:name:](self, "initFromResourceDepot:name:", v4, v5);

  return v6;
}

- (void)start
{
  -[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (void)stop
{
  -[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v5;
  double result;

  v5 = a3;
  -[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (double)updateSuggestionEntriesOfType:(int64_t)a3 handler:(id)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a4;
  if (!a3 || (v7 = 0.0, -[MapsSuggestionsBaseSource canProduceEntriesOfType:](self, "canProduceEntriesOfType:", a3)))
  {
    -[MapsSuggestionsBaseSource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", v6);
    v7 = v8;
  }

  return v7;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  BOOL result;

  result = -[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  BOOL result;

  v8 = a3;
  v9 = a5;
  result = -[MapsSuggestionsBaseSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (unint64_t)addOrUpdateMySuggestionEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MapsSuggestionsBaseSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "addOrUpdateSuggestionEntries:source:", v4, v6);

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseSource.m";
      v12 = 1024;
      v13 = 105;
      v14 = 2082;
      v15 = "-[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:]";
      v16 = 2082;
      v17 = "nil == (entries)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more entries", (uint8_t *)&v10, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (MapsSuggestionsSourceDelegate)delegate
{
  return (MapsSuggestionsSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
