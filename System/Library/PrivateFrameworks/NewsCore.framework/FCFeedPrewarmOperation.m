@implementation FCFeedPrewarmOperation

FCFeedDatabaseLookup *__42__FCFeedPrewarmOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCFeedDatabaseLookup *v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;

  v2 = a2;
  v3 = objc_alloc_init(FCFeedDatabaseLookup);
  objc_msgSend(v2, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_setProperty_nonatomic_copy(v3, v4, v5, 16);

  objc_msgSend(v2, "feedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_setProperty_nonatomic_copy(v3, v7, v6, 24);

  return v3;
}

void __42__FCFeedPrewarmOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "top");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bottom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v8, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  +[FCCKOrderFeedUtilities orderFeedRequestForFeedID:feedRange:](FCCKOrderFeedUtilities, "orderFeedRequestForFeedID:feedRange:", v6, v16);
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "feedIDsByCKFeedID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = (void *)v11[1];
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v12, "setObject:forKey:", v6, v14);

  objc_msgSend(*(id *)(a1 + 32), "requestRangeByFeedID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
}

- (NSMutableDictionary)requestRangeByFeedID
{
  return self->_requestRangeByFeedID;
}

- (NSMutableDictionary)feedIDsByCKFeedID
{
  return self->_feedIDsByCKFeedID;
}

- (FCFeedPrewarmOperation)initWithPrewarmRequest:(id)a3 contentContext:(id)a4
{
  id v7;
  id v8;
  FCFeedPrewarmOperation *v9;
  FCFeedPrewarmOperation *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *feedIDsByCKFeedID;
  NSMutableDictionary *v13;
  NSMutableDictionary *requestRangeByFeedID;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCFeedPrewarmOperation;
  v9 = -[FCOperation init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prewarmRequest, a3);
    objc_storeStrong((id *)&v10->_contentContext, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    feedIDsByCKFeedID = v10->_feedIDsByCKFeedID;
    v10->_feedIDsByCKFeedID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestRangeByFeedID = v10->_requestRangeByFeedID;
    v10->_requestRangeByFeedID = v13;

  }
  return v10;
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
  uint64_t v10;
  id v11;
  FCCKBatchedOrderFeedQueryOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  SEL v45;
  SEL v46;
  NFPromise *queryCompletionPromise;
  NFPromise *v48;
  id v49;
  NFPromise *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  NFPromise *v55;
  FCFeedPrewarmOperation *v56;
  uint64_t newValue;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  FCFeedPrewarmOperation *v61;
  _QWORD v62[5];
  _QWORD v63[5];
  id v64;

  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedPrewarmOperation contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalContentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_2;
  v63[3] = &unk_1E463D440;
  v63[4] = self;
  v11 = v6;
  v64 = v11;
  -[FCFeedDatabase enumerateRangesMissingFromLookups:visitor:]((uint64_t)v9, v5, v63);

  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc_init(FCCKBatchedOrderFeedQueryOperation);
    -[FCFeedPrewarmOperation contentContext](self, "contentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "internalContentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKBatchedOrderFeedQueryOperation setDatabase:]((uint64_t)v12, v15);

    if (v12)
    {
      objc_setProperty_nonatomic_copy(v12, v16, v11, 376);
      v12->_resultsLimit = 4000;
    }
    v17 = (void *)MEMORY[0x1E0D626D0];
    -[FCFeedPrewarmOperation contentContext](self, "contentContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "internalContentContext");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "articleRecordSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keysForFeedItemAndArticleRecordWithRecordSource:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v23, "options");

    v52 = v5;
    if ((v19 & 2) != 0)
    {
      -[FCFeedPrewarmOperation contentContext](self, "contentContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "internalContentContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "articleRecordSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "desiredKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v28;
    }
    -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest", v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "options");

    if ((v30 & 4) != 0)
    {
      -[FCFeedPrewarmOperation contentContext](self, "contentContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "internalContentContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "tagRecordSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "desiredKeys");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addObject:", CFSTR("sourceChannelTagID"));
      v21 = (void *)v35;
    }
    -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "options");

    if ((v37 & 8) != 0)
    {
      -[FCFeedPrewarmOperation contentContext](self, "contentContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "internalContentContext");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "issueRecordSource");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "desiredKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v42);
      v43 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addObject:", CFSTR("parentIssueID"));
      v21 = (void *)v43;
    }
    v5 = v53;
    v44 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      objc_setProperty_nonatomic_copy(v12, v38, v21, 384);
      objc_setProperty_nonatomic_copy(v12, v45, v22, 408);
      newValue = v44;
      v58 = 3221225472;
      v59 = __42__FCFeedPrewarmOperation_performOperation__block_invoke_5;
      v60 = &unk_1E463D468;
      v61 = self;
      objc_setProperty_nonatomic_copy(v12, v46, &newValue, 432);
      queryCompletionPromise = v12->_queryCompletionPromise;
    }
    else
    {
      queryCompletionPromise = 0;
      newValue = MEMORY[0x1E0C809B0];
      v58 = 3221225472;
      v59 = __42__FCFeedPrewarmOperation_performOperation__block_invoke_5;
      v60 = &unk_1E463D468;
      v61 = self;
    }
    v48 = queryCompletionPromise;
    v49 = objc_alloc(MEMORY[0x1E0D60AD0]);
    v54[0] = v44;
    v54[1] = 3221225472;
    v54[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_6;
    v54[3] = &unk_1E463D4B8;
    v55 = v48;
    v56 = self;
    v50 = v48;
    v51 = (void *)objc_msgSend(v49, "initWithConstructor:", v54);
    -[FCFeedPrewarmOperation setLazyResultPromise:](self, "setLazyResultPromise:", v51);

    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v12);
    -[FCOperation start](v12, "start");

  }
  else
  {
    v62[0] = v10;
    v62[1] = 3221225472;
    v62[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_3;
    v62[3] = &unk_1E463AB18;
    v62[4] = self;
    __42__FCFeedPrewarmOperation_performOperation__block_invoke_3((uint64_t)v62);
  }

}

