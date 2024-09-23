@implementation NTCatchUpOperation

- (NTCatchUpOperation)init
{
  NTCatchUpOperation *v2;
  uint64_t v3;
  NSMutableArray *articleListRequests;
  uint64_t v5;
  NSMutableArray *articleIDsRequests;
  uint64_t v7;
  NSMutableSet *articleIDsToExclude;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTCatchUpOperation;
  v2 = -[FCOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    articleListRequests = v2->_articleListRequests;
    v2->_articleListRequests = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    articleIDsRequests = v2->_articleIDsRequests;
    v2->_articleIDsRequests = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    articleIDsToExclude = v2->_articleIDsToExclude;
    v2->_articleIDsToExclude = (NSMutableSet *)v7;

  }
  return v2;
}

- (void)addArticleListRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation addArticleListRequest:].cold.1();
  -[NTCatchUpOperation articleListRequests](self, "articleListRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addArticleIDsRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation addArticleIDsRequest:].cold.1();
  -[NTCatchUpOperation articleIDsRequests](self, "articleIDsRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addArticleIDsToExclude:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation addArticleIDsToExclude:].cold.1();
  -[NTCatchUpOperation articleIDsToExclude](self, "articleIDsToExclude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (BOOL)validateOperation
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  BOOL v14;
  char v16;
  char v17;

  -[NTCatchUpOperation appConfiguration](self, "appConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation validateOperation].cold.6();
  -[NTCatchUpOperation contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation validateOperation].cold.5();
  -[NTCatchUpOperation feedPersonalizer](self, "feedPersonalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation validateOperation].cold.4();
  -[NTCatchUpOperation articleIDsRequests](self, "articleIDsRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (!v8)
  {
    -[NTCatchUpOperation articleListRequests](self, "articleListRequests");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count"))
    {

LABEL_19:
      v10 = 1;
      goto LABEL_20;
    }
  }
  -[NTCatchUpOperation todayConfigOperationHeldRecordsByType](self, "todayConfigOperationHeldRecordsByType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (v9)
    goto LABEL_19;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation validateOperation].cold.3();
  v10 = 0;
LABEL_20:
  if (-[NTCatchUpOperation isForYouEnabled](self, "isForYouEnabled")
    && (-[NTCatchUpOperation forYouRequest](self, "forYouRequest"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NTCatchUpOperation validateOperation].cold.2();
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  -[NTCatchUpOperation catchUpCompletionHandler](self, "catchUpCompletionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation validateOperation].cold.1();
  if (v4)
    v14 = v5 == 0;
  else
    v14 = 1;
  if (v14 || v6 == 0)
    v16 = 0;
  else
    v16 = v10;
  v17 = v16 & v12;
  if (v13)
    return v17;
  else
    return 0;
}

- (void)prepareOperation
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperation setFetchDate:](self, "setFetchDate:", v3);

}

- (void)performOperation
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[11];
  _QWORD v9[4];
  NSObject *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__NTCatchUpOperation_performOperation__block_invoke;
  v14[3] = &unk_24DB5ECC8;
  v16 = v29;
  v17 = v27;
  v18 = v25;
  v5 = v3;
  v15 = v5;
  -[NTCatchUpOperation _fetchForYouResultsIfNeededWithCompletion:](self, "_fetchForYouResultsIfNeededWithCompletion:", v14);
  dispatch_group_enter(v5);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __38__NTCatchUpOperation_performOperation__block_invoke_2;
  v9[3] = &unk_24DB5ECF0;
  v11 = v23;
  v12 = v21;
  v13 = v19;
  v6 = v5;
  v10 = v6;
  -[NTCatchUpOperation _fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:](self, "_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:", v9);
  -[NTCatchUpOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __38__NTCatchUpOperation_performOperation__block_invoke_3;
  block[3] = &unk_24DB5ED18;
  block[6] = v21;
  block[7] = v29;
  block[4] = self;
  block[5] = v23;
  block[8] = v27;
  block[9] = v25;
  block[10] = v19;
  dispatch_group_notify(v6, v7, block);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

void __38__NTCatchUpOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(a2, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_msgSend(v8, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = objc_msgSend(v7, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __38__NTCatchUpOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(a2, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_msgSend(v8, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = objc_msgSend(v7, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __38__NTCatchUpOperation_performOperation__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NTSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = objc_msgSend(*(id *)(a1 + 32), "isForYouEnabled");
    v12 = 134218752;
    v13 = v3;
    v14 = 2048;
    v15 = v4;
    v16 = 2048;
    v17 = v6;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_INFO, "fetched %lu sets of articleList headlines, %lu sets of articleIDs headlines, %lu For You headlines (enabled: %d)", (uint8_t *)&v12, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setResultsByArticleListID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setResultsByArticleIDsRequestID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setForYouResults:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setForYouFetchInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!v9)
      goto LABEL_9;
  }
  NTSharedLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = (uint64_t)v11;
    _os_log_impl(&dword_2197E6000, v10, OS_LOG_TYPE_ERROR, "Encountered error %@ while attempting to catch up", (uint8_t *)&v12, 0xCu);

  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v9);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    NTSharedLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_2197E6000, v5, OS_LOG_TYPE_ERROR, "Catch up operation failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NTCatchUpOperation catchUpCompletionHandler](self, "catchUpCompletionHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NTCatchUpOperation *, id))v6)[2](v6, self, v4);

}

- (void)_fetchForYouResultsIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation _fetchForYouResultsIfNeededWithCompletion:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTCatchUpOperation isForYouEnabled](self, "isForYouEnabled"))
  {
    v25 = v5;
    -[NTCatchUpOperation contentContext](self, "contentContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTCatchUpOperation forYouRequest](self, "forYouRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCEE0]);
    objc_msgSend(v6, "rankedSubscribedTagIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    objc_msgSend(v6, "topStoriesChannelID");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "removeObject:", v10);
    -[NTCatchUpOperation appConfiguration](self, "appConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BE6CBF0];
    objc_msgSend(v9, "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mutedTagIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "purchasedTagIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleSubscriptionProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NTCatchUpOperation qualityOfService](self, "qualityOfService");
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke;
    v26[3] = &unk_24DB5EDF8;
    v26[4] = self;
    v27 = v6;
    v28 = v9;
    v29 = v11;
    v32 = v4;
    v30 = v24;
    v23 = (void *)v10;
    v5 = v25;
    v31 = v25;
    v16 = v24;
    v17 = v11;
    v18 = v9;
    v19 = v6;
    LOBYTE(v20) = 0;
    objc_msgSend(v22, "fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v21, v12, v13, v14, v17, v16, v20, v15, v26);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

void __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  _BOOL8 v40;
  uint64_t v41;
  NTCatchUpOperationResults *v42;
  NTCatchUpOperationResults *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  BOOL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _BYTE v79[128];
  _QWORD v80[7];

  v80[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CB38]), "initWithStartDate:timeInterval:", v60, (double)-objc_msgSend(*(id *)(a1 + 40), "cutoffTime"));
    objc_msgSend(MEMORY[0x24BE6CB78], "feedRangeFromDateRange:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_2;
    v77[3] = &unk_24DB5ED40;
    v78 = *(id *)(a1 + 40);
    v61 = (void *)MEMORY[0x219A33CDC](v77);
    v59 = v5;
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_dictionaryWithKeyBlock:", &__block_literal_global_83);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v6;
    v75[1] = 3221225472;
    v75[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_4;
    v75[3] = &unk_24DB5EDA8;
    v57 = v8;
    v76 = v57;
    objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v75);
    v10 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)MEMORY[0x24BE6CBF0];
    objc_msgSend(*(id *)(a1 + 40), "hiddenFeedIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 40), "allowPaidBundleFeed");
    objc_msgSend(*(id *)(a1 + 40), "purchasedTagIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bundleSubscriptionProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 56);
    v17 = objc_msgSend(*(id *)(a1 + 40), "headlinesPerFeedFetchCount");
    objc_msgSend(*(id *)(a1 + 64), "pptContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = objc_msgSend(v18, "isRunningPPT");
    v19 = v55;
    v56 = (void *)v10;
    objc_msgSend(v19, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:allowPaidBundleFeed:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:isRunningPPT:", v10, v61, v12, v13, v14, v15, v16, v17, v62, 0, v52);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "channelDefaultSectionRequests");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v21;
    objc_msgSend(v20, "topicRequests");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v22;
    objc_msgSend(v20, "paidBundleRequests");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v23;
    objc_msgSend(v20, "hiddenFeedRequests");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v24;
    objc_msgSend(v20, "channelOtherSectionsRequests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fc_arrayByFlattening");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "feedMaxCount"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE6CB80], "feedRequestContentEnvironmentTokenWithContext:", *(_QWORD *)(a1 + 64));
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "feedDatabase");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "version");

      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "throttlingIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v29;
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@%@%@-%hu"), CFSTR("fy-fetchdate-"), v29, v34, v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v36;
      if (v36)
      {
        objc_msgSend(v60, "timeIntervalSinceDate:", v36);
        v38 = (double)(uint64_t)v37;
        objc_msgSend(*(id *)(a1 + 40), "minimumUpdateInterval");
        v40 = v39 >= v38;
      }
      else
      {
        v40 = 0;
      }
      v5 = v59;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v43 = v28;
      v45 = -[NTCatchUpOperationResults countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v72 != v47)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "setCachedOnly:", v40);
          }
          v46 = -[NTCatchUpOperationResults countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        }
        while (v46);
      }

      v49 = objc_alloc_init(MEMORY[0x24BE6CB80]);
      objc_msgSend(v49, "setContext:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "appConfiguration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setConfiguration:", v50);

      objc_msgSend(v49, "setFeedRequests:", v43);
      objc_msgSend(v49, "setOptions:", 1);
      objc_msgSend(v49, "setExpectedNetworkEventCount:", 1);
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_5;
      v63[3] = &unk_24DB5EDD0;
      v69 = *(id *)(a1 + 80);
      v70 = v40;
      v64 = *(id *)(a1 + 72);
      v44 = v60;
      v65 = v60;
      v66 = v35;
      v67 = *(_QWORD *)(a1 + 32);
      v68 = v20;
      v51 = v35;
      objc_msgSend(v49, "setRequestCompletionHandlerWithHeldRecords:", v63);
      objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v49);
      objc_msgSend(v49, "start");

    }
    else
    {
      v41 = *(_QWORD *)(a1 + 80);
      v42 = [NTCatchUpOperationResults alloc];
      v43 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](v42, "initWithItems:rankingFeedback:supplementalInterestToken:", MEMORY[0x24BDBD1A8], 0, 0);
      (*(void (**)(uint64_t, NTCatchUpOperationResults *, _QWORD, _QWORD))(v41 + 16))(v41, v43, 0, 0);
      v5 = v59;
      v44 = v60;
    }

  }
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchingBin");
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NTCatchUpOperationResults *v14;
  NTCatchUpOperationForYouFetchInfo *v15;
  uint64_t v16;
  void *v17;
  NTCatchUpOperationForYouFetchInfo *v18;
  _QWORD v19[5];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_6;
    v19[3] = &unk_24DB5E440;
    v19[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v10, "fc_arrayOfObjectsFailingTest:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = -[NTCatchUpOperationResults initWithFeedItems:supplementalInterestToken:]([NTCatchUpOperationResults alloc], "initWithFeedItems:supplementalInterestToken:", v13, 0);
    else
      v14 = 0;
    v15 = [NTCatchUpOperationForYouFetchInfo alloc];
    v16 = *(unsigned __int8 *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 64), "feedContextByFeedID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NTCatchUpOperationForYouFetchInfo initWithAttemptedCachedOnly:feedContextByFeedID:](v15, "initWithAttemptedCachedOnly:feedContextByFeedID:", v16, v17);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "articleIDsToExclude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

- (void)_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  NTCatchUpOperation *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperation _fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:].cold.1();
  -[NTCatchUpOperation articleListRequests](self, "articleListRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperation articleIDsRequests](self, "articleIDsRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "articleIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "set");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_95);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NTSharedLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v15, "count");
      v18 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218754;
      v34 = v17;
      v35 = 2112;
      v36 = v15;
      v37 = 2048;
      v38 = v18;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_2197E6000, v16, OS_LOG_TYPE_INFO, "NTCatchUpOperation fetching headlines for articleListIDs (%lu): %@  articleIDs (%lu): %@", buf, 0x2Au);
    }

    -[NTCatchUpOperation contentContext](self, "contentContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    -[NTCatchUpOperation appConfiguration](self, "appConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConfiguration:", v21);

    objc_msgSend(v20, "setContext:", v19);
    objc_msgSend(v20, "setArticleListIDs:", v15);
    objc_msgSend(v20, "setArticleIDs:", v7);
    objc_msgSend(v20, "setShouldBypassRecordSourcePersistence:", 1);
    -[NTCatchUpOperation todayConfigOperationHeldRecordsByType](self, "todayConfigOperationHeldRecordsByType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHeldRecordsByType:", v22);

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_97;
    v24[3] = &unk_24DB5EED8;
    v25 = v5;
    v26 = self;
    v27 = v8;
    v28 = v4;
    objc_msgSend(v20, "setHeadlinesCompletionHandler:", v24);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v20);
    objc_msgSend(v20, "start");

    v6 = v23;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

