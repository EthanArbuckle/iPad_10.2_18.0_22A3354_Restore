@implementation FCTodayFeedConfigOperation

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  -[FCTodayFeedConfigOperation parentNetworkActivity](self, "parentNetworkActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[FCNetworkActivity activityWithLabel:](FCNetworkActivity, "activityWithLabel:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTodayFeedConfigOperation parentNetworkActivity](self, "parentNetworkActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParentActivity:", v5);

    objc_msgSend(v4, "startActivity");
    -[FCTodayFeedConfigOperation setNetworkActivity:](self, "setNetworkActivity:", v4);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTodayFeedConfigOperation _fetchFromCK](self, "_fetchFromCK");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke;
  v27[3] = &unk_1E463AD10;
  v27[4] = self;
  v28 = v6;
  v10 = v6;
  v11 = (id)objc_msgSend(v7, "alwaysOn:always:", v8, v27);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTodayFeedConfigOperation _fetchFromNewsEdge](self, "_fetchFromNewsEdge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_10;
  v25[3] = &unk_1E463AD10;
  v25[4] = self;
  v26 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v13, "alwaysOn:always:", v14, v25);

  zalgo();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_11;
  v23[3] = &unk_1E4644060;
  v23[4] = self;
  v24 = v13;
  v18 = v13;
  v19 = (id)objc_msgSend(v7, "thenOn:then:", v17, v23);

  zalgo();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_17;
  v22[3] = &unk_1E463EA38;
  v22[4] = self;
  v21 = (id)objc_msgSend(v7, "errorOn:error:", v20, v22);

}

- (id)_fetchFromNewsEdge
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke;
  v5[3] = &unk_1E463DAD0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithResolver:", v5);
}

- (id)_fetchFromCK
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke;
  v5[3] = &unk_1E463DAD0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithResolver:", v5);
}

- (void)setCachePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

