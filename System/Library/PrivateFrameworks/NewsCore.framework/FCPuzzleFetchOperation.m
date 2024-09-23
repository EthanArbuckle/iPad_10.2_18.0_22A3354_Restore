@implementation FCPuzzleFetchOperation

- (FCPuzzleFetchOperation)init
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
    v8 = "-[FCPuzzleFetchOperation init]";
    v9 = 2080;
    v10 = "FCPuzzleFetchOperation.m";
    v11 = 1024;
    v12 = 45;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPuzzleFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPuzzleFetchOperation)initWithPuzzleIDs:(id)a3 puzzleTypeController:(id)a4 puzzleRecordSource:(id)a5 assetManager:(id)a6 configurationManager:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  FCPuzzleFetchOperation *v18;
  FCPuzzleFetchOperation *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleFetchOperation;
  v18 = -[FCMultiStepFetchOperation init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_puzzleIDs, a3);
    objc_storeStrong((id *)&v19->_puzzleTypeController, a4);
    objc_storeStrong((id *)&v19->_puzzleRecordSource, a5);
    objc_storeStrong((id *)&v19->_assetManager, a6);
    objc_storeStrong((id *)&v19->_configurationManager, a7);
    objc_storeWeak((id *)&v19->_delegate, v17);
    -[FCMultiStepFetchOperation addFetchStep:](v19, "addFetchStep:", sel_determineAppropriateFetchStepsWithCompletion_);
  }

  return v19;
}

- (id)determineAppropriateFetchStepsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;

  v4 = (void (**)(id, _QWORD))a3;
  -[FCPuzzleFetchOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[FCMultiStepFetchOperation addNonCriticalFetchStep:](self, "addNonCriticalFetchStep:", sel_fetchConfigWithCompletion_);
  -[FCMultiStepFetchOperation addFetchStep:](self, "addFetchStep:", sel_fetchPuzzleRecordsWithCompletion_);
  v4[2](v4, 0);

  return 0;
}

- (id)fetchConfigWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[FCPuzzleFetchOperation configurationManager](self, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__FCPuzzleFetchOperation_fetchConfigWithCompletion___block_invoke;
  v8[3] = &unk_1E463F0E8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  FCCoreConfigurationFetch(v5, v8);

  return 0;
}

void __52__FCPuzzleFetchOperation_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v9 = a2;
  v5 = a3;
  if (v5)
  {

    v6 = 0;
    v7 = 3;
  }
  else
  {
    v7 = 0;
    v6 = v9;
  }
  v10 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v6);
  +[FCFetchOperationResult resultWithStatus:fetchedObject:error:](FCFetchOperationResult, "resultWithStatus:fetchedObject:error:", v7, v10, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPuzzleFetchOperation;
  -[FCMultiStepFetchOperation customizeChildOperation:forFetchStep:](&v7, sel_customizeChildOperation_forFetchStep_, v6, a4);
  if (sel_fetchPuzzleRecordsWithCompletion_ == a4
    && -[FCPuzzleFetchOperation overrideTargetsCachePolicy](self, "overrideTargetsCachePolicy"))
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCPuzzleFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    -[FCPuzzleFetchOperation targetsMaximumCachedAge](self, "targetsMaximumCachedAge");
    objc_msgSend(v6, "setMaximumCachedAge:");
  }

}

- (id)fetchPuzzleRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FCPuzzleFetchOperation puzzleRecordSource](self, "puzzleRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleFetchOperation puzzleIDs](self, "puzzleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOperationForRecordsWithIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  -[FCFetchOperation maximumCachedAge](self, "maximumCachedAge");
  objc_msgSend(v7, "setMaximumCachedAge:");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E463B768;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "setFetchCompletionBlock:", v10);

  return v7;
}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[5];

  v3 = a2;
  objc_msgSend(v3, "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHeldPuzzleRecords:", v4);

  objc_msgSend(*(id *)(a1 + 32), "heldPuzzleRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_3;
      aBlock[3] = &unk_1E46441E8;
      aBlock[4] = *(_QWORD *)(a1 + 32);
      v9 = (void (**)(void *, void *))_Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 32), "heldPuzzleRecords");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v10);

    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "heldPuzzleRecords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_5;
    v22[3] = &unk_1E464A8F0;
    v23 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateRecordsAndInterestTokensWithBlock:", v22);

    objc_msgSend(*(id *)(a1 + 32), "puzzleTypeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
    objc_msgSend(*(id *)(a1 + 32), "fetchCompletionQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_6;
    v19[3] = &unk_1E464A918;
    v18 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v21 = v18;
    v20 = v3;
    objc_msgSend(v14, "fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:", v15, 0, v16, v17, v19);

  }
  else
  {
    v13 = *(id *)(a1 + 40);
    (*((void (**)(id, id))v13 + 2))(v13, v3);
  }

}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a2, "interestTokensByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_4;
  v5[3] = &unk_1E46441C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void (**v4)(id, id);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "interestTokenHandler");
  v4 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "puzzleTypeID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setFetchedPuzzleTypes:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)completeFetchOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleFetchOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "puzzlesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "difficultyDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleFetchOperation heldPuzzleRecords](self, "heldPuzzleRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__FCPuzzleFetchOperation_completeFetchOperation__block_invoke;
  v14[3] = &unk_1E463F8D0;
  v14[4] = self;
  v15 = v6;
  v8 = v3;
  v16 = v8;
  v9 = v6;
  objc_msgSend(v7, "enumerateRecordsAndInterestTokensWithBlock:", v14);

  -[FCPuzzleFetchOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "puzzleFetchOperation:didFetchPuzzles:", self, v11);

  }
  v12 = v8;

  return v12;
}

void __48__FCPuzzleFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  FCPuzzle *v9;
  void *v10;
  FCPuzzle *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  objc_msgSend(v14, "puzzleTypeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [FCPuzzle alloc];
    objc_msgSend(*(id *)(a1 + 32), "assetManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCPuzzle initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:](v9, "initWithPuzzleRecord:puzzleType:assetManager:interestToken:difficultyDescriptions:", v14, v8, v10, v5, *(_QWORD *)(a1 + 40));

    v12 = *(void **)(a1 + 48);
    -[FCPuzzle identifier](v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
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

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSArray)puzzleIDs
{
  return self->_puzzleIDs;
}

- (void)setPuzzleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleIDs, a3);
}

- (FCHeldRecords)heldPuzzleRecords
{
  return self->_heldPuzzleRecords;
}

- (void)setHeldPuzzleRecords:(id)a3
{
  objc_storeStrong((id *)&self->_heldPuzzleRecords, a3);
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  return self->_puzzleRecordSource;
}

- (void)setPuzzleRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleRecordSource, a3);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (FCPuzzleFetchOperationDelegate)delegate
{
  return (FCPuzzleFetchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (void)setPuzzleTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeController, a3);
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (NSDictionary)fetchedPuzzleTypes
{
  return self->_fetchedPuzzleTypes;
}

- (void)setFetchedPuzzleTypes:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedPuzzleTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedPuzzleTypes, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_heldPuzzleRecords, 0);
  objc_storeStrong((id *)&self->_puzzleIDs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
}

@end
