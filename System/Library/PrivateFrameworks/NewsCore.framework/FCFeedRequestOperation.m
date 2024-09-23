@implementation FCFeedRequestOperation

+ (id)feedRequestContentEnvironmentTokenWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentContext");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFeedRequestOperation feedRequestContentEnvironmentTokenWithContext:]";
    v13 = 2080;
    v14 = "FCFeedRequestOperation.m";
    v15 = 1024;
    v16 = 89;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "contentEnvironmentToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%zd"), v5, objc_msgSend(v7, "endpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FCFeedRequestOperation)init
{
  FCFeedRequestOperation *v2;
  NSMutableSet *v3;
  NSMutableSet *progressReportedFeedItems;
  NSMutableDictionary *v5;
  NSMutableDictionary *resultFeedResponses;
  NSMutableArray *v7;
  NSMutableArray *mutableNetworkEvents;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCFeedRequestOperation;
  v2 = -[FCOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    progressReportedFeedItems = v2->_progressReportedFeedItems;
    v2->_progressReportedFeedItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultFeedResponses = v2->_resultFeedResponses;
    v2->_resultFeedResponses = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableNetworkEvents = v2->_mutableNetworkEvents;
    v2->_mutableNetworkEvents = v7;

    v2->_queryBudget = 10;
  }
  return v2;
}

- (BOOL)validateOperation
{
  FCFeedRequestOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  FCFeedRequestOperation *v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x1E0C80C00];
  -[FCFeedRequestOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed request operation requires a context"));
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    v50 = 1024;
    v51 = 109;
    v52 = 2114;
    v53 = v35;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedRequestOperation configuration](v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed request operation requires a configuration"));
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    v50 = 1024;
    v51 = 110;
    v52 = 2114;
    v53 = v36;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFeedRequestOperation feedRequests](v2, "feedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed request operation requires at least one request"));
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    v50 = 1024;
    v51 = 111;
    v52 = 2114;
    v53 = v37;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[FCFeedRequestOperation feedRequests](v2, "feedRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x1E0C81028];
    v40 = *(_QWORD *)v42;
    v38 = v2;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        objc_msgSend(v12, "feedID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (objc_msgSend(v7, "containsObject:", v13) && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("only one feed request is allowed per feedID and feedID %@ is duplicated"), v13);
            *(_DWORD *)buf = 136315906;
            v47 = "-[FCFeedRequestOperation validateOperation]";
            v48 = 2080;
            v49 = "FCFeedRequestOperation.m";
            v50 = 1024;
            v51 = 125;
            v52 = 2114;
            v53 = v28;
            _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(v7, "addObject:", v13);
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed requests must have a feed ID"));
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          v50 = 1024;
          v51 = 121;
          v52 = 2114;
          v53 = v24;
          _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        objc_msgSend(v12, "feedRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "top");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed requests must have a non-nil range top"));
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          v50 = 1024;
          v51 = 129;
          v52 = 2114;
          v53 = v25;
          _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        objc_msgSend(v12, "feedRange");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bottom");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed requests must have a non-nil range bottom"));
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          v50 = 1024;
          v51 = 130;
          v52 = 2114;
          v53 = v26;
          _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        if (!objc_msgSend(v12, "maxCount") && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("feed requests must have a non-zero max count"));
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          v50 = 1024;
          v51 = 131;
          v52 = 2114;
          v53 = v27;
          _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          if (!v13)
            goto LABEL_44;
        }
        else if (!v13)
        {
          goto LABEL_44;
        }
        objc_msgSend(v12, "feedRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "top");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

LABEL_44:
LABEL_45:
          v30 = 0;
          v2 = v38;
          goto LABEL_46;
        }
        v20 = (void *)v19;
        objc_msgSend(v12, "feedRange");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bottom");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          v23 = objc_msgSend(v12, "maxCount") == 0;
        else
          v23 = 1;

        if (v23)
          goto LABEL_45;
        ++v11;
      }
      while (v9 != v11);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      v9 = v29;
      v30 = 1;
      v2 = v38;
    }
    while (v29);
  }
  else
  {
    v30 = 1;
  }
LABEL_46:

  -[FCFeedRequestOperation context](v2, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[FCFeedRequestOperation configuration](v2, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      -[FCFeedRequestOperation feedRequests](v2, "feedRequests");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v33, "count"))
        v30 = 0;

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[FCFeedRequestOperation feedDatabase](self, "feedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[FCFeedRequestOperation context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalContentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setFeedDatabase:](self, "setFeedDatabase:", v6);

  }
  -[FCFeedRequestOperation feedRequests](self, "feedRequests");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_setByTransformingWithBlock:", &__block_literal_global_110);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_nonExpendableFeedIDs, v7);

}

id __42__FCFeedRequestOperation_prepareOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isExpendable") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "feedID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)performOperation
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  __int128 buf;
  void *v15;
  void *v16;
  FCFeedRequestOperation *v17;
  _QWORD *v18;
  uint64_t v19;

  v3 = MEMORY[0x1E0C809B0];
  v19 = *MEMORY[0x1E0C80C00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__FCFeedRequestOperation_performOperation__block_invoke;
  v13[3] = &unk_1E463AB18;
  v13[4] = self;
  v4 = v13;
  if (self)
  {
    -[FCFeedRequestOperation prewarmRequestKey](self, "prewarmRequestKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        -[FCOperation shortOperationDescription](self, "shortOperationDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait for prewarming to finish", (uint8_t *)&buf, 0xCu);

      }
      -[FCFeedRequestOperation context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "internalContentContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "feedPrewarmer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation prewarmRequestKey](self, "prewarmRequestKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v3;
      *((_QWORD *)&buf + 1) = 3221225472;
      v15 = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_53;
      v16 = &unk_1E4645D68;
      v17 = self;
      v18 = v4;
      objc_msgSend(v11, "finishPrewarmingRequestForKey:completion:", v12, &buf);

    }
    else
    {
      *(_QWORD *)&buf = v3;
      *((_QWORD *)&buf + 1) = 3221225472;
      v15 = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke;
      v16 = &unk_1E463B790;
      v17 = self;
      v18 = v4;
      __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke((uint64_t)&buf);
    }
  }

}

