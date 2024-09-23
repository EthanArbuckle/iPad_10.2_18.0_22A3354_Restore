@implementation CNReplaySubject

uint64_t __29__CNReplaySubject_subscribe___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__CNReplaySubject__removeObserver___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNReplaySubject performWithResourceLock:](self, "performWithResourceLock:", v6);

}

- (id)resultWithResourceLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNReplaySubject resourceLock](self, "resourceLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNResultWithLock(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performWithResourceLock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNReplaySubject resourceLock](self, "resourceLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CNRunWithLock(v5, v4);

}

- (NSLocking)resourceLock
{
  return self->_resourceLock;
}

- (id)subscribe:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CNReplaySubject_subscribe___block_invoke;
  v8[3] = &unk_1E29B8C38;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[CNReplaySubject resultWithResourceLock:](self, "resultWithResourceLock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __35__CNReplaySubject__removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

id __44__CNReplaySubject_observerDidReceiveResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "recentEventStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEvent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __38__CNReplaySubject_observerDidComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[CNObservableEvent completionEvent](CNObservableEvent, "completionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_removeAllObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:", v2);

  return v3;
}

- (void)resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNReplaySubject recentEventStrategy](self, "recentEventStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  +[_CNObservableEventBufferingStrategy strategyWithEvents:](_CNObservableEventBufferingStrategy, "strategyWithEvents:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReplaySubject setRecentEventStrategy:](self, "setRecentEventStrategy:", v7);

}

- (void)resourceLock_scheduleReplayToObserver:(id)a3
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNReplaySubject recentEventStrategy](self, "recentEventStrategy", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEvents");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dematerializeWithObserver:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

CNCancelationToken *__29__CNReplaySubject_subscribe___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  CNCancelationToken *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock_upToDateObserverFromObserver:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recentEventStrategy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSequenceTerminated");

  if (v4)
  {
    v5 = objc_alloc_init(CNCancelationToken);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v2);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__CNReplaySubject_subscribe___block_invoke_2;
    v8[3] = &unk_1E29B8C10;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v2;
    +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v8);
    v5 = (CNCancelationToken *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (_CNObservableEventBufferingStrategy)recentEventStrategy
{
  return self->_recentEventStrategy;
}

- (id)resourceLock_upToDateObserverFromObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNReplaySubject schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CNBufferedObserver bufferObserver:schedulerProvider:](_CNBufferedObserver, "bufferObserver:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNReplaySubject resourceLock_scheduleReplayToObserver:](self, "resourceLock_scheduleReplayToObserver:", v6);
  objc_msgSend(v6, "resume");
  return v6;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)resourceLock_removeAllObservers
{
  void *v3;
  void *v4;
  void *v5;

  -[CNReplaySubject observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[CNReplaySubject observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  return v4;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setRecentEventStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_recentEventStrategy, a3);
}

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
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CNReplaySubject enforcement](self, "enforcement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidComplete");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__CNReplaySubject_observerDidComplete__block_invoke;
  v13[3] = &unk_1E29B8C60;
  v13[4] = self;
  -[CNReplaySubject resultWithResourceLock:](self, "resultWithResourceLock:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
  -[CNReplaySubject enforcement](self, "enforcement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observerDidReceiveResult:", v4);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__CNReplaySubject_observerDidReceiveResult___block_invoke;
  v19[3] = &unk_1E29B8C38;
  v19[4] = self;
  v9 = v4;
  v20 = v9;
  -[CNReplaySubject resultWithResourceLock:](self, "resultWithResourceLock:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "observerDidReceiveResult:", v9);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v12);
  }

}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

- (CNReplaySubject)initWithSchedulerProvider:(id)a3
{
  id v4;
  CNQueue *v5;
  CNReplaySubject *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNQueue);
  v6 = -[CNReplaySubject initWithQueue:schedulerProvider:](self, "initWithQueue:schedulerProvider:", v5, v4);

  return v6;
}

- (CNReplaySubject)initWithCapacity:(unint64_t)a3 schedulerProvider:(id)a4
{
  id v6;
  void *v7;
  CNReplaySubject *v8;

  v6 = a4;
  +[CNQueue boundedQueueWithCapacity:](CNQueue, "boundedQueueWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNReplaySubject initWithQueue:schedulerProvider:](self, "initWithQueue:schedulerProvider:", v7, v6);

  return v8;
}

- (CNReplaySubject)initWithQueue:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNReplaySubject *v8;
  NSMutableArray *v9;
  NSMutableArray *observers;
  uint64_t v11;
  _CNObservableEventBufferingStrategy *recentEventStrategy;
  CNUnfairLock *v13;
  NSLocking *resourceLock;
  CNObservableContractEnforcement *v15;
  CNObservableContractEnforcement *enforcement;
  CNReplaySubject *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNReplaySubject;
  v8 = -[CNReplaySubject init](&v19, sel_init);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v8->_observers;
    v8->_observers = v9;

    +[_CNObservableEventBufferingStrategy strategyWithQueue:](_CNObservableEventBufferingStrategy, "strategyWithQueue:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    recentEventStrategy = v8->_recentEventStrategy;
    v8->_recentEventStrategy = (_CNObservableEventBufferingStrategy *)v11;

    objc_storeStrong((id *)&v8->_schedulerProvider, a4);
    v13 = objc_alloc_init(CNUnfairLock);
    resourceLock = v8->_resourceLock;
    v8->_resourceLock = (NSLocking *)v13;

    v15 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v8->_enforcement;
    v8->_enforcement = v15;

    v17 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_recentEventStrategy, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (CNReplaySubject)init
{
  void *v3;
  CNReplaySubject *v4;

  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNReplaySubject initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (void)observerDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  CNReplaySubject *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNReplaySubject enforcement](self, "enforcement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observerDidFailWithError:", v4);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__CNReplaySubject_observerDidFailWithError___block_invoke;
  v16[3] = &unk_1E29B8C38;
  v6 = v4;
  v17 = v6;
  v18 = self;
  -[CNReplaySubject resultWithResourceLock:](self, "resultWithResourceLock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "observerDidFailWithError:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v9);
  }

}

id __44__CNReplaySubject_observerDidFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[CNObservableEvent failureEventWithError:](CNObservableEvent, "failureEventWithError:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resourceLock_removeAllObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resourceLock_swapBufferingStrategiesGivenNewTerminatingEvent:", v2);

  return v3;
}

@end
