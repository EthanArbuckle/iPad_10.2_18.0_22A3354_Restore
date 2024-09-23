@implementation FCPurchaseLookupFetchOperation

void __62__FCPurchaseLookupFetchOperation_processFetchedResults_error___block_invoke(_QWORD *a1, void *a2)
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
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasPrefix:", CFSTR("IAP-")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("IAP-"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "channelTagIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)a1[4];
      objc_msgSend(v3, "channelTagIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v8, "setObject:forKey:", v10, v6);

    }
    objc_msgSend(v3, "bundleChannelTagIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)a1[5];
      objc_msgSend(v3, "bundleChannelTagIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v12, "setObject:forKey:", v14, v6);

    }
  }
  else
  {
    v15 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "Purchase lookup identifier should have prefix IAP- but found %@", (uint8_t *)&v21, 0xCu);
    }
  }
  objc_msgSend(v3, "bundleChannelTagIDsVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "bundleChannelTagIDsVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- (void)performOperation
{
  void *v3;
  void *v4;
  FCRecordChainFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.stocks.widget")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.news.widget")))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke;
    v13[3] = &unk_1E463AB18;
    v13[4] = self;
    __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke((uint64_t)v13);
  }
  else
  {
    v5 = objc_alloc_init(FCRecordChainFetchOperation);
    -[FCPurchaseLookupFetchOperation contentContext](self, "contentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setContext:](v5, "setContext:", v6);

    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 900.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePolicy:](v5, "setCachePolicy:", v7);

    -[FCPurchaseLookupFetchOperation purchaseIDs](self, "purchaseIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseLookupFetchOperation _prefixedPurchasedIDs:](self, "_prefixedPurchasedIDs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v5, "setTopLevelRecordIDs:", v9);

    v14 = CFSTR("PurchaseLookup");
    v15[0] = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v5, "setLinkKeysByRecordType:", v10);

    +[FCEdgeCacheHint edgeCacheHintForPurchaseLookup](FCEdgeCacheHint, "edgeCacheHintForPurchaseLookup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setEdgeCacheHint:](v5, "setEdgeCacheHint:", v11);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke_2;
    v12[3] = &unk_1E463D040;
    v12[4] = self;
    -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v5, "setRecordChainCompletionHandler:", v12);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
    -[FCOperation start](v5, "start");

  }
}

- (NSArray)purchaseIDs
{
  return self->_purchaseIDs;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (id)_prefixedPurchasedIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__FCPurchaseLookupFetchOperation__prefixedPurchasedIDs___block_invoke;
  v9[3] = &unk_1E463D0B8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (FCPurchaseLookupFetchOperation)initWithPurchaseIDs:(id)a3 contentContext:(id)a4
{
  id v7;
  id v8;
  FCPurchaseLookupFetchOperation *v9;
  FCPurchaseLookupFetchOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCPurchaseLookupFetchOperation;
  v9 = -[FCFetchOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_purchaseIDs, a3);
    objc_storeStrong((id *)&v10->_contentContext, a4);
  }

  return v10;
}

void __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Error when fetching purchase lookup record error=%{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_onlyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processFetchedResults:error:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishExecutingWithFetchedObject:", v11);

}

- (id)processFetchedResults:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  FCPurchaseLookupFetchOperationResult *v11;
  FCPurchaseLookupFetchOperationResult *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__78;
  v22 = __Block_byref_object_dispose__78;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__FCPurchaseLookupFetchOperation_processFetchedResults_error___block_invoke;
  v14[3] = &unk_1E464A830;
  v9 = v7;
  v15 = v9;
  v10 = v8;
  v16 = v10;
  v17 = &v18;
  objc_msgSend(v5, "enumerateRecordsAndInterestTokensWithBlock:", v14);
  v11 = [FCPurchaseLookupFetchOperationResult alloc];
  v12 = -[FCPurchaseLookupFetchOperationResult initWithChannelIDsByPurchaseID:bundleChannelIDsByPurchaseID:bundleChannelIDsVersion:error:](v11, "initWithChannelIDsByPurchaseID:bundleChannelIDsByPurchaseID:bundleChannelIDsVersion:error:", v9, v10, v19[5], v6);

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_purchaseIDs, 0);
}

void __56__FCPurchaseLookupFetchOperation__prefixedPurchasedIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("IAP-"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (FCPurchaseLookupFetchOperation)init
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
    v8 = "-[FCPurchaseLookupFetchOperation init]";
    v9 = 2080;
    v10 = "FCPurchaseLookupFetchOperation.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPurchaseLookupFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void __50__FCPurchaseLookupFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 41, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v2);

}

- (void)setPurchaseIDs:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseIDs, a3);
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

@end