uint64_t __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleListID");
}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_97(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = *(void **)(a1 + 32);
  v16 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_2;
  v38[3] = &unk_24DB5EE60;
  v31 = v10;
  v39 = v31;
  v17 = v14;
  v40 = v17;
  v18 = v12;
  v41 = v18;
  v30 = v9;
  v42 = v30;
  v19 = v13;
  v43 = v19;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v38);
  objc_msgSend(*(id *)(a1 + 40), "appConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v23 = *(void **)(a1 + 48);
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_3;
  v32[3] = &unk_24DB5EEB0;
  v33 = v11;
  v24 = v22;
  v34 = v24;
  v25 = v18;
  v35 = v25;
  v36 = v20;
  v37 = v21;
  v26 = v21;
  v27 = v20;
  v28 = v11;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v32);
  if (objc_msgSend(v17, "count") || objc_msgSend(v24, "count"))
    v29 = v25;
  else
    v29 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NTCatchUpOperationResults *v5;
  NTCatchUpOperationResults *v6;
  id v7;

  objc_msgSend(a2, "articleListID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [NTCatchUpOperationResults alloc];
      v6 = -[NTCatchUpOperationResults initWithHeadlines:rankingFeedback:actionURLsByArticleID:](v5, "initWithHeadlines:rankingFeedback:actionURLsByArticleID:", v4, 0, MEMORY[0x24BDBD1B8]);
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v6, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v7);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v7);
  }

}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NTCatchUpOperationResults *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "articleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "overrideHeadlineMetadataByArticleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "nf_objectsForKeysWithoutMarker:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_4;
    v12[3] = &unk_24DB5EE88;
    v13 = v6;
    v14 = *(id *)(a1 + 56);
    v15 = v8;
    v9 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
    v10 = -[NTCatchUpOperationResults initWithHeadlines:rankingFeedback:actionURLsByArticleID:]([NTCatchUpOperationResults alloc], "initWithHeadlines:rankingFeedback:actionURLsByArticleID:", v7, 0, v9);
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v10, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v11);
  }

}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_4(_QWORD *a1, void *a2)
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
  id v13;

  v13 = a2;
  objc_opt_class();
  FCCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  objc_msgSend(v13, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "applyHeadlineMetadata:configuration:", v6, a1[5]);
  objc_msgSend(v6, "actionURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "actionURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)a1[6];
  objc_msgSend(v13, "articleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (void)setAppConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (NSDictionary)todayConfigOperationHeldRecordsByType
{
  return self->_todayConfigOperationHeldRecordsByType;
}

- (void)setTodayConfigOperationHeldRecordsByType:(id)a3
{
  objc_storeStrong((id *)&self->_todayConfigOperationHeldRecordsByType, a3);
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (void)setForYouRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (BOOL)isForYouEnabled
{
  return self->_forYouEnabled;
}

- (void)setForYouEnabled:(BOOL)a3
{
  self->_forYouEnabled = a3;
}

- (NSDictionary)resultsByArticleListID
{
  return self->_resultsByArticleListID;
}

- (void)setResultsByArticleListID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSDictionary)resultsByArticleIDsRequestID
{
  return self->_resultsByArticleIDsRequestID;
}

- (void)setResultsByArticleIDsRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NTCatchUpOperationResults)forYouResults
{
  return self->_forYouResults;
}

