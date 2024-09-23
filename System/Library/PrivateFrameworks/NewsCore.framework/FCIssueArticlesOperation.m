@implementation FCIssueArticlesOperation

- (FCIssueArticlesOperation)init
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
    v8 = "-[FCIssueArticlesOperation init]";
    v9 = 2080;
    v10 = "FCIssueArticlesOperation.m";
    v11 = 1024;
    v12 = 34;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssueArticlesOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCIssueArticlesOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7;
  id v8;
  FCIssueArticlesOperation *v9;
  FCIssueArticlesOperation *v10;
  uint64_t v11;
  NSArray *issueIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssueArticlesOperation;
  v9 = -[FCOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    issueIDs = v10->_issueIDs;
    v10->_issueIDs = (NSArray *)v11;

  }
  return v10;
}

- (FCIssueArticlesOperation)initWithContext:(id)a3 issues:(id)a4
{
  id v6;
  void *v7;
  FCIssueArticlesOperation *v8;

  v6 = a3;
  objc_msgSend(a4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCIssueArticlesOperation initWithContext:issueIDs:](self, "initWithContext:issueIDs:", v6, v7);

  return v8;
}

uint64_t __51__FCIssueArticlesOperation_initWithContext_issues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)validateOperation
{
  char v3;
  char v4;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("channel issues fetch operation requires a context"));
      v8 = 136315906;
      v9 = "-[FCIssueArticlesOperation validateOperation]";
      v10 = 2080;
      v11 = "FCIssueArticlesOperation.m";
      v12 = 1024;
      v13 = 63;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_issueIDs)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues headlines fetch operation requires issue IDs"));
    v8 = 136315906;
    v9 = "-[FCIssueArticlesOperation validateOperation]";
    v10 = 2080;
    v11 = "FCIssueArticlesOperation.m";
    v12 = 1024;
    v13 = 67;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[6];

  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke;
  v17[3] = &unk_1E463D3A8;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_2;
  v16[3] = &unk_1E463E9E8;
  v16[4] = self;
  objc_msgSend(v4, "thenOn:then:", v5, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_3;
  v15[3] = &unk_1E463EA10;
  v15[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_4;
  v14[3] = &unk_1E463EA10;
  v14[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __44__FCIssueArticlesOperation_performOperation__block_invoke_5;
  v13[3] = &unk_1E463EA38;
  v13[4] = self;
  v12 = (id)objc_msgSend(v10, "errorOn:error:", v11, v13);

}

id __44__FCIssueArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 392), "configurationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    FCCoreConfigurationPromise(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __44__FCIssueArticlesOperation_performOperation__block_invoke_2(uint64_t a1)
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
  v4[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke;
  v4[3] = &unk_1E463DAD0;
  v4[4] = v1;
  return (id)objc_msgSend(v2, "initWithResolver:", v4);
}

id __44__FCIssueArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__FCIssueArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke;
  v6[3] = &unk_1E463EA88;
  v6[4] = v2;
  objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", v3);

  return v4;
}

uint64_t __44__FCIssueArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 408), a2);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __44__FCIssueArticlesOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *resultFeedItems;
  id v8;

  v8 = a3;
  -[FCIssueArticlesOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCIssueArticlesOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self)
      resultFeedItems = self->_resultFeedItems;
    else
      resultFeedItems = 0;
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, resultFeedItems, v8);

  }
}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKBatchedMultiFetchQueryOperation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  id v21;
  _QWORD newValue[4];
  id v23;
  id v24;
  _QWORD v25[5];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 392);
  else
    v9 = 0;
  objc_msgSend(v9, "internalContentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v11);

  objc_msgSend(*(id *)(a1 + 32), "edgeCacheHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v12, v13, 416);

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 400);
  else
    v15 = 0;
  -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v15);
  v16 = objc_msgSend(*(id *)(a1 + 32), "maxIssuesPerFetch");
  if (v7)
    v7->_maxBatchSize = v16;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2;
  v25[3] = &unk_1E463AA30;
  v25[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v18);

  newValue[0] = v17;
  newValue[1] = 3221225472;
  newValue[2] = __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3;
  newValue[3] = &unk_1E463EA60;
  v23 = v6;
  v24 = v5;
  v19 = v5;
  v21 = v6;
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v20, newValue, 448);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7);
  -[FCOperation start](v7, "start");

}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  SEL v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  SEL v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, CFSTR("Issue"), 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E0C9AA60], 24);
  }
  v22[0] = CFSTR("contentArticleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);

  objc_msgSend(v3, "addObject:", v6);
  v10 = (void *)objc_opt_new();
  v12 = v10;
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v11, CFSTR("Article"), 16);
  v13 = (void *)MEMORY[0x1E0D626D0];
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 392);
  else
    v15 = 0;
  objc_msgSend(v15, "internalContentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "articleRecordSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keysForArticleRecordWithRecordSource:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  if (v12)
  {
    objc_setProperty_nonatomic_copy(v12, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v12, v21, MEMORY[0x1E0C9AA60], 32);
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", v12);

}

void __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_24_0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __68__FCIssueArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Article"));

  return v3;
}

id __64__FCIssueArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0D626D0];
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[49];
  v6 = v5;
  v7 = a2;
  objc_msgSend(v6, "contentStoreFrontID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 392);
  else
    v10 = 0;
  objc_msgSend(v10, "internalContentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "articleRecordSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedItemFromCKRecord:storefrontID:recordSource:", v7, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void)setEdgeCacheHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (unint64_t)maxIssuesPerFetch
{
  return self->_maxIssuesPerFetch;
}

- (void)setMaxIssuesPerFetch:(unint64_t)a3
{
  self->_maxIssuesPerFetch = a3;
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
}

@end
