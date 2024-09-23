@implementation FCFlintResourceManager

- (id)cachedResourceWithIdentifier:(id)a3
{
  id v4;
  FCResource *v5;
  FCContentContext *context;
  FCResource *v7;

  v4 = a3;
  v5 = [FCResource alloc];
  if (self)
    context = self->_context;
  else
    context = 0;
  v7 = -[FCResource initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:](v5, "initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:", v4, 0, context);

  return v7;
}

- (FCResourcesFetchOperation)fetchResourcesWithIdentifiers:(uint64_t)a3 downloadAssets:(uint64_t)a4 cacheLifetimeHint:(uint64_t)a5 relativePriority:(void *)a6 callBackQueue:(void *)a7 completionBlock:
{
  id v13;
  id v14;
  id v15;
  FCResourcesFetchOperation *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a6;
  v15 = a7;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_13;
  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "resourceIdentifiers");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callB"
          "ackQueue:completionBlock:]";
    v27 = 2080;
    v28 = "FCFlintResourceManager.m";
    v29 = 1024;
    v30 = 111;
    v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "completionBlock");
        *(_DWORD *)buf = 136315906;
        v26 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:c"
              "allBackQueue:completionBlock:]";
        v27 = 2080;
        v28 = "FCFlintResourceManager.m";
        v29 = 1024;
        v30 = 112;
        v31 = 2114;
        v32 = v22;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v15)
  {
    goto LABEL_5;
  }
  v16 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:]([FCResourcesFetchOperation alloc], "initWithContext:resourceIDs:downloadAssets:", *(_QWORD *)(a1 + 8), v13, a3);
  -[FCOperation setPurpose:](v16, "setPurpose:", CFSTR("article"));
  -[FCResourcesFetchOperation setCacheLifetimeHint:](v16, "setCacheLifetimeHint:", a4);
  v17 = 25;
  if (!a5)
    v17 = 17;
  if (a5 == -1)
    v18 = 9;
  else
    v18 = v17;
  -[FCOperation setQualityOfService:](v16, "setQualityOfService:", v18);
  -[FCOperation setRelativePriority:](v16, "setRelativePriority:", a5);
  -[FCFetchOperation setFetchCompletionQueue:](v16, "setFetchCompletionQueue:", v14);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __136__FCFlintResourceManager_fetchResourcesWithIdentifiers_downloadAssets_cacheLifetimeHint_relativePriority_callBackQueue_completionBlock___block_invoke;
  v23[3] = &unk_1E463B608;
  v24 = v15;
  -[FCFetchOperation setFetchCompletionBlock:](v16, "setFetchCompletionBlock:", v23);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v16);

LABEL_13:
  return v16;
}

- (FCFlintResourceManager)initWithContext:(id)a3
{
  id v5;
  FCFlintResourceManager *v6;
  FCFlintResourceManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCFlintResourceManager;
  v6 = -[FCFlintResourceManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

void __136__FCFlintResourceManager_fetchResourcesWithIdentifiers_downloadAssets_cacheLifetimeHint_relativePriority_callBackQueue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    v16 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    objc_msgSend(v3, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "resourceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "resource.resourceID");
            *(_DWORD *)buf = 136315906;
            v23 = "-[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriori"
                  "ty:callBackQueue:completionBlock:]_block_invoke";
            v24 = 2080;
            v25 = "FCFlintResourceManager.m";
            v26 = 1024;
            v27 = 131;
            v28 = 2114;
            v29 = v15;
            _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(v12, "resourceID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v8);
    }

    v4 = 0;
    a1 = v16;
    v3 = v17;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)fetchResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 callBackQueue:(id)a6 completionBlock:(id)a7
{
  return -[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callBackQueue:completionBlock:]((uint64_t)self, a3, a4, 0, a5, a6, a7);
}

- (id)fetchFontResourcesWithIdentifiers:(id)a3 downloadAssets:(BOOL)a4 relativePriority:(int64_t)a5 completionBlock:(id)a6
{
  return -[FCFlintResourceManager fetchResourcesWithIdentifiers:downloadAssets:cacheLifetimeHint:relativePriority:callBackQueue:completionBlock:]((uint64_t)self, a3, a4, 1, a5, 0, a6);
}

- (id)cachedResourcesWithIdentifiers:(id)a3
{
  id v4;
  FCResourcesFetchOperation *v5;
  FCContentContext *context;
  FCResourcesFetchOperation *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "resourceIdentifiers");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFlintResourceManager cachedResourcesWithIdentifiers:]";
    v14 = 2080;
    v15 = "FCFlintResourceManager.m";
    v16 = 1024;
    v17 = 80;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = [FCResourcesFetchOperation alloc];
  if (self)
    context = self->_context;
  else
    context = 0;
  v7 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v5, "initWithContext:resourceIDs:downloadAssets:", context, v4, 0);
  -[FCOperation setPurpose:](v7, "setPurpose:", CFSTR("article"));
  -[FCFetchOperation setCachePolicy:](v7, "setCachePolicy:", 3);
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v7, "setCanSendFetchCompletionSynchronously:", 1);
  -[FCOperation start](v7, "start");
  -[FCResourcesFetchOperation waitUntilFinished](v7, "waitUntilFinished");
  -[FCFetchOperation result](v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (FCFlintResourceManager)init
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
    v8 = "-[FCFlintResourceManager init]";
    v9 = 2080;
    v10 = "FCFlintResourceManager.m";
    v11 = 1024;
    v12 = 31;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFlintResourceManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
