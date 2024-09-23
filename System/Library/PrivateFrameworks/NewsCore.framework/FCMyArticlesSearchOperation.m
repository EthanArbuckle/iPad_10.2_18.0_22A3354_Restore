@implementation FCMyArticlesSearchOperation

- (FCMyArticlesSearchOperation)init
{
  FCMyArticlesSearchOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCMyArticlesSearchOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
  {
    result->_channelsOnly = 1;
    result->_cachedOnly = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[FCMyArticlesSearchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("articles search operation requires a context"));
    v18 = 136315906;
    v19 = "-[FCMyArticlesSearchOperation validateOperation]";
    v20 = 2080;
    v21 = "FCMyArticlesSearchOperation.m";
    v22 = 1024;
    v23 = 51;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

  }
  -[FCMyArticlesSearchOperation feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("articles search operation requires a feature"));
    v18 = 136315906;
    v19 = "-[FCMyArticlesSearchOperation validateOperation]";
    v20 = 2080;
    v21 = "FCMyArticlesSearchOperation.m";
    v22 = 1024;
    v23 = 52;
    v24 = 2114;
    v25 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

  }
  -[FCMyArticlesSearchOperation dateRange](self, "dateRange");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[FCMyArticlesSearchOperation dateRange](self, "dateRange"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isFinite"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("articles search operation requires a finite date range"));
      v18 = 136315906;
      v19 = "-[FCMyArticlesSearchOperation validateOperation]";
      v20 = 2080;
      v21 = "FCMyArticlesSearchOperation.m";
      v22 = 1024;
      v23 = 53;
      v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

    }
  }
  -[FCMyArticlesSearchOperation context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[FCMyArticlesSearchOperation feature](self, "feature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[FCMyArticlesSearchOperation dateRange](self, "dateRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[FCMyArticlesSearchOperation dateRange](self, "dateRange");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isFinite");

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[FCMyArticlesSearchOperation dateRange](self, "dateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__FCMyArticlesSearchOperation_performOperation__block_invoke;
  v5[3] = &unk_1E463D6E0;
  v5[4] = self;
  -[FCMyArticlesSearchOperation _generateFeedRequestsForFeedRange:completionHandler:](self, "_generateFeedRequestsForFeedRange:completionHandler:", v4, v5);

}

void __47__FCMyArticlesSearchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  FCFeedRequestOperation *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || !objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);
  }
  else
  {
    v10 = objc_alloc_init(FCFeedRequestOperation);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setContext:](v10, "setContext:", v11);

    -[FCFeedRequestOperation setConfiguration:](v10, "setConfiguration:", v8);
    -[FCFeedRequestOperation setFeedRequests:](v10, "setFeedRequests:", v7);
    v12 = objc_msgSend(*(id *)(a1 + 32), "filterOptions");
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedTransformationFilter transformationWithFilterOptions:configuration:context:](FCFeedTransformationFilter, "transformationWithFilterOptions:configuration:context:", v12, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setFeedTransformations:](v10, "setFeedTransformations:", v17);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__FCMyArticlesSearchOperation_performOperation__block_invoke_2;
    v19[3] = &unk_1E463D6B8;
    v19[4] = *(_QWORD *)(a1 + 32);
    -[FCFeedRequestOperation setRequestCompletionHandler:](v10, "setRequestCompletionHandler:", v19);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10);
    -[FCOperation start](v10, "start");

  }
}

void __47__FCMyArticlesSearchOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v9 = a4;
  objc_msgSend(v7, "_cappedFeedItemsFromResponses:allFeedItems:", a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResultFeedItems:", v8);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  FCMyArticlesSearchOperation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[FCMyArticlesSearchOperation resultFeedItems](self, "resultFeedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!v4)
      goto LABEL_7;
    v5 = self;
    v6 = 0;
  }
  else
  {
    if (v4)
      goto LABEL_7;
    v6 = MEMORY[0x1E0C9AA60];
    v5 = self;
  }
  -[FCMyArticlesSearchOperation setResultFeedItems:](v5, "setResultFeedItems:", v6);
