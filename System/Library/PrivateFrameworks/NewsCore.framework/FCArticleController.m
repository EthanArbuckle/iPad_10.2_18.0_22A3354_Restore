@implementation FCArticleController

- (id)articleWithHeadline:(id)a3
{
  id v4;
  FCArticle *v5;
  void *v6;
  FCArticle *v7;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = [FCArticle alloc];
    -[FCArticleController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCArticle initWithContext:headline:](v5, "initWithContext:headline:", v6, v4);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "headline != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCArticleController articleWithHeadline:]";
      v12 = 2080;
      v13 = "FCArticleController.m";
      v14 = 1024;
      v15 = 90;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v7 = 0;
  }

  return v7;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCArticleController)initWithContext:(id)a3
{
  id v5;
  FCArticleController *v6;
  FCArticleController *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCArticleController initWithContext:]";
    v13 = 2080;
    v14 = "FCArticleController.m";
    v15 = 1024;
    v16 = 33;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCArticleController;
  v6 = -[FCArticleController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_context, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (FCArticleController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleController init]";
    v9 = 2080;
    v10 = "FCArticleController.m";
    v11 = 1024;
    v12 = 28;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)articleWithID:(id)a3
{
  return -[FCArticleController articleWithID:qualityOfService:relativePriority:](self, "articleWithID:qualityOfService:relativePriority:", a3, -1, 0);
}

- (id)articleWithID:(id)a3 relativePriority:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = 25;
  if (!a4)
    v7 = 17;
  if (a4 == -1)
    v8 = 9;
  else
    v8 = v7;
  -[FCArticleController articleWithID:forceArticleUpdate:qualityOfService:relativePriority:](self, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v6, 0, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)articleWithID:(id)a3 qualityOfService:(int64_t)a4 relativePriority:(int64_t)a5
{
  return -[FCArticleController articleWithID:forceArticleUpdate:qualityOfService:relativePriority:](self, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", a3, 0, a4, a5);
}

- (id)articleWithID:(id)a3 forceArticleUpdate:(BOOL)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6
{
  _BOOL8 v8;
  id v10;
  FCArticle *v11;
  void *v12;
  FCArticle *v13;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v8 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    v11 = [FCArticle alloc];
    -[FCArticleController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCArticle initWithContext:articleID:forceArticleUpdate:qualityOfService:relativePriority:](v11, "initWithContext:articleID:forceArticleUpdate:qualityOfService:relativePriority:", v12, v10, v8, a5, a6);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
      *(_DWORD *)buf = 136315906;
      v17 = "-[FCArticleController articleWithID:forceArticleUpdate:qualityOfService:relativePriority:]";
      v18 = 2080;
      v19 = "FCArticleController.m";
      v20 = 1024;
      v21 = 72;
      v22 = 2114;
      v23 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v13 = 0;
  }

  return v13;
}

- (id)headlinesFetchOperationForArticleIDs:(id)a3
{
  id v4;
  FCArticleHeadlinesFetchOperation *v5;
  void *v6;
  FCArticleHeadlinesFetchOperation *v7;

  v4 = a3;
  v5 = [FCArticleHeadlinesFetchOperation alloc];
  -[FCArticleController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v5, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v6, v4, 0);

  return v7;
}

- (id)headlinesFetchOperationForArticleIDs:(id)a3 ignoreCacheForArticleIDs:(id)a4
{
  id v6;
  id v7;
  FCArticleHeadlinesFetchOperation *v8;
  void *v9;
  FCArticleHeadlinesFetchOperation *v10;

  v6 = a4;
  v7 = a3;
  v8 = [FCArticleHeadlinesFetchOperation alloc];
  -[FCArticleController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v8, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v9, v7, v6);

  return v10;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
