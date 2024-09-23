@implementation FCFeaturedArticlesOperation

- (FCFeaturedArticlesOperation)init
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
    v8 = "-[FCFeaturedArticlesOperation init]";
    v9 = 2080;
    v10 = "FCFeaturedArticlesOperation.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeaturedArticlesOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCFeaturedArticlesOperation)initWithContext:(id)a3
{
  id v5;
  FCFeaturedArticlesOperation *v6;
  FCFeaturedArticlesOperation *v7;
  uint64_t v8;
  NSArray *networkEvents;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeaturedArticlesOperation;
  v6 = -[FCOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    networkEvents = v7->_networkEvents;
    v7->_networkEvents = (NSArray *)v8;

  }
  return v7;
}

- (BOOL)validateOperation
{
  _BOOL4 v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("current featured headlines fetch operation requires a context"));
      v5 = 136315906;
      v6 = "-[FCFeaturedArticlesOperation validateOperation]";
      v7 = 2080;
      v8 = "FCFeaturedArticlesOperation.m";
      v9 = 1024;
      v10 = 59;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[6];

  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke;
  v17[3] = &unk_1E463D3A8;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_2;
  v16[3] = &unk_1E463E9E8;
  v16[4] = self;
  objc_msgSend(v4, "thenOn:then:", v5, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_3;
  v15[3] = &unk_1E463EA10;
  v15[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_4;
  v14[3] = &unk_1E463EA10;
  v14[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_5;
  v13[3] = &unk_1E463EA38;
  v13[4] = self;
  v12 = (id)objc_msgSend(v10, "errorOn:error:", v11, v13);

}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 384), "configurationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    FCCoreConfigurationPromise(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  objc_msgSend(a2, "paidBundleConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featuredArticlesTagList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2;
    v11[3] = &unk_1E463F188;
    v11[4] = v2;
    v12 = v5;
    v7 = v5;
    v8 = (void *)objc_msgSend(v6, "initWithResolver:", v11);

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v8 = (void *)objc_msgSend(v9, "initWithValue:", MEMORY[0x1E0C9AA60]);
  }

  return v8;
}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__FCFeaturedArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke;
  v6[3] = &unk_1E463EA88;
  v6[4] = v2;
  objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60AF0]), "initWithValue:", v3);

  return v4;
}

uint64_t __47__FCFeaturedArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 392), a2);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __47__FCFeaturedArticlesOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *resultFeedItems;
  id v8;

  v8 = a3;
  -[FCFeaturedArticlesOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCFeaturedArticlesOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self)
      resultFeedItems = self->_resultFeedItems;
    else
      resultFeedItems = 0;
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, resultFeedItems, v8);

  }
}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKMultiFetchQueryOperation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, uint64_t);
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[5];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKMultiFetchQueryOperation);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 384);
  else
    v9 = 0;
  objc_msgSend(v9, "internalContentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v11);

  +[FCEdgeCacheHint edgeCacheHintForFeaturedArticles](FCEdgeCacheHint, "edgeCacheHintForFeaturedArticles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v12, v13, 408);

  v30[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v14);

  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3;
  v29[3] = &unk_1E463AA30;
  v29[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v16);

  objc_initWeak(&location, v7);
  v20 = v15;
  v21 = 3221225472;
  v22 = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_4;
  v23 = &unk_1E463F160;
  v17 = v6;
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v17;
  objc_copyWeak(&v27, &location);
  v19 = v5;
  v26 = v19;
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v18, &v20, 432);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v20, v21, v22, v23, v24);
  -[FCOperation start](v7, "start");

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  SEL v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  SEL v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  SEL v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  SEL v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  SEL v39;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[2];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, CFSTR("TagList"), 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E0C9AA60], 24);
  }
  v43[0] = CFSTR("tagIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);

  objc_msgSend(v3, "addObject:", v6);
  v10 = (void *)objc_opt_new();
  v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, CFSTR("Tag"), 16);
    objc_setProperty_nonatomic_copy(v12, v13, MEMORY[0x1E0C9AA60], 24);
  }
  v42[0] = CFSTR("latestIssueIDs");
  v42[1] = CFSTR("currentNonIssueBundleFeaturedArticleListID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_setProperty_nonatomic_copy(v12, v14, v15, 32);

  objc_msgSend(v3, "addObject:", v12);
  v16 = (void *)objc_opt_new();
  v18 = v16;
  if (v16)
  {
    objc_setProperty_nonatomic_copy(v16, v17, CFSTR("Issue"), 16);
    objc_setProperty_nonatomic_copy(v18, v19, MEMORY[0x1E0C9AA60], 24);
  }
  v41 = CFSTR("bundleFeaturedArticleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_setProperty_nonatomic_copy(v18, v20, v21, 32);

  objc_msgSend(v3, "addObject:", v18);
  v22 = (void *)objc_opt_new();
  v24 = v22;
  if (v22)
  {
    objc_setProperty_nonatomic_copy(v22, v23, CFSTR("ArticleList"), 16);
    objc_setProperty_nonatomic_copy(v24, v25, MEMORY[0x1E0C9AA60], 24);
  }
  v40 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_setProperty_nonatomic_copy(v24, v26, v27, 32);

  objc_msgSend(v3, "addObject:", v24);
  v28 = (void *)objc_opt_new();
  v30 = v28;
  if (v28)
    objc_setProperty_nonatomic_copy(v28, v29, CFSTR("Article"), 16);
  v31 = (void *)MEMORY[0x1E0D626D0];
  v32 = *(_QWORD *)(a1 + 32);
  if (v32)
    v33 = *(void **)(v32 + 384);
  else
    v33 = 0;
  objc_msgSend(v33, "internalContentContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "articleRecordSource");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "keysForArticleRecordWithRecordSource:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v36;
  if (v30)
  {
    objc_setProperty_nonatomic_copy(v30, v37, v36, 24);

    objc_setProperty_nonatomic_copy(v30, v39, MEMORY[0x1E0C9AA60], 32);
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", v30);

}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_20_0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v6 = WeakRetained;
    if (WeakRetained)
      v7 = (void *)*((_QWORD *)WeakRetained + 52);
    else
      v7 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 376), v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Article"));

  return v3;
}

id __67__FCFeaturedArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0D626D0];
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[48];
  v6 = v5;
  v7 = a2;
  objc_msgSend(v6, "contentStoreFrontID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 384);
  else
    v10 = 0;
  objc_msgSend(v10, "internalContentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "articleRecordSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedItemFromCKRecord:storefrontID:recordSource:", v7, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "markAsEvergreen");
  return v13;
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
