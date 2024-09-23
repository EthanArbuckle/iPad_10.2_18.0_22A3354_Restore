@implementation FCSearchOperation

- (FCSearchOperation)initWithSearchText:(id)a3 cloudContext:(id)a4 parsecQueryID:(unint64_t)a5
{
  id v9;
  id v10;
  FCSearchOperation *v11;
  FCSearchOperation *v12;
  uint64_t v13;
  FCSearchResult *searchResult;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCSearchOperation;
  v11 = -[FCOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchString, a3);
    objc_storeStrong((id *)&v12->_cloudContext, a4);
    v12->_parsecQueryID = a5;
    v12->_shouldFetchFullHeadline = 0;
    v13 = objc_opt_new();
    searchResult = v12->_searchResult;
    v12->_searchResult = (FCSearchResult *)v13;

  }
  return v12;
}

- (BOOL)validateOperation
{
  void *v2;
  void *v4;
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
  -[FCSearchOperation cloudContext](self, "cloudContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Search operation requires a cloud context"));
    v5 = 136315906;
    v6 = "-[FCSearchOperation validateOperation]";
    v7 = 2080;
    v8 = "FCSearchOperation.m";
    v9 = 1024;
    v10 = 87;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return v2 != 0;
}

- (void)performOperation
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[6];

  v3 = -[FCSearchOperation batchSize](self, "batchSize");
  v4 = 20;
  if (v3 > 0x14)
    v4 = v3;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__FCSearchOperation_performOperation__block_invoke;
  v15[3] = &unk_1E4640CD0;
  v15[4] = self;
  v15[5] = v4;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __37__FCSearchOperation_performOperation__block_invoke_2;
  v14[3] = &unk_1E464B990;
  v14[4] = self;
  objc_msgSend(v6, "then:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __37__FCSearchOperation_performOperation__block_invoke_3;
  v13[3] = &unk_1E464B9B8;
  v13[4] = self;
  objc_msgSend(v7, "then:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __37__FCSearchOperation_performOperation__block_invoke_4;
  v12[3] = &unk_1E464B9B8;
  v12[4] = self;
  objc_msgSend(v8, "then:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __37__FCSearchOperation_performOperation__block_invoke_5;
  v11[3] = &unk_1E463EA38;
  v11[4] = self;
  v10 = (id)objc_msgSend(v9, "error:", v11);

}

uint64_t __37__FCSearchOperation_performOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchResultsForTagsWithBatchSize:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__FCSearchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTagSearchResult:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_fetchResultsForArticlesWithBatchSize:", objc_msgSend(*(id *)(a1 + 32), "batchSize"));
}

id __37__FCSearchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldFetchFullHeadline"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchFullHeadlineResultsForArticles:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

uint64_t __37__FCSearchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArticleSearchResult:", v4);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

void __37__FCSearchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "fc_isCancellationError"))
    v3 = 0;
  else
    v3 = v4;
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v3);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCSearchOperation searchResultsBlock](self, "searchResultsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCSearchOperation searchResultsBlock](self, "searchResultsBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCSearchOperation searchResult](self, "searchResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (id)_fetchResultsForTagsWithBatchSize:(unint64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

void __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE6757B8))
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  objc_msgSend(v7, "setContentContext:", v11);

  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchString:", v12);

  objc_msgSend(v7, "setUserFacingTagOptions:", 3);
  objc_msgSend(v7, "setBatchSize:", *(_QWORD *)(a1 + 40));
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke_2;
  v18 = &unk_1E464B9E0;
  v19 = v6;
  v20 = v5;
  v13 = v5;
  v14 = v6;
  objc_msgSend(v7, "setSearchResultsBlock:", &v15);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v15, v16, v17, v18);
  objc_msgSend(v7, "start");

}

