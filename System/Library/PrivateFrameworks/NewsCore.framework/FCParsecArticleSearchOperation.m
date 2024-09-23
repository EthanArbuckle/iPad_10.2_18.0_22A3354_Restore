@implementation FCParsecArticleSearchOperation

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
  -[FCParsecArticleSearchOperation query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article search operation requires a query"));
    v9 = 136315906;
    v10 = "-[FCParsecArticleSearchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCParsecArticleSearchOperation.m";
    v13 = 1024;
    v14 = 40;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

  }
  -[FCParsecArticleSearchOperation articleSearchCompletionHandler](self, "articleSearchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("article search operation requires a completion"));
    v9 = 136315906;
    v10 = "-[FCParsecArticleSearchOperation validateOperation]";
    v11 = 2080;
    v12 = "FCParsecArticleSearchOperation.m";
    v13 = 1024;
    v14 = 44;
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

- (FCParsecArticleSearchOperation)initWithMoreResults:(id)a3 parsecQueryID:(unint64_t)a4
{
  id v7;
  FCParsecArticleSearchOperation *v8;
  FCParsecArticleSearchOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCParsecArticleSearchOperation;
  v8 = -[FCOperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_moreResults, a3);
    v9->_parsecQueryID = a4;
  }

  return v9;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[FCParsecArticleSearchOperation previousRankingFeedback](self, "previousRankingFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[FCParsecArticleSearchOperation moreResults](self, "moreResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have previous ranking feedback when fetching more results"));
      *(_DWORD *)buf = 136315906;
      v16 = "-[FCParsecArticleSearchOperation performOperation]";
      v17 = 2080;
      v18 = "FCParsecArticleSearchOperation.m";
      v19 = 1024;
      v20 = 64;
      v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  -[FCParsecArticleSearchOperation moreResults](self, "moreResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCParsecArticleSearchOperation moreResults](self, "moreResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__FCParsecArticleSearchOperation_performOperation__block_invoke;
    v14[3] = &unk_1E463B408;
    v14[4] = self;
    objc_msgSend(v6, "loadSearchResultsWithCompletionAndErrorHandler:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D177D8], "fc_sharedParsecSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D177B0];
    -[FCParsecArticleSearchOperation query](self, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchRequestWithString:triggerEvent:queryId:", v8, 1, -[FCParsecArticleSearchOperation parsecQueryID](self, "parsecQueryID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCParsecArticleSearchOperation keyboardInputMode](self, "keyboardInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyboardInputMode:", v10);

    -[FCParsecArticleSearchOperation scale](self, "scale");
    objc_msgSend(v9, "setScale:");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__FCParsecArticleSearchOperation_performOperation__block_invoke_3;
    v13[3] = &unk_1E4642C40;
    v13[4] = self;
    objc_msgSend(v6, "taskWithRequest:completion:", v9, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
}

void __50__FCParsecArticleSearchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = v5;
  }
  else
  {
    if (v18 && objc_msgSend(v18, "count"))
    {
      objc_opt_class();
      objc_msgSend(v18, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "moreResults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 32), "setMoreResults:", v11);

      objc_msgSend(*(id *)(a1 + 32), "setResults:", v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setResults:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(*(id *)(a1 + 32), "setMoreResults:", 0);
    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "previousRankingFeedback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "section");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_rankingFeedbackWithSection:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRankingFeedback:", v17);

    v6 = *(void **)(a1 + 32);
    v7 = 0;
  }
  objc_msgSend(v6, "finishedPerformingOperationWithError:", v7);

}

void __50__FCParsecArticleSearchOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a4;
  v20 = v6;
  if (!v6)
  {
    v7 = a3;
    objc_msgSend(v7, "results");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    if (objc_msgSend(v11, "count"))
    {
      objc_opt_class();
      objc_msgSend(v11, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "moreResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 32), "setMoreResults:", v15);

      objc_msgSend(*(id *)(a1 + 32), "setResults:", v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setResults:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(*(id *)(a1 + 32), "setMoreResults:", 0);
    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_rankingFeedbackWithSection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRankingFeedback:", v19);

    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t)a3;
  -[FCParsecArticleSearchOperation rankingFeedback](self, "rankingFeedback");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4 | v5;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("successful parsec search operation should always have ranking feedback"));
    v15 = 136315906;
    v16 = "-[FCParsecArticleSearchOperation operationWillFinishWithError:]";
    v17 = 2080;
    v18 = "FCParsecArticleSearchOperation.m";
    v19 = 1024;
    v20 = 130;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  -[FCParsecArticleSearchOperation rankingFeedback](self, "rankingFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[FCParsecArticleSearchOperation previousRankingFeedback](self, "previousRankingFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation setRankingFeedback:](self, "setRankingFeedback:", v8);

  }
  -[FCParsecArticleSearchOperation articleSearchCompletionHandler](self, "articleSearchCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FCParsecArticleSearchOperation articleSearchCompletionHandler](self, "articleSearchCompletionHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation results](self, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation moreResults](self, "moreResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCParsecArticleSearchOperation rankingFeedback](self, "rankingFeedback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, unint64_t))v10)[2](v10, v11, v12, v13, v4);

  }
}

- (id)_rankingFeedbackWithSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    -[FCParsecArticleSearchOperation results](self, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResults:", v5);

    -[FCParsecArticleSearchOperation previousRankingFeedback](self, "previousRankingFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_58);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99D20];
    -[FCParsecArticleSearchOperation results](self, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_arrayByAddingObjectsFromArray:toArray:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_17_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6D8]), "initWithResults:section:localSectionPosition:personalizationScore:", v14, v4, 0, 0.0);
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C600]), "initWithSections:blendingDuration:", v16, 0.0);

  return v17;
}

uint64_t __62__FCParsecArticleSearchOperation__rankingFeedbackWithSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "result");
}

id __62__FCParsecArticleSearchOperation__rankingFeedbackWithSection___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D8C648];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v3, 0, 0, 0);

  return v4;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (SFRankingFeedback)previousRankingFeedback
{
  return self->_previousRankingFeedback;
}

- (void)setPreviousRankingFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_previousRankingFeedback, a3);
}

- (id)articleSearchCompletionHandler
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setArticleSearchCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)setRankingFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_rankingFeedback, a3);
}

- (unint64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(unint64_t)a3
{
  self->_parsecQueryID = a3;
}

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (void)setMoreResults:(id)a3
{
  objc_storeStrong((id *)&self->_moreResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_articleSearchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_previousRankingFeedback, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