void __42__FCFeedRequestOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  FCCKOrderFeedQueryOperation *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  SEL v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  SEL v44;
  id v45;
  id v46;
  const char *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  id location;
  _QWORD v55[5];
  _BYTE newValue[24];
  __int128 v57;
  id v58;
  id v59;
  _QWORD *v60;
  id v61[2];
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "feedRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_dictionaryWithKeySelector:", sel_feedID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)v2)
    objc_storeStrong((id *)(*(_QWORD *)v2 + 488), v4);

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_2;
  v53[3] = &unk_1E463AA78;
  v53[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v53);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    objc_storeStrong((id *)(v6 + 496), v5);

  objc_msgSend(*(id *)(a1 + 32), "edgeCacheHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  v9 = *(void **)(a1 + 32);
  if (!v8)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_3;
    v52[3] = &unk_1E463EA38;
    v52[4] = v9;
    v10 = v52;
    if (!v9)
    {
LABEL_29:

      return;
    }
    objc_msgSend(v9, "feedRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke;
    v55[3] = &unk_1E4645D40;
    v55[4] = v9;
    objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v55);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(FCCKOrderFeedQueryOperation);
    objc_msgSend(v9, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internalContentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentDatabase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation setDatabase:]((uint64_t)v13, v16);

    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v17, v12, 376);
      -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest]((uint64_t)v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(v13, v19, v18, 416);
    }
    else
    {
      -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest]((uint64_t)v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v9, "edgeCacheHint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_setProperty_nonatomic_copy(v13, v20, v21, 424);

    objc_msgSend(v9, "feedRequests");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count") == 1)
    {
      objc_msgSend(v9, "feedRequests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "maxCount");
      if (!v13)
      {

        goto LABEL_19;
      }
      v13->_resultsLimit = v25;

    }
    else
    {
      if (!v13)
      {

        goto LABEL_19;
      }
      v13->_resultsLimit = 4000;
    }

    v13->_queryPriority = 300;
LABEL_19:
    objc_msgSend(v9, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "internalContentContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contentStoreFrontID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0D626D0];
    objc_msgSend(v30, "articleRecordSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "keysForFeedItemAndArticleRecordWithRecordSource:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "options") & 2) != 0)
    {
      objc_msgSend(v30, "articleRecordSource");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "desiredKeys");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v38;
    }
    if ((objc_msgSend(v9, "options") & 4) != 0)
    {
      objc_msgSend(v30, "tagRecordSource");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "desiredKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v42);
      v43 = objc_claimAutoreleasedReturnValue();

      v62[0] = CFSTR("sourceChannelTagID");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v43;
    }
    else
    {
      v40 = 0;
    }
    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v39, v35, 384);
      objc_setProperty_nonatomic_copy(v13, v44, v40, 408);
    }
    objc_initWeak(&location, v13);
    *(_QWORD *)newValue = MEMORY[0x1E0C809B0];
    *(_QWORD *)&newValue[8] = 3221225472;
    *(_QWORD *)&newValue[16] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_2;
    *(_QWORD *)&v57 = &unk_1E4645DE0;
    *((_QWORD *)&v57 + 1) = v9;
    objc_copyWeak(v61, &location);
    v45 = v30;
    v58 = v45;
    v46 = v32;
    v59 = v46;
    v60 = v10;
    if (v13)
      objc_setProperty_nonatomic_copy(v13, v47, newValue, 440);
    objc_msgSend(v9, "associateChildOperation:", v13);
    -[FCOperation start](v13, "start");

    objc_destroyWeak(v61);
    objc_destroyWeak(&location);

    goto LABEL_29;
  }
  objc_msgSend(*(id *)(a1 + 32), "feedDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "endpoint") == 1;

  if (v27)
  {
    v28 = *(void **)(a1 + 32);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_4;
    v51[3] = &unk_1E463EA38;
    v51[4] = v28;
    -[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:](v28, v51);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MultiFeed is no longer supported"));
      *(_DWORD *)newValue = 136315906;
      *(_QWORD *)&newValue[4] = "-[FCFeedRequestOperation performOperation]_block_invoke";
      *(_WORD *)&newValue[12] = 2080;
      *(_QWORD *)&newValue[14] = "FCFeedRequestOperation.m";
      *(_WORD *)&newValue[22] = 1024;
      LODWORD(v57) = 190;
      WORD2(v57) = 2114;
      *(_QWORD *)((char *)&v57 + 6) = v50;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", newValue, 0x26u);

    }
    v48 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "finishedPerformingOperationWithError:", v49);

  }
}

void __42__FCFeedRequestOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  FCFeedDatabaseLookup *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  SEL v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "feedRequests", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = objc_alloc_init(FCFeedDatabaseLookup);
        objc_msgSend(v9, "feedID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_setProperty_nonatomic_copy(v10, v11, v12, 16);

        objc_msgSend(v9, "feedRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13;
        if (v10)
        {
          objc_setProperty_nonatomic_copy(v10, v14, v13, 24);

          v10->_maxCount = objc_msgSend(v9, "maxCount");
          v10->_cachedOnly = objc_msgSend(v9, "cachedOnly");
          objc_msgSend(v9, "requiredFeature");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_nonatomic_copy(v10, v17, v16, 40);
        }
        else
        {

          objc_msgSend(v9, "maxCount");
          objc_msgSend(v9, "cachedOnly");
          objc_msgSend(v9, "requiredFeature");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v9, "feedID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, v18);

        ++v8;
      }
      while (v6 != v8);
      v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v6 = v19;
    }
    while (v19);
  }

}

uint64_t __42__FCFeedRequestOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

