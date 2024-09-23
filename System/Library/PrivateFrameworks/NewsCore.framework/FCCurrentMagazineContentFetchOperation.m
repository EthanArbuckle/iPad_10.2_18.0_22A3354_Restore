@implementation FCCurrentMagazineContentFetchOperation

- (FCCurrentMagazineContentFetchOperation)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentMagazineContentFetchOperation init]";
    v9 = 2080;
    v10 = "FCCurrentMagazineContentFetchOperation.m";
    v11 = 1024;
    v12 = 57;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCurrentMagazineContentFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCCurrentMagazineContentFetchOperation)initWithContext:(id)a3 configIssueIDs:(id)a4 configArticleIDs:(id)a5 trendingArticleListID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCCurrentMagazineContentFetchOperation *v15;
  FCCurrentMagazineContentFetchOperation *v16;
  uint64_t v17;
  NSArray *configIssueIDs;
  uint64_t v19;
  NSArray *configArticleIDs;
  uint64_t v21;
  NSString *trendingArticleListID;
  FCCachePolicy *cachedPolicy;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)FCCurrentMagazineContentFetchOperation;
  v15 = -[FCOperation init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    v17 = objc_msgSend(v12, "copy");
    configIssueIDs = v16->_configIssueIDs;
    v16->_configIssueIDs = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    configArticleIDs = v16->_configArticleIDs;
    v16->_configArticleIDs = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    trendingArticleListID = v16->_trendingArticleListID;
    v16->_trendingArticleListID = (NSString *)v21;

    cachedPolicy = v16->_cachedPolicy;
    v16->_cachedPolicy = 0;

    v16->_contentOptions = 7;
  }

  return v16;
}

- (BOOL)validateOperation
{
  char v3;
  char v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current magazine content fetch operation requires a context"));
      v10 = 136315906;
      v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
      v12 = 2080;
      v13 = "FCCurrentMagazineContentFetchOperation.m";
      v14 = 1024;
      v15 = 84;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    }
    v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current magazine content fetch operation requires config issue IDs"));
        v10 = 136315906;
        v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
        v12 = 2080;
        v13 = "FCCurrentMagazineContentFetchOperation.m";
        v14 = 1024;
        v15 = 88;
        v16 = 2114;
        v17 = v8;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      }
      v4 = 0;
      if (!self)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  if (!self->_configIssueIDs)
    goto LABEL_9;
  v4 = 1;
LABEL_12:
  if (self->_configArticleIDs)
  {
    v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current magazine content fetch operation requires config article IDs"));
    v10 = 136315906;
    v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
    v12 = 2080;
    v13 = "FCCurrentMagazineContentFetchOperation.m";
    v14 = 1024;
    v15 = 92;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  v5 = 0;
  return v5 & v3 & v4;
}

