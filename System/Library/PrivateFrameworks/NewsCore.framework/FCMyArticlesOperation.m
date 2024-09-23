@implementation FCMyArticlesOperation

FCFeedRequest *__50__FCMyArticlesOperation_prewarmDateRange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCFeedRequest *v4;

  v3 = a2;
  v4 = objc_alloc_init(FCFeedRequest);
  -[FCFeedRequest setFeedID:](v4, "setFeedID:", v3);

  -[FCFeedRequest setFeedRange:](v4, "setFeedRange:", *(_QWORD *)(a1 + 32));
  -[FCFeedRequest setMaxCount:](v4, "setMaxCount:", 1000);
  return v4;
}

+ (BOOL)prewarmDateRange:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  FCFeedPrewarmRequest *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_lastKnownFeedIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__FCMyArticlesOperation_prewarmDateRange_context___block_invoke_2;
    v19[3] = &unk_1E463C9B8;
    v20 = v11;
    v12 = v11;
    objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[FCMyArticlesOperation _prewarmRequestKeyForDateRange:]((uint64_t)a1, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCFeedPrewarmRequest initWithRequestKey:feedRequests:options:edgeCacheHint:]([FCFeedPrewarmRequest alloc], "initWithRequestKey:feedRequests:options:edgeCacheHint:", v14, v13, 1, 0);
    objc_msgSend(v7, "internalContentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "feedPrewarmer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startPrewarmingRequest:", v15);

  }
  return v9 != 0;
}

