@implementation FCOfflineIssueFetchOperation

- (FCOfflineIssueFetchOperation)init
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
    v8 = "-[FCOfflineIssueFetchOperation init]";
    v9 = 2080;
    v10 = "FCOfflineIssueFetchOperation.m";
    v11 = 1024;
    v12 = 77;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCOfflineIssueFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issueID:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCOfflineIssueFetchOperation *v12;
  FCOfflineIssueFetchOperation *v13;
  uint64_t v14;
  NSString *issueID;
  FCThreadSafeMutableArray *v16;
  FCThreadSafeMutableArray *resultInterestTokens;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCOfflineIssueFetchOperation;
  v12 = -[FCOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    v14 = objc_msgSend(v11, "copy");
    issueID = v13->_issueID;
    v13->_issueID = (NSString *)v14;

    v16 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v13->_resultInterestTokens;
    v13->_resultInterestTokens = v16;

  }
  return v13;
}

- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  FCOfflineIssueFetchOperation *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCOfflineIssueFetchOperation initWithContext:ANFHelper:issueID:](self, "initWithContext:ANFHelper:issueID:", v9, v8, v10);

  return v11;
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
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline issue fetch operation requires a context"));
      v5 = 136315906;
      v6 = "-[FCOfflineIssueFetchOperation validateOperation]";
      v7 = 2080;
      v8 = "FCOfflineIssueFetchOperation.m";
      v9 = 1024;
      v10 = 108;
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
  FCOfflineIssueFetchOperation *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  if (self)
    self = (FCOfflineIssueFetchOperation *)self->_context;
  -[FCOfflineIssueFetchOperation appConfigurationManager](self, "appConfigurationManager");
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
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__81;
  v32[4] = __Block_byref_object_dispose__81;
  v33 = 0;
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FCOfflineIssueFetchOperation cachedOnly](self, "cachedOnly"))
      v5 = CFSTR("lookup cached");
    else
      v5 = CFSTR("fetch");
    if (self)
    {
      v6 = self->_issueID;
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
    v35 = v4;
    v36 = 2114;
    v37 = v5;
    v38 = 2114;
    v39 = v6;
    v40 = 2114;
    v41 = v9;
    v42 = 2114;
    v43 = v13;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ issue id=%{public}@, thumbnail variant=%{public}@, image variant=%{public}@", buf, 0x34u);

  }
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke;
  v31[3] = &unk_1E463D3A8;
  v31[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2;
  v30[3] = &unk_1E464ADE0;
  v30[4] = self;
  v30[5] = v32;
  objc_msgSend(v25, "thenOn:then:", v24, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_3;
  v29[3] = &unk_1E464AE08;
  v29[4] = self;
  v29[5] = v32;
  objc_msgSend(v15, "thenOn:then:", v16, v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_4;
  v28[3] = &unk_1E464AE08;
  v28[4] = self;
  v28[5] = v32;
  objc_msgSend(v17, "thenOn:then:", v18, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_20;
  v27[3] = &unk_1E4644198;
  v27[4] = self;
  objc_msgSend(v19, "thenOn:then:", v20, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2_22;
  v26[3] = &unk_1E463EA38;
  v26[4] = self;
  v23 = (id)objc_msgSend(v21, "errorOn:error:", v22, v26);

  _Block_object_dispose(v32, 8);
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke(uint64_t a1)
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
  v4[2] = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke;
  v4[3] = &unk_1E463DAD0;
  v4[4] = v1;
  return (id)objc_msgSend(v2, "initWithResolver:", v4);
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
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
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v4;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke;
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

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke;
    v6[3] = &unk_1E463F188;
    v7 = v2;
    v8 = v1;
    v4 = (void *)objc_msgSend(v3, "initWithResolver:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v29[5];
  id v30;
  __int128 buf;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "type");
  if (v3 == 1)
  {
    v21 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(void **)(a1 + 32);
      v23 = v21;
      objc_msgSend(v22, "shortOperationDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ will download PDF pages", (uint8_t *)&buf, 0xCu);

    }
    v25 = *(void **)(a1 + 32);
    v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v25)
    {
      v1 = 0;
      goto LABEL_15;
    }
    v26 = objc_alloc(MEMORY[0x1E0D60AF0]);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v32 = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke;
    v33 = &unk_1E463F188;
    v34 = v12;
    v35 = v25;
    v27 = objc_msgSend(v26, "initWithResolver:", &buf);
    goto LABEL_13;
  }
  if (!v3)
  {
    v4 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "shortOperationDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will download ANF pages", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "metadataJSONAssetHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = *(void **)(a1 + 32);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      if (!v1)
        return v1;
      objc_msgSend(v10, "allArticleIDs");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[FCOfflineIssueFetchOperation _promiseANFArticlesForArticleIDs:withDownloadProgressMin:downloadProgressMax:](v1, v12, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v11 = v10;
    v12 = v11;
    if (!v1)
    {
LABEL_15:

      return v1;
    }
    objc_msgSend(v11, "metadataJSONAssetHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = (void *)MEMORY[0x1E0D60AF0];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v32 = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_2;
      v33 = &unk_1E463EBC0;
      v34 = v1;
      v17 = v12;
      v35 = v17;
      objc_msgSend(v16, "firstly:", &buf);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      zalgo();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_3;
      v29[3] = &unk_1E464AE58;
      v29[4] = v1;
      v30 = v17;
      objc_msgSend(v18, "thenOn:then:", v19, v29);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v35;
LABEL_14:

      goto LABEL_15;
    }
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v32 = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke;
    v33 = &unk_1E463D3A8;
    v34 = v12;
    __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke((uint64_t)&buf);
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v1 = (void *)v27;
    v20 = v34;
    goto LABEL_14;
  }
  return v1;
}

uint64_t __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_20(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2_22(uint64_t a1, uint64_t a2)
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
    -[FCOfflineIssueFetchOperation _updateProgress:]((double *)self, 1.0);
  -[FCOfflineIssueFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOfflineIssueFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
    {
      -[FCOfflineIssueFetchOperation fetchCompletionQueue](self, "fetchCompletionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__FCOfflineIssueFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E463AD10;
      v12[4] = self;
      v13 = v4;
      dispatch_async(v7, v12);

    }
  }
  else if (v6)
  {
    -[FCOfflineIssueFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
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
    if (a1[58] > a2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fetch progress should never go backward"));
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCOfflineIssueFetchOperation _updateProgress:]";
      v11 = 2080;
      v12 = "FCOfflineIssueFetchOperation.m";
      v13 = 1024;
      v14 = 648;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    a1[58] = a2;
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
      block[2] = __48__FCOfflineIssueFetchOperation__updateProgress___block_invoke_88;
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
      (*(void (**)(double))(v6 + 16))(a1[58]);
    }

  }
}

void __61__FCOfflineIssueFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
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

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  if (-[FCOfflineIssueFetchOperation cachedOnly](self, "cachedOnly"))
    goto LABEL_6;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("FCErrorDomain")))
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 != 21)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  *a4 = (id)objc_opt_new();
  v9 = 1;
LABEL_7:

  return v9;
}

