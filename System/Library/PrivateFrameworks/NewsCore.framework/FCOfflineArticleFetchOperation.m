@implementation FCOfflineArticleFetchOperation

- (FCOfflineArticleFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 articleID:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCOfflineArticleFetchOperation *v12;
  FCOfflineArticleFetchOperation *v13;
  uint64_t v14;
  NSString *articleID;
  FCThreadSafeMutableArray *v16;
  FCThreadSafeMutableArray *resultInterestTokens;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCOfflineArticleFetchOperation;
  v12 = -[FCOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    v14 = objc_msgSend(v11, "copy");
    articleID = v13->_articleID;
    v13->_articleID = (NSString *)v14;

    v16 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v13->_resultInterestTokens;
    v13->_resultInterestTokens = v16;

  }
  return v13;
}

- (BOOL)validateOperation
{
  char v3;
  char v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline article fetch operation requires a context"));
      v10 = 136315906;
      v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
      v12 = 2080;
      v13 = "FCOfflineArticleFetchOperation.m";
      v14 = 1024;
      v15 = 80;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
    v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline article fetch operation requires a flint helper"));
        v10 = 136315906;
        v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
        v12 = 2080;
        v13 = "FCOfflineArticleFetchOperation.m";
        v14 = 1024;
        v15 = 84;
        v16 = 2114;
        v17 = v8;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      }
      v4 = 0;
      if (!self)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  if (!self->_ANFHelper)
    goto LABEL_9;
  v4 = 1;
LABEL_12:
  if (self->_articleID)
  {
    v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline article fetch operation requires an article ID"));
    v10 = 136315906;
    v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
    v12 = 2080;
    v13 = "FCOfflineArticleFetchOperation.m";
    v14 = 1024;
    v15 = 88;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  v5 = 0;
  return v5 & v3 & v4;
}

- (void)prepareOperation
{
  FCOfflineArticleFetchOperation *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  if (self)
    self = (FCOfflineArticleFetchOperation *)self->_context;
  -[FCOfflineArticleFetchOperation appConfigurationManager](self, "appConfigurationManager");
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
  const __CFString *v9;
  FCOfflineDownloadsConfiguration *v10;
  FCOfflineDownloadsConfiguration *v11;
  _BOOL4 v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__66;
  v29[4] = __Block_byref_object_dispose__66;
  v30 = 0;
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FCOfflineArticleFetchOperation cachedOnly](self, "cachedOnly"))
      v5 = CFSTR("lookup cached");
    else
      v5 = CFSTR("fetch");
    if (self)
    {
      v6 = self->_articleID;
      config = self->_config;
    }
    else
    {
      v6 = 0;
      config = 0;
    }
    v8 = config;
    if (-[FCOfflineDownloadsConfiguration useSmallestArticleThumbnails](v8, "useSmallestArticleThumbnails"))
      v9 = CFSTR("small");
    else
      v9 = CFSTR("normal");
    if (self)
      v10 = self->_config;
    else
      v10 = 0;
    v11 = v10;
    v12 = -[FCOfflineDownloadsConfiguration useSmallestArticleImages](v11, "useSmallestArticleImages");
    *(_DWORD *)buf = 138544386;
    if (v12)
      v13 = CFSTR("small");
    else
      v13 = CFSTR("normal");
    v32 = v4;
    v33 = 2114;
    v34 = v5;
    v35 = 2114;
    v36 = v6;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v13;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ article id=%{public}@, thumbnail variant=%{public}@, image variant=%{public}@", buf, 0x34u);

  }
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke;
  v28[3] = &unk_1E463D3A8;
  v28[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_2;
  v27[3] = &unk_1E4648F78;
  v27[4] = self;
  v27[5] = v29;
  objc_msgSend(v15, "thenOn:then:", v16, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_3;
  v26[3] = &unk_1E4648FA0;
  v26[4] = self;
  v26[5] = v29;
  objc_msgSend(v17, "thenOn:then:", v18, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_4;
  v25[3] = &unk_1E4644198;
  v25[4] = self;
  objc_msgSend(v19, "thenOn:then:", v20, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_5;
  v24[3] = &unk_1E463EA38;
  v24[4] = self;
  v23 = (id)objc_msgSend(v21, "errorOn:error:", v22, v24);

  _Block_object_dispose(v29, 8);
}

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke;
  v4[3] = &unk_1E463DAD0;
  v4[4] = v1;
  return (id)objc_msgSend(v2, "initWithResolver:", v4);
}

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "contentType") == 2)
    {
      v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_2;
      v14[3] = &unk_1E463F188;
      v14[4] = v5;
      v15 = v7;
      v9 = (void *)objc_msgSend(v8, "initWithResolver:", v14);

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16[0] = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("Offline downloads are only supported for ANF articles.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 42, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithError:", v12);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "parentIssue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_2;
    v11[3] = &unk_1E463F188;
    v12 = v4;
    v13 = v1;
    v6 = v4;
    v7 = (void *)objc_msgSend(v5, "initWithResolver:", v11);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v9 = (void *)objc_opt_new();
    v7 = (void *)objc_msgSend(v8, "initWithValue:", v9);

  }
  return v7;
}

