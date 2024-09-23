@implementation FCArticleSearchOperation

- (FCArticleSearchOperation)initWithParsecQueryID:(unint64_t)a3
{
  FCArticleSearchOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCArticleSearchOperation;
  result = -[FCOperation init](&v5, sel_init);
  if (result)
    result->_parsecQueryID = a3;
  return result;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FCArticleSearchOperation query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article search operation requires a query"));
    v9 = 136315906;
    v10 = "-[FCArticleSearchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCArticleSearchOperation.m";
    v13 = 1024;
    v14 = 80;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCArticleSearchOperation articleSearchCompletion](self, "articleSearchCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article search operation requires a completion"));
    v9 = 136315906;
    v10 = "-[FCArticleSearchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCArticleSearchOperation.m";
    v13 = 1024;
    v14 = 84;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)performOperation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__FCArticleSearchOperation_performOperation__block_invoke;
  v2[3] = &unk_1E46477C8;
  v2[4] = self;
  -[FCArticleSearchOperation _performSearchQuery:](self, "_performSearchQuery:", v2);
}

void __44__FCArticleSearchOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v9 = a4;
  v8 = a3;
  objc_msgSend(v7, "setResults:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setFeedbackResult:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setSearchError:", v9);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);

}

- (void)_performSearchQuery:(id)a3
{
  id v4;
  FCArticleSearchStream *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  FCArticleSearchStream *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  FCArticleSearchStream *v19;
  id v20;

  v4 = a3;
  v5 = -[FCArticleSearchStream initWithParsecQueryID:]([FCArticleSearchStream alloc], "initWithParsecQueryID:", -[FCArticleSearchOperation parsecQueryID](self, "parsecQueryID"));
  -[FCArticleSearchOperation cloudContext](self, "cloudContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchStream setCloudContext:](v5, "setCloudContext:", v6);

  -[FCArticleSearchOperation query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchStream setQuery:](v5, "setQuery:", v7);

  -[FCArticleSearchOperation keyboardInputMode](self, "keyboardInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchStream setKeyboardInputMode:](v5, "setKeyboardInputMode:", v8);

  -[FCArticleSearchOperation scale](self, "scale");
  -[FCArticleSearchStream setScale:](v5, "setScale:");
  v9 = -[FCArticleSearchOperation resultsLimit](self, "resultsLimit");
  v10 = -[FCArticleSearchOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService(-[FCArticleSearchOperation qualityOfService](self, "qualityOfService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __48__FCArticleSearchOperation__performSearchQuery___block_invoke;
  v18 = &unk_1E46477F0;
  v19 = v5;
  v20 = v4;
  v12 = v5;
  v13 = v4;
  -[FCArticleSearchStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:](v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", v9, v10, v11, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v14, v15, v16, v17, v18);
}

void __48__FCArticleSearchOperation__performSearchQuery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  FCArticleStreamingResults *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "fc_isCancellationError"))
      v10 = 0;
    else
      v10 = v9;
    (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, v10);
  }
  else
  {
    v11 = -[FCStreamingResults initWithResults:followedByStream:]([FCArticleStreamingResults alloc], "initWithResults:followedByStream:", v12, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FCArticleSearchOperation articleSearchCompletion](self, "articleSearchCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCArticleSearchOperation articleSearchCompletion](self, "articleSearchCompletion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCArticleSearchOperation results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCArticleSearchOperation feedbackResult](self, "feedbackResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v5)[2](v5, v6, v7, v8);

  }
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
  self->_keyboardInputMode = (NSString *)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (id)articleSearchCompletion
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setArticleSearchCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (unint64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(unint64_t)a3
{
  self->_parsecQueryID = a3;
}

- (FCArticleStreamingResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSError)searchError
{
  return self->_searchError;
}

- (void)setSearchError:(id)a3
{
  objc_storeStrong((id *)&self->_searchError, a3);
}

- (FCArticleSearchOperationFeedbackResult)feedbackResult
{
  return self->_feedbackResult;
}

- (void)setFeedbackResult:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackResult, 0);
  objc_storeStrong((id *)&self->_searchError, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_articleSearchCompletion, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
