@implementation _CNOnEmptyObservable

- (void)observableDidSendResult
{
  self->_observableIsEmpty = 0;
}

- (id)subscribe:(id)a3
{
  id v4;
  _CNOnEmptyObservableCNCancelationToken *v5;
  _CNOnEmptyObservable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _CNOnEmptyObservableCNCancelationToken *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(_CNOnEmptyObservableCNCancelationToken);
  v6 = self;
  objc_sync_enter(v6);
  -[_CNOnEmptyObservable observable](v6, "observable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNOnEmptyObservable setObservable:](v6, "setObservable:", 0);
  objc_sync_exit(v6);

  if (v7)
  {
    objc_initWeak(&location, v5);
    v8 = objc_opt_class();
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __34___CNOnEmptyObservable_subscribe___block_invoke;
    v20[3] = &unk_1E29BA058;
    v20[4] = v6;
    v21 = v4;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __34___CNOnEmptyObservable_subscribe___block_invoke_2;
    v17[3] = &unk_1E29BBDE0;
    v17[4] = v6;
    v18 = v21;
    objc_copyWeak(&v19, &location);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __34___CNOnEmptyObservable_subscribe___block_invoke_3;
    v15[3] = &unk_1E29B9558;
    v16 = v18;
    +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v8, v20, v17, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subscribe:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNCancelationToken addCancelable:](v5, "addCancelable:", v11);
    v12 = v5;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subscribe:", v4);
    v12 = (_CNOnEmptyObservableCNCancelationToken *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)setObservable:(id)a3
{
  objc_storeStrong((id *)&self->_observable, a3);
}

- (CNObservable)observable
{
  return self->_observable;
}

- (BOOL)isObservableEmpty
{
  return self->_observableIsEmpty;
}

- (id)subscribeNextObservable:(id)a3
{
  return -[CNObservable subscribe:](self->_nextObservable, "subscribe:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextObservable, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

- (_CNOnEmptyObservable)initWithObservable:(id)a3 nextObservable:(id)a4
{
  id v7;
  id v8;
  _CNOnEmptyObservable *v9;
  _CNOnEmptyObservable *v10;
  _CNOnEmptyObservable *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNOnEmptyObservable;
  v9 = -[_CNOnEmptyObservable init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_nextObservable, a4);
    v10->_observableIsEmpty = 1;
    v11 = v10;
  }

  return v10;
}

@end