uint64_t __42__FCFeedRequestOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)_gatherAllOrderFeedResponsesWithCompletionHandler:(void *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  FCFeedResponse *v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _BOOL8 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  FCCKBatchedOrderFeedQueryOperation *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  SEL v49;
  void *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  SEL v77;
  id v78;
  id v79;
  id v80;
  const char *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id newValue;
  void *v89;
  uint64_t v90;
  id obj;
  uint64_t v92;
  _QWORD v93[5];
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  uint8_t buf[4];
  const char *v107;
  __int16 v108;
  char *v109;
  __int16 v110;
  _QWORD v111[2];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v84 = a2;
  v92 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    newValue = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "feedRequests");
    v3 = objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke;
    v105[3] = &unk_1E4645D40;
    v105[4] = v92;
    objc_msgSend((id)v3, "fc_arrayByTransformingWithBlock:", v105);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend((id)v92, "maxCount") == 0;
    objc_msgSend((id)v92, "feedDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((v3 & 1) != 0)
      -[FCFeedDatabase performDatabaseLookups:](v4, v85);
    else
      -[FCFeedDatabase performDatabaseLookups:boundedByCount:](v4, v85, objc_msgSend((id)v92, "maxCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend((id)v92, "shortOperationDescription");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v83, "fc_millisecondTimeIntervalUntilNow");
      v11 = objc_msgSend(v85, "count");
      *(_DWORD *)buf = 138543874;
      v107 = v9;
      v108 = 2048;
      v109 = (char *)v10;
      v110 = 2048;
      v111[0] = v11;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to lookup %lu feeds in the database", buf, 0x20u);

    }
    objc_msgSend((id)v92, "feedRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (unint64_t)objc_msgSend(v12, "count") < 3;

    if (v13)
    {
      v14 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend((id)v92, "shortOperationDescription");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v107 = v16;
        v108 = 2114;
        v109 = (char *)v85;
        v110 = 2114;
        v111[0] = v6;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ did perform database lookups: %{public}@,\nresults:%{public}@", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v6;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    if (v17)
    {
      v90 = *(_QWORD *)v102;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v102 != v90)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v18);
          objc_msgSend(*(id *)(v92 + 488), "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v92 + 496), "objectForKey:", v19);
          v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "objectForKey:", v19);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            v24 = *(void **)(v22 + 16);
          else
            v24 = 0;
          v25 = v24;
          v26 = objc_msgSend(v25, "count");
          if (!v21 || (v26 < v21[4] ? (v27 = v23 == 0) : (v27 = 1), v27))
          {

LABEL_32:
            v29 = objc_alloc_init(FCFeedResponse);
            -[FCFeedResponse setFeedID:](v29, "setFeedID:", v19);
            if (v23)
            {
              v37 = *(id *)(v23 + 16);
              -[FCFeedResponse setFeedItems:](v29, "setFeedItems:", v37);

              v38 = *(_BYTE *)(v23 + 8) != 0;
            }
            else
            {
              -[FCFeedResponse setFeedItems:](v29, "setFeedItems:", 0);
              v38 = 0;
            }
            -[FCFeedResponse setExhaustedRequestRange:](v29, "setExhaustedRequestRange:", v38);
            objc_msgSend(*(id *)(v92 + 520), "setObject:forKey:", v29, v19);
            if (v23)
              v39 = *(void **)(v23 + 16);
            else
              v39 = 0;
            v30 = v39;
            objc_msgSend(v89, "addObjectsFromArray:", v30);
            goto LABEL_37;
          }
          v28 = *(_QWORD *)(v23 + 40) == 0;

          if (v28)
            goto LABEL_32;
          +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", *(_QWORD *)(v23 + 40), *(_QWORD *)(v23 + 48));
          v29 = (FCFeedResponse *)objc_claimAutoreleasedReturnValue();
          +[FCCKOrderFeedUtilities orderFeedRequestForFeedID:feedRange:](FCCKOrderFeedUtilities, "orderFeedRequestForFeedID:feedRange:", v19, v29);
          v30 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend((id)v92, "maxCount"))
          {
            v31 = v21[4];
            v32 = *(id *)(v23 + 16);
            v33 = objc_msgSend(v32, "count");
            if (v30)
              v30[4] = v31 - v33;

          }
          objc_msgSend(newValue, "addObject:", v30);
          if (v30)
            v34 = (void *)v30[1];
          else
            v34 = 0;
          v35 = v34;
          objc_msgSend(v87, "setObject:forKey:", v20, v35);

          v36 = *(id *)(v23 + 56);
          objc_msgSend(v86, "setObject:forKey:", v36, v19);

LABEL_37:
          ++v18;
        }
        while (v17 != v18);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
        v17 = v40;
      }
      while (v40);
    }

    -[FCFeedRequestOperation _reportProgressWithFeedItems:]((id *)v92, v89);
    if (objc_msgSend(newValue, "count"))
    {
      v41 = *(_QWORD *)(v92 + 504);
      if (v41)
      {
        *(_QWORD *)(v92 + 504) = v41 - 1;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_alloc_init(FCCKBatchedOrderFeedQueryOperation);
        objc_msgSend((id)v92, "context");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "internalContentContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "contentDatabase");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKBatchedOrderFeedQueryOperation setDatabase:]((uint64_t)v43, v46);

        if (v43)
        {
          objc_setProperty_nonatomic_copy(v43, v47, newValue, 376);
          -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest](v92);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_nonatomic_copy(v43, v49, v48, 416);
        }
        else
        {
          -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest](v92);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend((id)v92, "edgeCacheHint");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v50;
        if (v43)
        {
          objc_setProperty_nonatomic_copy(v43, v51, v50, 424);

          v53 = objc_msgSend((id)v92, "relativePriority");
          v54 = 300;
          if (!v53)
            v54 = 200;
          if (v53 == -1)
            v54 = 100;
          v43->_queryPriority = v54;
        }
        else
        {

          objc_msgSend((id)v92, "relativePriority");
        }
        if (objc_msgSend((id)v92, "maxCount"))
        {
          if ((unint64_t)objc_msgSend((id)v92, "maxCount") >= 0x190
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("max count should be reasonable; pass zero if you don't want a limit"));
            *(_DWORD *)buf = 136315906;
            v107 = "-[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:]";
            v108 = 2080;
            v109 = "FCFeedRequestOperation.m";
            v110 = 1024;
            LODWORD(v111[0]) = 577;
            WORD2(v111[0]) = 2114;
            *(_QWORD *)((char *)v111 + 6) = v82;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v55 = objc_msgSend((id)v92, "maxCount");
        }
        else
        {
          v55 = 4000;
        }
        if (v43)
          v43->_resultsLimit = v55;
        objc_msgSend((id)v92, "context");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "internalContentContext");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v92, "context");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "contentStoreFrontID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = (void *)MEMORY[0x1E0D626D0];
        objc_msgSend(v60, "articleRecordSource");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "keysForFeedItemAndArticleRecordWithRecordSource:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)v92, "options") & 2) != 0)
        {
          objc_msgSend(v60, "articleRecordSource");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "desiredKeys");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "arrayByAddingObjectsFromArray:", v68);
          v69 = objc_claimAutoreleasedReturnValue();

          v65 = (void *)v69;
        }
        if ((objc_msgSend((id)v92, "options") & 4) != 0)
        {
          objc_msgSend(v60, "tagRecordSource");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "desiredKeys");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "arrayByAddingObjectsFromArray:", v71);
          v72 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "addObject:", CFSTR("sourceChannelTagID"));
          v65 = (void *)v72;
        }
        if ((objc_msgSend((id)v92, "options") & 8) != 0)
        {
          objc_msgSend(v60, "issueRecordSource");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "desiredKeys");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "arrayByAddingObjectsFromArray:", v75);
          v76 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "addObject:", CFSTR("parentIssueID"));
          v65 = (void *)v76;
        }
        if (v43)
        {
          objc_setProperty_nonatomic_copy(v43, v73, v65, 384);
          objc_setProperty_nonatomic_copy(v43, v77, v66, 408);
        }
        objc_initWeak((id *)buf, v43);
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_70;
        v93[3] = &unk_1E4645DB8;
        v93[4] = v92;
        objc_copyWeak(&v100, (id *)buf);
        v78 = v60;
        v94 = v78;
        v95 = v87;
        v79 = v62;
        v96 = v79;
        v97 = v86;
        v80 = v42;
        v98 = v80;
        v99 = v84;
        if (v43)
          objc_setProperty_nonatomic_copy(v43, v81, v93, 432);
        objc_msgSend((id)v92, "associateChildOperation:", v43);
        -[FCOperation start](v43, "start");

        objc_destroyWeak(&v100);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        v56 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend((id)v92, "errorUserInfo");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "fc_exceededQueryBudgetErrorWithAdditionalUserInfo:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v84 + 2))(v84, v58);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD))v84 + 2))(v84, 0);
    }

  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *resultFeedResponses;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  FCHeldRecords *resultHeldArticleRecords;
  void *v32;
  _BOOL4 v33;
  void *v34;
  FCHeldRecords *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  FCHeldRecords *v39;
  void *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  FCFeedRequestOperation *v48;
  FCHeldRecords *v49;
  BOOL v50;
  FCHeldRecords *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  FCFeedRequestOperation *v56;
  FCHeldRecords *resultHeldTagRecords;
  BOOL v58;
  FCHeldRecords *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  FCHeldRecords *resultHeldIssueRecords;
  FCHeldRecords *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  NSObject *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  void *v100;
  void *v101;
  NSMutableDictionary *v102;
  NSMutableDictionary *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void (**v107)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v108;
  void *v109;
  void (**v110)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v111;
  id v112;
  void *v113;
  void *v114;
  id obj;
  void *v116;
  FCFeedRequestOperation *v117;
  _QWORD v118[5];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[5];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  char *v149;
  __int16 v150;
  _BYTE v151[18];
  __int16 v152;
  void *v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v112 = a3;
  v117 = self;
  if (v112)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    if (self)
      resultFeedResponses = self->_resultFeedResponses;
    else
      resultFeedResponses = 0;
    -[NSMutableDictionary allValues](resultFeedResponses, "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v141;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v141 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
          objc_msgSend(v11, "feedItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            objc_msgSend(v11, "feedItems");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "addObjectsFromArray:", v14);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
      }
      while (v8);
    }

    v15 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[FCOperation shortOperationDescription](v117, "shortOperationDescription");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v116, "count");
      v19 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 138543874;
      v147 = v17;
      v148 = 2048;
      v149 = (char *)v18;
      v150 = 2048;
      *(_QWORD *)v151 = v19;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ gathered %lu feed items from %lu feeds", buf, 0x20u);

    }
    -[FCFeedRequestOperation requestCompletionHandlerWithHeldRecords](v117, "requestCompletionHandlerWithHeldRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (!v21)
    {
      v22 = -[FCFeedRequestOperation options](v117, "options");
      if ((v22 & 0xE) != 0)
      {
        v23 = (void *)objc_opt_new();
        v24 = (void *)objc_opt_new();
        v114 = (void *)objc_opt_new();
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v25 = v116;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v137;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v137 != v27)
                objc_enumerationMutation(v25);
              v29 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v28);
              if ((v22 & 2) != 0)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * v28), "articleID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v117)
                  resultHeldArticleRecords = v117->_resultHeldArticleRecords;
                else
                  resultHeldArticleRecords = 0;
                -[FCHeldRecords recordWithID:](resultHeldArticleRecords, "recordWithID:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v32 == 0;

                if (v33)
                  objc_msgSend(v23, "addObject:", v30);

              }
              if ((v22 & 4) != 0)
              {
                objc_msgSend(v29, "sourceChannelID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  v35 = v117 ? v117->_resultHeldTagRecords : 0;
                  -[FCHeldRecords recordWithID:](v35, "recordWithID:", v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = v36 == 0;

                  if (v37)
                    objc_msgSend(v24, "addObject:", v34);
                }

              }
              if ((v22 & 8) != 0)
              {
                objc_msgSend(v29, "parentIssueID");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  v39 = v117 ? v117->_resultHeldTagRecords : 0;
                  -[FCHeldRecords recordWithID:](v39, "recordWithID:", v38);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v40 == 0;

                  if (v41)
                    objc_msgSend(v114, "addObject:", v38);
                }

              }
              ++v28;
            }
            while (v26 != v28);
            v42 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
            v26 = v42;
          }
          while (v42);
        }

        -[FCFeedRequestOperation context](v117, "context");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "internalContentContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "articleRecordSource");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "cachedRecordsWithIDs:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v117)
        {
          v48 = v117;
          v49 = v117->_resultHeldArticleRecords;
        }
        else
        {
          v49 = 0;
          v48 = 0;
        }
        v50 = v48 == 0;
        v51 = v49;
        +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v51, v47);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedRequestOperation setResultHeldArticleRecords:]((uint64_t)v117, v52);

        objc_msgSend(v44, "tagRecordSource");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allObjects");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "cachedRecordsWithIDs:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          resultHeldTagRecords = 0;
          v56 = v117;
        }
        else
        {
          v56 = v117;
          resultHeldTagRecords = v117->_resultHeldTagRecords;
        }
        v58 = v56 == 0;
        v59 = resultHeldTagRecords;
        +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v59, v55);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedRequestOperation setResultHeldTagRecords:]((uint64_t)v117, v60);

        objc_msgSend(v44, "issueRecordSource");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "allObjects");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "cachedRecordsWithIDs:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
          resultHeldIssueRecords = 0;
        else
          resultHeldIssueRecords = v117->_resultHeldIssueRecords;
        v65 = resultHeldIssueRecords;
        +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v65, v63);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedRequestOperation setResultHeldIssueRecords:]((uint64_t)v117, v66);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v68 = v67;
    v69 = (void *)objc_msgSend(v116, "copy");
    v132 = 0;
    v133 = &v132;
    v134 = 0x2020000000;
    v135 = 1;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    -[FCFeedRequestOperation feedTransformations](v117, "feedTransformations");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v128, v154, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v129;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v129 != v72)
            objc_enumerationMutation(v70);
          v74 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * j);
          objc_opt_class();
          if (v74 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v75 = v74;
            objc_msgSend(v75, "transformFeedItemsWithResults:", v69);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v127[0] = MEMORY[0x1E0C809B0];
            v127[1] = 3221225472;
            v127[2] = __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke;
            v127[3] = &unk_1E4645CF8;
            v127[4] = &v132;
            objc_msgSend(v76, "fc_arrayByTransformingWithBlock:", v127);
            v77 = objc_claimAutoreleasedReturnValue();

            v69 = (void *)v77;
          }
          else
          {
            objc_msgSend(v74, "transformFeedItems:", v69);
            v75 = 0;
            v76 = v69;
            v69 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v128, v154, 16);
      }
      while (v71);
    }

    if (v133[3] != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v79 = v78;
      v80 = (id)FCOperationLog;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        -[FCOperation shortOperationDescription](v117, "shortOperationDescription");
        v81 = (char *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v116, "count");
        v83 = objc_msgSend(v69, "count");
        FCFeedFilterOptionsToNSString(v133[3]);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v147 = v81;
        v148 = 2048;
        v149 = (char *)v82;
        v150 = 2048;
        *(_QWORD *)v151 = v83;
        *(_WORD *)&v151[8] = 2048;
        *(_QWORD *)&v151[10] = (unint64_t)(fmax(v79 - v68, 0.0) * 1000.0);
        v152 = 2114;
        v153 = v84;
        _os_log_impl(&dword_1A1B90000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@ filtered from %lu to %lu feed items, time=%llums, reasons=%{public}@", buf, 0x34u);

      }
    }
    v85 = v69;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v4 = v85;
    v87 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v124;
      do
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v124 != v88)
            objc_enumerationMutation(v4);
          v90 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * k);
          objc_msgSend(v90, "feedID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKeyedSubscript:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v92 == 0;

          if (v93)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v90);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "feedID");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v94, v95);
          }
          else
          {
            objc_msgSend(v90, "feedID");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "objectForKeyedSubscript:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "addObject:", v90);
          }

        }
        v87 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
      }
      while (v87);
    }

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v5 = obj;
    v96 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v119, v144, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v120;
      do
      {
        for (m = 0; m != v96; ++m)
        {
          if (*(_QWORD *)v120 != v97)
            objc_enumerationMutation(v5);
          v99 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * m);
          objc_msgSend(v99, "feedID");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKeyedSubscript:", v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setFeedItems:", v101);

        }
        v96 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v119, v144, 16);
      }
      while (v96);
    }

    _Block_object_dispose(&v132, 8);
    if (v117)
      v102 = v117->_resultFeedResponses;
    else
      v102 = 0;
    v103 = v102;
    v104 = -[NSMutableDictionary count](v103, "count");
    -[FCFeedRequestOperation feedRequests](v117, "feedRequests");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v104) = v104 == objc_msgSend(v105, "count");
    if ((v104 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("each feed request must have a corresponding response"));
      *(_DWORD *)buf = 136315906;
      v147 = "-[FCFeedRequestOperation operationWillFinishWithError:]";
      v148 = 2080;
      v149 = "FCFeedRequestOperation.m";
      v150 = 1024;
      *(_DWORD *)v151 = 327;
      *(_WORD *)&v151[4] = 2114;
      *(_QWORD *)&v151[6] = v111;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCFeedRequestOperation _reportProgressWithFeedItems:]((id *)&v117->super.super.super.isa, v4);
  }
  -[FCFeedRequestOperation requestCompletionHandler](v117, "requestCompletionHandler", v112);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    -[FCFeedRequestOperation requestCompletionHandler](v117, "requestCompletionHandler");
    v107 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *))v107)[2](v107, v5, v4, v113);

  }
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke_41;
  v118[3] = &unk_1E463AA78;
  v118[4] = v117;
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v118);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedRequestOperation requestCompletionHandlerWithHeldRecords](v117, "requestCompletionHandlerWithHeldRecords");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    -[FCFeedRequestOperation requestCompletionHandlerWithHeldRecords](v117, "requestCompletionHandlerWithHeldRecords");
    v110 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *, void *))v110)[2](v110, v5, v4, v108, v113);

  }
}

