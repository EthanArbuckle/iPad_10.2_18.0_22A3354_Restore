@implementation FCOfflinePuzzleFetchOperation

- (FCOfflinePuzzleFetchOperation)init
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
    v8 = "-[FCOfflinePuzzleFetchOperation init]";
    v9 = 2080;
    v10 = "FCOfflinePuzzleFetchOperation.m";
    v11 = 1024;
    v12 = 81;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCOfflinePuzzleFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzleID:(id)a4
{
  id v7;
  id v8;
  FCOfflinePuzzleFetchOperation *v9;
  FCOfflinePuzzleFetchOperation *v10;
  uint64_t v11;
  NSString *puzzleID;
  FCThreadSafeMutableArray *v13;
  FCThreadSafeMutableArray *resultInterestTokens;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCOfflinePuzzleFetchOperation;
  v9 = -[FCOperation init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    puzzleID = v10->_puzzleID;
    v10->_puzzleID = (NSString *)v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v10->_resultInterestTokens;
    v10->_resultInterestTokens = v13;

  }
  return v10;
}

- (FCOfflinePuzzleFetchOperation)initWithContext:(id)a3 puzzle:(id)a4
{
  id v6;
  void *v7;
  FCOfflinePuzzleFetchOperation *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCOfflinePuzzleFetchOperation initWithContext:puzzleID:](self, "initWithContext:puzzleID:", v6, v7);

  return v8;
}