uint64_t __46__FCTodayFeedConfigOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timeoutAfter:", *(double *)(a1 + 40));
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FCTodayFeedConfigOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Today feed config operation must have a context"));
    v12 = 136315906;
    v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    v16 = 1024;
    v17 = 127;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCTodayFeedConfigOperation appConfig](self, "appConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Today feed config operation must have an app config"));
    v12 = 136315906;
    v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    v16 = 1024;
    v17 = 131;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  -[FCTodayFeedConfigOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Today feed config operation must have a request"));
    v12 = 136315906;
    v13 = "-[FCTodayFeedConfigOperation validateOperation]";
    v14 = 2080;
    v15 = "FCTodayFeedConfigOperation.m";
    v16 = 1024;
    v17 = 135;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCNewsAppConfiguration)appConfig
{
  return self->_appConfig;
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCRecordChainFetchOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _BYTE location[12];
  __int16 v32;
  void *v33;
  const __CFString *v34;
  _QWORD v35[2];
  const __CFString *v36;
  _QWORD v37[5];
  _QWORD v38[6];

  v38[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCRecordChainFetchOperation);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v7, "setContext:", v8);

  objc_msgSend(*(id *)(a1 + 32), "cachePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePolicy:](v7, "setCachePolicy:", v9);

  +[FCEdgeCacheHint edgeCacheHintForForYouConfig](FCEdgeCacheHint, "edgeCacheHintForForYouConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setEdgeCacheHint:](v7, "setEdgeCacheHint:", v10);

  -[FCRecordChainFetchOperation setNetworkEventType:](v7, "setNetworkEventType:", 14);
  objc_msgSend(*(id *)(a1 + 32), "networkActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2;
    v29[3] = &unk_1E46440B0;
    objc_copyWeak(&v30, (id *)location);
    -[FCRecordChainFetchOperation setNetworkActivityBlock:](v7, "setNetworkActivityBlock:", v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_3;
  v28[3] = &unk_1E463AA30;
  v28[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v7, "setTopLevelRecordIDs:", v13);

  v37[0] = CFSTR("ForYouConfig");
  v36 = CFSTR("todayFeedTopStoriesArticleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  v37[1] = CFSTR("Article");
  v35[0] = CFSTR("sourceChannelTagID");
  v35[1] = CFSTR("parentIssueID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v15;
  v37[2] = CFSTR("ArticleList");
  v34 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v16;
  v37[3] = CFSTR("Tag");
  v37[4] = CFSTR("Issue");
  v38[3] = MEMORY[0x1E0C9AA60];
  v38[4] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v7, "setLinkKeysByRecordType:", v17);

  v18 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(void **)(a1 + 32);
    v20 = v18;
    objc_msgSend(v19, "shortOperationDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation topLevelRecordIDs](v7, "topLevelRecordIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v21;
    v32 = 2114;
    v33 = v22;
    _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch config from CK with top-level record IDs: %{public}@", location, 0x16u);

  }
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_26;
  v25[3] = &unk_1E46440D8;
  v25[4] = *(_QWORD *)(a1 + 32);
  v26 = v6;
  v27 = v5;
  v23 = v5;
  v24 = v6;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v7, "setRecordChainCompletionHandler:", v25);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7);
  -[FCOperation start](v7, "start");

}

void __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  _QWORD v34[6];
  _QWORD v35[6];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "todayFeedConfigRequestsEnabled");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appConfigurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE66D718))
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      v28 = v13;
      objc_msgSend(v14, "networkActivity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_initWeak(location, *(id *)(a1 + 32));
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_80;
        aBlock[3] = &unk_1E4644100;
        objc_copyWeak(&v33, location);
        v26 = _Block_copy(aBlock);
        objc_destroyWeak(&v33);
        objc_destroyWeak(location);
      }
      else
      {
        v26 = 0;
      }
      v16 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(a1 + 32);
        v18 = v16;
        objc_msgSend(v17, "shortOperationDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v19;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch config from News Edge", (uint8_t *)location, 0xCu);

      }
      FCDispatchQueueForQualityOfService(objc_msgSend(*(id *)(a1 + 32), "qualityOfService", v26));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "feedType");
      objc_msgSend(*(id *)(a1 + 32), "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "formatVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cachePolicy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_83;
      v29[3] = &unk_1E4644128;
      v29[4] = *(_QWORD *)(a1 + 32);
      v30 = v6;
      v31 = v5;
      objc_msgSend(v28, "fetchTodayFeedConfigurationIfNeededWithCompletionQueue:feedType:formatVersion:cachePolicy:networkActivityBlock:completion:", v20, v22, v24, v25, v27, v29);

    }
    else
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_79;
      v34[3] = &unk_1E463B790;
      v34[4] = *(_QWORD *)(a1 + 32);
      v34[5] = v5;
      __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_79((uint64_t)v34);
    }

  }
  else
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2;
    v35[3] = &unk_1E463B790;
    v35[4] = *(_QWORD *)(a1 + 32);
    v35[5] = v5;
    __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2((uint64_t)v35);
  }

}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

id __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[FCNetworkActivity activityWithLabel:](FCNetworkActivity, "activityWithLabel:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "networkActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setParentActivity:", v3);

  return v2;
}

- (FCTodayFeedConfigRequest)request
{
  return self->_request;
}

- (void)setResultCKRecordsByType:(id)a3
{
  objc_storeStrong((id *)&self->_resultCKRecordsByType, a3);
}

- (void)setResultCKConfigData:(id)a3
{
  objc_storeStrong((id *)&self->_resultCKConfigData, a3);
}

id __46__FCTodayFeedConfigOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setResultNewsEdgeConfigData:", v3);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return v3;
}