- (FCFeedPrewarmRequest)prewarmRequest
{
  return self->_prewarmRequest;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setLazyResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_lazyResultPromise, a3);
}

- (void)commitResultsOnceWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCOperation startIfNeeded](self, "startIfNeeded");
  -[FCFeedPrewarmOperation lazyResultPromise](self, "lazyResultPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("lazy result promise should be created as soon as the operation starts"));
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCFeedPrewarmOperation commitResultsOnceWithCompletionHandler:]";
    v22 = 2080;
    v23 = "FCFeedPrewarmOperation.m";
    v24 = 1024;
    v25 = 65;
    v26 = 2114;
    v27 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E463D3A8;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E463D3D0;
  v9 = v4;
  v18 = v9;
  objc_msgSend(v7, "thenOn:then:", v8, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E463D3F8;
  v15[4] = self;
  v16 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v10, "errorOn:error:", v11, v15);

}

id __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "lazyResultPromise");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

void __65__FCFeedPrewarmOperation_commitResultsOnceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  FCFeedPrewarmResult *v3;
  void *v4;
  FCFeedPrewarmResult *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = [FCFeedPrewarmResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "prewarmRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCFeedPrewarmResult initWithSuccessfulRequests:failedRequests:](v3, "initWithSuccessfulRequests:failedRequests:", MEMORY[0x1E0C9AA60], v4);
  (*(void (**)(uint64_t, FCFeedPrewarmResult *))(v2 + 16))(v2, v5);

}