- (void)setForYouResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)catchUpCompletionHandler
{
  return self->_catchUpCompletionHandler;
}

- (void)setCatchUpCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSMutableSet)articleIDsToExclude
{
  return self->_articleIDsToExclude;
}

- (void)setArticleIDsToExclude:(id)a3
{
  objc_storeStrong((id *)&self->_articleIDsToExclude, a3);
}

- (NSMutableArray)articleListRequests
{
  return self->_articleListRequests;
}

- (void)setArticleListRequests:(id)a3
{
  objc_storeStrong((id *)&self->_articleListRequests, a3);
}

- (NSMutableArray)articleIDsRequests
{
  return self->_articleIDsRequests;
}

- (void)setArticleIDsRequests:(id)a3
{
  objc_storeStrong((id *)&self->_articleIDsRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleIDsRequests, 0);
  objc_storeStrong((id *)&self->_articleListRequests, 0);
  objc_storeStrong((id *)&self->_articleIDsToExclude, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong(&self->_catchUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_forYouResults, 0);
  objc_storeStrong((id *)&self->_resultsByArticleIDsRequestID, 0);
  objc_storeStrong((id *)&self->_resultsByArticleListID, 0);
  objc_storeStrong((id *)&self->_forYouRequest, 0);
  objc_storeStrong((id *)&self->_todayConfigOperationHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);
}

- (void)addArticleListRequest:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleListRequest");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)addArticleIDsRequest:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleIDsRequest");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)addArticleIDsToExclude:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleIDs");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Catch up operation must have an app configuration"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_3_0();
}

- (void)_fetchForYouResultsIfNeededWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

@end