- (void)setResultNewsEdgeConfigData:(id)a3
{
  objc_storeStrong((id *)&self->_resultNewsEdgeConfigData, a3);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  FCTodayFeedConfigResponse *v5;
  FCTodayFeedConfigResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCTodayFeedConfigResponse *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  FCTodayFeedConfigOperation *v21;
  FCTodayFeedConfigResponse *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *(*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [FCTodayFeedConfigResponse alloc];
    -[FCTodayFeedConfigOperation resultCKConfigData](self, "resultCKConfigData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTodayFeedConfigOperation resultCKRecordsByType](self, "resultCKRecordsByType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTodayFeedConfigOperation resultNewsEdgeConfigData](self, "resultNewsEdgeConfigData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FCTodayFeedConfigResponse initWithCKConfigData:ckRecordsByType:newsEdgeConfigData:](v6, "initWithCKConfigData:ckRecordsByType:newsEdgeConfigData:", v7, v8, v9);

  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__32;
  v29 = __Block_byref_object_dispose__32;
  v30 = 0;
  -[FCTodayFeedConfigOperation completionLock](self, "completionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke;
  v20 = &unk_1E463DF40;
  v21 = self;
  v11 = v5;
  v22 = v11;
  v12 = v4;
  v23 = v12;
  v24 = &v25;
  objc_msgSend(v10, "performWithLockSync:", &v17);

  -[FCTodayFeedConfigOperation networkActivity](self, "networkActivity", v17, v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FCTodayFeedConfigOperation networkActivity](self, "networkActivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "completeActivityWithSuccess:", v4 == 0);

    -[FCTodayFeedConfigOperation parentNetworkActivity](self, "parentNetworkActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completeActivityWithSuccess:", v4 == 0);

  }
  -[FCTodayFeedConfigOperation reusableCompletionHandler](self, "reusableCompletionHandler");
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v16[2](v16, v26[5]);

  _Block_object_dispose(&v25, 8);
}

uint64_t __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (id)reusableCompletionHandler
{
  return self->_reusableCompletionHandler;
}

- (NSData)resultNewsEdgeConfigData
{
  return self->_resultNewsEdgeConfigData;
}

- (NSDictionary)resultCKRecordsByType
{
  return self->_resultCKRecordsByType;
}

- (NSData)resultCKConfigData
{
  return self->_resultCKConfigData;
}

- (NFUnfairLock)completionLock
{
  return self->_completionLock;
}

void __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__FCTodayFeedConfigOperation_operationWillFinishWithError___block_invoke_2;
  v7[3] = &unk_1E4644088;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setReusableCompletionHandler:", v7);
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 368));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = 0;

}

- (void)setReusableCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_26(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  FCTodayFeedConfigCKResult *v8;
  id v9;
  _QWORD v10[7];

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_27;
    v10[3] = &unk_1E463CCB8;
    v7 = a1[5];
    v10[4] = a1[4];
    v10[5] = v5;
    v10[6] = v7;
    __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_27(v10);
  }
  else
  {
    v8 = -[FCTodayFeedConfigCKResult initWithRecordsByType:]([FCTodayFeedConfigCKResult alloc], "initWithRecordsByType:", v9);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (FCTodayFeedConfigOperation)initWithContext:(id)a3 appConfig:(id)a4 request:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCTodayFeedConfigOperation *v12;
  FCTodayFeedConfigOperation *v13;
  uint64_t v14;
  FCTodayFeedConfigRequest *request;
  uint64_t v16;
  NFUnfairLock *completionLock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCTodayFeedConfigOperation;
  v12 = -[FCOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_appConfig, a4);
    v14 = objc_msgSend(v11, "copy");
    request = v13->_request;
    v13->_request = (FCTodayFeedConfigRequest *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    completionLock = v13->_completionLock;
    v13->_completionLock = (NFUnfairLock *)v16;

  }
  return v13;
}

