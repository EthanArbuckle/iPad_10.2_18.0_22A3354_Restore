@implementation FCTagsFetchOperation

- (id)fetchTagRecordsWithCompletion:(id)a3
{
  id v4;
  FCTagRecordSource *v5;
  NSArray *tagIDs;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (self)
  {
    v5 = self->_tagRecordSource;
    tagIDs = self->_tagIDs;
  }
  else
  {
    v5 = 0;
    tagIDs = 0;
  }
  -[FCRecordSource fetchOperationForRecordsWithIDs:](v5, "fetchOperationForRecordsWithIDs:", tagIDs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__FCTagsFetchOperation_fetchTagRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E463B768;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "setFetchCompletionBlock:", v10);

  return v7;
}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTag *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCTag *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCTag alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 520);
  else
    v9 = 0;
  v12 = -[FCTag initWithTagRecord:assetManager:interestToken:](v7, "initWithTagRecord:assetManager:interestToken:", v6, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCTag identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

void __54__FCTagsFetchOperation_fetchTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 488), v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)completeFetchOperation
{
  void *v3;
  FCHeldRecords *heldTagRecords;
  uint64_t v5;
  id v6;
  FCHeldRecords *heldParentTagRecords;
  id v8;
  FCHeldRecords *heldChildTagRecords;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  FCTagsFetchOperation *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    heldTagRecords = self->_heldTagRecords;
  else
    heldTagRecords = 0;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke;
  v23[3] = &unk_1E463B718;
  v23[4] = self;
  v6 = v3;
  v24 = v6;
  -[FCHeldRecords enumerateRecordsAndInterestTokensWithBlock:](heldTagRecords, "enumerateRecordsAndInterestTokensWithBlock:", v23);
  if (self)
    heldParentTagRecords = self->_heldParentTagRecords;
  else
    heldParentTagRecords = 0;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_2;
  v21[3] = &unk_1E463B718;
  v21[4] = self;
  v8 = v6;
  v22 = v8;
  -[FCHeldRecords enumerateRecordsAndInterestTokensWithBlock:](heldParentTagRecords, "enumerateRecordsAndInterestTokensWithBlock:", v21);
  if (self)
    heldChildTagRecords = self->_heldChildTagRecords;
  else
    heldChildTagRecords = 0;
  v15 = v5;
  v16 = 3221225472;
  v17 = __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_3;
  v18 = &unk_1E463B718;
  v19 = self;
  v10 = v8;
  v20 = v10;
  -[FCHeldRecords enumerateRecordsAndInterestTokensWithBlock:](heldChildTagRecords, "enumerateRecordsAndInterestTokensWithBlock:", &v15);
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      objc_msgSend(v10, "allValues", v15, v16, v17, v18, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tagsFetchOperation:didFetchTags:", self, v12);

    }
  }
  else
  {
    WeakRetained = 0;
  }
  v13 = v10;

  return v13;
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCTagsFetchOperation;
  -[FCMultiStepFetchOperation customizeChildOperation:forFetchStep:](&v7, sel_customizeChildOperation_forFetchStep_, v6, a4);
  if (sel_fetchTagRecordsWithCompletion_ == a4
    && -[FCTagsFetchOperation overrideTargetsCachePolicy](self, "overrideTargetsCachePolicy"))
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCTagsFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    -[FCTagsFetchOperation targetsMaximumCachedAge](self, "targetsMaximumCachedAge");
LABEL_7:
    objc_msgSend(v6, "setMaximumCachedAge:");
    goto LABEL_8;
  }
  if (sel_fetchChildTagRecordsWithCompletion_ == a4
    && -[FCTagsFetchOperation overrideChildrenCachePolicy](self, "overrideChildrenCachePolicy"))
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCTagsFetchOperation childrenCachePolicy](self, "childrenCachePolicy"));
    -[FCTagsFetchOperation childrenMaximumCachedAge](self, "childrenMaximumCachedAge");
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)overrideTargetsCachePolicy
{
  return self->_overrideTargetsCachePolicy;
}

- (FCTagsFetchOperation)initWithTagIDs:(id)a3 tagRecordSource:(id)a4 assetManager:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCTagsFetchOperation *v14;
  uint64_t v15;
  NSArray *tagIDs;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagIDs");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    v26 = 1024;
    v27 = 41;
    v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    v26 = 1024;
    v27 = 42;
    v28 = 2114;
    v29 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagRecordSource");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCTagsFetchOperation initWithTagIDs:tagRecordSource:assetManager:delegate:]";
    v24 = 2080;
    v25 = "FCTagsFetchOperation.m";
    v26 = 1024;
    v27 = 43;
    v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v21.receiver = self;
  v21.super_class = (Class)FCTagsFetchOperation;
  v14 = -[FCMultiStepFetchOperation init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    tagIDs = v14->_tagIDs;
    v14->_tagIDs = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_assetManager, a5);
    objc_storeStrong((id *)&v14->_tagRecordSource, a4);
    objc_storeWeak((id *)&v14->_delegate, v13);
    -[FCMultiStepFetchOperation addFetchStep:](v14, "addFetchStep:", sel_fetchTagRecordsWithCompletion_);
    -[FCMultiStepFetchOperation addFetchStep:](v14, "addFetchStep:", sel_fetchParentTagRecordsWithCompletion_);
    -[FCMultiStepFetchOperation addFetchStep:](v14, "addFetchStep:", sel_fetchChildTagRecordsWithCompletion_);
  }

  return v14;
}