- (void)resetForRetry
{
  void *v3;
  void *v4;

  +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v4 = v3;
    objc_storeStrong((id *)&self->_issueRecordCachePolicy, v3);
    v3 = v4;
  }

}

void __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCIssuesFetchOperation *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  FCIssuesFetchOperation *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, void *, uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCIssuesFetchOperation alloc];
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
  v29[0] = v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "arrayWithObjects:count:", v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCIssuesFetchOperation initWithContext:issueIDs:](v7, "initWithContext:issueIDs:", v12, v13);

  if ((objc_msgSend(*(id *)(a1 + 32), "cachedOnly") & 1) != 0)
  {
    +[FCCachePolicy cachedOnlyCachePolicy](FCCachePolicy, "cachedOnlyCachePolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCIssuesFetchOperation setCachePolicy:](v14, "setCachePolicy:", v15);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v17 = *(_QWORD *)(v16 + 472);
    else
      v17 = 0;
    -[FCIssuesFetchOperation setCachePolicy:](v14, "setCachePolicy:", v17);
  }
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_2;
  v28[3] = &unk_1E4644210;
  v28[4] = *(_QWORD *)(a1 + 32);
  -[FCIssuesFetchOperation setInterestTokenHandler:](v14, "setInterestTokenHandler:", v28);
  v21 = v18;
  v22 = 3221225472;
  v23 = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_3;
  v24 = &unk_1E464AE30;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v6;
  v27 = v5;
  v19 = v5;
  v20 = v6;
  -[FCIssuesFetchOperation setFetchCompletionHandler:](v14, "setFetchCompletionHandler:", &v21);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v21, v22, v23, v24, v25);
  -[FCOperation start](v14, "start");

}

