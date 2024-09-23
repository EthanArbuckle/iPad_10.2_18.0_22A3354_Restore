@implementation _CNCombineLatestObservable

- (void)observableAtIndexDidComplete:(unint64_t)a3 forObserver:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke;
  v8[3] = &unk_1E29BB408;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[_CNCombineLatestObservable performWithResourceLock:](self, "performWithResourceLock:", v8);

}

- (void)observableAtIndex:(unint64_t)a3 didReceiveResult:(id)a4 forObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke;
  v12[3] = &unk_1E29BA840;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[_CNCombineLatestObservable performWithResourceLock:](self, "performWithResourceLock:", v12);

}

- (void)performWithResourceLock:(id)a3
{
  _CNCombineLatestObservable *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  v5[2]();
  objc_sync_exit(v4);

}

- (NSMutableIndexSet)activeObservableIndexes
{
  return self->_activeObservableIndexes;
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (NSMutableIndexSet)silentObservableIndexes
{
  return self->_silentObservableIndexes;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (CNScheduler)resultScheduler
{
  return self->_resultScheduler;
}

- (_CNCombineLatestObservable)initWithObservables:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNCombineLatestObservable *v11;
  void *v12;
  uint64_t v13;
  NSArray *observables;
  void *v15;
  uint64_t v16;
  NSMutableArray *results;
  void *v18;
  uint64_t v19;
  NSMutableArray *tokens;
  uint64_t v21;
  NSMutableIndexSet *silentObservableIndexes;
  uint64_t v23;
  NSMutableIndexSet *activeObservableIndexes;
  void *v25;
  _CNCombineLatestObservable *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_CNCombineLatestObservable;
  v11 = -[_CNCombineLatestObservable init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_47);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    observables = v11->_observables;
    v11->_observables = (NSArray *)v13;

    objc_msgSend(v8, "_cn_map:", &__block_literal_global_3_5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    results = v11->_results;
    v11->_results = (NSMutableArray *)v16;

    objc_msgSend(v8, "_cn_map:", &__block_literal_global_5_3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    tokens = v11->_tokens;
    v11->_tokens = (NSMutableArray *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    silentObservableIndexes = v11->_silentObservableIndexes;
    v11->_silentObservableIndexes = (NSMutableIndexSet *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    activeObservableIndexes = v11->_activeObservableIndexes;
    v11->_activeObservableIndexes = (NSMutableIndexSet *)v23;

    v25 = v9;
    if (!v9)
      v25 = (void *)objc_msgSend(v10, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.combine-latest.results"));
    objc_storeStrong((id *)&v11->_resultScheduler, v25);
    if (!v9)

    v26 = v11;
  }

  return v11;
}

- (id)subscribe:(id)a3
{
  id v4;
  _CNCombineLatestObservableCancelationToken *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _CNCombineLatestObservableCancelationToken *v9;
  _CNCombineLatestObservableCancelationToken *v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  _CNCombineLatestObservable *v15;
  _CNCombineLatestObservableCancelationToken *v16;
  id v17;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(_CNCombineLatestObservableCancelationToken);
  objc_initWeak(&location, self);
  -[_CNCombineLatestObservable observables](self, "observables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40___CNCombineLatestObservable_subscribe___block_invoke;
  v13[3] = &unk_1E29BB430;
  objc_copyWeak(&v17, &location);
  v8 = v4;
  v14 = v8;
  v15 = self;
  v9 = v5;
  v16 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_6;
  v12[3] = &unk_1E29B9358;
  v12[4] = self;
  -[CNCancelationToken addCancelationBlock:](v9, "addCancelationBlock:", v12);
  v10 = v9;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

- (NSArray)observables
{
  return self->_observables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultScheduler, 0);
  objc_storeStrong((id *)&self->_silentObservableIndexes, 0);
  objc_storeStrong((id *)&self->_activeObservableIndexes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observables, 0);
}

- (_CNCombineLatestObservable)initWithObservables:(id)a3
{
  id v4;
  void *v5;
  _CNCombineLatestObservable *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNCombineLatestObservable initWithObservables:resultScheduler:schedulerProvider:](self, "initWithObservables:resultScheduler:schedulerProvider:", v4, 0, v5);

  return v6;
}

- (void)observableAtIndex:(unint64_t)a3 didFailWithError:(id)a4 forObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke;
  v12[3] = &unk_1E29BA840;
  v12[4] = self;
  v13 = v9;
  v14 = v8;
  v15 = a3;
  v10 = v8;
  v11 = v9;
  -[_CNCombineLatestObservable performWithResourceLock:](self, "performWithResourceLock:", v12);

}

@end
