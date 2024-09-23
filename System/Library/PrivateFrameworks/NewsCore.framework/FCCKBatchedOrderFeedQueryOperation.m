@implementation FCCKBatchedOrderFeedQueryOperation

- (FCCKBatchedOrderFeedQueryOperation)init
{
  FCCKBatchedOrderFeedQueryOperation *v2;
  FCThreadSafeMutableArray *v3;
  FCThreadSafeMutableArray *allFeedItemAndArticleRecords;
  FCThreadSafeMutableArray *v5;
  FCThreadSafeMutableArray *allFeedResponses;
  FCThreadSafeMutableArray *v7;
  FCThreadSafeMutableArray *allTagRecords;
  FCThreadSafeMutableArray *v9;
  FCThreadSafeMutableArray *allIssueRecords;
  FCThreadSafeMutableArray *v11;
  FCThreadSafeMutableArray *allNetworkEvents;
  FCThreadSafeMutableArray *v13;
  FCThreadSafeMutableArray *allErrors;
  id v15;
  FCCKBatchedOrderFeedQueryOperation *v16;
  uint64_t v17;
  NFPromise *queryCompletionPromise;
  _QWORD v20[4];
  FCCKBatchedOrderFeedQueryOperation *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FCCKBatchedOrderFeedQueryOperation;
  v2 = -[FCOperation init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    allFeedItemAndArticleRecords = v2->_allFeedItemAndArticleRecords;
    v2->_allFeedItemAndArticleRecords = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    allFeedResponses = v2->_allFeedResponses;
    v2->_allFeedResponses = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableArray);
    allTagRecords = v2->_allTagRecords;
    v2->_allTagRecords = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allIssueRecords = v2->_allIssueRecords;
    v2->_allIssueRecords = v9;

    v11 = objc_alloc_init(FCThreadSafeMutableArray);
    allNetworkEvents = v2->_allNetworkEvents;
    v2->_allNetworkEvents = v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    allErrors = v2->_allErrors;
    v2->_allErrors = v13;

    v15 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__FCCKBatchedOrderFeedQueryOperation_init__block_invoke;
    v20[3] = &unk_1E463DAD0;
    v16 = v2;
    v21 = v16;
    v17 = objc_msgSend(v15, "initWithResolver:", v20);
    queryCompletionPromise = v16->_queryCompletionPromise;
    v16->_queryCompletionPromise = (NFPromise *)v17;

  }
  return v2;
}