uint64_t __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_2(uint64_t result, uint64_t a2)
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

void __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_3(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v6 = (void *)a1[4];
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentArchive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOfflineIssueFetchOperation _handleArchive:](v6, v8);

    v9 = a1[6];
    objc_msgSend(v11, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
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
        v9[2] = __47__FCOfflineIssueFetchOperation__handleArchive___block_invoke_2;
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

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  FCAssetsFetchOperation *v8;
  void *v9;
  FCAssetsFetchOperation *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [FCAssetsFetchOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCAssetsFetchOperation initWithAssetHandle:](v8, "initWithAssetHandle:", v9);

    -[FCOperation setPurpose:](v10, "setPurpose:", CFSTR("offlineDownload"));
    if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
      v11 = 3;
    else
      v11 = 0;
    -[FCFetchOperation setCachePolicy:](v10, "setCachePolicy:", v11);
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v10, "setCanSendFetchCompletionSynchronously:", objc_msgSend(*(id *)(a1 + 40), "cachedOnly"));
    -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v10, "setMaxConcurrentFetchCount:", 20);
    -[FCFetchOperation setShouldFailOnMissingObjects:](v10, "setShouldFailOnMissingObjects:", 1);
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_38;
    v20[3] = &unk_1E4644210;
    v20[4] = *(_QWORD *)(a1 + 40);
    -[FCAssetsFetchOperation setInterestTokenHandler:](v10, "setInterestTokenHandler:", v20);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2_39;
    v19[3] = &unk_1E4644238;
    v19[4] = *(_QWORD *)(a1 + 40);
    -[FCAssetsFetchOperation setArchiveHandler:](v10, "setArchiveHandler:", v19);
    v13 = v12;
    v14 = 3221225472;
    v15 = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_3;
    v16 = &unk_1E4644260;
    v17 = v5;
    v18 = v6;
    -[FCFetchOperation setFetchCompletionBlock:](v10, "setFetchCompletionBlock:", &v13);
    objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v10, v13, v14, v15, v16);
    -[FCOperation start](v10, "start");

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2;
    v21[3] = &unk_1E463B790;
    v22 = *(id *)(a1 + 32);
    v23 = v6;
    v10 = (FCAssetsFetchOperation *)v22;
    __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2((uint64_t)v21);
  }

}

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("An issue is missing its metadata JSON asset handle, issueID=%@"), v5);
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCOfflineIssueFetchOperation _promiseMetadataForIssue:]_block_invoke_2";
    v9 = 2080;
    v10 = "FCOfflineIssueFetchOperation.m";
    v11 = 1024;
    v12 = 239;
    v13 = 2114;
    v14 = v6;
    _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingIssueMetadata) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_missingAssetErrorWithAssetHandles:", MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

uint64_t __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_38(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2_39(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_3(uint64_t a1, void *a2)
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

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
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
  FCOfflineThumbnailAssetHandlesForIssue(*(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCAssetsFetchOperation initWithAssetHandles:](v7, "initWithAssetHandles:", v8);

  -[FCOperation setPurpose:](v9, "setPurpose:", CFSTR("offlineDownload"));
  if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
    v10 = 3;
  else
    v10 = 0;
  -[FCFetchOperation setCachePolicy:](v9, "setCachePolicy:", v10);
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v9, "setCanSendFetchCompletionSynchronously:", objc_msgSend(*(id *)(a1 + 40), "cachedOnly"));
  -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v9, "setMaxConcurrentFetchCount:", 20);
  -[FCFetchOperation setShouldFailOnMissingObjects:](v9, "setShouldFailOnMissingObjects:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_2;
  v21[3] = &unk_1E4644210;
  v21[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setInterestTokenHandler:](v9, "setInterestTokenHandler:", v21);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_3;
  v20[3] = &unk_1E4644238;
  v20[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setArchiveHandler:](v9, "setArchiveHandler:", v20);
  v14 = v11;
  v15 = 3221225472;
  v16 = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_4;
  v17 = &unk_1E4644260;
  v18 = v5;
  v19 = v6;
  v12 = v6;
  v13 = v5;
  -[FCFetchOperation setFetchCompletionBlock:](v9, "setFetchCompletionBlock:", &v14);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v9, v14, v15, v16, v17);
  -[FCOperation start](v9, "start");

}