uint64_t __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
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
  -[FCOfflineArticleFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOfflineArticleFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
    {
      -[FCOfflineArticleFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__FCOfflineArticleFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E463AD10;
      v12[4] = self;
      v13 = v4;
      dispatch_async(v7, v12);

    }
  }
  else if (v6)
  {
    -[FCOfflineArticleFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
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

void __63__FCOfflineArticleFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "fetchCompletionHandler");
  v5 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[57];
  v3 = v2;
  objc_msgSend(v3, "readOnlyArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, *(_QWORD *)(a1 + 40));

}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCArticleHeadlinesFetchOperation *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  FCArticleHeadlinesFetchOperation *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *);
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCArticleHeadlinesFetchOperation alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
  {
    v9 = (void *)v8[53];
    v8 = (_QWORD *)v8[55];
  }
  else
  {
    v9 = 0;
  }
  v27[0] = v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v7, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v12, v13, 0);

  -[FCFetchOperation setShouldFailOnMissingObjects:](v14, "setShouldFailOnMissingObjects:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "cachedOnly"))
    v15 = 3;
  else
    v15 = 0;
  -[FCFetchOperation setCachePolicy:](v14, "setCachePolicy:", v15);
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v14, "setCanSendFetchCompletionSynchronously:", objc_msgSend(*(id *)(a1 + 32), "cachedOnly"));
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_2;
  v26[3] = &unk_1E4644210;
  v26[4] = *(_QWORD *)(a1 + 32);
  -[FCArticleHeadlinesFetchOperation setInterestTokenHandler:](v14, "setInterestTokenHandler:", v26);
  v19 = v16;
  v20 = 3221225472;
  v21 = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_3;
  v22 = &unk_1E463F580;
  v23 = *(_QWORD *)(a1 + 32);
  v24 = v6;
  v25 = v5;
  v17 = v5;
  v18 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v14, "setFetchCompletionBlock:", &v19);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v19, v20, v21, v22, v23);
  -[FCOperation start](v14, "start");

}

