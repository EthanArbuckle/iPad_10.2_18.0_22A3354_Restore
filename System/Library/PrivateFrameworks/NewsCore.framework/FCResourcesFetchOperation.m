@implementation FCResourcesFetchOperation

FCResource *__58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCResource *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FCResource *v8;

  v3 = a2;
  v4 = [FCResource alloc];
  v5 = objc_msgSend(*(id *)(a1 + 32), "cacheLifetimeHint");
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 488);
  else
    v7 = 0;
  v8 = -[FCResource initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:](v4, "initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:", v3, v5, v7);

  return v8;
}

- (int64_t)cacheLifetimeHint
{
  return self->_cacheLifetimeHint;
}

- (void)setCacheLifetimeHint:(int64_t)a3
{
  self->_cacheLifetimeHint = a3;
}

- (id)fetchResourcesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *resourceIDs;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCContentContext *context;
  FCContentContext *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, _QWORD);
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = (void (**)(id, _QWORD))a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__39;
  v32 = __Block_byref_object_dispose__39;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__39;
  v26 = __Block_byref_object_dispose__39;
  v27 = 0;
  if (self)
    resourceIDs = self->_resourceIDs;
  else
    resourceIDs = 0;
  v6 = resourceIDs;
  v7 = MEMORY[0x1E0C809B0];
  v20[5] = &v22;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke;
  v21[3] = &unk_1E4644CD0;
  v21[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_2;
  v20[3] = &unk_1E463F498;
  v20[4] = &v28;
  -[NSArray fc_splitArrayWithTest:result:](v6, "fc_splitArrayWithTest:result:", v21, v20);

  v8 = (void *)v29[5];
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_3;
  v19[3] = &unk_1E4644CF8;
  v19[4] = self;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)v23[5], "count"))
  {
    -[FCResourcesFetchOperation setResources:]((uint64_t)self, v9);
LABEL_9:
    v4[2](v4, 0);
    v14 = 0;
    goto LABEL_10;
  }
  if (self)
    context = self->_context;
  else
    context = 0;
  v11 = context;
  -[FCContentContext internalContentContext](v11, "internalContentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceRecordSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchOperationForRecordsWithIDs:", v23[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_4;
  v16[3] = &unk_1E463B880;
  v16[4] = self;
  v17 = v9;
  v18 = v4;
  objc_msgSend(v14, "setFetchCompletionBlock:", v16);

  if (!v14)
    goto LABEL_9;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_4(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  objc_msgSend(v3, "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_5;
  v7[3] = &unk_1E4644D20;
  v7[4] = a1[4];
  objc_msgSend(v4, "transformRecordsWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", v5, a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCResourcesFetchOperation setResources:](a1[4], v6);

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)setResources:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 504), a2);
}

- (id)downloadAssetsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  FCAssetsFetchOperation *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self && self->_downloadAssets)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_resources;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "assetHandle", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "assetHandle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  v14 = -[FCAssetsFetchOperation initWithAssetHandles:]([FCAssetsFetchOperation alloc], "initWithAssetHandles:", v5);
  -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v14, "setMaxConcurrentFetchCount:", -[FCResourcesFetchOperation maxConcurrentFetchCount](self, "maxConcurrentFetchCount"));
  -[FCResourcesFetchOperation progressHandler](self, "progressHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetsFetchOperation setProgressHandler:](v14, "setProgressHandler:", v15);

  -[FCFetchOperation setFetchCompletionBlock:](v14, "setFetchCompletionBlock:", v4);
  -[FCResourcesFetchOperation interestTokenHandler](self, "interestTokenHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetsFetchOperation setInterestTokenHandler:](v14, "setInterestTokenHandler:", v16);

  return v14;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

FCResource *__58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  FCResource *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  FCResource *v14;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "interestTokenHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v5);

  }
  v10 = [FCResource alloc];
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 488);
  else
    v12 = 0;
  objc_msgSend(v12, "assetManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCResource initWithRecord:interestToken:assetManager:](v10, "initWithRecord:interestToken:assetManager:", v7, v5, v13);

  return v14;
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (FCResourcesFetchOperation)initWithContext:(id)a3 resourceIDs:(id)a4 downloadAssets:(BOOL)a5
{
  id v9;
  id v10;
  FCResourcesFetchOperation *v11;
  FCResourcesFetchOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCResourcesFetchOperation;
  v11 = -[FCMultiStepFetchOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_resourceIDs, a4);
    v12->_downloadAssets = a5;
    v12->_cacheLifetimeHint = 0;
    -[FCMultiStepFetchOperation addFetchStep:](v12, "addFetchStep:", sel_fetchResourcesWithCompletion_);
    -[FCMultiStepFetchOperation addFetchStep:](v12, "addFetchStep:", sel_downloadAssetsWithCompletion_);
  }

  return v12;
}

- (BOOL)validateOperation
{
  BOOL v2;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)FCResourcesFetchOperation;
  v2 = -[FCOperation validateOperation](&v5, sel_validateOperation);
  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("resources fetch operation's superclass failed validation"));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCResourcesFetchOperation validateOperation]";
    v8 = 2080;
    v9 = "FCResourcesFetchOperation.m";
    v10 = 1024;
    v11 = 66;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v2;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  NSArray *resources;
  void *v6;
  void (**v7)(id, void *);

  if (!a3)
  {
    -[FCResourcesFetchOperation archiveHandler](self, "archiveHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[FCResourcesFetchOperation archiveHandler](self, "archiveHandler");
      v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
      if (self)
        resources = self->_resources;
      else
        resources = 0;
      -[NSArray contentArchive](resources, "contentArchive");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v6);

    }
  }
}

- (id)completeFetchOperation
{
  if (self)
    self = (FCResourcesFetchOperation *)self->_resources;
  return self;
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

uint64_t __58__FCResourcesFetchOperation_fetchResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    if (qword_1ED0F7B30 != -1)
      dispatch_once(&qword_1ED0F7B30, &__block_literal_global_91);
    if (_MergedGlobals_1)
    {
      v2 = 0;
    }
    else
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
      v2 = v4 != 0;

    }
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

void __65__FCResourcesFetchOperation__shouldUsePermanentURLForResourceID___block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("disable_permanent_resource_urls"));

}

- (FCResourcesFetchOperation)init
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
    v8 = "-[FCResourcesFetchOperation init]";
    v9 = 2080;
    v10 = "FCResourcesFetchOperation.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCResourcesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

@end