uint64_t __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_2(uint64_t result, uint64_t a2)
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

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_3(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_4(uint64_t a1, void *a2)
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

- (id)_promiseANFArticlesForArticleIDs:(void *)a1 withDownloadProgressMin:(void *)a2 downloadProgressMax:(double)a3
{
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  double v11;

  v5 = a2;
  if (a1)
  {
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke;
    v8[3] = &unk_1E464AEA8;
    v8[4] = a1;
    v9 = v5;
    v10 = 0;
    v11 = a3;
    a1 = (void *)objc_msgSend(v6, "initWithResolver:", v8);

  }
  return a1;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v3 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_missingAssetErrorWithAssetHandles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithError:", v6);

  return v7;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metadataJSONAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOfflineIssueFetchOperation _itemIdentifiersForKey:fromMetadataJSONData:](v2, CFSTR("articleIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOfflineIssueFetchOperation _promiseANFArticlesForArticleIDs:withDownloadProgressMin:downloadProgressMax:](*(void **)(a1 + 32), v6, 0.9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_itemIdentifiersForKey:(void *)a3 fromMetadataJSONData:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1A8580B64]();
      objc_opt_class();
      v43 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v43);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v43;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v10;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v14 = v12;

      if (v14)
      {
        v36 = v11;
        v15 = v14;
        objc_opt_class();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("items"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
        }
        else
        {
          v17 = 0;
        }
        v19 = v17;

        if (v19)
        {
          v33 = v15;
          v34 = v9;
          v35 = v7;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v32 = v19;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v38 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_opt_class();
                if (v25)
                {
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v26 = v25;
                  else
                    v26 = 0;
                }
                else
                {
                  v26 = 0;
                }
                v27 = v26;
                objc_opt_class();
                objc_msgSend(v27, "objectForKeyedSubscript:", v5);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v29 = v28;
                  else
                    v29 = 0;
                }
                else
                {
                  v29 = 0;
                }
                v30 = v29;

                objc_msgSend(v8, "fc_safelyAddObject:", v30);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
            }
            while (v22);
          }

          v9 = v34;
          v7 = v35;
          v19 = v32;
          v15 = v33;
        }

        objc_autoreleasePoolPop(v9);
        v13 = v8;
      }
      else
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2;
        v41[3] = &unk_1E4648980;
        v41[4] = a1;
        v42 = v11;
        v18 = v11;
        __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2((uint64_t)v41);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v9);
      }

    }
    else
    {
      v13 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke;
    v6[3] = &unk_1E464AEA8;
    v7 = v2;
    v8 = v1;
    v9 = xmmword_1A1E836A0;
    v4 = (void *)objc_msgSend(v3, "initWithResolver:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCOfflineANFArticlesFetchOperation *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SEL v20;
  id v21;
  const char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  uint64_t v33;
  _QWORD newValue[5];

  v5 = a2;
  v6 = a3;
  v7 = [FCOfflineANFArticlesFetchOperation alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
  {
    v9 = (void *)v8[53];
    v10 = (void *)v8[56];
    v11 = (void *)v8[54];
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v11 = 0;
  }
  v12 = *(void **)(a1 + 40);
  v13 = v10;
  v14 = v9;
  v15 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:articleIDs:]((id *)&v7->super.super.super.isa, v14, v13, v11, v12);

  if (v15)
  {
    v15[48] = (id)2;
    v15[47] = (id)20;
    *((_BYTE *)v15 + 368) = objc_msgSend(*(id *)(a1 + 32), "cachedOnly");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedOnly");
  }
  v17 = MEMORY[0x1E0C809B0];
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_2;
  newValue[3] = &unk_1E4644210;
  v18 = *(_QWORD *)(a1 + 32);
  newValue[4] = v18;
  if (v15)
  {
    objc_setProperty_nonatomic_copy(v15, v16, newValue, 400);
    v19 = *(_QWORD *)(a1 + 32);
    v29 = v17;
    v30 = 3221225472;
    v31 = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_3;
    v32 = &unk_1E4644238;
    v33 = v19;
    objc_setProperty_nonatomic_copy(v15, v20, &v29, 408);
    v18 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_3;
    v32 = &unk_1E4644238;
    v33 = v18;
  }
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_4;
  v27[3] = &unk_1E464AE80;
  v28 = *(_OWORD *)(a1 + 48);
  v27[4] = v18;
  if (v15)
    objc_setProperty_nonatomic_copy(v15, v16, v27, 392);
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_5;
  v24[3] = &unk_1E4643418;
  v25 = v6;
  v26 = v5;
  v21 = v5;
  v23 = v6;
  if (v15)
    objc_setProperty_nonatomic_copy(v15, v22, v24, 416);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v15);
  objc_msgSend(v15, "start");

}