- (void)setResultHeldArticleRecords:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 528), a2);
}

- (void)setResultHeldTagRecords:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 536), a2);
}

- (void)setResultHeldIssueRecords:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 544), a2);
}

id __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v3, "filteredReasons");
  if ((objc_msgSend(v3, "isFiltered") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_reportProgressWithFeedItems:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "progressHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(v5);

    if (v6)
    {
      v7 = (void (**)(void *, void *))_Block_copy(v6);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__FCFeedRequestOperation__reportProgressWithFeedItems___block_invoke_2;
      v14[3] = &unk_1E4645E30;
      v14[4] = a1;
      objc_msgSend(v3, "fc_arrayOfObjectsFailingTest:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v7[2](v7, v8);
        objc_msgSend(a1[64], "addObjectsFromArray:", v8);
        v9 = (void *)FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          objc_msgSend(a1, "operationID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "fc_millisecondTimeIntervalUntilNow");
          v13 = objc_msgSend(v8, "count");
          *(_DWORD *)buf = 138543874;
          v16 = v11;
          v17 = 2048;
          v18 = v12;
          v19 = 2048;
          v20 = v13;
          _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to report %lu feeds via progress handler", buf, 0x20u);

        }
      }

    }
  }

}

void __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 528);
    else
      v4 = 0;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, &unk_1E470AC70);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 536);
    else
      v6 = 0;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, &unk_1E470AC88);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 8) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(_QWORD *)(v7 + 544);
    else
      v8 = 0;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, &unk_1E470ACA0);
  }

}

