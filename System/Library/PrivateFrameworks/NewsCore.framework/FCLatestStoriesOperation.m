@implementation FCLatestStoriesOperation

- (FCLatestStoriesOperation)initWithContext:(id)a3 dateRange:(id)a4 totalLimit:(unint64_t)a5 perFeedLimit:(unint64_t)a6
{
  id v11;
  id v12;
  FCLatestStoriesOperation *v13;
  FCLatestStoriesOperation *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCLatestStoriesOperation;
  v13 = -[FCOperation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_dateRange, a4);
    v14->_totalLimit = a5;
    v14->_perFeedLimit = a6;
  }

  return v14;
}

- (void)prepareOperation
{
  void *v3;
  FCCoreConfiguration *v4;
  FCCoreConfiguration *configuration;
  id v6;

  -[FCLatestStoriesOperation context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (FCCoreConfiguration *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  self->_configuration = v4;

}

- (void)performOperation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__FCLatestStoriesOperation_performOperation__block_invoke;
  v2[3] = &unk_1E463F6A0;
  v2[4] = self;
  -[FCLatestStoriesOperation _fetchTagsForQueryingWithCompletionHandler:](self, "_fetchTagsForQueryingWithCompletionHandler:", v2);
}

void __44__FCLatestStoriesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCFeedRequestOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_constructFeedRequestsFromTags:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "feedContextByFeedID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(FCFeedRequestOperation);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setConfiguration:](v12, "setConfiguration:", v13);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setContext:](v12, "setContext:", v14);

    -[FCFeedRequestOperation setFeedRequests:](v12, "setFeedRequests:", v10);
    -[FCFeedRequestOperation setMaxCount:](v12, "setMaxCount:", objc_msgSend(*(id *)(a1 + 32), "totalLimit"));
    -[FCFeedRequestOperation setOptions:](v12, "setOptions:", -[FCFeedRequestOperation options](v12, "options") | 0xE);
    -[FCFeedRequestOperation setOptions:](v12, "setOptions:", -[FCFeedRequestOperation options](v12, "options") | 0x10);
    +[FCFeedDatabase temporaryFeedDatabaseWithEndpoint:](FCFeedDatabase, "temporaryFeedDatabaseWithEndpoint:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setFeedDatabase:](v12, "setFeedDatabase:", v15);

    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __44__FCLatestStoriesOperation_performOperation__block_invoke_3;
    v20 = &unk_1E463D338;
    v21 = *(_QWORD *)(a1 + 32);
    v22 = v11;
    v16 = v11;
    -[FCFeedRequestOperation setRequestCompletionHandler:](v12, "setRequestCompletionHandler:", &v17);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v12, v17, v18, v19, v20, v21);
    -[FCOperation start](v12, "start");

  }
  else
  {
    objc_msgSend(v8, "finishedPerformingOperationWithError:", v6);
  }

}

void __44__FCLatestStoriesOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  FCFeedItemHeadlinesOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = objc_alloc_init(FCFeedItemHeadlinesOperation);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedItemHeadlinesOperation setContext:](v5, "setContext:", v6);

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedItemHeadlinesOperation setConfiguration:](v5, "setConfiguration:", v7);

  -[FCFeedItemHeadlinesOperation setFeedItems:](v5, "setFeedItems:", v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedPersonalizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedItemHeadlinesOperation setPersonalizer:](v5, "setPersonalizer:", v9);

  -[FCFeedItemHeadlinesOperation setFeedPersonalizationConfigurationSet:](v5, "setFeedPersonalizationConfigurationSet:", 0);
  -[FCFeedItemHeadlinesOperation setFeedContextByFeedID:](v5, "setFeedContextByFeedID:", *(_QWORD *)(a1 + 40));
  -[FCFeedItemHeadlinesOperation setCachedOnly:](v5, "setCachedOnly:", 1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__FCLatestStoriesOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E463B408;
  v10[4] = *(_QWORD *)(a1 + 32);
  -[FCFeedItemHeadlinesOperation setHeadlinesCompletionHandler:](v5, "setHeadlinesCompletionHandler:", v10);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5);
  -[FCOperation start](v5, "start");

}

void __44__FCLatestStoriesOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultHeadlines:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCLatestStoriesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCLatestStoriesOperation headlinesCompletionHandler](self, "headlinesCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCLatestStoriesOperation resultHeadlines](self, "resultHeadlines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (void)_fetchTagsForQueryingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[FCLatestStoriesOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCDispatchQueueForQualityOfService(-[FCLatestStoriesOperation qualityOfService](self, "qualityOfService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__FCLatestStoriesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E463F6C8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "performFirstSyncWithCallbackQueue:completion:", v7, v9);

}

void __71__FCLatestStoriesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subscriptionList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allSubscribedTagIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subscriptionList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mutedTagIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "purchaseController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allPurchasedTagIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleSubscriptionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pptContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v9, "isRunningPPT") ^ 1;
  +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v12, v11, v3, v5, v6, v7, v10, objc_msgSend(*(id *)(a1 + 32), "qualityOfService"), *(_QWORD *)(a1 + 40));

}

- (id)_constructFeedRequestsFromTags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;

  v4 = a3;
  -[FCLatestStoriesOperation dateRange](self, "dateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCLatestStoriesOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "purchaseController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allPurchasedTagIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCLatestStoriesOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleSubscriptionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCLatestStoriesOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FCLatestStoriesOperation perFeedLimit](self, "perFeedLimit");
  +[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:options:](FCForYouQueryUtilities, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:options:", v7, &__block_literal_global_36, MEMORY[0x1E0C9AA60], v10, v12, v13, v14, v6, 0, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __59__FCLatestStoriesOperation__constructFeedRequestsFromTags___block_invoke()
{
  return 1;
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (unint64_t)totalLimit
{
  return self->_totalLimit;
}

- (unint64_t)perFeedLimit
{
  return self->_perFeedLimit;
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (void)setResultHeadlines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
}

@end