uint64_t __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 456), "addObject:", a2);
  }
  return result;
}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[7];

  v14 = a2;
  if (objc_msgSend(v14, "status"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4;
    v15[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v15[5] = a1[4];
    v15[6] = v3;
    v15[4] = v14;
    v4 = v3;
    v5 = v14;
    __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4((uint64_t)v15);
  }
  else
  {
    objc_msgSend(v14, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE666C30))
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v5 = v9;

    v10 = (void *)a1[4];
    objc_msgSend(v5, "contentArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOfflineArticleFetchOperation _handleArchive:](v10, v11);

    v12 = a1[6];
    objc_msgSend(v14, "fetchedObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 2)
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void (**)(uint64_t))(v6 + 16);
    v9 = v6;
LABEL_6:
    v11 = (id)v7;
    v8(v9);
    goto LABEL_7;
  }
  if (v2 != 1)
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void (**)(uint64_t))(v10 + 16);
    v9 = v10;
    goto LABEL_6;
  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_operationCancelledErrorWithAdditionalUserInfo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

LABEL_7:
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
        v9[2] = __49__FCOfflineArticleFetchOperation__handleArchive___block_invoke_2;
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

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCOfflineANFArticlesFetchOperation *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  id v14;
  void *v15;
  id *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SEL v21;
  id v22;
  const char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  uint64_t v35;
  _QWORD newValue[5];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCOfflineANFArticlesFetchOperation alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
  {
    v9 = (void *)v8[53];
    v10 = (void *)v8[56];
    v8 = (_QWORD *)v8[54];
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v37[0] = *(_QWORD *)(a1 + 40);
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = v8;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "arrayWithObjects:count:", v37, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:headlines:]((id *)&v7->super.super.super.isa, v14, v13, v12, v15);

  if (v16)
  {
    v16[47] = (id)20;
    *((_BYTE *)v16 + 368) = objc_msgSend(*(id *)(a1 + 32), "cachedOnly");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedOnly");
  }
  v18 = MEMORY[0x1E0C809B0];
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_3;
  newValue[3] = &unk_1E4644210;
  v19 = *(_QWORD *)(a1 + 32);
  newValue[4] = v19;
  if (v16)
  {
    objc_setProperty_nonatomic_copy(v16, v17, newValue, 400);
    v20 = *(_QWORD *)(a1 + 32);
    v31 = v18;
    v32 = 3221225472;
    v33 = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_4;
    v34 = &unk_1E4644238;
    v35 = v20;
    objc_setProperty_nonatomic_copy(v16, v21, &v31, 408);
  }
  else
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_4;
    v34 = &unk_1E4644238;
    v35 = v19;
  }
  v25 = v18;
  v26 = 3221225472;
  v27 = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_5;
  v28 = &unk_1E4643418;
  v29 = v6;
  v30 = v5;
  v22 = v5;
  v24 = v6;
  if (v16)
    objc_setProperty_nonatomic_copy(v16, v23, &v25, 416);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v16, v25, v26, v27, v28);
  objc_msgSend(v16, "start");

}

uint64_t __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 456), "addObject:", a2);
  }
  return result;
}

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
  -[FCOfflineArticleFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCAssetsFetchOperation *v7;
  void *v8;
  FCAssetsFetchOperation *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v5 = a2;
  v6 = a3;
  v7 = [FCAssetsFetchOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "coverImageAssetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCAssetsFetchOperation initWithAssetHandle:](v7, "initWithAssetHandle:", v8);

  -[FCOperation setPurpose:](v9, "setPurpose:", CFSTR("offlineDownload"));
  if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
    v10 = 3;
  else
    v10 = 0;
  -[FCFetchOperation setCachePolicy:](v9, "setCachePolicy:", v10);
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v9, "setCanSendFetchCompletionSynchronously:", objc_msgSend(*(id *)(a1 + 40), "cachedOnly"));
  -[FCFetchOperation setShouldFailOnMissingObjects:](v9, "setShouldFailOnMissingObjects:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_3;
  v21[3] = &unk_1E4644210;
  v21[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setInterestTokenHandler:](v9, "setInterestTokenHandler:", v21);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_4;
  v20[3] = &unk_1E4644238;
  v20[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setArchiveHandler:](v9, "setArchiveHandler:", v20);
  v14 = v11;
  v15 = 3221225472;
  v16 = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_5;
  v17 = &unk_1E4644260;
  v18 = v5;
  v19 = v6;
  v12 = v6;
  v13 = v5;
  -[FCFetchOperation setFetchCompletionBlock:](v9, "setFetchCompletionBlock:", &v14);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v9, v14, v15, v16, v17);
  -[FCOperation start](v9, "start");

}

uint64_t __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      return objc_msgSend(*(id *)(v2 + 456), "addObject:", a2);
  }
  return result;
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
  -[FCOfflineArticleFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "fetchedObject");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

void __49__FCOfflineArticleFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
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
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end