- (BOOL)validateOperation
{
  _BOOL4 v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline puzzle fetch operation requires a context"));
      v5 = 136315906;
      v6 = "-[FCOfflinePuzzleFetchOperation validateOperation]";
      v7 = 2080;
      v8 = "FCOfflinePuzzleFetchOperation.m";
      v9 = 1024;
      v10 = 109;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)prepareOperation
{
  FCOfflinePuzzleFetchOperation *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  if (self)
    self = (FCOfflinePuzzleFetchOperation *)self->_context;
  -[FCOfflinePuzzleFetchOperation appConfigurationManager](self, "appConfigurationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possiblyUnfetchedAppConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offlineDownloadsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong((id *)&v2->_config, v4);

}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  NSString *v6;
  FCOfflineDownloadsConfiguration *config;
  FCOfflineDownloadsConfiguration *v8;
  _BOOL4 v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__33;
  v26[4] = __Block_byref_object_dispose__33;
  v27 = 0;
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FCOfflinePuzzleFetchOperation cachedOnly](self, "cachedOnly"))
      v5 = CFSTR("lookup cached");
    else
      v5 = CFSTR("fetch");
    if (self)
    {
      v6 = self->_puzzleID;
      config = self->_config;
    }
    else
    {
      v6 = 0;
      config = 0;
    }
    v8 = config;
    v9 = -[FCOfflineDownloadsConfiguration useSmallestPuzzleThumbnails](v8, "useSmallestPuzzleThumbnails");
    v10 = CFSTR("normal");
    *(_DWORD *)buf = 138544130;
    v29 = v4;
    v30 = 2114;
    if (v9)
      v10 = CFSTR("small");
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ puzzle id=%{public}@, thumbnail variant=%{public}@", buf, 0x2Au);

  }
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke;
  v25[3] = &unk_1E463D3A8;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_2;
  v24[3] = &unk_1E4644170;
  v24[4] = self;
  v24[5] = v26;
  objc_msgSend(v12, "thenOn:then:", v13, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_3;
  v23[3] = &unk_1E4640480;
  v23[4] = self;
  v23[5] = v26;
  objc_msgSend(v14, "thenOn:then:", v15, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_4;
  v22[3] = &unk_1E4644198;
  v22[4] = self;
  objc_msgSend(v16, "thenOn:then:", v17, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_5;
  v21[3] = &unk_1E463EA38;
  v21[4] = self;
  v20 = (id)objc_msgSend(v18, "errorOn:error:", v19, v21);

  _Block_object_dispose(v26, 8);
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v5[5];

  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.0);
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke;
  v5[3] = &unk_1E463DAD0;
  v5[4] = v2;
  return (id)objc_msgSend(v3, "initWithResolver:", v5);
}

- (void)_updateProgress:(double *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1 && (objc_msgSend(a1, "isFinished") & 1) == 0)
  {
    if (a1[57] > a2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetch progress should never go backward"));
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCOfflinePuzzleFetchOperation _updateProgress:]";
      v11 = 2080;
      v12 = "FCOfflinePuzzleFetchOperation.m";
      v13 = 1024;
      v14 = 308;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    a1[57] = a2;
    objc_msgSend(a1, "progressQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "progressHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!v5)
        return;
      objc_msgSend(a1, "progressQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__FCOfflinePuzzleFetchOperation__updateProgress___block_invoke_49;
      block[3] = &unk_1E463AB18;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)v6, block);
    }
    else
    {
      if (!v5)
        return;
      objc_msgSend(a1, "progressHandler");
      v6 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(double))(v6 + 16))(a1[57]);
    }

  }
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.2);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke;
    v10[3] = &unk_1E463F188;
    v11 = v6;
    v12 = v5;
    v8 = (void *)objc_msgSend(v7, "initWithResolver:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  -[FCOfflinePuzzleFetchOperation _updateProgress:](*(double **)(a1 + 32), 0.4);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke;
    v7[3] = &unk_1E463F188;
    v8 = v3;
    v9 = v2;
    v5 = (void *)objc_msgSend(v4, "initWithResolver:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __49__FCOfflinePuzzleFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  FCThreadSafeMutableArray *resultInterestTokens;
  FCThreadSafeMutableArray *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (!v4)
    -[FCOfflinePuzzleFetchOperation _updateProgress:]((double *)self, 1.0);
  -[FCOfflinePuzzleFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOfflinePuzzleFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
    {
      -[FCOfflinePuzzleFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62__FCOfflinePuzzleFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E463AD10;
      v12[4] = self;
      v13 = v4;
      dispatch_async(v7, v12);

    }
  }
  else if (v6)
  {
    -[FCOfflinePuzzleFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (self)
      resultInterestTokens = self->_resultInterestTokens;
    else
      resultInterestTokens = 0;
    v10 = resultInterestTokens;
    -[FCThreadSafeMutableArray readOnlyArray](v10, "readOnlyArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v8)[2](v8, v11, v4);

  }
}

void __62__FCOfflinePuzzleFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "fetchCompletionHandler");
  v5 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[56];
  v3 = v2;
  objc_msgSend(v3, "readOnlyArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, *(_QWORD *)(a1 + 40));

}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCRecordChainFetchOperation *v7;
  FCRecordChainFetchOperation *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCRecordChainFetchOperation);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 424);
  else
    v10 = 0;
  -[FCRecordChainFetchOperation setContext:](v7, "setContext:", v10);
  v11 = *(_QWORD **)(a1 + 32);
  if (v11)
    v11 = (_QWORD *)v11[54];
  v30[0] = v11;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = v11;
  objc_msgSend(v12, "arrayWithObjects:count:", v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v8, "setTopLevelRecordIDs:", v14);
  v28[0] = CFSTR("Puzzle");
  v27 = CFSTR("puzzleTypeID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = CFSTR("PuzzleType");
  v29[0] = v15;
  v29[1] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v8, "setLinkKeysByRecordType:", v16);

  if (objc_msgSend(*(id *)(a1 + 32), "cachedOnly"))
  {
    +[FCCachePolicy cachedOnlyCachePolicy](FCCachePolicy, "cachedOnlyCachePolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePolicy:](v8, "setCachePolicy:", v17);

  }
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2;
  v23 = &unk_1E46440D8;
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v6;
  v26 = v5;
  v18 = v5;
  v19 = v6;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v8, "setRecordChainCompletionHandler:", &v20);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v20, v21, v22, v23, v24);
  -[FCOperation start](v8, "start");

}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(void *, void *);
  void (**v11)(void *, void *);
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD aBlock[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470AA00);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470AA18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2_32;
        aBlock[3] = &unk_1E46441E8;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v10 = (void (**)(void *, void *))_Block_copy(aBlock);
        v10[2](v10, v7);
        v10[2](v10, v8);
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_4;
        v16[3] = &unk_1E46441E8;
        v16[4] = *(_QWORD *)(a1 + 32);
        v11 = (void (**)(void *, void *))_Block_copy(v16);
        v11[2](v11, v7);
        v11[2](v11, v8);
        v12 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v7, "onlyRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "onlyRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

      }
      else
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_31;
        v18[3] = &unk_1E463B598;
        v18[4] = *(_QWORD *)(a1 + 40);
        __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_31((uint64_t)v18);
      }

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_28;
      v19[3] = &unk_1E463B598;
      v19[4] = *(_QWORD *)(a1 + 40);
      __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_28((uint64_t)v19);
    }

  }
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_28(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_31(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_2_32(uint64_t a1, void *a2)
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
  v5[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3_33;
  v5[3] = &unk_1E46441C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_3_33(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 448), "addObject:", a2);
  }
  return result;
}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a2, "recordsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_5;
  v5[3] = &unk_1E463D0B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __54__FCOfflinePuzzleFetchOperation__promisePuzzleRecords__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCOfflinePuzzleFetchOperation _handleArchive:](v2, v3);

}