void __55__FCSearchOperation__fetchResultsForTagsWithBatchSize___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  FCTagSearchOperationResult *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  FCStreamingResults *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  FCStreamingResults *v20;
  id v21;

  v21 = a2;
  v7 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(FCTagSearchOperationResult);
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "underlyingStream");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = (id)objc_opt_new();
      v12 = v11;

      objc_msgSend(v21, "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[FCStreamingResults initWithResults:followedByStream:]([FCStreamingResults alloc], "initWithResults:followedByStream:", v13, v12);
      -[FCTagSearchOperationResult setChannels:](v8, "setChannels:", v14);

    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "underlyingStream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (id)objc_opt_new();
      v18 = v17;

      objc_msgSend(v7, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[FCStreamingResults initWithResults:followedByStream:]([FCStreamingResults alloc], "initWithResults:followedByStream:", v19, v18);
      -[FCTagSearchOperationResult setTopics:](v8, "setTopics:", v20);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_fetchResultsForArticlesWithBatchSize:(unint64_t)a3
{
  id v5;
  _QWORD v7[6];

  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke;
  v7[3] = &unk_1E4644350;
  v7[4] = self;
  v7[5] = a3;
  return (id)objc_msgSend(v5, "initWithResolver:", v7);
}

void __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCArticleSearchOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = -[FCArticleSearchOperation initWithParsecQueryID:]([FCArticleSearchOperation alloc], "initWithParsecQueryID:", objc_msgSend(*(id *)(a1 + 32), "parsecQueryID"));
  objc_msgSend(*(id *)(a1 + 32), "cloudContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchOperation setCloudContext:](v7, "setCloudContext:", v8);

  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchOperation setQuery:](v7, "setQuery:", v9);

  -[FCArticleSearchOperation setResultsLimit:](v7, "setResultsLimit:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "keyboardInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleSearchOperation setKeyboardInputMode:](v7, "setKeyboardInputMode:", v10);

  objc_msgSend(*(id *)(a1 + 32), "scale");
  -[FCArticleSearchOperation setScale:](v7, "setScale:");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke_2;
  v16 = &unk_1E464BA08;
  v17 = v6;
  v18 = v5;
  v11 = v5;
  v12 = v6;
  -[FCArticleSearchOperation setArticleSearchCompletion:](v7, "setArticleSearchCompletion:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v13, v14, v15, v16);
  -[FCOperation start](v7, "start");

}

void __59__FCSearchOperation__fetchResultsForArticlesWithBatchSize___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  FCArticleSearchOperationResult *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(FCArticleSearchOperationResult);
    -[FCArticleSearchOperationResult setArticles:](v8, "setArticles:", v9);
    -[FCArticleSearchOperationResult setFeedBack:](v8, "setFeedBack:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_fetchFullHeadlineResultsForArticles:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  FCSearchOperation *v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke;
  v9[3] = &unk_1E463F188;
  v10 = v4;
  v11 = self;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FCArticleHeadlinesFetchOperation *v10;
  void *v11;
  FCArticleHeadlinesFetchOperation *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "articles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_197);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [FCArticleHeadlinesFetchOperation alloc];
  objc_msgSend(*(id *)(a1 + 40), "cloudContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCArticleHeadlinesFetchOperation initWithContext:articleIDs:ignoreCacheForArticleIDs:](v10, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v11, v9, 0);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_3;
  v17[3] = &unk_1E464BA90;
  v21 = v6;
  v18 = v9;
  v19 = v8;
  v20 = *(id *)(a1 + 32);
  v22 = v5;
  v13 = v5;
  v14 = v8;
  v15 = v9;
  v16 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v12, "setFetchCompletionBlock:", v17);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v12);
  -[FCOperation start](v12, "start");

}

uint64_t __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  FCArticleSearchOperationResult *v30;
  FCArticleStreamingResults *v31;
  void *v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[6];
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4;
    v39[3] = &unk_1E463B790;
    v4 = *(_QWORD *)(a1 + 56);
    v39[4] = v3;
    v39[5] = v4;
    v5 = v3;
    __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4((uint64_t)v39);
  }
  else
  {
    v34 = v3;
    objc_msgSend(v3, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_dictionaryWithKeyBlock:", &__block_literal_global_226);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218240;
      v42 = v9;
      v43 = 2048;
      v44 = v10;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_INFO, "inflated %lu of %lu search results", buf, 0x16u);

    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v33 = a1;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "articleID", v33);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v17;
          v21 = v20;
          if (v19)
          {
            objc_msgSend(v20, "setInflatedHeadline:", v19);
          }
          else
          {
            v22 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v23 = v22;
              objc_msgSend(v21, "articleID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v24;
              _os_log_error_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_ERROR, "failed to inflate search result headline with article ID: %@", buf, 0xCu);

            }
          }
          objc_msgSend(v11, "addObject:", v21);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(v33 + 48), "articles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "underlyingStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (id)objc_opt_new();
    v29 = v28;

    v30 = objc_alloc_init(FCArticleSearchOperationResult);
    v31 = -[FCStreamingResults initWithResults:followedByStream:]([FCArticleStreamingResults alloc], "initWithResults:followedByStream:", v11, v29);
    -[FCArticleSearchOperationResult setArticles:](v30, "setArticles:", v31);

    objc_msgSend(*(id *)(v33 + 48), "feedBack");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCArticleSearchOperationResult setFeedBack:](v30, "setFeedBack:", v32);

    (*(void (**)(void))(*(_QWORD *)(v33 + 64) + 16))();
    v3 = v34;
  }

}

void __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v2;
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_error_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_ERROR, "failed to inflate search result headlines with error: %@", (uint8_t *)&v8, 0xCu);

  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __58__FCSearchOperation__fetchFullHeadlineResultsForArticles___block_invoke_224(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
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

- (BOOL)shouldFetchFullHeadline
{
  return self->_shouldFetchFullHeadline;
}

- (void)setShouldFetchFullHeadline:(BOOL)a3
{
  self->_shouldFetchFullHeadline = a3;
}

- (id)searchResultsBlock
{
  return self->_searchResultsBlock;
}

- (void)setSearchResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (FCSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (unint64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(unint64_t)a3
{
  self->_parsecQueryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
