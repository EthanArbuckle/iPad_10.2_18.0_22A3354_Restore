@implementation EFLazyFuture

- (EFLazyFuture)initWithScheduler:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  EFLazyFuture *v9;
  uint64_t v10;
  NSConditionLock *stateLock;
  void *v12;
  id block;
  EFPromise *v14;
  EFPromise *promise;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EFLazyFuture;
  v9 = -[EFFuture init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v9->_stateLock;
    v9->_stateLock = (NSConditionLock *)v10;

    -[NSConditionLock setName:](v9->_stateLock, "setName:", CFSTR("EFLazyFuture state lock"));
    objc_storeStrong((id *)&v9->_scheduler, a3);
    v12 = _Block_copy(v8);
    block = v9->_block;
    v9->_block = v12;

    v14 = objc_alloc_init(EFPromise);
    promise = v9->_promise;
    v9->_promise = v14;

  }
  return v9;
}

- (id)delegate
{
  void *v2;
  void *v3;

  -[EFPromise future](self->_promise, "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFPromise future](self->_promise, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

}

- (BOOL)run
{
  int64_t v3;
  void *v4;
  id block;
  EFScheduler *scheduler;
  id v7;
  _QWORD v9[5];
  id v10;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[NSConditionLock condition](self->_stateLock, "condition");
  if (v3)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    v4 = _Block_copy(self->_block);
    block = self->_block;
    self->_block = 0;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1);
    scheduler = self->_scheduler;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __19__EFLazyFuture_run__block_invoke;
    v9[3] = &unk_1E62A5D70;
    v7 = v4;
    v9[4] = self;
    v10 = v7;
    -[EFScheduler performBlock:](scheduler, "performBlock:", v9);

  }
  return v3 == 0;
}

void __19__EFLazyFuture_run__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "finishWithResult:error:", v3, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unlockWithCondition:", 2);

}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[EFPromise future](self->_promise, "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[EFPromise future](self->_promise, "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (BOOL)tryCancel
{
  int64_t v3;
  void *v4;
  id block;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[NSConditionLock condition](self->_stateLock, "condition");
  if (v3)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    -[EFPromise future](self->_promise, "future");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    block = self->_block;
    self->_block = 0;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 2);
  }
  return v3 == 0;
}

- (void)addSuccessBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFLazyFuture onScheduler:addSuccessBlock:](self, "onScheduler:addSuccessBlock:", v4, v5);

}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EFLazyFuture run](self, "run");
  -[EFPromise future](self->_promise, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v8, v6);

}

- (void)addFailureBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFLazyFuture onScheduler:addFailureBlock:](self, "onScheduler:addFailureBlock:", v4, v5);

}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EFLazyFuture run](self, "run");
  -[EFPromise future](self->_promise, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "onScheduler:addFailureBlock:", v8, v6);

}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[EFLazyFuture run](self, "run");
  -[EFPromise future](self->_promise, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultBeforeDate:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resultIfAvailable:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFLazyFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
