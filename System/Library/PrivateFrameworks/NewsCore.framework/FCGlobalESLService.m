@implementation FCGlobalESLService

- (FCGlobalESLService)initWithContext:(id)a3
{
  id v5;
  FCGlobalESLService *v6;
  FCGlobalESLService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGlobalESLService;
  v6 = -[FCGlobalESLService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (FCGlobalESLService)init
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
    v8 = "-[FCGlobalESLService init]";
    v9 = 2080;
    v10 = "FCGlobalESLService.m";
    v11 = 1024;
    v12 = 43;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCGlobalESLService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)fetchFeedItemsWithCursor:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  _QWORD v27[7];
  _QWORD v28[6];
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v19 = a3;
  v6 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__36;
  v32[4] = __Block_byref_object_dispose__36;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__36;
  v30[4] = __Block_byref_object_dispose__36;
  v31 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke;
  v29[3] = &unk_1E463D3A8;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_2;
  v28[3] = &unk_1E4640458;
  v28[4] = self;
  v28[5] = v32;
  objc_msgSend(v21, "thenOn:then:", v20, v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_3;
  v27[3] = &unk_1E46447B0;
  v27[4] = self;
  v27[5] = v30;
  v27[6] = v32;
  objc_msgSend(v8, "thenOn:then:", v9, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_4;
  v26[3] = &unk_1E46447D8;
  v26[4] = v30;
  objc_msgSend(v10, "thenOn:then:", v11, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_5;
  v24[3] = &unk_1E46404A8;
  v14 = v6;
  v25 = v14;
  objc_msgSend(v12, "thenOn:then:", v13, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_6;
  v22[3] = &unk_1E463DB48;
  v17 = v14;
  v23 = v17;
  v18 = (id)objc_msgSend(v15, "errorOn:error:", v16, v22);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseConfiguration");
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "shouldManuallySupplementEvergreenWithIssueArticles"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_promiseIssueFeedItemsWithConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_promiseCuratedFeedItemsWithConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingUniqueObjectsFromArray:toArray:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

id __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __58__FCGlobalESLService_fetchFeedItemsWithCursor_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_promiseConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[FCGlobalESLService context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCCoreConfigurationPromise(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_promiseIssueFeedItemsWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D60AF0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke;
  v15[3] = &unk_1E463EBC0;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v6, "firstly:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke_2;
  v13[3] = &unk_1E4644800;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v8, "thenOn:then:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseIssuesWithConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__FCGlobalESLService__promiseIssueFeedItemsWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_promiseFeedItemsWithIssues:configuration:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_promiseIssuesWithConfiguration:(id)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke;
  v6[3] = &unk_1E463DAD0;
  v6[4] = self;
  return (id)objc_msgSend(v4, "initWithResolver:", v6);
}

void __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCurrentIssuesFetchOperation *v7;
  void *v8;
  FCCurrentIssuesFetchOperation *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCCurrentIssuesFetchOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCCurrentIssuesFetchOperation initWithContext:](v7, "initWithContext:", v8);

  v10 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[FCOperation shortOperationDescription](v9, "shortOperationDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "will fetch current issues with operation: %{public}@", buf, 0xCu);

  }
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke_14;
  v18 = &unk_1E46404F0;
  v19 = v6;
  v20 = v5;
  v13 = v5;
  v14 = v6;
  -[FCCurrentIssuesFetchOperation setFetchCompletionHandler:](v9, "setFetchCompletionHandler:", &v15);
  -[FCOperation start](v9, "start", v15, v16, v17, v18);

}

void __54__FCGlobalESLService__promiseIssuesWithConfiguration___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "did fetch %lu issues", (uint8_t *)&v10, 0xCu);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (id)_promiseFeedItemsWithIssues:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke;
  v13[3] = &unk_1E463F5A8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithResolver:", v13);

  return v11;
}

void __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCIssueArticlesOperation *v7;
  void *v8;
  FCIssueArticlesOperation *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCIssueArticlesOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCIssueArticlesOperation initWithContext:issues:](v7, "initWithContext:issues:", v8, *(_QWORD *)(a1 + 40));

  +[FCEdgeCacheHint edgeCacheHintForCurrentIssueArticles](FCEdgeCacheHint, "edgeCacheHintForCurrentIssueArticles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCIssueArticlesOperation setEdgeCacheHint:](v9, "setEdgeCacheHint:", v10);

  -[FCIssueArticlesOperation setMaxIssuesPerFetch:](v9, "setMaxIssuesPerFetch:", objc_msgSend(*(id *)(a1 + 48), "maxIssuesPerESLInventoryRequest"));
  v11 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[FCOperation shortOperationDescription](v9, "shortOperationDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "will fetch issue feed items with operation: %{public}@", buf, 0xCu);

  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke_20;
  v19 = &unk_1E46404F0;
  v20 = v6;
  v21 = v5;
  v14 = v5;
  v15 = v6;
  -[FCIssueArticlesOperation setFetchCompletionHandler:](v9, "setFetchCompletionHandler:", &v16);
  -[FCOperation start](v9, "start", v16, v17, v18, v19);

}

void __64__FCGlobalESLService__promiseFeedItemsWithIssues_configuration___block_invoke_20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_markAsEvergreen);
    v8 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = 134217984;
      v11 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "did fetch %lu issue feed items", (uint8_t *)&v10, 0xCu);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (id)_promiseCuratedFeedItemsWithConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke;
  v9[3] = &unk_1E463F188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCGlobalCuratedESLArticlesOperation *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FCGlobalCuratedESLArticlesOperation *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = [FCGlobalCuratedESLArticlesOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleSubscriptionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCGlobalCuratedESLArticlesOperation initWithContext:configuration:bundleSubscriptionManager:](v7, "initWithContext:configuration:bundleSubscriptionManager:", v8, v9, v11);

  v13 = (void *)FCESLInventoryLog;
  if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[FCOperation shortOperationDescription](v12, "shortOperationDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v15;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "will fetch global evergreen feed items with operation: %{public}@", buf, 0xCu);

  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke_24;
  v21 = &unk_1E46404F0;
  v22 = v6;
  v23 = v5;
  v16 = v5;
  v17 = v6;
  -[FCGlobalCuratedESLArticlesOperation setCompletionHandler:](v12, "setCompletionHandler:", &v18);
  -[FCOperation start](v12, "start", v18, v19, v20, v21);

}

void __64__FCGlobalESLService__promiseCuratedFeedItemsWithConfiguration___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = (void *)FCESLInventoryLog;
    if (os_log_type_enabled((os_log_t)FCESLInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "did fetch %lu global evergreen feed items", (uint8_t *)&v10, 0xCu);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (FCCloudContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