uint64_t __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_2(uint64_t result, uint64_t a2)
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

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_3(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_4(uint64_t a1, double a2)
{
  -[FCOfflineIssueFetchOperation _updateProgress:](*(double **)(a1 + 32), *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2);
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_5(uint64_t a1, uint64_t a2)
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

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  FCResourcesFetchOperation *v14;
  uint64_t v15;
  uint64_t v16;
  FCResourcesFetchOperation *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[6];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOfflineIssueFetchOperation _itemIdentifiersForKey:fromMetadataJSONData:](v9, CFSTR("asset"), v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = [FCResourcesFetchOperation alloc];
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      v16 = *(_QWORD *)(v15 + 424);
    else
      v16 = 0;
    v17 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v14, "initWithContext:resourceIDs:downloadAssets:", v16, v13, 1);
    -[FCOperation setPurpose:](v17, "setPurpose:", CFSTR("offlineDownload"));
    -[FCResourcesFetchOperation setMaxConcurrentFetchCount:](v17, "setMaxConcurrentFetchCount:", 20);
    -[FCFetchOperation setShouldFailOnMissingObjects:](v17, "setShouldFailOnMissingObjects:", 1);
    if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
      v18 = 3;
    else
      v18 = 0;
    -[FCFetchOperation setCachePolicy:](v17, "setCachePolicy:", v18);
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v17, "setCanSendFetchCompletionSynchronously:", objc_msgSend(*(id *)(a1 + 40), "cachedOnly"));
    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_3;
    v32[3] = &unk_1E4644210;
    v32[4] = *(_QWORD *)(a1 + 40);
    -[FCResourcesFetchOperation setInterestTokenHandler:](v17, "setInterestTokenHandler:", v32);
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_4;
    v31[3] = &unk_1E4644238;
    v31[4] = *(_QWORD *)(a1 + 40);
    -[FCResourcesFetchOperation setArchiveHandler:](v17, "setArchiveHandler:", v31);
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_5;
    v29[3] = &unk_1E464AE80;
    v30 = *(_OWORD *)(a1 + 48);
    v29[4] = *(_QWORD *)(a1 + 40);
    -[FCResourcesFetchOperation setProgressHandler:](v17, "setProgressHandler:", v29);
    v22 = v19;
    v23 = 3221225472;
    v24 = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_6;
    v25 = &unk_1E464AED0;
    v27 = v5;
    v20 = v6;
    v21 = *(_QWORD *)(a1 + 40);
    v28 = v20;
    v26 = v21;
    -[FCFetchOperation setFetchCompletionBlock:](v17, "setFetchCompletionBlock:", &v22);
    objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v17, v22, v23, v24, v25);
    -[FCOperation start](v17, "start");

  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2;
    v33[3] = &unk_1E463B2D0;
    v33[4] = *(_QWORD *)(a1 + 32);
    v33[5] = v6;
    v13 = v6;
    __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2((uint64_t)v33);
  }

}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_missingAssetErrorWithAssetHandles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