+ (id)_prewarmRequestKeyForDateRange:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("MyArticles"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCMyArticlesOperation)init
{
  FCMyArticlesOperation *v2;
  FCMyArticlesOperation *v3;
  FCMyArticlesTiming *v4;
  FCMyArticlesTiming *timing;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCMyArticlesOperation;
  v2 = -[FCOperation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_binOverride = 0;
    v4 = -[FCMyArticlesTiming initWithTotalTime:feedsNetworkTime:evergreenNetworkTime:scoringTime:]([FCMyArticlesTiming alloc], "initWithTotalTime:feedsNetworkTime:evergreenNetworkTime:scoringTime:", 0.0, 0.0, 0.0, 0.0);
    timing = v3->_timing;
    v3->_timing = v4;

  }
  return v3;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[FCMyArticlesOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("my articles operation must have a configuration"));
    v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    v18 = 1024;
    v19 = 90;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCMyArticlesOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("my articles operation must have a context"));
    v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    v18 = 1024;
    v19 = 91;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCMyArticlesOperation dateRange](self, "dateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("my articles operation must have a date range"));
    v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    v18 = 1024;
    v19 = 92;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCMyArticlesOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[FCMyArticlesOperation context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[FCMyArticlesOperation dateRange](self, "dateRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)performOperation
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  FCMyArticlesOperation *v18;
  _QWORD *v19;
  char v20;

  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__FCMyArticlesOperation_performOperation__block_invoke;
  v14[3] = &unk_1E463F6A0;
  v14[4] = self;
  v4 = v14;
  if (self)
  {
    -[FCMyArticlesOperation context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMyArticlesOperation configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCMyArticlesOperation context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pptContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunningPPT");

    objc_msgSend(v5, "subscriptionList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCDispatchQueueForQualityOfService(-[FCMyArticlesOperation qualityOfService](self, "qualityOfService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __68__FCMyArticlesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E4640C00;
    v16 = v5;
    v17 = v6;
    v20 = v9;
    v18 = self;
    v19 = v4;
    v12 = v6;
    v13 = v5;
    objc_msgSend(v10, "performFirstSyncWithCallbackQueue:completion:", v11, v15);

  }
}

void __41__FCMyArticlesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  _QWORD *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  FCFeedRequestOperation *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  FCFeedRequestOperation *v62;
  FCFeedRequestOperation *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  _BYTE buf[24];
  void *v82;
  void *v83;
  FCFeedRequestOperation *v84;
  FCFeedRequestOperation *v85;
  id v86;
  _BYTE aBlock[24];
  void *v88;
  void *v89;
  id v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v73 = v6;
    v74 = v5;
    v9 = v5;
    v10 = MEMORY[0x1E0C809B0];
    v71 = v9;
    v72 = a1;
    if (v8)
    {
      v11 = v9;
      objc_msgSend(v8, "dateRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCFeedRange feedRangeFromDateRange:](FCFeedRange, "feedRangeFromDateRange:", v12);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        objc_msgSend(v8, "shortOperationDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "dateRange");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ querying date range %{public}@", buf, 0x16u);

      }
      NewsCoreUserDefaults();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("exclude_hidden_feeds"));

      objc_msgSend(v8, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v20;
      if ((v19 & 1) != 0)
      {
        v67 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(v20, "hiddenFeedIDs");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = (void *)MEMORY[0x1E0C99E60];
      *(_QWORD *)buf = v10;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke;
      v82 = &unk_1E463B8A8;
      v83 = v8;
      v84 = v11;
      objc_msgSend(v21, "fc_set:", buf);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        objc_msgSend(v8, "shortOperationDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fc_arrayByTransformingWithBlock:", &__block_literal_global_23_1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "description");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)aBlock = 138543618;
        *(_QWORD *)&aBlock[4] = v25;
        *(_WORD *)&aBlock[12] = 2114;
        *(_QWORD *)&aBlock[14] = v27;
        _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ querying tags %{public}@", aBlock, 0x16u);

      }
      *(_QWORD *)aBlock = v10;
      *(_QWORD *)&aBlock[8] = 3221225472;
      *(_QWORD *)&aBlock[16] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_24;
      v88 = &unk_1E463D758;
      v89 = v8;
      v77 = _Block_copy(aBlock);
      v69 = v22;
      objc_msgSend(v22, "allObjects");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "purchaseController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "allPurchasedTagIDs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bundleSubscriptionManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v30;
      if (objc_msgSend(v8, "perFeedLimit"))
        v34 = objc_msgSend(v8, "perFeedLimit");
      else
        v34 = 1000;
      objc_msgSend(v8, "sidecar");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pptContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v66) = objc_msgSend(v37, "isRunningPPT");
      v65 = v34;
      v38 = (void *)v28;
      +[FCForYouQueryUtilities feedRequestsForTags:tagBinProvider:hiddenFeedIDs:allowPaidBundleFeed:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:isRunningPPT:](FCForYouQueryUtilities, "feedRequestsForTags:tagBinProvider:hiddenFeedIDs:allowPaidBundleFeed:purchasedTagIDs:bundleSubscriptionProvider:configuration:maxCount:feedRange:sidecar:isRunningPPT:", v28, v77, v67, 1, v31, v33, v70, v65, v75, v35, v66);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }

    objc_msgSend(v39, "allRequests");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "feedContextByFeedID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "fc_arrayByTransformingWithBlock:", &__block_literal_global_52);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(v72 + 32);
    if (v43)
    {
      v44 = objc_msgSend(v43, "maxNumberOfFeedsToQuery");
      v45 = MEMORY[0x1E0C809B0];
      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setFc_lastKnownFeedIDs:", v42);

      }
      v47 = *(void **)(v72 + 32);
    }
    else
    {
      v47 = 0;
      v45 = MEMORY[0x1E0C809B0];
    }
    v78 = v39;
    v79[0] = v45;
    v48 = v45;
    v79[1] = 3221225472;
    v79[2] = __41__FCMyArticlesOperation_performOperation__block_invoke_4;
    v79[3] = &unk_1E463B490;
    v79[4] = v47;
    v80 = v41;
    v49 = v41;
    v50 = v79;
    if (v47)
    {
      v76 = v42;
      v51 = v40;
      objc_msgSend(v47, "configuration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "context");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCFeedTransformationFilter transformationWithFilterOptions:configuration:context:](FCFeedTransformationFilter, "transformationWithFilterOptions:configuration:context:", 282, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = objc_alloc_init(FCFeedRequestOperation);
      objc_msgSend(v47, "context");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation setContext:](v56, "setContext:", v57);

      objc_msgSend(v47, "configuration");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation setConfiguration:](v56, "setConfiguration:", v58);

      -[FCFeedRequestOperation setFeedRequests:](v56, "setFeedRequests:", v51);
      -[FCFeedRequestOperation setFeedTransformations:](v56, "setFeedTransformations:", v55);
      -[FCFeedRequestOperation setExpectedNetworkEventCount:](v56, "setExpectedNetworkEventCount:", 1);
      if (!objc_msgSend(v47, "maxNumberOfFeedsToQuery"))
      {
        objc_msgSend(v47, "dateRange");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[FCMyArticlesOperation _prewarmRequestKeyForDateRange:]((uint64_t)FCMyArticlesOperation, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedRequestOperation setPrewarmRequestKey:](v56, "setPrewarmRequestKey:", v60);

      }
      objc_msgSend(v47, "progressHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        *(_QWORD *)aBlock = v48;
        *(_QWORD *)&aBlock[8] = 3221225472;
        *(_QWORD *)&aBlock[16] = __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke;
        v88 = &unk_1E463CFF0;
        v89 = v47;
        v90 = v49;
        -[FCFeedRequestOperation setProgressHandler:](v56, "setProgressHandler:", aBlock);

      }
      v62 = v56;
      *(_QWORD *)buf = v48;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke_2;
      v82 = &unk_1E4640C68;
      v83 = v47;
      v63 = v62;
      v84 = v63;
      v64 = v50;
      v85 = v63;
      v86 = v64;
      -[FCFeedRequestOperation setRequestCompletionHandler:](v63, "setRequestCompletionHandler:", buf);
      objc_msgSend(v47, "associateChildOperation:", v63);
      -[FCOperation start](v63, "start");

      v42 = v76;
    }

    v6 = v73;
    v5 = v74;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);
  }

}

uint64_t __41__FCMyArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feedID");
}