- (void)setIncludeParents:(BOOL)a3
{
  self->_includeParents = a3;
}

- (void)setIncludeChildren:(BOOL)a3
{
  self->_includeChildren = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_heldChildTagRecords, 0);
  objc_storeStrong((id *)&self->_heldParentTagRecords, 0);
  objc_storeStrong((id *)&self->_heldTagRecords, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
}

- (id)fetchChildTagRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FCHeldRecords *heldTagRecords;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  FCTagRecordSource *tagRecordSource;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCTagsFetchOperation includeChildren](self, "includeChildren"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    if (self)
      heldTagRecords = self->_heldTagRecords;
    else
      heldTagRecords = 0;
    -[FCHeldRecords allRecords](heldTagRecords, "allRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "channelSectionIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    if (self)
      tagRecordSource = self->_tagRecordSource;
    else
      tagRecordSource = 0;
    -[FCRecordSource fetchOperationForRecordsWithIDs:](tagRecordSource, "fetchOperationForRecordsWithIDs:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__FCTagsFetchOperation_fetchChildTagRecordsWithCompletion___block_invoke;
    v17[3] = &unk_1E463B768;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v14, "setFetchCompletionBlock:", v17);
    v15 = v14;

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v15 = 0;
  }

  return v15;
}

- (BOOL)includeChildren
{
  return self->_includeChildren;
}

- (id)fetchParentTagRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FCHeldRecords *heldTagRecords;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  FCTagRecordSource *tagRecordSource;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCTagsFetchOperation includeParents](self, "includeParents"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    if (self)
      heldTagRecords = self->_heldTagRecords;
    else
      heldTagRecords = 0;
    -[FCHeldRecords allRecords](heldTagRecords, "allRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "parentID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    if (self)
      tagRecordSource = self->_tagRecordSource;
    else
      tagRecordSource = 0;
    -[FCRecordSource fetchOperationForRecordsWithIDs:](tagRecordSource, "fetchOperationForRecordsWithIDs:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__FCTagsFetchOperation_fetchParentTagRecordsWithCompletion___block_invoke;
    v17[3] = &unk_1E463B768;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v14, "setFetchCompletionBlock:", v17);
    v15 = v14;

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v15 = 0;
  }

  return v15;
}

- (BOOL)includeParents
{
  return self->_includeParents;
}

void __60__FCTagsFetchOperation_fetchParentTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 496), v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__FCTagsFetchOperation_fetchChildTagRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 504), v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTag *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCTag *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCTag alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 520);
  else
    v9 = 0;
  v12 = -[FCTag initWithTagRecord:assetManager:interestToken:](v7, "initWithTagRecord:assetManager:interestToken:", v6, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCTag identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

void __46__FCTagsFetchOperation_completeFetchOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCTag *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCTag *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCTag alloc];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 520);
  else
    v9 = 0;
  v12 = -[FCTag initWithTagRecord:assetManager:interestToken:](v7, "initWithTagRecord:assetManager:interestToken:", v6, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCTag identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

- (void)setOverrideTargetsCachePolicy:(BOOL)a3
{
  self->_overrideTargetsCachePolicy = a3;
}

- (unint64_t)targetsCachePolicy
{
  return self->_targetsCachePolicy;
}

- (void)setTargetsCachePolicy:(unint64_t)a3
{
  self->_targetsCachePolicy = a3;
}

- (double)targetsMaximumCachedAge
{
  return self->_targetsMaximumCachedAge;
}

- (void)setTargetsMaximumCachedAge:(double)a3
{
  self->_targetsMaximumCachedAge = a3;
}

- (BOOL)overrideChildrenCachePolicy
{
  return self->_overrideChildrenCachePolicy;
}

- (void)setOverrideChildrenCachePolicy:(BOOL)a3
{
  self->_overrideChildrenCachePolicy = a3;
}

- (unint64_t)childrenCachePolicy
{
  return self->_childrenCachePolicy;
}

- (void)setChildrenCachePolicy:(unint64_t)a3
{
  self->_childrenCachePolicy = a3;
}

- (double)childrenMaximumCachedAge
{
  return self->_childrenMaximumCachedAge;
}

- (void)setChildrenMaximumCachedAge:(double)a3
{
  self->_childrenMaximumCachedAge = a3;
}

@end