uint64_t __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_3(uint64_t result, uint64_t a2)
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

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_4(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_5(uint64_t a1, double a2)
{
  -[FCOfflineIssueFetchOperation _updateProgress:](*(double **)(a1 + 32), *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2);
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "status");
  if (v3 == 1)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "errorUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_operationCancelledErrorWithAdditionalUserInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v9, "error");
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "fetchedObject");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }

}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  FCResourceArchiveFetchOperation *v71;
  uint64_t v72;
  uint64_t v73;
  FCResourceArchiveFetchOperation *v74;
  uint64_t v75;
  id *v76;
  id *v77;
  FCResourcesFetchOperation *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id obj;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  _QWORD v102[5];
  id v103;
  id v104;
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[4];
  id v109;
  id v110;
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[7];
  _QWORD v116[5];
  _QWORD v117[6];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[5];
  id v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2;
    v117[3] = &unk_1E463B2D0;
    v17 = *(_QWORD *)(a1 + 32);
    v117[5] = v6;
    v117[4] = v17;
    v10 = v6;
    __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2((uint64_t)v117);
    goto LABEL_109;
  }
  v10 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataProvider");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "data");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v93 = v6;
  if (v10)
  {
    if (v12)
    {
      v91 = v11;
      v13 = v12;
      objc_opt_class();
      v126 = 0;
      v90 = v13;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v126);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v126;
      if (v14)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v14;
        else
          v16 = 0;
      }
      else
      {
        v16 = 0;
      }
      v18 = v16;

      v89 = v18;
      if (!v18)
      {
        v131[0] = v9;
        v131[1] = 3221225472;
        v131[2] = __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2;
        v131[3] = &unk_1E4648980;
        v131[4] = v10;
        v132 = v15;
        __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2((uint64_t)v131);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v11 = v91;
LABEL_91:

        v12 = v90;
        goto LABEL_92;
      }
      v19 = v18;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v88 = v19;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pages"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v22 = v21;

      v23 = v22;
      v10 = v101;
      v11 = v91;
      v100 = v15;
      v86 = v23;
      v87 = v5;
      if (v23)
      {
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        obj = v23;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
        if (!v24)
        {
LABEL_90:

          v5 = v87;
          goto LABEL_91;
        }
        v25 = v24;
        v26 = a1;
        v27 = *(_QWORD *)v128;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v128 != v27)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
            objc_opt_class();
            if (v29)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v30 = v29;
              else
                v30 = 0;
            }
            else
            {
              v30 = 0;
            }
            v31 = v30;
            objc_opt_class();
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("pageAsset"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v33 = v32;
              else
                v33 = 0;
            }
            else
            {
              v33 = 0;
            }
            v34 = v33;

            objc_msgSend(v101, "fc_safelyAddObject:", v34);
            objc_opt_class();
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("thumbnailAssetLQ"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v36 = v35;
              else
                v36 = 0;
            }
            else
            {
              v36 = 0;
            }
            v37 = v36;

            objc_msgSend(v101, "fc_safelyAddObject:", v37);
            v15 = v100;
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
        }
        while (v25);
        a1 = v26;
      }
      else
      {
        objc_opt_class();
        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("content"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
        }
        else
        {
          v39 = 0;
        }
        v85 = a1;
        v40 = v39;

        objc_opt_class();
        obj = v40;
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("pageLayouts"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v42 = v41;
          else
            v42 = 0;
        }
        else
        {
          v42 = 0;
        }
        v43 = v42;

        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v84 = v43;
        objc_msgSend(v43, "allValues");
        v94 = (id)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
        if (v97)
        {
          v96 = *(_QWORD *)v123;
          do
          {
            v44 = 0;
            do
            {
              if (*(_QWORD *)v123 != v96)
                objc_enumerationMutation(v94);
              v45 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v44);
              objc_opt_class();
              if (v45)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v46 = v45;
                else
                  v46 = 0;
              }
              else
              {
                v46 = 0;
              }
              v99 = v44;
              v47 = v46;
              objc_opt_class();
              v98 = v47;
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pdfOverlays"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v49 = v48;
                else
                  v49 = 0;
              }
              else
              {
                v49 = 0;
              }
              v50 = v49;

              v120 = 0u;
              v121 = 0u;
              v118 = 0u;
              v119 = 0u;
              v51 = v50;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v118, &v127, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v119;
                do
                {
                  for (j = 0; j != v53; ++j)
                  {
                    if (*(_QWORD *)v119 != v54)
                      objc_enumerationMutation(v51);
                    v56 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
                    objc_opt_class();
                    if (v56)
                    {
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v57 = v56;
                      else
                        v57 = 0;
                    }
                    else
                    {
                      v57 = 0;
                    }
                    v58 = v57;
                    objc_opt_class();
                    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("url"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v59)
                    {
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v60 = v59;
                      else
                        v60 = 0;
                    }
                    else
                    {
                      v60 = 0;
                    }
                    v61 = v60;

                    if (v61)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v61);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "host");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v101, "fc_safelyAddObject:", v63);
                    }

                  }
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v118, &v127, 16);
                }
                while (v53);
              }

              v15 = v100;
              v44 = v99 + 1;
            }
            while (v99 + 1 != v97);
            v97 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
          }
          while (v97);
        }

        a1 = v85;
      }
      v10 = v101;
      v9 = MEMORY[0x1E0C809B0];
      v11 = v91;
      goto LABEL_90;
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_92:
  v64 = v12;

  v116[0] = v9;
  v116[1] = 3221225472;
  v116[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3;
  v116[3] = &unk_1E4644CF8;
  v116[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v116);
  v65 = v9;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "fc_allObjectsPassTest:", &__block_literal_global_53_1))
  {
    v115[0] = v65;
    v115[1] = 3221225472;
    v115[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5;
    v115[3] = &unk_1E463CCB8;
    v115[4] = *(_QWORD *)(a1 + 40);
    v115[5] = v66;
    v115[6] = v5;
    __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5((uint64_t)v115);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "cachedOnly"))
  {
    v114[0] = v65;
    v114[1] = 3221225472;
    v114[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_56;
    v114[3] = &unk_1E463B598;
    v114[4] = v93;
    __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_56((uint64_t)v114);
  }
  else
  {
    v67 = v10;
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_104;
    objc_msgSend(*(id *)(a1 + 32), "issueRecord");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "pdfResourceArchiveURL");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
    }

    if (v70)
    {
      v71 = [FCResourceArchiveFetchOperation alloc];
      v72 = *(_QWORD *)(a1 + 40);
      if (v72)
        v73 = *(_QWORD *)(v72 + 424);
      else
        v73 = 0;
      v74 = -[FCResourceArchiveFetchOperation initWithArchiveURL:context:](v71, "initWithArchiveURL:context:", v70, v73);
      -[FCResourceArchiveFetchOperation setMaxConcurrentFetchCount:](v74, "setMaxConcurrentFetchCount:", 20);
      v113[0] = v65;
      v113[1] = 3221225472;
      v113[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3_58;
      v113[3] = &unk_1E4644210;
      v75 = a1;
      v113[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setInterestTokenHandler:](v74, "setInterestTokenHandler:", v113);
      v112[0] = v65;
      v112[1] = 3221225472;
      v112[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4_59;
      v112[3] = &unk_1E4644238;
      v112[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setArchiveHandler:](v74, "setArchiveHandler:", v112);
      v111[0] = v65;
      v111[1] = 3221225472;
      v111[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5_60;
      v111[3] = &unk_1E463F650;
      v111[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setProgressHandler:](v74, "setProgressHandler:", v111);
      v108[0] = v65;
      v108[1] = 3221225472;
      v108[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_6;
      v108[3] = &unk_1E46404F0;
      v76 = &v109;
      v109 = v93;
      v77 = &v110;
      v110 = v5;
      -[FCResourceArchiveFetchOperation setFetchCompletionHandler:](v74, "setFetchCompletionHandler:", v108);
      objc_msgSend(*(id *)(v75 + 40), "associateChildOperation:", v74);
      -[FCOperation start](v74, "start");
    }
    else
    {
LABEL_104:
      v78 = [FCResourcesFetchOperation alloc];
      v79 = a1;
      v80 = *(_QWORD *)(a1 + 40);
      if (v80)
        v81 = *(_QWORD *)(v80 + 424);
      else
        v81 = 0;
      v74 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v78, "initWithContext:resourceIDs:downloadAssets:", v81, v67, 1);
      -[FCOperation setPurpose:](v74, "setPurpose:", CFSTR("offlineDownload"));
      -[FCResourceArchiveFetchOperation setMaxConcurrentFetchCount:](v74, "setMaxConcurrentFetchCount:", 20);
      -[FCResourceArchiveFetchOperation setShouldFailOnMissingObjects:](v74, "setShouldFailOnMissingObjects:", 1);
      v107[0] = v65;
      v107[1] = 3221225472;
      v107[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_8;
      v107[3] = &unk_1E4644210;
      v107[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setInterestTokenHandler:](v74, "setInterestTokenHandler:", v107);
      v106[0] = v65;
      v106[1] = 3221225472;
      v106[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_9;
      v106[3] = &unk_1E4644238;
      v106[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setArchiveHandler:](v74, "setArchiveHandler:", v106);
      v105[0] = v65;
      v105[1] = 3221225472;
      v105[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_10;
      v105[3] = &unk_1E463F650;
      v105[4] = *(_QWORD *)(a1 + 40);
      -[FCResourceArchiveFetchOperation setProgressHandler:](v74, "setProgressHandler:", v105);
      v102[0] = v65;
      v102[1] = 3221225472;
      v102[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_11;
      v102[3] = &unk_1E464AED0;
      v76 = &v103;
      v103 = v5;
      v77 = &v104;
      v82 = v93;
      v83 = *(_QWORD *)(v79 + 40);
      v104 = v82;
      v102[4] = v83;
      -[FCResourceArchiveFetchOperation setFetchCompletionBlock:](v74, "setFetchCompletionBlock:", v102);
      objc_msgSend(*(id *)(v79 + 40), "associateChildOperation:", v74);
      -[FCOperation start](v74, "start");
      v70 = 0;
    }

    v10 = v67;
  }

  v6 = v93;
LABEL_109:

}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "metadataJSONAssetHandle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_missingAssetErrorWithAssetHandles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

FCResource *__57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  FCResource *v4;
  uint64_t v5;
  uint64_t v6;
  FCResource *v7;

  v3 = a2;
  v4 = [FCResource alloc];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(_QWORD *)(v5 + 424);
  else
    v6 = 0;
  v7 = -[FCResource initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:](v4, "initWithPermanentURLForResourceID:cacheLifetimeHint:contentContext:", v3, 0, v6);

  return v7;
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOnDisk");
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ already has all PDF pages in the cache", buf, 0xCu);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_54;
  v10[3] = &unk_1E4646EC8;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentArchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOfflineIssueFetchOperation _handleArchive:](v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "assetHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v3;
  if (v3)
    v4 = *(void **)(v3 + 88);
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v2)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(*(id *)(v2 + 456), "addObject:", v5);

}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_56(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3_58(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4_59(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5_60(uint64_t a1, double a2)
{
  -[FCOfflineIssueFetchOperation _updateProgress:](*(double **)(a1 + 32), a2);
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_8(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_9(uint64_t a1, void *a2)
{
  -[FCOfflineIssueFetchOperation _handleArchive:](*(void **)(a1 + 32), a2);
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_10(uint64_t a1, double a2)
{
  -[FCOfflineIssueFetchOperation _updateProgress:](*(double **)(a1 + 32), a2);
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "status");
  if (v3 == 1)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "errorUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_operationCancelledErrorWithAdditionalUserInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
  else
  {
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v9, "error");
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "fetchedObject");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }

}

uint64_t __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error occurred trying to parse issue metadata JSON: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return MEMORY[0x1E0C9AA60];
}

uint64_t __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error occurred trying to parse issue metadata JSON: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return MEMORY[0x1E0C9AA60];
}

void __48__FCOfflineIssueFetchOperation__updateProgress___block_invoke_88(uint64_t a1)
{
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v3.n128_u64[0] = *(_QWORD *)(v4 + 464);
  else
    v3.n128_u64[0] = 0;
  v5 = (id)v2;
  (*(void (**)(__n128))(v2 + 16))(v3);

}

void __47__FCOfflineIssueFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
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
  objc_storeStrong((id *)&self->_issueRecordCachePolicy, 0);
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_issueID, 0);
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
