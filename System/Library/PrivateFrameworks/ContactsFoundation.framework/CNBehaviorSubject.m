@implementation CNBehaviorSubject

- (CNBehaviorSubject)initWithSeed:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  CNBehaviorSubject *v8;
  NSMutableArray *v9;
  NSMutableArray *observers;
  uint64_t v11;
  CNObservableEvent *mostRecentEvent;
  CNUnfairLock *v13;
  NSLocking *resourceLock;
  CNObservableContractEnforcement *v15;
  CNObservableContractEnforcement *enforcement;
  CNBehaviorSubject *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CNBehaviorSubject;
  v8 = -[CNBehaviorSubject init](&v19, sel_init);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v8->_observers;
    v8->_observers = v9;

    +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = (CNObservableEvent *)v11;

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

- (id)resultWithResourceLock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CNBehaviorSubject_resultWithResourceLock___block_invoke;
  v8[3] = &unk_1E29B8BE8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CNBehaviorSubject performWithResourceLock:](self, "performWithResourceLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__CNBehaviorSubject_resultWithResourceLock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)performWithResourceLock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNBehaviorSubject resourceLock](self, "resourceLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CNRunWithLock(v5, v4);

}

- (id)subscribe:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = -[CNBehaviorSubject _addObserver:](self, "_addObserver:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__CNBehaviorSubject_subscribe___block_invoke;
  v9[3] = &unk_1E29B8C10;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __31__CNBehaviorSubject_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (id)_addObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  CNBehaviorSubject *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__CNBehaviorSubject__addObserver___block_invoke;
  v8[3] = &unk_1E29B8C38;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[CNBehaviorSubject resultWithResourceLock:](self, "resultWithResourceLock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __34__CNBehaviorSubject__addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "schedulerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CNBufferedObserver bufferObserver:schedulerProvider:](_CNBufferedObserver, "bufferObserver:schedulerProvider:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "mostRecentEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dematerializeWithObserver:", v4);

  objc_msgSend(v4, "resume");
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  return v4;
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
  v6[2] = __37__CNBehaviorSubject__removeObserver___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNBehaviorSubject performWithResourceLock:](self, "performWithResourceLock:", v6);

}

void __37__CNBehaviorSubject__removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

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
  -[CNBehaviorSubject enforcement](self, "enforcement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observerDidReceiveResult:", v4);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__CNBehaviorSubject_observerDidReceiveResult___block_invoke;
  v19[3] = &unk_1E29B8C38;
  v19[4] = self;
  v9 = v4;
  v20 = v9;
  -[CNBehaviorSubject resultWithResourceLock:](self, "resultWithResourceLock:", v19);
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

id __46__CNBehaviorSubject_observerDidReceiveResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentEvent:", v2);

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  -[CNBehaviorSubject enforcement](self, "enforcement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidComplete");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__CNBehaviorSubject_observerDidComplete__block_invoke;
  v13[3] = &unk_1E29B8C60;
  v13[4] = self;
  -[CNBehaviorSubject resultWithResourceLock:](self, "resultWithResourceLock:", v13);
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

id __40__CNBehaviorSubject_observerDidComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[CNObservableEvent completionEvent](CNObservableEvent, "completionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentEvent:", v2);

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

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
  _QWORD v16[5];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNBehaviorSubject enforcement](self, "enforcement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observerDidFailWithError:", v4);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__CNBehaviorSubject_observerDidFailWithError___block_invoke;
  v16[3] = &unk_1E29B8C38;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  -[CNBehaviorSubject resultWithResourceLock:](self, "resultWithResourceLock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
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
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v9);
  }

}

id __46__CNBehaviorSubject_observerDidFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[CNObservableEvent failureEventWithError:](CNObservableEvent, "failureEventWithError:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentEvent:", v2);

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CNObservableEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentEvent, a3);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (NSLocking)resourceLock
{
  return self->_resourceLock;
}

- (CNObservableContractEnforcement)enforcement
{
  return self->_enforcement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)observerDidReceiveResult:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_18F80C000, a1, OS_LOG_TYPE_ERROR, "Call stack: %{public}@", (uint8_t *)&v3, 0xCu);

}

- (void)observerDidReceiveResult:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F80C000, log, OS_LOG_TYPE_ERROR, "Swizzling a nil result", v1, 2u);
}

@end