LABEL_7:
  -[FCMyArticlesSearchOperation searchCompletionHandler](self, "searchCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7)
  {
    -[FCMyArticlesSearchOperation searchCompletionHandler](self, "searchCompletionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCMyArticlesSearchOperation resultFeedItems](self, "resultFeedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMyArticlesSearchOperation resultFeedContextByFeedID](self, "resultFeedContextByFeedID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v9)[2](v9, v10, v11, v12);

    v8 = v12;
  }

}

- (void)_generateFeedRequestsForFeedRange:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;

  v23 = a3;
  v22 = a4;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__11;
  v41[4] = __Block_byref_object_dispose__11;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__11;
  v39[4] = __Block_byref_object_dispose__11;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__11;
  v37[4] = __Block_byref_object_dispose__11;
  v38 = 0;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  -[FCMyArticlesSearchOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke;
  v33[3] = &unk_1E463D708;
  v35 = v41;
  v36 = v39;
  v9 = v6;
  v34 = v9;
  FCCoreConfigurationFetch(v8, v33);

  dispatch_group_enter(v9);
  -[FCMyArticlesSearchOperation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tagController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCMyArticlesSearchOperation context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscriptionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allSubscribedTagIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCMyArticlesSearchOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService(-[FCMyArticlesSearchOperation qualityOfService](self, "qualityOfService"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_2;
  v30[3] = &unk_1E463D730;
  v32 = v37;
  v18 = v9;
  v31 = v18;
  objc_msgSend(v11, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v15, v16, v17, v30);

  FCDispatchQueueForQualityOfService(-[FCMyArticlesSearchOperation qualityOfService](self, "qualityOfService"));
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_3;
  block[3] = &unk_1E463D7A8;
  v26 = v22;
  v27 = v37;
  v28 = v39;
  v29 = v41;
  block[4] = self;
  v25 = v23;
  v20 = v23;
  v21 = v22;
  dispatch_group_notify(v18, v19, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD aBlock[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allPurchasedTagIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "channelsOnly"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fc_arrayOfObjectsPassingTest:", &__block_literal_global_19);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == 0;
  else
    v8 = 0;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E463D780;
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v31 = v9;
    aBlock[4] = v10;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 72);
    v29 = v11;
    v32 = v12;
    v30 = *(id *)(a1 + 40);
    v23 = _Block_copy(aBlock);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subscriptionList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mutedTagIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "purchaseController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allPurchasedTagIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleSubscriptionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pptContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_msgSend(v19, "isRunningPPT") ^ 1;
    +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v22, v21, v13, v15, v16, v17, v20, objc_msgSend(*(id *)(a1 + 32), "qualityOfService"), v23);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

BOOL __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tagType") != 1;
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD aBlock[5];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_6;
    aBlock[3] = &unk_1E463D758;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v6 = _Block_copy(aBlock);
    v27 = v5;
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleSubscriptionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pptContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v14, "isRunningPPT");
    v25 = v12;
    v15 = v6;
    +[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:allowPaidBundleFeed:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:isRunningPPT:](FCForYouQueryUtilities, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:allowPaidBundleFeed:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:isRunningPPT:", v7, v6, MEMORY[0x1E0C9AA60], 1, v8, v10, v11, 1000, v25, 0, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "feedContextByFeedID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResultFeedContextByFeedID:", v17);

    objc_msgSend(v16, "allRequests");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v22);
          objc_msgSend(v23, "setCachedOnly:", objc_msgSend(*(id *)(a1 + 32), "cachedOnly"));
          objc_msgSend(*(id *)(a1 + 32), "feature");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setRequiredFeature:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    v5 = v27;
  }

}

uint64_t __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (objc_msgSend(a2, "tagType") != 1)
    return 3;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCFeedBinForTopicsInForYou(v3);

  return v4;
}

- (id)_cappedFeedItemsFromResponses:(id)a3 allFeedItems:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[FCMyArticlesSearchOperation maxFeedItems](self, "maxFeedItems")
    && (v8 = objc_msgSend(v7, "count"), v8 > -[FCMyArticlesSearchOperation maxFeedItems](self, "maxFeedItems")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compareFeedItemCount_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke_2;
    v15[3] = &unk_1E463D7D0;
    v15[4] = self;
    v11 = v9;
    v16 = v11;
    v17 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
    v12 = v17;
    v13 = v11;

  }
  else
  {
    v13 = v7;
  }

  return v13;
}

void __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "maxFeedItems");
  v8 = v7 - objc_msgSend(*(id *)(a1 + 40), "count");
  v9 = (double)v8 / (double)(unint64_t)(objc_msgSend(*(id *)(a1 + 48), "count") - a3);
  objc_msgSend(v6, "feedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (double)(unint64_t)objc_msgSend(v10, "count");

  if (v9 >= v11)
  {
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v6, "feedItems");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addObjectsFromArray:", v16);
  }
  else
  {
    objc_msgSend(v6, "feedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compareGlobalUserFeedbackDescending_);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 40);
    objc_msgSend(v16, "fc_subarrayWithMaxCount:", (unint64_t)v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCFeedItemFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)channelsOnly
{
  return self->_channelsOnly;
}

- (void)setChannelsOnly:(BOOL)a3
{
  self->_channelsOnly = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (unint64_t)maxFeedItems
{
  return self->_maxFeedItems;
}

- (void)setMaxFeedItems:(unint64_t)a3
{
  self->_maxFeedItems = a3;
}

- (id)searchCompletionHandler
{
  return self->_searchCompletionHandler;
}

- (void)setSearchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSArray)resultFeedItems
{
  return self->_resultFeedItems;
}

- (void)setResultFeedItems:(id)a3
{
  objc_storeStrong((id *)&self->_resultFeedItems, a3);
}

- (NSDictionary)resultFeedContextByFeedID
{
  return (NSDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setResultFeedContextByFeedID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong(&self->_searchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
