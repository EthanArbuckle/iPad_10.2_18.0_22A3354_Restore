@implementation HKMCPregnancyModelProvider

- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3
{
  return -[HKMCPregnancyModelProvider initWithHealthStore:startQueryImmediately:](self, "initWithHealthStore:startQueryImmediately:", a3, 1);
}

- (HKMCPregnancyModelProvider)initWithHealthStore:(id)a3 startQueryImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  HKMCPregnancyModelProvider *v8;
  HKMCPregnancyModelProvider *v9;
  id v10;
  uint64_t v11;
  HKObserverSet *observers;
  NSMutableArray *v13;
  NSMutableArray *nextPregnancyModelQueryResultBlocks;
  objc_super v16;

  v4 = a4;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCPregnancyModelProvider;
  v8 = -[HKMCPregnancyModelProvider init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v10 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v11 = objc_msgSend(v10, "initWithName:loggingCategory:", CFSTR("HKMCPregnancyModelProviderObservers"), *MEMORY[0x24BDD3030]);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    nextPregnancyModelQueryResultBlocks = v9->_nextPregnancyModelQueryResultBlocks;
    v9->_nextPregnancyModelQueryResultBlocks = v13;

    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4)
      -[HKMCPregnancyModelProvider startQuery](v9, "startQuery");
  }

  return v9;
}

- (void)startQuery
{
  id v3;
  HKMCPregnancyStateQuery *v4;
  HKMCPregnancyStateQuery *pregnancyModelQuery;
  void *v6;
  NSObject *v7;
  void *v8;
  HKMCPregnancyStateQuery *v9;
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
  HKMCPregnancyStateQuery *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_pregnancyModelQuery)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCPregnancyModelProvider.m"), 53, CFSTR("Query can only be started once"));

  }
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDD3CB8]);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __40__HKMCPregnancyModelProvider_startQuery__block_invoke;
  v16 = &unk_24D99D938;
  objc_copyWeak(&v17, &location);
  v4 = (HKMCPregnancyStateQuery *)objc_msgSend(v3, "initWithIsRunningForMaintenance:updateHandler:", 0, &v13);
  pregnancyModelQuery = self->_pregnancyModelQuery;
  self->_pregnancyModelQuery = v4;

  -[HKMCPregnancyModelProvider description](self, "description", v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCPregnancyStateQuery setDebugIdentifier:](self->_pregnancyModelQuery, "setDebugIdentifier:", v6);

  _HKInitializeLogging();
  v7 = (id)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = self->_pregnancyModelQuery;
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v10 = v8;
    _os_log_impl(&dword_218A9C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting pregnancy model query %{public}@", buf, 0x16u);

  }
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_pregnancyModelQuery);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __40__HKMCPregnancyModelProvider_startQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handlePregnancyModelQueryResult:error:", v7, v6);

}

- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4
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
  _QWORD v24[4];
  NSError *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastPregnancyModel, a3);
    lastError = self->_lastError;
    self->_lastError = 0;

    observers = self->_observers;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __69__HKMCPregnancyModelProvider__handlePregnancyModelQueryResult_error___block_invoke;
    v24[3] = &unk_24D99D960;
    v25 = (NSError *)v7;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v24);
    v11 = v25;
LABEL_3:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    -[HKMCPregnancyModelProvider _handlePregnancyModelQueryResult:error:].cold.1(v12, (uint64_t)self, (uint64_t)v8);
  if (!self->_lastPregnancyModel)
  {
    if (v8)
    {
      v19 = (NSError *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("Query returned with no model and no error"));
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v11 = self->_lastError;
    self->_lastError = v19;
    goto LABEL_3;
  }
LABEL_7:
  v13 = (void *)-[NSMutableArray copy](self->_nextPregnancyModelQueryResultBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_nextPregnancyModelQueryResultBlocks, "removeAllObjects");
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

uint64_t __69__HKMCPregnancyModelProvider__handlePregnancyModelQueryResult_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pregnancyModelDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[HKMCPregnancyModel copy](self->_lastPregnancyModel, "copy");
  v5 = (void *)-[NSError copy](self->_lastError, "copy");
  os_unfair_lock_unlock(p_lock);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  HKSensitiveLogItem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p pregnancyModel:%@ error:%@>"), v7, self, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  HKMCPregnancyStateQuery *pregnancyModelQuery;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  HKMCPregnancyStateQuery *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    pregnancyModelQuery = self->_pregnancyModelQuery;
    *(_DWORD *)buf = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = pregnancyModelQuery;
    v7 = v5;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping pregnancy model query %{public}@", buf, 0x16u);

  }
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_pregnancyModelQuery);
  v8.receiver = self;
  v8.super_class = (Class)HKMCPregnancyModelProvider;
  -[HKMCPregnancyModelProvider dealloc](&v8, sel_dealloc);
}

- (id)getCurrentPregnancyModel
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[HKMCPregnancyModel copy](self->_lastPregnancyModel, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)registerObserver:(id)a3 isUserInitiated:(BOOL)a4
{
  id v5;
  void *v6;
  HKObserverSet *observers;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", v5);
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[HKMCPregnancyModel copy](self->_lastPregnancyModel, "copy");
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    observers = self->_observers;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__HKMCPregnancyModelProvider_registerObserver_isUserInitiated___block_invoke;
    v8[3] = &unk_24D99D960;
    v9 = v6;
    -[HKObserverSet notifyObserver:handler:](observers, "notifyObserver:handler:", v5, v8);

  }
}

uint64_t __63__HKMCPregnancyModelProvider_registerObserver_isUserInitiated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pregnancyModelDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)unregisterObserver:(id)a3
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
  objc_storeStrong((id *)&self->_lastPregnancyModel, 0);
  objc_storeStrong((id *)&self->_pregnancyModelQuery, 0);
  objc_storeStrong((id *)&self->_nextPregnancyModelQueryResultBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handlePregnancyModelQueryResult:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
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
  _os_log_error_impl(&dword_218A9C000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error in pregnancy state query: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
