@implementation FCArticle

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (FCArticle)initWithContext:(id)a3 headline:(id)a4
{
  id v6;
  id v7;
  FCArticle *v8;
  uint64_t v9;
  NSString *articleID;
  uint64_t v11;
  FCArticleContent *content;
  dispatch_group_t v13;
  OS_dispatch_group *fetchGroup;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCArticle;
  v8 = -[FCArticle init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "articleID");
    v9 = objc_claimAutoreleasedReturnValue();
    articleID = v8->_articleID;
    v8->_articleID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_headline, a4);
    -[FCHeadlineProviding contentWithContext:](v8->_headline, "contentWithContext:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    content = v8->_content;
    v8->_content = (FCArticleContent *)v11;

    v13 = dispatch_group_create();
    fetchGroup = v8->_fetchGroup;
    v8->_fetchGroup = (OS_dispatch_group *)v13;

  }
  return v8;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)performBlockWhenFullyLoaded:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 IsEmpty;
  id *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE location[12];
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCArticle performBlockWhenFullyLoaded:]";
    v18 = 2080;
    v19 = "FCArticle.m";
    v20 = 1024;
    v21 = 103;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

  }
  objc_initWeak((id *)location, self);
  -[FCArticle fetchGroup](self, "fetchGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmpty = FCDispatchGroupIsEmpty(v5);

  if (IsEmpty)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__FCArticle_performBlockWhenFullyLoaded___block_invoke;
    v14[3] = &unk_1E4645C18;
    v15 = v4;
    v7 = &v16;
    objc_copyWeak(&v16, (id *)location);
    __41__FCArticle_performBlockWhenFullyLoaded___block_invoke((uint64_t)v14);
    v8 = &v15;
  }
  else
  {
    -[FCArticle fetchGroup](self, "fetchGroup");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__FCArticle_performBlockWhenFullyLoaded___block_invoke_2;
    block[3] = &unk_1E4645C18;
    v12 = v4;
    v7 = &v13;
    objc_copyWeak(&v13, (id *)location);
    dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

    v8 = &v12;
  }
  objc_destroyWeak(v7);

  objc_destroyWeak((id *)location);
}

void __41__FCArticle_performBlockWhenFullyLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "fetchError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (FCArticle)init
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
    v8 = "-[FCArticle init]";
    v9 = 2080;
    v10 = "FCArticle.m";
    v11 = 1024;
    v12 = 37;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticle init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCArticle)initWithContext:(id)a3 articleID:(id)a4 forceArticleUpdate:(BOOL)a5 qualityOfService:(int64_t)a6 relativePriority:(int64_t)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  FCArticle *v14;
  uint64_t v15;
  NSString *articleID;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id location;
  objc_super v32;
  _QWORD v33[2];

  v9 = a5;
  v33[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FCArticle;
  v14 = -[FCArticle init](&v32, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    articleID = v14->_articleID;
    v14->_articleID = (NSString *)v15;

    objc_msgSend(v12, "articleController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "headlinesFetchOperationForArticleIDs:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setQualityOfService:", a6);
    objc_msgSend(v19, "setRelativePriority:", a7);
    if (v9)
    {
      objc_msgSend(v19, "setOverrideArticleCachePolicy:", 1);
      objc_msgSend(v19, "setArticleCachePolicy:", 1);
      objc_msgSend(v19, "setArticleMaximumCachedAge:", 0.0);
    }
    objc_storeStrong((id *)&v14->_headlineFetchOperation, v19);
    v20 = dispatch_group_create();
    objc_initWeak(&location, v14);
    dispatch_group_enter(v20);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __92__FCArticle_initWithContext_articleID_forceArticleUpdate_qualityOfService_relativePriority___block_invoke;
    v27 = &unk_1E4645BF0;
    objc_copyWeak(&v30, &location);
    v28 = v12;
    v21 = v20;
    v29 = v21;
    -[FCFetchOperation setFetchCompletionBlock:](v14->_headlineFetchOperation, "setFetchCompletionBlock:", &v24);
    objc_storeStrong((id *)&v14->_fetchGroup, v20);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue", v24, v25, v26, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addOperation:", v14->_headlineFetchOperation);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v14;
}

void __92__FCArticle_initWithContext_articleID_forceArticleUpdate_qualityOfService_relativePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setFetchError:", v4);

  objc_msgSend(v3, "fetchedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "setHeadline:", v7);

  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v9, "headline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentWithContext:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "setContent:", v11);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[FCFetchOperation cancel](self->_headlineFetchOperation, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)FCArticle;
  -[FCArticle dealloc](&v3, sel_dealloc);
}

void __41__FCArticle_performBlockWhenFullyLoaded___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "fetchError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)performBlockWhenContentIsLoaded:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 IsEmpty;
  id *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE location[12];
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FCArticle performBlockWhenContentIsLoaded:]";
    v18 = 2080;
    v19 = "FCArticle.m";
    v20 = 1024;
    v21 = 113;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

  }
  objc_initWeak((id *)location, self);
  -[FCArticle fetchGroup](self, "fetchGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmpty = FCDispatchGroupIsEmpty(v5);

  if (IsEmpty)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke;
    v14[3] = &unk_1E4645C18;
    v15 = v4;
    v7 = &v16;
    objc_copyWeak(&v16, (id *)location);
    __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke((uint64_t)v14);
    v8 = &v15;
  }
  else
  {
    -[FCArticle fetchGroup](self, "fetchGroup");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke_2;
    block[3] = &unk_1E4645C18;
    v12 = v4;
    v7 = &v13;
    objc_copyWeak(&v13, (id *)location);
    dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

    v8 = &v12;
  }
  objc_destroyWeak(v7);

  objc_destroyWeak((id *)location);
}

void __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "fetchError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v1 + 16))(v1, v3, v5);

}

void __45__FCArticle_performBlockWhenContentIsLoaded___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "fetchError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v1 + 16))(v1, v3, v5);

}

- (void)setHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_headline, a3);
}

- (FCArticleContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)setFetchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchGroup, a3);
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (FCFetchOperation)headlineFetchOperation
{
  return self->_headlineFetchOperation;
}

- (void)setHeadlineFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_headlineFetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlineFetchOperation, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
