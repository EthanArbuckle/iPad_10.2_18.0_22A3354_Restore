@implementation FCPuzzleTypeFetchOperation

- (FCPuzzleTypeFetchOperation)init
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
    v8 = "-[FCPuzzleTypeFetchOperation init]";
    v9 = 2080;
    v10 = "FCPuzzleTypeFetchOperation.m";
    v11 = 1024;
    v12 = 37;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPuzzleTypeFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPuzzleTypeFetchOperation)initWithPuzzleTypeIDs:(id)a3 puzzleTypeRecordSource:(id)a4 assetManager:(id)a5 context:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FCPuzzleTypeFetchOperation *v17;
  FCPuzzleTypeFetchOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCPuzzleTypeFetchOperation;
  v17 = -[FCMultiStepFetchOperation init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_puzzleTypeIDs, a3);
    objc_storeStrong((id *)&v18->_puzzleTypeRecordSource, a4);
    objc_storeStrong((id *)&v18->_assetManager, a5);
    objc_storeStrong((id *)&v18->_context, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    -[FCMultiStepFetchOperation addFetchStep:](v18, "addFetchStep:", sel_fetchPuzzleTypeRecordsWithCompletion_);
  }

  return v18;
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPuzzleTypeFetchOperation;
  -[FCMultiStepFetchOperation customizeChildOperation:forFetchStep:](&v7, sel_customizeChildOperation_forFetchStep_, v6, a4);
  if (sel_fetchPuzzleTypeRecordsWithCompletion_ == a4
    && -[FCPuzzleTypeFetchOperation overrideTargetsCachePolicy](self, "overrideTargetsCachePolicy"))
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCPuzzleTypeFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    -[FCPuzzleTypeFetchOperation targetsMaximumCachedAge](self, "targetsMaximumCachedAge");
    objc_msgSend(v6, "setMaximumCachedAge:");
  }

}

- (id)fetchPuzzleTypeRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FCPuzzleTypeFetchOperation puzzleTypeRecordSource](self, "puzzleTypeRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleTypeFetchOperation puzzleTypeIDs](self, "puzzleTypeIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOperationForRecordsWithIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FCPuzzleTypeFetchOperation_fetchPuzzleTypeRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E463B768;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "setFetchCompletionBlock:", v10);

  return v7;
}

void __67__FCPuzzleTypeFetchOperation_fetchPuzzleTypeRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "fetchedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHeldPuzzleTypeRecords:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)completeFetchOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  FCPuzzleTypeFetchOperation *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleTypeFetchOperation heldPuzzleTypeRecords](self, "heldPuzzleTypeRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__FCPuzzleTypeFetchOperation_completeFetchOperation__block_invoke;
  v13 = &unk_1E4648318;
  v14 = self;
  v5 = v3;
  v15 = v5;
  objc_msgSend(v4, "enumerateRecordsAndInterestTokensWithBlock:", &v10);

  -[FCPuzzleTypeFetchOperation delegate](self, "delegate", v10, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "puzzleTypeFetchOperation:didFetchPuzzleTypes:", self, v7);

  }
  v8 = v5;

  return v8;
}

void __52__FCPuzzleTypeFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCPuzzleType *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCPuzzleType *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCPuzzleType alloc];
  objc_msgSend(*(id *)(a1 + 32), "assetManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCPuzzleType initWithPuzzleTypeRecord:assetManager:context:interestToken:](v7, "initWithPuzzleTypeRecord:assetManager:context:interestToken:", v6, v8, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCPuzzleType identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

- (BOOL)overrideTargetsCachePolicy
{
  return self->_overrideTargetsCachePolicy;
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

- (NSArray)puzzleTypeIDs
{
  return self->_puzzleTypeIDs;
}

- (void)setPuzzleTypeIDs:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeIDs, a3);
}

- (FCHeldRecords)heldPuzzleTypeRecords
{
  return self->_heldPuzzleTypeRecords;
}

- (void)setHeldPuzzleTypeRecords:(id)a3
{
  objc_storeStrong((id *)&self->_heldPuzzleTypeRecords, a3);
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  return self->_puzzleTypeRecordSource;
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, a3);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCPuzzleTypeFetchOperationDelegate)delegate
{
  return (FCPuzzleTypeFetchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_heldPuzzleTypeRecords, 0);
  objc_storeStrong((id *)&self->_puzzleTypeIDs, 0);
}

@end