- (void)performOperation
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  FCCloudContext *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD v11[10];
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
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

  v3 = dispatch_group_create();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__20;
  v27[4] = __Block_byref_object_dispose__20;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__20;
  v25[4] = __Block_byref_object_dispose__20;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__20;
  v23[4] = __Block_byref_object_dispose__20;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__20;
  v21[4] = __Block_byref_object_dispose__20;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__20;
  v19[4] = __Block_byref_object_dispose__20;
  v20 = 0;
  dispatch_group_enter(v3);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke;
  v12[3] = &unk_1E463EF60;
  v14 = v27;
  v15 = v25;
  v16 = v23;
  v17 = v21;
  v18 = v19;
  v5 = v3;
  v13 = v5;
  v6 = v12;
  if (self)
  {
    v7 = self->_context;
    -[FCCloudContext configurationManager](v7, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v4;
    v29[1] = 3221225472;
    v29[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke;
    v29[3] = &unk_1E463F0E8;
    v29[4] = self;
    v9 = v6;

    v30 = v9;
    FCCoreConfigurationFetch(v8, v29);

  }
  FCDispatchQueueForQualityOfService(-[FCCurrentMagazineContentFetchOperation qualityOfService](self, "qualityOfService"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_2;
  v11[3] = &unk_1E463EF88;
  v11[4] = self;
  v11[5] = v19;
  v11[6] = v27;
  v11[7] = v25;
  v11[8] = v23;
  v11[9] = v21;
  dispatch_group_notify(v5, v10, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v11;
  v30 = v11;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v12;
  v20 = v12;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v13;
  v23 = v13;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v14;
  v26 = v14;

  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v15;
  v29 = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_2(uint64_t *a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = a1 + 4;
  v2 = (void *)a1[4];
  v4 = *(_QWORD *)(*(_QWORD *)(v3[1] + 8) + 40);
  if (!v4)
  {
    -[FCCurrentMagazineContentFetchOperation _filterInaccessibleIssues:]((uint64_t)v2, *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = a1[4];
    v8 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
    {
      if (v5)
        v9 = (void *)v5;
      else
        v9 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)(v7 + 424), v9);
    }

    -[FCCurrentMagazineContentFetchOperation _filterInaccessibleHeadlines:](a1[4], *(void **)(*(_QWORD *)(a1[7] + 8) + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = a1[4];
    if (v12)
    {
      if (v10)
        v13 = (void *)v10;
      else
        v13 = v8;
      objc_storeStrong((id *)(v12 + 432), v13);
    }

    -[FCCurrentMagazineContentFetchOperation _filterInaccessibleIssues:](a1[4], *(void **)(*(_QWORD *)(a1[8] + 8) + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = a1[4];
    if (v16)
    {
      if (v14)
        v17 = (void *)v14;
      else
        v17 = v8;
      objc_storeStrong((id *)(v16 + 440), v17);
    }

    -[FCCurrentMagazineContentFetchOperation _filterInaccessibleHeadlines:](a1[4], *(void **)(*(_QWORD *)(a1[9] + 8) + 40));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = a1[4];
    if (v20)
    {
      if (v18)
        v21 = (void *)v18;
      else
        v21 = v8;
      objc_storeStrong((id *)(v20 + 448), v21);
    }

    v2 = (void *)a1[4];
    v4 = 0;
  }
  return objc_msgSend(v2, "finishedPerformingOperationWithError:", v4);
}

- (id)_filterInaccessibleIssues:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a1)
    return 0;
  v3 = *(id *)(a1 + 392);
  v4 = a2;
  objc_msgSend(v3, "issueAccessChecker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__FCCurrentMagazineContentFetchOperation__filterInaccessibleIssues___block_invoke;
  v9[3] = &unk_1E463F138;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_filterInaccessibleHeadlines:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a1)
    return 0;
  v3 = *(id *)(a1 + 392);
  v4 = a2;
  objc_msgSend(v3, "articleAccessChecker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__FCCurrentMagazineContentFetchOperation__filterInaccessibleHeadlines___block_invoke;
  v9[3] = &unk_1E463F110;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *resultConfigIssues;
  NSArray *v7;
  NSArray *resultConfigHeadlines;
  NSArray *v9;
  uint64_t v10;
  NSArray *resultCurrentIssues;
  NSArray *v12;
  uint64_t v13;
  NSArray *resultTrendingHeadlines;
  NSArray *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = (id)FCOperationLog;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FCOperation shortOperationDescription](self, "shortOperationDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        resultConfigIssues = self->_resultConfigIssues;
      else
        resultConfigIssues = 0;
      v7 = resultConfigIssues;
      v22 = -[NSArray count](v7, "count");
      if (self)
        resultConfigHeadlines = self->_resultConfigHeadlines;
      else
        resultConfigHeadlines = 0;
      v9 = resultConfigHeadlines;
      v10 = -[NSArray count](v9, "count");
      if (self)
        resultCurrentIssues = self->_resultCurrentIssues;
      else
        resultCurrentIssues = 0;
      v12 = resultCurrentIssues;
      v13 = -[NSArray count](v12, "count");
      if (self)
        resultTrendingHeadlines = self->_resultTrendingHeadlines;
      else
        resultTrendingHeadlines = 0;
      v15 = resultTrendingHeadlines;
      *(_DWORD *)buf = 138544386;
      v25 = v23;
      v26 = 2048;
      v27 = v22;
      v28 = 2048;
      v29 = v10;
      v30 = 2048;
      v31 = v13;
      v32 = 2048;
      v33 = -[NSArray count](v15, "count");
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu config issues, %lu config headlines, %lu current issues, and %lu trending headlines", buf, 0x34u);

    }
  }
  -[FCCurrentMagazineContentFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FCCurrentMagazineContentFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v18 = self->_resultConfigIssues;
      v19 = self->_resultConfigHeadlines;
      v20 = self->_resultCurrentIssues;
      v21 = self->_resultTrendingHeadlines;
    }
    else
    {
      v20 = 0;
      v18 = 0;
      v19 = 0;
      v21 = 0;
    }
    ((void (**)(_QWORD, NSArray *, NSArray *, NSArray *, NSArray *, id))v17)[2](v17, v18, v19, v20, v21, v4);

  }
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  FCRecordChainFetchOperation *v7;
  FCRecordChainFetchOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  const __CFString *v31;
  _QWORD v32[2];
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[5];
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2;
  v29[3] = &unk_1E463EFB0;
  v29[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v30 = v5;
  objc_msgSend(v4, "fc_array:", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(FCRecordChainFetchOperation);
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(_QWORD *)(v9 + 392);
    else
      v10 = 0;
    -[FCRecordChainFetchOperation setContext:](v7, "setContext:", v10);
    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v8, "setTopLevelRecordIDs:", v6);
    v36[0] = CFSTR("TagList");
    v35 = CFSTR("tagIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v11;
    v36[1] = CFSTR("Tag");
    v34 = CFSTR("latestIssueIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v12;
    v36[2] = CFSTR("Issue");
    v33 = CFSTR("channelTagID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v13;
    v36[3] = CFSTR("Article");
    v32[0] = CFSTR("sourceChannelTagID");
    v32[1] = CFSTR("parentIssueID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v14;
    v36[4] = CFSTR("ArticleList");
    v31 = CFSTR("articleIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v8, "setLinkKeysByRecordType:", v16);

    v17 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_4;
    v28[3] = &unk_1E463EFD8;
    v28[4] = *(_QWORD *)(a1 + 32);
    -[FCRecordChainFetchOperation setDynamicCachePolicyBlock:](v8, "setDynamicCachePolicyBlock:", v28);
    +[FCEdgeCacheHint edgeCacheHintForMagazineContent](FCEdgeCacheHint, "edgeCacheHintForMagazineContent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setEdgeCacheHint:](v8, "setEdgeCacheHint:", v18);

    v21 = v17;
    v22 = 3221225472;
    v23 = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5;
    v24 = &unk_1E463F0C0;
    v19 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 32);
    v27 = v19;
    v25 = v20;
    v26 = v5;
    -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v8, "setRecordChainCompletionHandler:", &v21);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8, v21, v22, v23, v24, v25);
    -[FCOperation start](v8, "start");

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "contentOptions") & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "paidBundleConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recommendableIssuesTagList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_safelyAddObject:", v4);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "contentOptions") & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 416);
    else
      v6 = 0;
    objc_msgSend(v11, "fc_safelyAddObject:", v6);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "contentOptions") & 2) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(_QWORD *)(v7 + 400);
    else
      v8 = 0;
    objc_msgSend(v11, "addObjectsFromArray:", v8);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(_QWORD *)(v9 + 408);
    else
      v10 = 0;
    objc_msgSend(v11, "addObjectsFromArray:", v10);
  }

}

id __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPolicy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 60.0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(id *)(a1 + 48);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))v7 + 2))(v7, 0, 0, 0, 0, a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470A538);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470A550);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470A568);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470A580);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E470A598);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v9 = (_QWORD *)v9[49];
    v10 = v9;
    objc_msgSend(v10, "tagController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "channelsForTagRecords:", v64);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = *(_QWORD **)(a1 + 32);
    if (v14)
      v14 = (_QWORD *)v14[49];
    v15 = v14;
    objc_msgSend(v15, "subscriptionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mutedTagIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_28;
    v74[3] = &unk_1E463F000;
    v74[4] = *(_QWORD *)(a1 + 32);
    v20 = v18;
    v75 = v20;
    objc_msgSend(v63, "heldRecordsPassingTest:", v74);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v19;
    v72[1] = 3221225472;
    v72[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2_31;
    v72[3] = &unk_1E463F028;
    v72[4] = *(_QWORD *)(a1 + 32);
    v57 = v20;
    v58 = v8;
    v73 = v57;
    objc_msgSend(v8, "heldRecordsPassingTest:", v72);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v19;
    v69[1] = 3221225472;
    v69[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3_33;
    v69[3] = &unk_1E463F050;
    v22 = v12;
    v23 = *(_QWORD *)(a1 + 32);
    v70 = v22;
    v71 = v23;
    v61 = v21;
    objc_msgSend(v21, "transformRecordsByIDWithBlock:", v69);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD **)(a1 + 32);
    v26 = *(void **)(a1 + 40);
    if (v25)
      v25 = (_QWORD *)v25[49];
    v27 = v25;
    objc_msgSend(v27, "assetManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v63, "allRecordIDs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleIDFromHeldRecords(v26, v28, v31, v62, v22, v61, 1, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "transformRecordsByIDWithBlock:", &__block_literal_global_40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD **)(a1 + 32);
    v34 = *(void **)(a1 + 40);
    if (v33)
      v33 = (_QWORD *)v33[49];
    v35 = v33;
    objc_msgSend(v35, "assetManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v32;
    objc_msgSend(v32, "allValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v34, v36, v62, v64, v61, v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0C99D20];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6_42;
    v65[3] = &unk_1E463F098;
    v7 = v55;
    v66 = v7;
    v56 = v22;
    v67 = v56;
    v40 = v24;
    v68 = v40;
    objc_msgSend(v39, "fc_array:", v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *(_QWORD *)(a1 + 32);
    if (v42)
      v43 = *(_QWORD *)(v42 + 400);
    else
      v43 = 0;
    objc_msgSend(v40, "nf_objectsForKeysWithoutMarker:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *(_QWORD *)(a1 + 32);
    if (v45)
      v46 = *(_QWORD *)(v45 + 408);
    else
      v46 = 0;
    objc_msgSend(v59, "nf_objectsForKeysWithoutMarker:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(_QWORD *)(a1 + 32);
    if (v48)
      v49 = *(_QWORD *)(v48 + 416);
    else
      v49 = 0;
    objc_msgSend(v38, "fc_safeObjectForKey:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      v52 = v50;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v52 = (id)objc_claimAutoreleasedReturnValue();
    }
    v53 = v52;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[49];
  v5 = v4;
  objc_msgSend(v5, "contentStoreFrontID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAllowedInStorefront:", v6))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "sourceChannelTagID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isNewsVersionAllowed:", objc_msgSend(v3, "minimumNewsVersion"));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2_31(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[49];
  v5 = v4;
  objc_msgSend(v5, "contentStoreFrontID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAllowedInStorefront:", v6))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "channelTagID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8) ^ 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

FCIssue *__92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FCIssue *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FCIssue *v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "channelTagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    v11 = [FCIssue alloc];
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      v13 = *(void **)(v12 + 392);
    else
      v13 = 0;
    objc_msgSend(v13, "assetManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCIssue initWithIssueRecord:assetManager:interestToken:sourceChannel:](v11, "initWithIssueRecord:assetManager:interestToken:sourceChannel:", v5, v14, v6, v10);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

FCArticleList *__92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5_38(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  FCArticleList *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[FCArticleList initWithRecord:interestToken:]([FCArticleList alloc], "initWithRecord:interestToken:", v5, v4);

  return v6;
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allRecords", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v11, "currentIssueIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "nf_objectsForKeysWithoutMarker:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "fc_safelyAddObjectsFromArray:", v15);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __71__FCCurrentMagazineContentFetchOperation__filterInaccessibleHeadlines___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "hasAccessToItem:blockedReason:error:", a2, &v3, 0);
}

uint64_t __68__FCCurrentMagazineContentFetchOperation__filterInaccessibleIssues___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "hasAccessToItem:blockedReason:error:", a2, &v3, 0);
}

- (FCCachePolicy)cachedPolicy
{
  return self->_cachedPolicy;
}

- (void)setCachedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPolicy, a3);
}

- (int64_t)contentOptions
{
  return self->_contentOptions;
}

- (void)setContentOptions:(int64_t)a3
{
  self->_contentOptions = a3;
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTrendingHeadlines, 0);
  objc_storeStrong((id *)&self->_resultCurrentIssues, 0);
  objc_storeStrong((id *)&self->_resultConfigHeadlines, 0);
  objc_storeStrong((id *)&self->_resultConfigIssues, 0);
  objc_storeStrong((id *)&self->_trendingArticleListID, 0);
  objc_storeStrong((id *)&self->_configArticleIDs, 0);
  objc_storeStrong((id *)&self->_configIssueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedPolicy, 0);
}

@end
