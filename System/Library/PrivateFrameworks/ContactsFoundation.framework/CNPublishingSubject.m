@implementation CNPublishingSubject

- (void)observerDidComplete
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CNPublishingSubject enforcement](self, "enforcement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidComplete");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CNPublishingSubject _allObservers](self, "_allObservers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "observerDidComplete");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[CNPublishingSubject cleanUpAfterTermination](self, "cleanUpAfterTermination");
}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[CNObservableContractEnforcement shouldSwizzleNilResults](CNObservableContractEnforcement, "shouldSwizzleNilResults");
  if (!v4 && v5)
  {
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CNBehaviorSubject observerDidReceiveResult:].cold.2(v6);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNBehaviorSubject observerDidReceiveResult:].cold.1(v7);

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CNPublishingSubject enforcement](self, "enforcement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observerDidReceiveResult:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNPublishingSubject _allObservers](self, "_allObservers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "observerDidReceiveResult:", v4);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

- (id)_allObservers
{
  CNPublishingSubject *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2->_observers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)cleanUpAfterTermination
{
  CNCancelable *upstreamToken;

  -[CNCancelable cancel](self->_upstreamToken, "cancel");
  upstreamToken = self->_upstreamToken;
  self->_upstreamToken = 0;

}

- (id)subscribe:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CNPublishingSubject _addObserver:](self, "_addObserver:", v4);
  -[CNPublishingSubject _subscribeToObservableIfNecessary](self, "_subscribeToObservableIfNecessary");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__CNPublishingSubject_subscribe___block_invoke;
  v8[3] = &unk_1E29B8C10;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_subscribeToObservableIfNecessary
{
  CNPublishingSubject *v2;
  CNCancelable *upstreamToken;
  uint64_t v4;
  CNCancelable *v5;

  v2 = self;
  objc_sync_enter(v2);
  upstreamToken = v2->_upstreamToken;
  objc_sync_exit(v2);

  if (!upstreamToken)
  {
    -[CNObservable subscribe:](v2->_observable, "subscribe:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_upstreamToken;
    v2->_upstreamToken = (CNCancelable *)v4;

  }
}

- (void)_addObserver:(id)a3
{
  CNPublishingSubject *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (CNPublishingSubject)initWithObservable:(id)a3
{
  id v5;
  CNPublishingSubject *v6;
  CNPublishingSubject *v7;
  NSMutableArray *v8;
  NSMutableArray *observers;
  CNObservableContractEnforcement *v10;
  CNObservableContractEnforcement *enforcement;
  CNPublishingSubject *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNPublishingSubject;
  v6 = -[CNPublishingSubject init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v7->_observers;
    v7->_observers = v8;

    v10 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v7->_enforcement;
    v7->_enforcement = v10;

    v12 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_upstreamToken, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

- (CNPublishingSubject)init
{
  return -[CNPublishingSubject initWithObservable:](self, "initWithObservable:", 0);
}

uint64_t __33__CNPublishingSubject_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObserver:(id)a3
{
  CNPublishingSubject *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)observerDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPublishingSubject enforcement](self, "enforcement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observerDidFailWithError:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNPublishingSubject _allObservers](self, "_allObservers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "observerDidFailWithError:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[CNPublishingSubject cleanUpAfterTermination](self, "cleanUpAfterTermination");
}

- (CNObservable)observable
{
  return self->_observable;
}

- (CNCancelable)upstreamToken
{
  return self->_upstreamToken;
}

- (void)setUpstreamToken:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamToken, a3);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

@end
