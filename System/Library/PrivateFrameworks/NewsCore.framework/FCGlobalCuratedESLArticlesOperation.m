@implementation FCGlobalCuratedESLArticlesOperation

- (FCGlobalCuratedESLArticlesOperation)init
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
    v8 = "-[FCGlobalCuratedESLArticlesOperation init]";
    v9 = 2080;
    v10 = "FCGlobalCuratedESLArticlesOperation.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCGlobalCuratedESLArticlesOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCGlobalCuratedESLArticlesOperation)initWithContext:(id)a3 configuration:(id)a4 bundleSubscriptionManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCGlobalCuratedESLArticlesOperation *v12;
  FCGlobalCuratedESLArticlesOperation *v13;
  uint64_t v14;
  NSArray *networkEvents;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCGlobalCuratedESLArticlesOperation;
  v12 = -[FCOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_bundleSubscriptionManager, a5);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    networkEvents = v13->_networkEvents;
    v13->_networkEvents = (NSArray *)v14;

  }
  return v13;
}

- (void)prepareOperation
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke;
  v4[3] = &unk_1E4643BA0;
  v4[4] = self;
  __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_evergreenArticleListIDs, v3);

}

id __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[50];
  v3 = v2;
  objc_msgSend(v3, "cachedSubscription");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject((id)v4, (const void *)(v4 + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  v7 = v6;
  objc_getAssociatedObject((id)v4, (const void *)~v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "unsignedIntegerValue") + 1) ^ (v7 + 1);

  if ((v9 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        v11 = *(void **)(v10 + 392);
      else
        v11 = 0;
      objc_msgSend(v11, "freeGlobalESLArticleListIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      return v12;
    }
LABEL_12:
    v12 = 0;
    return v12;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_12;
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 392);
  else
    v14 = 0;
  objc_msgSend(v14, "paidGlobalESLArticleListIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (void)performOperation
{
  FCGlobalCuratedESLArticlesOperation *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSArray *evergreenArticleListIDs;
  FCCKBatchedMultiFetchQueryOperation *v7;
  FCContentContext *context;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD newValue[5];
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  NSArray *v30;
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCGlobalCuratedESLArticlesOperation *)self->_evergreenArticleListIDs;
  if (-[FCGlobalCuratedESLArticlesOperation count](self, "count"))
  {
    v3 = (id)FCOperationLog;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      if (v2)
        evergreenArticleListIDs = v2->_evergreenArticleListIDs;
      else
        evergreenArticleListIDs = 0;
      *(_DWORD *)buf = 138543618;
      v28 = v4;
      v29 = 2114;
      v30 = evergreenArticleListIDs;
      _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch from article list IDs: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
    if (v2)
      context = v2->_context;
    else
      context = 0;
    -[FCContentContext internalContentContext](context, "internalContentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v10);

    +[FCEdgeCacheHint edgeCacheHintForEvergreenArticles](FCEdgeCacheHint, "edgeCacheHintForEvergreenArticles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_setProperty_nonatomic_copy(v7, v11, v12, 416);

    if (v2)
      v13 = v2->_evergreenArticleListIDs;
    else
      v13 = 0;
    -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v13);
    if (v7)
      v7->_maxBatchSize = 1;
    v14 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_16;
    v25[3] = &unk_1E463AA30;
    v25[4] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v15);

    newValue[0] = v14;
    newValue[1] = 3221225472;
    newValue[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_2;
    newValue[3] = &unk_1E4644438;
    newValue[4] = v2;
    v17 = (id)objc_opt_new();
    v24 = v17;
    if (v7)
      objc_setProperty_nonatomic_copy(v7, v16, newValue, 440);
    objc_initWeak((id *)buf, v7);
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_4;
    v20[3] = &unk_1E46435F8;
    v20[4] = v2;
    objc_copyWeak(&v22, (id *)buf);
    v19 = v17;
    v21 = v19;
    if (v7)
      objc_setProperty_nonatomic_copy(v7, v18, v20, 448);
    -[FCOperation associateChildOperation:](v2, "associateChildOperation:", v7);
    -[FCOperation start](v7, "start");

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke;
    v26[3] = &unk_1E463AB18;
    v26[4] = v2;
    __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke((uint64_t)v26);
  }
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will end early because there are no article list IDs", (uint8_t *)&v7, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
}

void __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_16(uint64_t a1, void *a2)
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  SEL v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, CFSTR("ArticleList"), 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E0C9AA60], 24);
  }
  v22[0] = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);

  objc_msgSend(v3, "addObject:", v6);
  v10 = (void *)objc_opt_new();
  v12 = v10;
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v11, CFSTR("Article"), 16);
  v13 = (void *)MEMORY[0x1E0D626D0];
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 384);
  else
    v15 = 0;
  objc_msgSend(v15, "internalContentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "articleRecordSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keysForArticleRecordWithRecordSource:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  if (v12)
  {
    objc_setProperty_nonatomic_copy(v12, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v12, v21, MEMORY[0x1E0C9AA60], 32);
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", v12);

}

void __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_22_0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "fc_onlyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = v8;
  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__FCGlobalCuratedESLArticlesOperation__feedItemsFromArticleRecords_sourceArticleListID___block_invoke;
    v12[3] = &unk_1E463D668;
    v12[4] = v6;
    v13 = v8;
    objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Article"));

  return v3;
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a4;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8 = WeakRetained;
    if (WeakRetained)
      v9 = (void *)*((_QWORD *)WeakRetained + 53);
    else
      v9 = 0;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      objc_storeStrong((id *)(v11 + 376), v9);

    objc_msgSend(*(id *)(a1 + 40), "readOnlyArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      objc_storeStrong((id *)(v13 + 416), v12);

    v5 = *(void **)(a1 + 32);
    v6 = 0;
  }
  return objc_msgSend(v5, "finishedPerformingOperationWithError:", v6);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *resultFeedItems;
  NSArray *v8;
  id v9;

  v9 = a3;
  -[FCGlobalCuratedESLArticlesOperation completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCGlobalCuratedESLArticlesOperation completionHandler](self, "completionHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self)
      resultFeedItems = self->_resultFeedItems;
    else
      resultFeedItems = 0;
    if (resultFeedItems)
      v8 = resultFeedItems;
    else
      v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v8, v9);

  }
}

id __88__FCGlobalCuratedESLArticlesOperation__feedItemsFromArticleRecords_sourceArticleListID___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v13, "addSurfacedByArticleListID:", *(_QWORD *)(a1 + 40));
  return v13;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
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
  objc_storeStrong((id *)&self->_evergreenArticleListIDs, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