- (void)_handleArchive:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_msgSend(a1, "archiveQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "archiveHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v6)
      {
        objc_msgSend(a1, "archiveQueue");
        v7 = objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __48__FCOfflinePuzzleFetchOperation__handleArchive___block_invoke_2;
        v9[3] = &unk_1E463AD10;
        v9[4] = a1;
        v10 = v4;
        dispatch_async(v7, v9);

      }
    }
    else if (v6)
    {
      objc_msgSend(a1, "archiveHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v4);

    }
  }

}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  FCAssetsFetchOperation *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD **)(a1 + 40);
  if (v9)
  {
    v10 = (void *)v9[55];
    v9 = (_QWORD *)v9[53];
  }
  else
  {
    v10 = 0;
  }
  v11 = v9;
  v12 = v10;
  objc_msgSend(v11, "assetManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FCOfflineThumbnailAssetHandlesForPuzzleRecords(v7, v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[FCAssetsFetchOperation initWithAssetHandles:]([FCAssetsFetchOperation alloc], "initWithAssetHandles:", v14);
  if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
    v16 = 3;
  else
    v16 = 0;
  -[FCFetchOperation setCachePolicy:](v15, "setCachePolicy:", v16);
  -[FCFetchOperation setShouldFailOnMissingObjects:](v15, "setShouldFailOnMissingObjects:", 1);
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_2;
  v27[3] = &unk_1E4644210;
  v27[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setInterestTokenHandler:](v15, "setInterestTokenHandler:", v27);
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_3;
  v26[3] = &unk_1E4644238;
  v26[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setArchiveHandler:](v15, "setArchiveHandler:", v26);
  v20 = v17;
  v21 = 3221225472;
  v22 = __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_4;
  v23 = &unk_1E4644260;
  v24 = v6;
  v25 = v5;
  v18 = v5;
  v19 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v15, "setFetchCompletionBlock:", &v20);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v15, v20, v21, v22, v23);
  -[FCOperation start](v15, "start");

}

uint64_t __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 448), "addObject:", a2);
  }
  return result;
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_3(uint64_t a1, void *a2)
{
  -[FCOfflinePuzzleFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __68__FCOfflinePuzzleFetchOperation__promiseThumbnailsForPuzzleRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    v4 = *(void (***)(_QWORD, _QWORD))(a1 + 32);
    v5 = v4;
    objc_msgSend(v3, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id))v4)[2](v5, v7);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "fetchedObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCResourcesFetchOperation *v10;
  uint64_t v11;
  uint64_t v12;
  FCResourcesFetchOperation *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0C99D20];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_2;
  v26[3] = &unk_1E463AA30;
  v27 = *(id *)(a1 + 32);
  objc_msgSend(v8, "fc_array:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [FCResourcesFetchOperation alloc];
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    v12 = *(_QWORD *)(v11 + 424);
  else
    v12 = 0;
  v13 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v10, "initWithContext:resourceIDs:downloadAssets:", v12, v9, 1);
  -[FCFetchOperation setShouldFailOnMissingObjects:](v13, "setShouldFailOnMissingObjects:", 1);
  if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
    v14 = 3;
  else
    v14 = 0;
  -[FCFetchOperation setCachePolicy:](v13, "setCachePolicy:", v14);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_3;
  v25[3] = &unk_1E4644210;
  v25[4] = *(_QWORD *)(a1 + 40);
  -[FCResourcesFetchOperation setInterestTokenHandler:](v13, "setInterestTokenHandler:", v25);
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_4;
  v24[3] = &unk_1E4644238;
  v24[4] = *(_QWORD *)(a1 + 40);
  -[FCResourcesFetchOperation setArchiveHandler:](v13, "setArchiveHandler:", v24);
  v17 = v7;
  v18 = 3221225472;
  v19 = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_5;
  v20 = &unk_1E463F580;
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v6;
  v23 = v5;
  v15 = v5;
  v16 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v13, "setFetchCompletionBlock:", &v17);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v13, v17, v18, v19, v20, v21);
  -[FCOperation start](v13, "start");

}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataResourceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "second");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "engineResourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

}

uint64_t __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 448), "addObject:", a2);
  }
  return result;
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_4(uint64_t a1, void *a2)
{
  -[FCOfflinePuzzleFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_5(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v7 = a2;
  if (objc_msgSend(v7, "status"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6;
    v8[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v8[5] = a1[4];
    v8[6] = v3;
    v8[4] = v7;
    v4 = v3;
    v5 = v7;
    __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6((uint64_t)v8);

  }
  else
  {
    v6 = a1[6];
    objc_msgSend(v7, "fetchedObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }

}

void __71__FCOfflinePuzzleFetchOperation__promiseDataResourcesForPuzzleRecords___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v5;
      objc_msgSend(v8, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "missingObjectDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF resources: %{public}@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __49__FCOfflinePuzzleFetchOperation__updateProgress___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v3.n128_u64[0] = *(_QWORD *)(v4 + 456);
  else
    v3.n128_u64[0] = 0;
  v5 = (id)v2;
  (*(void (**)(__n128))(v2 + 16))(v3);

}

void __48__FCOfflinePuzzleFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "archiveHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)archiveHandler
{
  return self->archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (OS_dispatch_queue)archiveQueue
{
  return self->archiveQueue;
}

- (void)setArchiveQueue:(id)a3
{
  objc_storeStrong((id *)&self->archiveQueue, a3);
}

- (BOOL)cachedOnly
{
  return self->cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->cachedOnly = a3;
}

- (id)fetchCompletionHandler
{
  return self->fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return self->fetchCompletionQueue;
}

- (void)setFetchCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->fetchCompletionQueue, a3);
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (OS_dispatch_queue)progressQueue
{
  return self->progressQueue;
}

- (void)setProgressQueue:(id)a3
{
  objc_storeStrong((id *)&self->progressQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleRecordCachePolicy, 0);
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_puzzleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end