void __41__FCMyArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  if (v5)
    objc_storeStrong((id *)(v5 + 456), a2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 464), *(id *)(a1 + 40));
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "finishedPerformingOperationWithError:", v8);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSDictionary *resultFeedContextByFeedID;
  NSDictionary *v10;
  id v11;

  v11 = a3;
  -[FCMyArticlesOperation feedItemCompletionBlock](self, "feedItemCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCMyArticlesOperation feedItemCompletionBlock](self, "feedItemCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (self)
    {
      v7 = self->_resultFeedItems;
      v8 = v7;
      if (v7)
        v6 = v7;
      resultFeedContextByFeedID = self->_resultFeedContextByFeedID;
    }
    else
    {
      v8 = 0;
      resultFeedContextByFeedID = 0;
    }
    if (resultFeedContextByFeedID)
      v10 = resultFeedContextByFeedID;
    else
      v10 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    ((void (**)(_QWORD, NSArray *, NSDictionary *, id))v5)[2](v5, v6, v10, v11);

  }
}

void __68__FCMyArticlesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "subscriptionList");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allSubscribedTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subscriptionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutedTagIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "purchaseController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allPurchasedTagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleSubscriptionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = *(_BYTE *)(a1 + 64) == 0;
  +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v2, v4, v6, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v8, objc_msgSend(*(id *)(a1 + 48), "qualityOfService"), *(_QWORD *)(a1 + 56));

}

void __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "maxNumberOfFeedsToQuery"))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedPersonalizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rankTagIDsDescending:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 32), "maxNumberOfFeedsToQuery"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_3;
    v15[3] = &unk_1E463DA78;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v12, "fc_setOfObjectsPassingTest:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v14);

  }
  else
  {
    objc_msgSend(v3, "unionSet:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "binOverride"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "binOverride");
  }
  else if (objc_msgSend(v3, "tagType") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = FCFeedBinForTopicsInForYou(v5);

  }
  else
  {
    v4 = 3;
  }

  return v4;
}

void __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void (**v5)(id, id, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "progressHandler");
  v5 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4, *(_QWORD *)(a1 + 40));

}

void __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FCMyArticlesTiming *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = a2;
  v7 = a3;
  v34 = a4;
  v8 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "shortOperationDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2048;
    v40 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu unique feed items", buf, 0x16u);

  }
  v12 = (void *)MEMORY[0x1E0CB3588];
  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "operationStartTime", v34);
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fc_safeDateIntervalWithStartDate:endDate:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [FCMyArticlesTiming alloc];
  objc_msgSend(*(id *)(a1 + 40), "networkEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  if (!v19)
  {
    v20 = 0.0;
    if (!v17)
      goto LABEL_6;
    goto LABEL_5;
  }
  v20 = *(double *)(v19 + 472);
  if (v17)
  {
LABEL_5:
    v21 = (void *)MEMORY[0x1E0C9AA60];
    v22 = MEMORY[0x1E0C9AA60];
    v23 = v18;
    objc_msgSend(v16, "duration");
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0CB3588];
    objc_msgSend(v23, "fc_arrayByTransformingWithBlock:", &__block_literal_global_129);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "fc_durationOfDateIntervalsIgnoringOverlap:", v27);
    v29 = v28;
    v30 = (void *)MEMORY[0x1E0CB3588];
    objc_msgSend(v21, "fc_arrayByTransformingWithBlock:", &__block_literal_global_130);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "fc_durationOfDateIntervalsIgnoringOverlap:", v31);
    v17 = -[FCMyArticlesTiming initWithTotalTime:feedsNetworkTime:evergreenNetworkTime:scoringTime:](v17, "initWithTotalTime:feedsNetworkTime:evergreenNetworkTime:scoringTime:", v25, v29, v32, v20);

    v19 = *(_QWORD *)(a1 + 32);
  }
LABEL_6:
  v33 = *(void **)(v19 + 448);
  *(_QWORD *)(v19 + 448) = v17;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "setRequestCompletionHandler:", 0);

}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (FCForYouQuerySidecar)sidecar
{
  return self->_sidecar;
}

- (void)setSidecar:(id)a3
{
  objc_storeStrong((id *)&self->_sidecar, a3);
}

- (BOOL)includeEvergreenFeedItems
{
  return self->_includeEvergreenFeedItems;
}

- (void)setIncludeEvergreenFeedItems:(BOOL)a3
{
  self->_includeEvergreenFeedItems = a3;
}

- (int64_t)binOverride
{
  return self->_binOverride;
}

- (void)setBinOverride:(int64_t)a3
{
  self->_binOverride = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)feedItemCompletionBlock
{
  return self->_feedItemCompletionBlock;
}

- (void)setFeedItemCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (unint64_t)maxNumberOfFeedsToQuery
{
  return self->_maxNumberOfFeedsToQuery;
}

- (void)setMaxNumberOfFeedsToQuery:(unint64_t)a3
{
  self->_maxNumberOfFeedsToQuery = a3;
}

- (unint64_t)perFeedLimit
{
  return self->_perFeedLimit;
}

- (void)setPerFeedLimit:(unint64_t)a3
{
  self->_perFeedLimit = a3;
}

- (FCMyArticlesTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong(&self->_feedItemCompletionBlock, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
