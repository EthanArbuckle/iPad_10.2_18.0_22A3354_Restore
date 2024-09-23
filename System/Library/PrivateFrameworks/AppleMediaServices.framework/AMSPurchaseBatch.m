@implementation AMSPurchaseBatch

- (AMSPurchaseBatch)initWithPurchases:(id)a3 weakPromise:(id)a4
{
  id v6;
  id v7;
  AMSPurchaseBatch *v8;
  NSLock *v9;
  NSLock *lock;
  NSMutableArray *v11;
  NSMutableArray *results;
  uint64_t v13;
  NSMutableArray *purchases;
  NSMutableDictionary *v15;
  NSMutableDictionary *purchaseMap;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *returnedPurchaseIDs;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AMSPurchaseBatch;
  v8 = -[AMSPurchaseBatch init](&v32, sel_init);
  if (v8)
  {
    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v8->_lock;
    v8->_lock = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v8->_results;
    v8->_results = v11;

    objc_storeStrong((id *)&v8->_promise, a4);
    v13 = objc_msgSend(v6, "mutableCopy");
    purchases = v8->_purchases;
    v8->_purchases = (NSMutableArray *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    purchaseMap = v8->_purchaseMap;
    v8->_purchaseMap = v15;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v8->_purchases;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v23 = v8->_purchaseMap;
          objc_msgSend(v22, "uniqueIdentifier", (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v22, v24);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v19);
    }

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    returnedPurchaseIDs = v8->_returnedPurchaseIDs;
    v8->_returnedPurchaseIDs = v25;

  }
  return v8;
}

- (id)purchaseForPurchaseId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSPurchaseBatch lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[NSMutableDictionary objectForKey:](self->_purchaseMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSPurchaseBatch lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (BOOL)finishPurchase:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  AMSPurchaseResult *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "logUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished purchase with error: %{public}@", buf, 0x16u);

    }
    -[AMSPurchaseBatch lock](self, "lock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = self->_purchases;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = objc_alloc_init(AMSPurchaseResult);
          -[AMSPurchaseResult setError:](v17, "setError:", v7);
          -[NSMutableArray addObject:](self->_results, "addObject:", v17);
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v18, "OSLogObject");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "logUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = v20;
            v31 = 2114;
            v32 = v7;
            _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished batch item purchase with error: %{public}@", buf, 0x16u);

          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    -[NSMutableArray removeAllObjects](self->_purchases, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_purchaseMap, "removeAllObjects");
    -[AMSMutableLazyPromise finishWithError:](self->_promise, "finishWithError:", v7);
    self->_isComplete = 1;
    -[AMSPurchaseBatch lock](self, "lock");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unlock");

  }
  return v6 != 0;
}

- (BOOL)finishPurchase:(id)a3 withResult:(id)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *purchaseMap;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSMutableArray *results;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  NSMutableArray *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSMutableArray *)a4;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "logUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished purchase with result: %{public}@", (uint8_t *)&v20, 0x16u);

    }
    -[AMSPurchaseBatch lock](self, "lock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    -[NSMutableArray addObject:](self->_results, "addObject:", v7);
    -[NSMutableArray removeObject:](self->_purchases, "removeObject:", v6);
    purchaseMap = self->_purchaseMap;
    objc_msgSend(v6, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](purchaseMap, "removeObjectForKey:", v13);

    if (!-[NSMutableArray count](self->_purchases, "count"))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "logUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        results = self->_results;
        v20 = 138543618;
        v21 = v16;
        v22 = 2114;
        v23 = results;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "AMSPurchaseQueue: [%{public}@] Finished promise with results: %{public}@", (uint8_t *)&v20, 0x16u);

      }
      -[AMSMutableLazyPromise finishWithResult:](self->_promise, "finishWithResult:", self->_results);
      self->_isComplete = 1;
    }
    -[AMSPurchaseBatch lock](self, "lock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unlock");

  }
  return v6 != 0;
}

- (id)nextPurchase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[AMSPurchaseBatch lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[AMSPurchaseBatch purchases](self, "purchases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__AMSPurchaseBatch_nextPurchase__block_invoke;
  v10[3] = &unk_1E2544DC8;
  v10[4] = self;
  objc_msgSend(v4, "ams_firstObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSPurchaseBatch returnedPurchaseIDs](self, "returnedPurchaseIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  -[AMSPurchaseBatch lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v5;
}

uint64_t __32__AMSPurchaseBatch_nextPurchase__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "returnedPurchaseIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (AMSMutableLazyPromise)promise
{
  return self->_promise;
}

- (NSMutableArray)purchases
{
  return self->_purchases;
}

- (NSMutableDictionary)purchaseMap
{
  return self->_purchaseMap;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableArray)returnedPurchaseIDs
{
  return self->_returnedPurchaseIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedPurchaseIDs, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_purchaseMap, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