- (unint64_t)maxRetries
{
  void *v2;
  unint64_t v3;

  -[FCFeedRequestOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxRetriesForDroppedFeeds");

  return v3;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  FCOperationDelayedRetrySignal *v10;
  double v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCFeedRequestOperation;
  if (-[FCOperation canRetryWithError:retryAfter:](&v13, sel_canRetryWithError_retryAfter_, v6, a4))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("FCErrorDomain"));
    if (v7)
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 != 2)
      {
        LOBYTE(v7) = 0;
        goto LABEL_8;
      }
      v10 = [FCOperationDelayedRetrySignal alloc];
      -[FCFeedRequestOperation configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delayBeforeRetryingDroppedFeeds");
      *a4 = -[FCOperationDelayedRetrySignal initWithDelay:](v10, "initWithDelay:", (double)exp2(v11 * (double)-[FCOperation retryCount](self, "retryCount")));
    }

  }
LABEL_8:

  return v7;
}

- (void)resetForRetry
{
  if (self)
  {
    -[NSMutableDictionary removeAllObjects](self->_resultFeedResponses, "removeAllObjects");
    objc_storeStrong((id *)&self->_resultHeldTagRecords, 0);
    objc_storeStrong((id *)&self->_resultHeldArticleRecords, 0);
    objc_storeStrong((id *)&self->_resultHeldIssueRecords, 0);
    self->_queryBudget = 10;
  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
  }
}