id __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_80(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D86F68];
  objc_msgSend(WeakRetained, "networkActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityWithDomain:label:parentToken:", 54, 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__FCTodayFeedConfigOperation_performOperation__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v3 = a2;
  objc_msgSend(v3, "recordsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResultCKRecordsByType:", v4);

  objc_msgSend(v3, "configData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setResultCKConfigData:", v5);
  objc_msgSend(*(id *)(a1 + 32), "appConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "todayFeedConfigEndpointTimeoutAfterCK");
  v8 = v7;

  v9 = MEMORY[0x1E0C809B0];
  v10 = (void *)MEMORY[0x1E0D60AF0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_2;
  v19[3] = &unk_1E4640CD0;
  v20 = *(id *)(a1 + 40);
  v21 = v8;
  objc_msgSend(v10, "firstly:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_3;
  v18[3] = &unk_1E4644038;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "thenOn:then:", v12, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __46__FCTodayFeedConfigOperation_performOperation__block_invoke_4;
  v17[3] = &unk_1E463EA38;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "errorOn:error:", v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fc_timeIntervalUntilNow");
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = (unint64_t)(fmax(v6, 0.0) * 1000.0);
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums fetching config from CK", (uint8_t *)&v7, 0x16u);

  }
}

- (id)fetchCompletionHandler
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *(*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__32;
  v11 = __Block_byref_object_dispose__32;
  v12 = 0;
  -[FCTodayFeedConfigOperation completionLock](self, "completionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__FCTodayFeedConfigOperation_fetchCompletionHandler__block_invoke;
  v6[3] = &unk_1E463AD80;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithLockSync:", v6);

  v4 = _Block_copy((const void *)v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__FCTodayFeedConfigOperation_fetchCompletionHandler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 368));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setFetchCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[FCTodayFeedConfigOperation completionLock](self, "completionLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__FCTodayFeedConfigOperation_setFetchCompletionHandler___block_invoke;
  v8[3] = &unk_1E4644010;
  v8[4] = self;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performWithLockSync:", v8);

  if (*((_BYTE *)v12 + 24))
  {
    -[FCTodayFeedConfigOperation reusableCompletionHandler](self, "reusableCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v6);

  }
  _Block_object_dispose(&v11, 8);

}

void __56__FCTodayFeedConfigOperation_setFetchCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "reusableCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v3 = _Block_copy(*(const void **)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 368);
    *(_QWORD *)(v4 + 368) = v3;

  }
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fc_timeIntervalUntilNow");
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = (unint64_t)(fmax(v6, 0.0) * 1000.0);
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums fetching config from News Edge", (uint8_t *)&v7, 0x16u);

  }
}

void __46__FCTodayFeedConfigOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0D60B28]))
    goto LABEL_5;
  v5 = objc_msgSend(v3, "code");
  v6 = *MEMORY[0x1E0D60B30];

  if (v5 == v6)
  {
    v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v4 = v7;
      objc_msgSend(v8, "shortOperationDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timed out waiting for config from News Edge, falling back to CK", (uint8_t *)&v10, 0xCu);

LABEL_5:
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);

}

uint64_t __46__FCTodayFeedConfigOperation_performOperation__block_invoke_17(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

void __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forYouConfigID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalRecordIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

}

uint64_t __42__FCTodayFeedConfigOperation__fetchFromCK__block_invoke_2_27(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered error fetching config from CK: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip News Edge because it's disabled in the app config", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip News Edge because there's no config manager", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_83(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[7];

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_84;
    v7[3] = &unk_1E463CCB8;
    v5 = a1[5];
    v7[4] = a1[4];
    v7[5] = v4;
    v7[6] = v5;
    __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_84(v7);
  }
  else
  {
    (*(void (**)(_QWORD))(a1[6] + 16))(a1[6]);
  }

}

uint64_t __48__FCTodayFeedConfigOperation__fetchFromNewsEdge__block_invoke_2_84(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered error fetching config from News Edge: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (FCNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (void)setParentNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_parentNetworkActivity, a3);
}

- (FCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_resultNewsEdgeConfigData, 0);
  objc_storeStrong((id *)&self->_resultCKRecordsByType, 0);
  objc_storeStrong((id *)&self->_resultCKConfigData, 0);
  objc_storeStrong((id *)&self->_appConfig, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_reusableCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionLock, 0);
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
