@implementation FCTagCuratedESLArticlesOperation

- (FCTagCuratedESLArticlesOperation)init
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
    v8 = "-[FCTagCuratedESLArticlesOperation init]";
    v9 = 2080;
    v10 = "FCTagCuratedESLArticlesOperation.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagCuratedESLArticlesOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTagCuratedESLArticlesOperation)initWithTags:(id)a3 context:(id)a4 configuration:(id)a5 bundleSubscriptionManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCTagCuratedESLArticlesOperation *v14;
  uint64_t v15;
  NSArray *tags;
  uint64_t v17;
  NSArray *networkEvents;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FCTagCuratedESLArticlesOperation;
  v14 = -[FCOperation init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    tags = v14->_tags;
    v14->_tags = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_context, a4);
    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v14->_bundleSubscriptionManager, a6);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    networkEvents = v14->_networkEvents;
    v14->_networkEvents = (NSArray *)v17;

  }
  return v14;
}

- (void)prepareOperation
{
  uint64_t v3;
  void *v4;
  NSArray *tags;
  NSArray *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke;
  v11[3] = &unk_1E463ADC8;
  v11[4] = self;
  __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke((uint64_t)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (self)
      tags = self->_tags;
    else
      tags = 0;
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_14;
    v8[3] = &unk_1E463D640;
    v9 = v4;
    v6 = tags;
    -[NSArray fc_arrayByTransformingWithBlock:](v6, "fc_arrayByTransformingWithBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_storeStrong((id *)&self->_evergreenArticleListIDs, v7);

  }
  else
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4;
    v10[3] = &unk_1E463AB18;
    v10[4] = self;
    __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4((uint64_t)v10);
  }

}

id __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke(uint64_t a1)
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
    v2 = (_QWORD *)v2[51];
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
        v11 = *(void **)(v10 + 400);
      else
        v11 = 0;
      objc_msgSend(v11, "freeTagESLArticleListIDPrefix");
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
    v14 = *(void **)(v13 + 400);
  else
    v14 = 0;
  objc_msgSend(v14, "paidTagESLArticleListIDPrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

void __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ found no prefix for per-tag ESL article lists", (uint8_t *)&v6, 0xCu);

  }
}

id __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "hasEvergreenArticleList"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)performOperation
{
  FCTagCuratedESLArticlesOperation *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSArray *evergreenArticleListIDs;
  FCCKBatchedMultiFetchQueryOperation *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, uint64_t);
  void *v19;
  FCTagCuratedESLArticlesOperation *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  NSArray *v27;
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCTagCuratedESLArticlesOperation *)self->_evergreenArticleListIDs;
  if (-[FCTagCuratedESLArticlesOperation count](self, "count"))
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
      v25 = v4;
      v26 = 2114;
      v27 = evergreenArticleListIDs;
      _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch from article list IDs: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
    if (v2)
    {
      -[FCContentContext internalContentContext](v2->_context, "internalContentContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentDatabase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v9);

      v10 = v2->_evergreenArticleListIDs;
    }
    else
    {
      objc_msgSend(0, "internalContentContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v15);

      v10 = 0;
    }
    -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v10);
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_19;
    v22[3] = &unk_1E463AA30;
    v22[4] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v12);

    objc_initWeak((id *)buf, v7);
    v16 = v11;
    v17 = 3221225472;
    v18 = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_2;
    v19 = &unk_1E463D690;
    v20 = v2;
    objc_copyWeak(&v21, (id *)buf);
    if (v7)
      objc_setProperty_nonatomic_copy(v7, v13, &v16, 448);
    -[FCOperation associateChildOperation:](v2, "associateChildOperation:", v7, v16, v17, v18, v19, v20);
    -[FCOperation start](v7, "start");
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke;
    v23[3] = &unk_1E463AB18;
    v23[4] = v2;
    __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke((uint64_t)v23);
  }
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke(uint64_t a1)
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

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  SEL v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6 = v4;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, CFSTR("ArticleList"), 16);
  v24[0] = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);

  v23 = CFSTR("articleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v9, v10, 32);

  objc_msgSend(v3, "addObject:", v6);
  v11 = (void *)objc_opt_new();
  v13 = v11;
  if (v11)
    objc_setProperty_nonatomic_copy(v11, v12, CFSTR("Article"), 16);
  v14 = (void *)MEMORY[0x1E0D626D0];
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v16 = *(void **)(v15 + 392);
  else
    v16 = 0;
  objc_msgSend(v16, "internalContentContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "articleRecordSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keysForArticleRecordWithRecordSource:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v20, v19, 24);

    objc_setProperty_nonatomic_copy(v13, v22, MEMORY[0x1E0C9AA60], 32);
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", v13);

}

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a2;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a4);
  }
  else
  {
    objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_5;
    v25[3] = &unk_1E463AA78;
    v26 = v8;
    v11 = v8;
    objc_msgSend(v10, "fc_dictionary:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_27_0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_7;
    v23[3] = &unk_1E463D668;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v12;
    v14 = v12;
    objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v17 = WeakRetained;
    if (WeakRetained)
      v18 = (void *)*((_QWORD *)WeakRetained + 53);
    else
      v18 = 0;
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
      objc_storeStrong((id *)(v20 + 376), v18);

    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
    {
      objc_storeStrong((id *)(v21 + 424), v15);
      v22 = *(void **)(a1 + 32);
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v22, "finishedPerformingOperationWithError:", 0);

  }
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ArticleList"));

  return v3;
}

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "recordID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("articleIDs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v21 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v16);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Article"));

  return v3;
}

id __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D626D0];
    v6 = *(id *)(v3 + 392);
    v7 = a2;
    objc_msgSend(v6, "contentStoreFrontID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v3 + 392), "internalContentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "articleRecordSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedItemFromCKRecord:storefrontID:recordSource:", v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "markAsEvergreen");
      objc_msgSend(v11, "articleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSurfacedByArticleListID:", v13);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  -[FCTagCuratedESLArticlesOperation completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCTagCuratedESLArticlesOperation completionHandler](self, "completionHandler");
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
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
