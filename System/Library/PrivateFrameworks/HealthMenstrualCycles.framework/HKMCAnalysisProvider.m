@implementation HKMCAnalysisProvider

- (HKMCAnalysisProvider)initWithHealthStore:(id)a3
{
  return -[HKMCAnalysisProvider initWithHealthStore:startAnalysisQueryImmediately:](self, "initWithHealthStore:startAnalysisQueryImmediately:", a3, 1);
}

- (HKMCAnalysisProvider)initWithHealthStore:(id)a3 startAnalysisQueryImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  HKMCAnalysisProvider *v8;
  HKMCAnalysisProvider *v9;
  id v10;
  uint64_t v11;
  HKObserverSet *observers;
  NSMutableArray *v13;
  NSMutableArray *nextAnalysisQueryResultBlocks;
  objc_super v16;

  v4 = a4;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCAnalysisProvider;
  v8 = -[HKMCAnalysisProvider init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v10 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v11 = objc_msgSend(v10, "initWithName:loggingCategory:", CFSTR("HKMCAnalysisProviderObservers"), *MEMORY[0x24BDD3030]);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    nextAnalysisQueryResultBlocks = v9->_nextAnalysisQueryResultBlocks;
    v9->_nextAnalysisQueryResultBlocks = v13;

    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4)
      -[HKMCAnalysisProvider startAnalysisQuery](v9, "startAnalysisQuery");
  }

  return v9;
}

- (void)startAnalysisQuery
{
  HKMCAnalysisQuery *v3;
  HKMCAnalysisQuery *v4;
  HKMCAnalysisQuery *analysisQuery;
  void *v6;
  NSObject *v7;
  void *v8;
  HKMCAnalysisQuery *v9;
  id v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, void *);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  HKMCAnalysisQuery *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_analysisQuery)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCAnalysisProvider.m"), 54, CFSTR("Analysis query can only be started once"));

  }
  objc_initWeak(&location, self);
  v3 = [HKMCAnalysisQuery alloc];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __42__HKMCAnalysisProvider_startAnalysisQuery__block_invoke;
  v16 = &unk_24D99DF30;
  objc_copyWeak(&v17, &location);
  v4 = -[HKMCAnalysisQuery initWithUpdateHandler:](v3, "initWithUpdateHandler:", &v13);
  analysisQuery = self->_analysisQuery;
  self->_analysisQuery = v4;

  -[HKMCAnalysisProvider description](self, "description", v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuery setDebugIdentifier:](self->_analysisQuery, "setDebugIdentifier:", v6);

  _HKInitializeLogging();
  v7 = (id)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = self->_analysisQuery;
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v10 = v8;
    _os_log_impl(&dword_218A9C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting analysis query %{public}@", buf, 0x16u);

  }
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_analysisQuery);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __42__HKMCAnalysisProvider_startAnalysisQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAnalysisQueryResult:error:", v7, v6);

}

- (void)_handleAnalysisQueryResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSError *lastError;
  HKObserverSet *observers;
  NSError *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSError *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  NSError *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastAnalysis, a3);
    lastError = self->_lastError;
    self->_lastError = 0;

    observers = self->_observers;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __57__HKMCAnalysisProvider__handleAnalysisQueryResult_error___block_invoke;
    v24[3] = &unk_24D99DF58;
    v24[4] = self;
    v25 = (NSError *)v7;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v24);
    v11 = v25;
LABEL_3:

    goto LABEL_9;
  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCAnalysisProvider _handleAnalysisQueryResult:error:].cold.1(v12, (uint64_t)self, (uint64_t)v8);
  if (!self->_lastAnalysis)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Query returned with no analysis and no error"));
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
      v11 = self->_lastError;
      self->_lastError = v19;
      goto LABEL_3;
    }
    objc_storeStrong((id *)&self->_lastError, a4);
  }
LABEL_9:
  v13 = (void *)-[NSMutableArray copy](self->_nextAnalysisQueryResultBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_nextAnalysisQueryResultBlocks, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v16);
  }

}

uint64_t __57__HKMCAnalysisProvider__handleAnalysisQueryResult_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "analysisProvider:didUpdateAnalysis:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[HKMCAnalysis copy](self->_lastAnalysis, "copy");
  v5 = (void *)-[NSError copy](self->_lastError, "copy");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p analysis:%@ error:%@>"), objc_opt_class(), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_analysisQuery);
  v3.receiver = self;
  v3.super_class = (Class)HKMCAnalysisProvider;
  -[HKMCAnalysisProvider dealloc](&v3, sel_dealloc);
}

- (void)analysisWithCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *nextAnalysisQueryResultBlocks;
  void *v8;
  void (**v9)(id, uint64_t, uint64_t);

  v9 = (void (**)(id, uint64_t, uint64_t))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[HKMCAnalysis copy](self->_lastAnalysis, "copy");
  v6 = -[NSError copy](self->_lastError, "copy");
  if (v5 | v6)
  {
    os_unfair_lock_unlock(&self->_lock);
    v9[2](v9, v5, v6);
  }
  else
  {
    nextAnalysisQueryResultBlocks = self->_nextAnalysisQueryResultBlocks;
    v8 = (void *)MEMORY[0x219A1F070](v9);
    -[NSMutableArray addObject:](nextAnalysisQueryResultBlocks, "addObject:", v8);

    os_unfair_lock_unlock(p_lock);
  }

}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  HKObserverSet *observers;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", v6, a4);
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)-[HKMCAnalysis copy](self->_lastAnalysis, "copy");
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    observers = self->_observers;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__HKMCAnalysisProvider_addObserver_queue___block_invoke;
    v9[3] = &unk_24D99DF58;
    v9[4] = self;
    v10 = v7;
    -[HKObserverSet notifyObserver:handler:](observers, "notifyObserver:handler:", v6, v9);

  }
}

uint64_t __42__HKMCAnalysisProvider_addObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "analysisProvider:didUpdateAnalysis:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastAnalysis, 0);
  objc_storeStrong((id *)&self->_analysisQuery, 0);
  objc_storeStrong((id *)&self->_nextAnalysisQueryResultBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handleAnalysisQueryResult:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_218A9C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in analysis query: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
