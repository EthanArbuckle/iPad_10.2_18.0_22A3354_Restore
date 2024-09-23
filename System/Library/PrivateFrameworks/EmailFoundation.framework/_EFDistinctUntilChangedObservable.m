@implementation _EFDistinctUntilChangedObservable

- (_EFDistinctUntilChangedObservable)initWithObservable:(id)a3
{
  id v5;
  _EFDistinctUntilChangedObservable *v6;
  NSLock *v7;
  NSLock *lock;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EFDistinctUntilChangedObservable;
  v6 = -[_EFDistinctUntilChangedObservable init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v6->_lock;
    v6->_lock = v7;

    objc_storeStrong((id *)&v6->_observable, a3);
  }

  return v6;
}

- (BOOL)_isLastResultDistinctFromResult:(id)a3
{
  id v5;
  char v6;

  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  v6 = objc_msgSend(v5, "isEqual:", self->_lastObservedResult);
  if ((v6 & 1) == 0)
    objc_storeStrong(&self->_lastObservedResult, a3);
  -[NSLock unlock](self->_lock, "unlock");

  return v6 ^ 1;
}

- (id)subscribe:(id)a3
{
  id v4;
  EFObservable *observable;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  observable = self->_observable;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke;
  v18[3] = &unk_1E62A57C0;
  v18[4] = self;
  v19 = v4;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_2;
  v16[3] = &unk_1E62A5860;
  v17 = v19;
  v11 = v6;
  v12 = 3221225472;
  v13 = __47___EFDistinctUntilChangedObservable_subscribe___block_invoke_3;
  v14 = &unk_1E62A5888;
  v7 = v17;
  v15 = v7;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](observable, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_lastObservedResult, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
