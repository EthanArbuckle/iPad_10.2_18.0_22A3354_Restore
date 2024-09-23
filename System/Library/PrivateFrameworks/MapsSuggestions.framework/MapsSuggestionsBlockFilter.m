@implementation MapsSuggestionsBlockFilter

+ (id)filterWithBlock:(id)a3
{
  id v3;
  MapsSuggestionsBlockFilter *v4;

  v3 = a3;
  v4 = -[MapsSuggestionsBlockFilter initWithBlock:]([MapsSuggestionsBlockFilter alloc], "initWithBlock:", v3);

  return v4;
}

- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsBlockFilter *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  id block;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsBlockFilter;
  v8 = -[MapsSuggestionsBlockFilter init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    block = v8->_block;
    v8->_block = (id)v11;

  }
  return v8;
}

- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3
{
  id v4;
  void *v5;
  MapsSuggestionsBlockFilter *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MapsSuggestionsBlockFilter initWithBlock:name:](self, "initWithBlock:name:", v4, v5);

  return v6;
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t (**block)(id, id);
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  block = (uint64_t (**)(id, id))self->_block;
  if (block)
    return block[2](block, a3);
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136446978;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockFilter.m";
    v8 = 1024;
    v9 = 49;
    v10 = 2082;
    v11 = "-[MapsSuggestionsBlockFilter shouldKeepEntry:]";
    v12 = 2082;
    v13 = "nil == (_block)";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block.", (uint8_t *)&v6, 0x26u);
  }

  return 1;
}

- (NSString)uniqueName
{
  return self->_name;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