- (NSArray)networkEvents
{
  if (self)
    self = (FCFeedRequestOperation *)self->_mutableNetworkEvents;
  return (NSArray *)self;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ has no prewarm request key", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[4];
  __int128 v36;
  _QWORD v37[4];
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "successfulRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    objc_msgSend(v3, "failedRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2;
      v37[3] = &unk_1E463B790;
      v38 = *(_OWORD *)(a1 + 32);
      __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2((uint64_t)v37);
      goto LABEL_19;
    }
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[60];
  v8 = v7;
  objc_msgSend(v3, "feedIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 2 * objc_msgSend(v8, "fc_countOfObjectsIntersectingSet:", v9);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 480);
  else
    v12 = 0;
  v13 = objc_msgSend(v12, "count");

  if (v10 >= v13)
  {
    objc_msgSend(v3, "successfulRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_55;
    v34[3] = &unk_1E463D578;
    v34[4] = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(v14, "fc_countOfObjectsPassingTest:", v34);

    objc_msgSend(v3, "failedRequests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2_57;
    v33[3] = &unk_1E463D578;
    v33[4] = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(v17, "fc_countOfObjectsPassingTest:", v33);

    if (v16 >= 10 * v18)
    {
      objc_msgSend(v3, "successfulRequests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fc_dictionaryWithKeyBlock:", &__block_literal_global_59);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "feedRequests");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_4;
      v31[3] = &unk_1E4645D40;
      v21 = v24;
      v32 = v21;
      objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setFeedRequests:", v26);

      objc_msgSend(*(id *)(a1 + 32), "setEdgeCacheHint:", 0);
      v27 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(a1 + 32);
        v29 = v27;
        objc_msgSend(v28, "shortOperationDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v30;
        _os_log_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ prewarming finished with enough successful feeds", buf, 0xCu);

      }
    }
    else
    {
      v19 = (void *)FCOperationLog;
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_19;
      }
      v20 = *(void **)(a1 + 32);
      v21 = v19;
      objc_msgSend(v20, "shortOperationDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v22;
      _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ prewarming finished without enough successful feeds", buf, 0xCu);

    }
    goto LABEL_17;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_54;
  v35[3] = &unk_1E463B790;
  v36 = *(_OWORD *)(a1 + 32);
  __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_54((uint64_t)v35);
LABEL_19:

}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ found no matching prewarm request", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_54(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ had insufficient overlap with prewarm request", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[60];
  v4 = v3;
  objc_msgSend(a2, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2_57(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[60];
  v4 = v3;
  objc_msgSend(a2, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feedID");
}

id __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "feedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v3, "feedRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "feedRangeByIntersectingWithRange:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFeedRange:", v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "feedID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 520);
  else
    v5 = 0;
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(void **)(v8 + 496);
    else
      v9 = 0;
    objc_msgSend(v9, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_additionalHTTPHeadersForOrderFeedRequest
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 472), "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "HTTPResponseHeaders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("X-Apple-News-Retry"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v9 = CFSTR("X-Apple-News-Retry");
      v10[0] = v4;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = v4;
      objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

void __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  id *v76;
  uint64_t v77;
  double v78;
  unint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  _QWORD *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  uint64_t v96;
  _QWORD *v97;
  void *v98;
  id v99;
  id obj;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  uint64_t v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v99 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[59];
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  -[FCCKBatchedOrderFeedQueryOperation networkEvents](WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  v10 = *(void **)(a1 + 32);
  v11 = v99;
  if (!v99)
  {
    if ((objc_msgSend(v10, "options") & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "articleRecordSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v13 = (void *)v5[1];
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v12, "saveArticleRecords:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(_QWORD **)(a1 + 32);
      if (v16)
        v16 = (_QWORD *)v16[66];
      v17 = v16;
      +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v17, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation setResultHeldArticleRecords:](*(_QWORD *)(a1 + 32), v18);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "tagRecordSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v20 = (void *)v5[3];
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend(v19, "saveTagRecords:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *(_QWORD **)(a1 + 32);
      if (v23)
        v23 = (_QWORD *)v23[67];
      v24 = v23;
      +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v24, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation setResultHeldTagRecords:](*(_QWORD *)(a1 + 32), v25);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "options") & 8) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "issueRecordSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v27 = (void *)v5[4];
      else
        v27 = 0;
      v28 = v27;
      objc_msgSend(v26, "saveRecords:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = *(_QWORD **)(a1 + 32);
      if (v30)
        v30 = (_QWORD *)v30[68];
      v31 = v30;
      +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v31, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeedRequestOperation setResultHeldIssueRecords:](*(_QWORD *)(a1 + 32), v32);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    if (v5)
      v33 = (void *)v5[2];
    else
      v33 = 0;
    v97 = v5;
    obj = v33;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
    v34 = 0;
    if (v103)
    {
      v102 = *(_QWORD *)v114;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v114 != v102)
            objc_enumerationMutation(obj);
          v36 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v35);
          v37 = *(void **)(a1 + 48);
          if (v36)
            v38 = *(void **)(v36 + 16);
          else
            v38 = 0;
          v39 = v38;
          objc_msgSend(v37, "objectForKey:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "feedID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            v42 = *(void **)(v36 + 24);
          else
            v42 = 0;
          v43 = v42;
          v109[0] = MEMORY[0x1E0C809B0];
          v109[1] = 3221225472;
          v109[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_3;
          v109[3] = &unk_1E4645D90;
          v44 = *(id *)(a1 + 56);
          v45 = *(_QWORD *)(a1 + 32);
          v110 = v44;
          v111 = v45;
          v46 = v41;
          v112 = v46;
          objc_msgSend(v43, "fc_arrayByTransformingWithBlock:", v109);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36 || !*(_BYTE *)(v36 + 10) || objc_msgSend(v47, "count"))
          {
            v104 = v34 + 1;
            objc_msgSend(*(id *)(a1 + 32), "feedDatabase");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "feedID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = *(void **)(a1 + 64);
            objc_msgSend(v40, "feedID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectForKey:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = *(void **)(a1 + 72);
            if (!v36)
            {
              -[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]((uint64_t)v48, v47, v49, v52, v53, 0, 0, 0);

              objc_msgSend(v40, "feedRange");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              FCFeedItemsCoveredByRange(v47, v62);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v101, "addObjectsFromArray:", v58);
              v34 = v104;
              goto LABEL_43;
            }
            -[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]((uint64_t)v48, v47, v49, v52, v53, *(_BYTE *)(v36 + 9), *(_QWORD *)(v36 + 32), *(_BYTE *)(v36 + 8));

            objc_msgSend(v40, "feedRange");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            FCFeedItemsCoveredByRange(v47, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v101, "addObjectsFromArray:", v55);
            v34 = v104;
          }
          if (!*(_BYTE *)(v36 + 10))
            goto LABEL_44;
          v56 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_feedDroppedError");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFeedRequestOperation _failureResponseForRequest:error:](v56, v40, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = *(_QWORD **)(a1 + 32);
          if (v59)
            v59 = (_QWORD *)v59[65];
          v60 = v59;
          objc_msgSend(v40, "feedID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKey:", v58, v61);

LABEL_43:
LABEL_44:

          ++v35;
        }
        while (v103 != v35);
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
        v103 = v63;
      }
      while (v63);
    }

    v64 = (void *)FCFeedDatabaseLog;
    v5 = v97;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v65 = a1;
      v66 = *(void **)(a1 + 32);
      v67 = v64;
      objc_msgSend(v66, "operationID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v98, "fc_millisecondTimeIntervalUntilNow");
      v70 = v34;
      if (v97)
        v71 = (void *)v97[1];
      else
        v71 = 0;
      v72 = v71;
      v73 = objc_msgSend(v72, "count");
      *(_DWORD *)buf = 138544130;
      v119 = v68;
      v120 = 2048;
      v121 = v69;
      v122 = 2048;
      v123 = v70;
      v124 = 2048;
      v125 = v73;
      _os_log_impl(&dword_1A1B90000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to save %lu feeds and %lu feed items in the database", buf, 0x2Au);

      a1 = v65;
    }
    -[FCFeedRequestOperation _reportProgressWithFeedItems:](*(id **)(a1 + 32), v101);
    v74 = -[FCFeedRequestOperation _countOfDroppedFeeds](*(_QWORD *)(a1 + 32));
    v75 = v74;
    v76 = *(id **)(a1 + 32);
    if (v76)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "options") & 0x10) != 0)
      {
        v80 = *(_QWORD **)(a1 + 32);
      }
      else
      {
        v77 = objc_msgSend(v76, "retryCount");
        if (v77 != objc_msgSend(v76, "maxRetries")
          || (v78 = 0.5, (unint64_t)objc_msgSend(v76[60], "count") <= 2))
        {
          v78 = 0.1;
        }
        v79 = objc_msgSend(v76[60], "count");
        v80 = *(_QWORD **)(a1 + 32);
        if (v75 > vcvtmd_u64_f64(v78 * (double)v79))
        {
          v81 = *(_QWORD *)(a1 + 80);
          v82 = (void *)MEMORY[0x1E0CB35C8];
          if (v80)
            v80 = (_QWORD *)v80[60];
          goto LABEL_62;
        }
      }
      if (v80)
        v80 = (_QWORD *)v80[65];
    }
    else
    {
      v80 = 0;
      if (v74)
      {
        v81 = *(_QWORD *)(a1 + 80);
        v82 = (void *)MEMORY[0x1E0CB35C8];
        v5 = v97;
LABEL_62:
        v83 = v80;
        objc_msgSend(v82, "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", v75, objc_msgSend(v83, "count"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v81 + 16))(v81, v84);

LABEL_82:
        v11 = 0;
        goto LABEL_83;
      }
      v5 = v97;
    }
    v85 = v80;
    v86 = objc_msgSend(v85, "count");
    objc_msgSend(*(id *)(a1 + 32), "feedRequests");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = objc_msgSend(v87, "count");
    if (v86 == v88)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "options") & 0x10) != 0)
      {
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v89 = *(_QWORD *)(a1 + 32);
        if (v89)
          v90 = *(void **)(v89 + 496);
        else
          v90 = 0;
        objc_msgSend(v90, "allValues");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
        if (v92)
        {
          v93 = v92;
          v94 = *(_QWORD *)v106;
          do
          {
            for (i = 0; i != v93; ++i)
            {
              if (*(_QWORD *)v106 != v94)
                objc_enumerationMutation(v91);
              v96 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
              if (v96)
                *(_BYTE *)(v96 + 8) = 1;
            }
            v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
          }
          while (v93);
        }

      }
      -[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80));
    }
    goto LABEL_82;
  }
  objc_msgSend(v10, "finishedPerformingOperationWithError:", v99);