- (void)performOperation
{
  dispatch_group_t v3;
  NSArray *feedRequests;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  _QWORD v9[5];
  dispatch_group_t v10;

  v3 = dispatch_group_create();
  if (self)
    feedRequests = self->_feedRequests;
  else
    feedRequests = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke;
  v9[3] = &unk_1E463CFF0;
  v9[4] = self;
  v10 = v3;
  v6 = v3;
  -[NSArray fc_visitSubarraysWithMaxCount:block:](feedRequests, "fc_visitSubarraysWithMaxCount:block:", 400, v9);
  FCDispatchQueueForQualityOfService(-[FCCKBatchedOrderFeedQueryOperation qualityOfService](self, "qualityOfService"));
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_3;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_group_notify(v6, v7, block);

}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCCKOrderFeedQueryOperation *v4;
  FCCKOrderFeedQueryOperation *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(FCCKOrderFeedQueryOperation);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 368);
  else
    v7 = 0;
  -[FCCKOrderFeedQueryOperation setDatabase:]((uint64_t)v4, v7);
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v8, v3, 376);
  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
  {
    v10 = (void *)v9[48];
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  v10 = 0;
  if (v5)
  {
LABEL_7:
    objc_setProperty_nonatomic_copy(v5, v8, v10, 384);
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_8:
  if (v9)
  {
    v11 = v9[49];
    if (!v5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v11 = 0;
  if (v5)
  {
LABEL_10:
    v5->_resultsLimit = v11;
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_11:
  if (v9)
  {
    v12 = v9[50];
    if (!v5)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = 0;
  if (v5)
  {
LABEL_13:
    v5->_queryPriority = v12;
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_14:
  if (v9)
  {
    v13 = (void *)v9[51];
    if (!v5)
      goto LABEL_17;
    goto LABEL_16;
  }
  v13 = 0;
  if (v5)
  {
LABEL_16:
    objc_setProperty_nonatomic_copy(v5, v8, v13, 408);
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_17:
  if (v9)
  {
    v14 = (void *)v9[52];
    if (!v5)
      goto LABEL_20;
    goto LABEL_19;
  }
  v14 = 0;
  if (v5)
  {
LABEL_19:
    objc_setProperty_nonatomic_copy(v5, v8, v14, 416);
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_20:
  if (v9)
  {
    v15 = (void *)v9[53];
    if (!v5)
      goto LABEL_23;
    goto LABEL_22;
  }
  v15 = 0;
  if (v5)
LABEL_22:
    objc_setProperty_nonatomic_copy(v5, v8, v15, 424);
LABEL_23:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_initWeak(&location, v5);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_2;
  v20 = &unk_1E4648130;
  v21 = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v23, &location);
  v22 = *(id *)(a1 + 40);
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v16, &v17, 440);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5, v17, v18, v19, v20, v21);
  -[FCOperation start](v5, "start");

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

void __42__FCCKBatchedOrderFeedQueryOperation_init__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = _Block_copy(a2);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 496);
  *(_QWORD *)(v7 + 496) = v6;

  v9 = _Block_copy(v5);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 504);
  *(_QWORD *)(v10 + 504) = v9;

}

- (id)networkEvents
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "allNetworkEvents");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "readOnlyArray");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v25 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "allFeedItemAndArticleRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = (void *)v6[1];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  objc_msgSend(*(id *)(a1 + 32), "allFeedResponses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v11 = (void *)v6[2];
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  objc_msgSend(*(id *)(a1 + 32), "allTagRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v14 = (void *)v6[3];
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  objc_msgSend(*(id *)(a1 + 32), "allIssueRecords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v17 = (void *)v6[4];
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v16, "addObjectsFromArray:", v18);
  objc_msgSend(*(id *)(a1 + 32), "allNetworkEvents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v21 = WeakRetained;
  if (WeakRetained)
    v22 = (void *)*((_QWORD *)WeakRetained + 54);
  else
    v22 = 0;
  v23 = v22;
  objc_msgSend(v19, "addObjectsFromArray:", v23);

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "allErrors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v25);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "allErrors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v3);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCCKOrderFeedQueryResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void (**v16)(void);
  void (**queryCompletionHandler)(id, id *, id);
  id v18;

  v18 = a3;
  -[FCCKBatchedOrderFeedQueryOperation allTagRecords](self, "allTagRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readOnlyArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_uniqueByValueBlock:", &__block_literal_global_139);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCKBatchedOrderFeedQueryOperation allIssueRecords](self, "allIssueRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readOnlyArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_uniqueByValueBlock:", &__block_literal_global_7_5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [FCCKOrderFeedQueryResult alloc];
  -[FCCKBatchedOrderFeedQueryOperation allFeedItemAndArticleRecords](self, "allFeedItemAndArticleRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readOnlyArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKBatchedOrderFeedQueryOperation allFeedResponses](self, "allFeedResponses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "readOnlyArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FCCKOrderFeedQueryResult initWithFeedItemAndArticleRecords:feedResponses:tagRecords:issueRecords:]((id *)&v10->super.isa, v12, v14, v6, v9);

  if (v18)
    -[FCCKBatchedOrderFeedQueryOperation promiseRejectBlock](self, "promiseRejectBlock");
  else
    -[FCCKBatchedOrderFeedQueryOperation promiseResolveBlock](self, "promiseResolveBlock");
  v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v16[2]();

  if (self)
  {
    queryCompletionHandler = (void (**)(id, id *, id))self->_queryCompletionHandler;
    if (queryCompletionHandler)
      queryCompletionHandler[2](queryCompletionHandler, v15, v18);
  }

}

id __67__FCCKBatchedOrderFeedQueryOperation_operationWillFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __67__FCCKBatchedOrderFeedQueryOperation_operationWillFinishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCThreadSafeMutableArray)allFeedItemAndArticleRecords
{
  return self->_allFeedItemAndArticleRecords;
}

- (FCThreadSafeMutableArray)allFeedResponses
{
  return self->_allFeedResponses;
}

- (FCThreadSafeMutableArray)allTagRecords
{
  return self->_allTagRecords;
}

- (FCThreadSafeMutableArray)allIssueRecords
{
  return self->_allIssueRecords;
}

- (FCThreadSafeMutableArray)allNetworkEvents
{
  return self->_allNetworkEvents;
}

- (FCThreadSafeMutableArray)allErrors
{
  return self->_allErrors;
}

- (id)promiseResolveBlock
{
  return self->_promiseResolveBlock;
}

- (id)promiseRejectBlock
{
  return self->_promiseRejectBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promiseRejectBlock, 0);
  objc_storeStrong(&self->_promiseResolveBlock, 0);
  objc_storeStrong((id *)&self->_allErrors, 0);
  objc_storeStrong((id *)&self->_allNetworkEvents, 0);
  objc_storeStrong((id *)&self->_allIssueRecords, 0);
  objc_storeStrong((id *)&self->_allTagRecords, 0);
  objc_storeStrong((id *)&self->_allFeedResponses, 0);
  objc_storeStrong((id *)&self->_allFeedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_queryCompletionPromise, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