void __42__FCFeedPrewarmOperation_performOperation__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_16_0);
  objc_msgSend(*(id *)(a1 + 32), "setLazyResultPromise:", v2);

}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_4()
{
  id v0;
  FCFeedPrewarmResult *v1;
  FCFeedPrewarmResult *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v1 = [FCFeedPrewarmResult alloc];
  v2 = -[FCFeedPrewarmResult initWithSuccessfulRequests:failedRequests:](v1, "initWithSuccessfulRequests:failedRequests:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_msgSend(v0, "initWithValue:", v2);

  return v3;
}

uint64_t __42__FCFeedPrewarmOperation_performOperation__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0D60AF0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_7;
  v9[3] = &unk_1E463D3A8;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "firstly:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __42__FCFeedPrewarmOperation_performOperation__block_invoke_8;
  v8[3] = &unk_1E463D490;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "thenOn:then:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __42__FCFeedPrewarmOperation_performOperation__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A8580B64]();
  objc_msgSend(*(id *)(a1 + 32), "_commitQueryResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (id)_commitQueryResult:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  FCFeedPrewarmResult *v76;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[4];
  id v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v95 = v7;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will commit query response to database", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = objc_claimAutoreleasedReturnValue();
  -[FCFeedPrewarmOperation feedIDsByCKFeedID](self, "feedIDsByCKFeedID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedPrewarmOperation requestRangeByFeedID](self, "requestRangeByFeedID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = (void *)v4[2];
  else
    v11 = 0;
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke;
  v92[3] = &unk_1E463D4E0;
  v14 = v9;
  v93 = v14;
  objc_msgSend(v12, "fc_dictionaryWithKeyBlock:valueBlock:", v92, &__block_literal_global_25_0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v16 = (void *)v4[1];
  else
    v16 = 0;
  v17 = v16;
  v90[0] = v13;
  v90[1] = 3221225472;
  v90[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3;
  v90[3] = &unk_1E463D528;
  v90[4] = self;
  v18 = v14;
  v91 = v18;
  objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v90);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138543618;
    v95 = v21;
    v96 = 2048;
    v97 = v22;
    _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums creating feed items", buf, 0x16u);

  }
  v80 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedPrewarmOperation contentContext](self, "contentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "internalContentContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "feedDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedDatabase saveFeedItems:feedIDs:extentByFeedID:requestRangeByFeedID:]((uint64_t)v26, v83, v27, v82, v10);

  v28 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v23, "fc_millisecondTimeIntervalUntilNow");
    v32 = objc_msgSend(v83, "count");
    *(_DWORD *)buf = 138543874;
    v95 = v30;
    v96 = 2048;
    v97 = v31;
    v98 = 2048;
    v99 = v32;
    _os_log_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ spent %llums saving %lu feed items", buf, 0x20u);

  }
  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "options");

  if ((v34 & 2) != 0)
  {
    -[FCFeedPrewarmOperation contentContext](self, "contentContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "internalContentContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "articleRecordSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v38 = (void *)v4[1];
    else
      v38 = 0;
    v39 = v38;
    v40 = (id)objc_msgSend(v37, "saveArticleRecords:", v39);

  }
  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "options");

  if ((v42 & 4) != 0)
  {
    -[FCFeedPrewarmOperation contentContext](self, "contentContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "internalContentContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "tagRecordSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v46 = (void *)v4[3];
    else
      v46 = 0;
    v47 = v46;
    v48 = (id)objc_msgSend(v45, "saveTagRecords:", v47);

  }
  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "options");

  if ((v50 & 8) != 0)
  {
    -[FCFeedPrewarmOperation contentContext](self, "contentContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "internalContentContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "issueRecordSource");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v54 = (void *)v4[4];
    else
      v54 = 0;
    v55 = v54;
    v56 = (id)objc_msgSend(v53, "saveRecords:", v55);

  }
  v81 = v10;
  v57 = (void *)MEMORY[0x1E0C99E60];
  v79 = v23;
  v58 = (void *)v8;
  if (v4)
    v59 = (void *)v4[2];
  else
    v59 = 0;
  v60 = v59;
  v61 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_29;
  v88[3] = &unk_1E463D550;
  v78 = v18;
  v89 = v78;
  objc_msgSend(v60, "fc_arrayByTransformingWithBlock:", v88);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setWithArray:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "feedRequests");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v61;
  v86[1] = 3221225472;
  v86[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2_30;
  v86[3] = &unk_1E463D578;
  v66 = v63;
  v87 = v66;
  objc_msgSend(v65, "fc_arrayOfObjectsPassingTest:", v86);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCFeedPrewarmOperation prewarmRequest](self, "prewarmRequest");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "feedRequests");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v61;
  v84[1] = 3221225472;
  v84[2] = __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3_32;
  v84[3] = &unk_1E463D578;
  v70 = v66;
  v85 = v70;
  objc_msgSend(v69, "fc_arrayOfObjectsPassingTest:", v84);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v73 = v72;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v58, "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138543618;
    v95 = v74;
    v96 = 2048;
    v97 = v75;
    _os_log_impl(&dword_1A1B90000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ did commit query response to database, total time = %llums", buf, 0x16u);

  }
  v76 = -[FCFeedPrewarmResult initWithSuccessfulRequests:failedRequests:]([FCFeedPrewarmResult alloc], "initWithSuccessfulRequests:failedRequests:", v67, v71);

  return v76;
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 32);
  else
    v2 = 0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0D626D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "contentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentStoreFrontID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalContentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "articleRecordSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedItemFromCKRecord:storefrontID:recordSource:", v5, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v11, "feedID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFeedID:", v14);

  return v11;
}

id __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (!*((_BYTE *)v3 + 10))
  {
    v6 = (void *)*((_QWORD *)v3 + 2);
LABEL_5:
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_2_30(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "feedID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __45__FCFeedPrewarmOperation__commitQueryResult___block_invoke_3_32(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "feedID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (NFLazy)lazyResultPromise
{
  return self->_lazyResultPromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyResultPromise, 0);
  objc_storeStrong((id *)&self->_requestRangeByFeedID, 0);
  objc_storeStrong((id *)&self->_feedIDsByCKFeedID, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_prewarmRequest, 0);
}

@end