LABEL_83:

}

id __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D626D0];
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = a2;
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalContentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "articleRecordSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedItemFromCKRecord:storefrontID:recordSource:", v6, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFeedID:", a1[6]);
  return v10;
}

- (FCFeedResponse)_failureResponseForRequest:(void *)a3 error:
{
  id v4;
  id v5;
  FCFeedResponse *v6;
  void *v7;

  if (a1)
  {
    v4 = a3;
    v5 = a2;
    v6 = objc_alloc_init(FCFeedResponse);
    objc_msgSend(v5, "feedID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCFeedResponse setFeedID:](v6, "setFeedID:", v7);
    -[FCFeedResponse setError:](v6, "setError:", v4);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)_countOfDroppedFeeds
{
  uint64_t v1;
  id v2;
  void *v3;
  _QWORD v5[5];

  v1 = a1;
  if (a1)
  {
    v2 = *(id *)(a1 + 520);
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__FCFeedRequestOperation__countOfDroppedFeeds__block_invoke;
    v5[3] = &unk_1E4645E08;
    v5[4] = v1;
    v1 = objc_msgSend(v3, "fc_countOfObjectsPassingTest:", v5);

  }
  return v1;
}

FCCKOrderFeedRequest *__78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
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
  FCCKOrderFeedRequest *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  objc_msgSend(v3, "feedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = v4;
    objc_msgSend(v6, "top");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 62, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHour:", objc_msgSend(v12, "hour") + 1);
    objc_msgSend(v11, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 62, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeFromDate:toDate:](FCFeedRange, "feedRangeFromDate:toDate:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_alloc_init(FCCKOrderFeedRequest);
  objc_msgSend(v3, "feedID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_setProperty_nonatomic_copy(v17, v18, v19, 8);

  objc_msgSend(v16, "top");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "order");
  if (v17)
    v17->_maxOrder = v21;

  objc_msgSend(v16, "bottom");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "order");
  if (v17)
    v17->_minOrder = v23;

  v24 = objc_msgSend(v3, "maxCount");
  if (v17)
    v17->_resultsLimit = v24;

  return v17;
}

void __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id *v48;
  id *v49;
  id *v50;
  id v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  FCFeedResponse *v68;
  void *v69;
  _BOOL8 v70;
  _QWORD *v71;
  _QWORD *v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  _QWORD *v81;
  _QWORD *v82;
  void *v83;
  id v84;
  id obj;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v84 = a2;
  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[59];
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
    v10 = (void *)*((_QWORD *)WeakRetained + 54);
  else
    v10 = 0;
  v11 = v10;
  objc_msgSend(v7, "addObjectsFromArray:", v11);

  v12 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v12, "finishedPerformingOperationWithError:", v5);
    v13 = v5;
    v14 = v84;
    goto LABEL_70;
  }
  v15 = v84;
  if ((objc_msgSend(v12, "options") & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "articleRecordSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
      v17 = (void *)*((_QWORD *)v84 + 1);
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v16, "saveArticleRecords:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(_QWORD **)(a1 + 32);
    if (v20)
      v20 = (_QWORD *)v20[66];
    v21 = v20;
    +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setResultHeldArticleRecords:](*(_QWORD *)(a1 + 32), v22);

    v15 = v84;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "tagRecordSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v24 = (void *)v15[3];
    else
      v24 = 0;
    v25 = v24;
    objc_msgSend(v23, "saveTagRecords:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *(_QWORD **)(a1 + 32);
    if (v27)
      v27 = (_QWORD *)v27[67];
    v28 = v27;
    +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v28, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setResultHeldTagRecords:](*(_QWORD *)(a1 + 32), v29);

    v15 = v84;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "issueRecordSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v31 = (void *)v15[4];
    else
      v31 = 0;
    v32 = v31;
    objc_msgSend(v30, "saveRecords:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = *(_QWORD **)(a1 + 32);
    if (v34)
      v34 = (_QWORD *)v34[68];
    v35 = v34;
    +[FCHeldRecords heldRecordsByMerging:with:](FCHeldRecords, "heldRecordsByMerging:with:", v35, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFeedRequestOperation setResultHeldIssueRecords:](*(_QWORD *)(a1 + 32), v36);

    v15 = v84;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  if (v15)
    v37 = (void *)v15[2];
  else
    v37 = 0;
  obj = v37;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v38)
  {
    v39 = v38;
    v86 = *(_QWORD *)v91;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v91 != v86)
          objc_enumerationMutation(obj);
        v41 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v40);
        v42 = *(_QWORD **)(a1 + 32);
        if (v42)
          v42 = (_QWORD *)v42[61];
        v43 = v42;
        if (v41)
          v44 = *(void **)(v41 + 16);
        else
          v44 = 0;
        v45 = v44;
        objc_msgSend(v43, "objectForKey:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "feedRange");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          v62 = 0;
          goto LABEL_49;
        }
        if (!*(_BYTE *)(v41 + 10))
          goto LABEL_48;
        v48 = *(id **)(a1 + 32);
        v49 = (id *)(id)v41;
        v50 = v49;
        if (v48 && (v51 = v49[3], v52 = objc_msgSend(v51, "count"), v51, v52))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", 1, objc_msgSend(v48[60], "count"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v48, "retryCount");
          if (v54 >= objc_msgSend(v48, "maxRetries"))
          {

LABEL_48:
            v62 = *(void **)(v41 + 24);
LABEL_49:
            v63 = v62;
            v87[0] = MEMORY[0x1E0C809B0];
            v87[1] = 3221225472;
            v87[2] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_4;
            v87[3] = &unk_1E463D528;
            v64 = *(id *)(a1 + 48);
            v65 = *(_QWORD *)(a1 + 32);
            v88 = v64;
            v89 = v65;
            objc_msgSend(v63, "fc_arrayByTransformingWithBlock:", v87);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            FCFeedItemsCoveredByRange(v66, v47);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_alloc_init(FCFeedResponse);
            objc_msgSend(v46, "feedID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCFeedResponse setFeedID:](v68, "setFeedID:", v69);

            -[FCFeedResponse setFeedItems:](v68, "setFeedItems:", v67);
            if (v41)
            {
              if (*(_BYTE *)(v41 + 9))
                v70 = 1;
              else
                v70 = *(_BYTE *)(v41 + 8) != 0;
            }
            else
            {
              v70 = 0;
            }
            -[FCFeedResponse setExhaustedRequestRange:](v68, "setExhaustedRequestRange:", v70);
            v71 = *(_QWORD **)(a1 + 32);
            if (v71)
              v71 = (_QWORD *)v71[65];
            v72 = v71;
            objc_msgSend(v46, "feedID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setObject:forKey:", v68, v73);

            v58 = v88;
            goto LABEL_56;
          }
          v94 = 0;
          v55 = objc_msgSend(v48, "canRetryWithError:retryAfter:", v53, &v94);

          if ((v55 & 1) == 0)
            goto LABEL_48;
        }
        else
        {

        }
        v56 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "fc_feedDroppedError");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFeedRequestOperation _failureResponseForRequest:error:](v56, v46, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = *(_QWORD **)(a1 + 32);
        if (v59)
          v59 = (_QWORD *)v59[65];
        v60 = v59;
        objc_msgSend(v46, "feedID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKey:", v58, v61);

LABEL_56:
        ++v40;
      }
      while (v39 != v40);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      v39 = v74;
    }
    while (v74);
  }

  v75 = -[FCFeedRequestOperation _countOfDroppedFeeds](*(_QWORD *)(a1 + 32));
  v76 = *(_QWORD *)(a1 + 32);
  if (v76)
    v77 = *(void **)(v76 + 480);
  else
    v77 = 0;
  v78 = objc_msgSend(v77, "count");
  v79 = *(_QWORD *)(a1 + 56);
  if (v75 >= v78)
  {
    v80 = (void *)MEMORY[0x1E0CB35C8];
    v81 = *(_QWORD **)(a1 + 32);
    if (v81)
      v81 = (_QWORD *)v81[60];
    v82 = v81;
    objc_msgSend(v80, "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", 1, objc_msgSend(v82, "count"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v79 + 16))(v79, v83);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v79 + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  v13 = 0;
  v14 = v84;
LABEL_70:

}

