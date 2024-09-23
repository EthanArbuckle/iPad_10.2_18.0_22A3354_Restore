@implementation _CNDistinctUntilChangedObservable

- (BOOL)_resultIsDistinctFromLastResult:(id)a3
{
  id v5;
  _CNDistinctUntilChangedObservable *v6;
  char v7;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_msgSend(v5, "isEqual:", v6->_lastObservedResult);
  if ((v7 & 1) == 0)
    objc_storeStrong(&v6->_lastObservedResult, a3);
  objc_sync_exit(v6);

  return v7 ^ 1;
}

- (id)subscribe:(id)a3
{
  id v4;
  _CNDistinctUntilChangedObservableCancelationToken *v5;
  CNObservable *observable;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(_CNDistinctUntilChangedObservableCancelationToken);
  observable = self->_observable;
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke;
  v18[3] = &unk_1E29BC330;
  objc_copyWeak(&v20, &location);
  v19 = v4;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_2;
  v16[3] = &unk_1E29B9358;
  v17 = v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_3;
  v14[3] = &unk_1E29B9558;
  v9 = v17;
  v15 = v9;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v7, v18, v16, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable subscribe:](observable, "subscribe:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v5, "addCancelable:", v11);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __47___CNDistinctUntilChangedObservable_subscribe___block_invoke_4;
  v13[3] = &unk_1E29B9358;
  v13[4] = self;
  -[CNCancelationToken addCancelationBlock:](v5, "addCancelationBlock:", v13);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v5;
}

- (_CNDistinctUntilChangedObservable)initWithObservable:(id)a3
{
  id v5;
  _CNDistinctUntilChangedObservable *v6;
  _CNDistinctUntilChangedObservable *v7;
  _CNDistinctUntilChangedObservable *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNDistinctUntilChangedObservable;
  v6 = -[_CNDistinctUntilChangedObservable init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observable, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastObservedResult, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