id __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0D626D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalContentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "articleRecordSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedItemFromCKRecord:storefrontID:recordSource:", v5, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __46__FCFeedRequestOperation__countOfDroppedFeeds__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[60];
  v5 = v4;
  objc_msgSend(v3, "feedID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("FCErrorDomain")))
      {
        objc_msgSend(v3, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "code") == 7;

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __55__FCFeedRequestOperation__reportProgressWithFeedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 512);
  else
    v3 = 0;
  return objc_msgSend(v3, "containsObject:", a2);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (FCFeedDatabase)feedDatabase
{
  return self->_feedDatabase;
}

- (void)setFeedDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_feedDatabase, a3);
}

- (NSCopying)prewarmRequestKey
{
  return self->_prewarmRequestKey;
}

- (void)setPrewarmRequestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)feedRequests
{
  return self->_feedRequests;
}

- (void)setFeedRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSArray)feedTransformations
{
  return self->_feedTransformations;
}

- (void)setFeedTransformations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void)setEdgeCacheHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (unint64_t)expectedNetworkEventCount
{
  return self->_expectedNetworkEventCount;
}

- (void)setExpectedNetworkEventCount:(unint64_t)a3
{
  self->_expectedNetworkEventCount = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (id)requestCompletionHandler
{
  return self->_requestCompletionHandler;
}

- (void)setRequestCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (id)requestCompletionHandlerWithHeldRecords
{
  return self->_requestCompletionHandlerWithHeldRecords;
}

- (void)setRequestCompletionHandlerWithHeldRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeldIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultHeldTagRecords, 0);
  objc_storeStrong((id *)&self->_resultHeldArticleRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_progressReportedFeedItems, 0);
  objc_storeStrong((id *)&self->_databaseLookupsByFeedID, 0);
  objc_storeStrong((id *)&self->_feedRequestsByFeedID, 0);
  objc_storeStrong((id *)&self->_nonExpendableFeedIDs, 0);
  objc_storeStrong((id *)&self->_mutableNetworkEvents, 0);
  objc_storeStrong(&self->_requestCompletionHandlerWithHeldRecords, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_feedTransformations, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_prewarmRequestKey, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
