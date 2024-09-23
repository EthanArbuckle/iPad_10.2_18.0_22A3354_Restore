@implementation EFFuture

- (EFFuture)init
{
  EFFuture *v2;
  uint64_t v3;
  NSConditionLock *stateLock;
  NSMutableArray *v5;
  NSMutableArray *completionBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EFFuture;
  v2 = -[EFFuture init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    -[NSConditionLock setName:](v2->_stateLock, "setName:", CFSTR("EFFuture state lock"));
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;

  }
  return v2;
}

void __33__EFFuture__join_ignoreFailures___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__EFFuture__join_ignoreFailures___block_invoke_2;
  v11[3] = &unk_1E62A5E60;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v15 = a3;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "addSuccessBlock:", v11);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __33__EFFuture__join_ignoreFailures___block_invoke_3;
  v7[3] = &unk_1E62A5E88;
  v10 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "addFailureBlock:", v7);

}

- (void)addFailureBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__EFFuture_addFailureBlock___block_invoke;
  aBlock[3] = &unk_1E62A5FA0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[EFFuture _addCompletionBlock:](self, "_addCompletionBlock:", v6);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__EFFuture_addSuccessBlock___block_invoke;
  aBlock[3] = &unk_1E62A5FA0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[EFFuture _addCompletionBlock:](self, "_addCompletionBlock:", v6);

}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSError *v10;
  NSError *error;

  v7 = a3;
  v8 = a4;
  -[NSConditionLock lock](self->_stateLock, "lock");
  v9 = -[EFFuture _nts_isFinished](self, "_nts_isFinished");
  if (v9)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    v10 = (NSError *)objc_msgSend(v8, "copy");
    error = self->_error;
    self->_error = v10;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1);
    -[EFFuture _flushCompletionBlocks](self, "_flushCompletionBlocks");
  }

  return !v9;
}

- (void)_addCompletionBlock:(id)a3
{
  _BOOL4 v4;
  NSMutableArray *completionBlocks;
  void *v6;
  id aBlock;

  aBlock = a3;
  -[NSConditionLock lock](self->_stateLock, "lock");
  v4 = -[EFFuture _nts_isFinished](self, "_nts_isFinished");
  if (!v4)
  {
    completionBlocks = self->_completionBlocks;
    v6 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v6);

  }
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  if (v4)
    (*((void (**)(id, id, NSError *))aBlock + 2))(aBlock, self->_result, self->_error);

}

- (BOOL)_nts_isFinished
{
  return -[NSConditionLock condition](self->_stateLock, "condition") == 1;
}

- (void)_flushCompletionBlocks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __28__EFFuture_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __28__EFFuture_addFailureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)finishWithResult:(id)a3
{
  return -[EFFuture finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

void __40__EFFuture_onScheduler_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__EFFuture_onScheduler_addSuccessBlock___block_invoke_2;
  v7[3] = &unk_1E62A5D70;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __30__EFFuture__finishWithFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __33__EFFuture__join_ignoreFailures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v3, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)resultIfAvailable
{
  return -[EFFuture resultIfAvailable:](self, "resultIfAvailable:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

+ (id)join:(id)a3
{
  objc_msgSend(a1, "_join:ignoreFailures:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  dispatch_group_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    +[EFPromise promise](EFPromise, "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, i);

      }
    }
    v11 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v12 = dispatch_group_create();
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __33__EFFuture__join_ignoreFailures___block_invoke;
    v31[3] = &unk_1E62A5EB0;
    v14 = v12;
    v32 = v14;
    v15 = v11;
    v33 = v15;
    v16 = v8;
    v34 = v16;
    v36 = a4;
    v17 = v6;
    v35 = v17;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v31);
    dispatch_get_global_queue(21, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v25 = 3221225472;
    v26 = __33__EFFuture__join_ignoreFailures___block_invoke_4;
    v27 = &unk_1E62A5ED8;
    v19 = v15;
    v28 = v19;
    v20 = v17;
    v29 = v20;
    v21 = v16;
    v30 = v21;
    dispatch_group_notify(v14, v18, &v24);

    objc_msgSend(v20, "future", v24, v25, v26, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EFFuture futureWithResult:](EFFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (id)futureWithResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[EFPromise promise](EFPromise, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v3);
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __40__EFFuture_onScheduler_addSuccessBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "onScheduler:lazyFutureWithBlock:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)then:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture onScheduler:then:](self, "onScheduler:then:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 then:(id)a4
{
  +[EFFuture _then:withBlock:scheduler:](EFFuture, "_then:withBlock:scheduler:", self, a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[EFPromise promise](EFPromise, "promise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__EFFuture__then_withBlock_scheduler___block_invoke;
  v19[3] = &unk_1E62A5DC0;
  v12 = v8;
  v21 = v12;
  v13 = v10;
  v20 = v13;
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v9, v19);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __38__EFFuture__then_withBlock_scheduler___block_invoke_2;
  v17[3] = &unk_1E62A5888;
  v14 = v13;
  v18 = v14;
  objc_msgSend(v7, "onScheduler:addFailureBlock:", v9, v17);
  objc_msgSend(v14, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__EFFuture_onScheduler_addSuccessBlock___block_invoke;
  v10[3] = &unk_1E62A5FC8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[EFFuture addSuccessBlock:](self, "addSuccessBlock:", v10);

}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__EFFuture_onScheduler_addFailureBlock___block_invoke;
  v10[3] = &unk_1E62A5FF0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[EFFuture addFailureBlock:](self, "addFailureBlock:", v10);

}

+ (id)onScheduler:(id)a3 lazyFutureWithBlock:(id)a4
{
  id v5;
  id v6;
  EFLazyFuture *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[EFLazyFuture initWithScheduler:block:]([EFLazyFuture alloc], "initWithScheduler:block:", v5, v6);

  return v7;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultIfAvailable:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  id v9;
  NSError *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v7)
  {
    -[EFFuture delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didStartBlockingMainThreadForFuture:", self);

  }
  if (-[NSConditionLock lockWhenCondition:beforeDate:](self->_stateLock, "lockWhenCondition:beforeDate:", 1, v6))
  {
    v9 = self->_result;
    v10 = self->_error;
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    if (v7)
    {
      -[EFFuture delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didFinishBlockingMainThreadForFuture:", self);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);

  }
  else
  {
    if (v7)
    {
      -[EFFuture delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didFinishBlockingMainThreadForFuture:", self);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ef_timeoutError");
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (EFFutureDelegate)delegate
{
  return (EFFutureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isFinished
{
  BOOL v3;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[EFFuture _nts_isFinished](self, "_nts_isFinished");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v3;
}

void __38__EFFuture__then_withBlock_scheduler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:");

}

- (void)_finishWithFuture:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__EFFuture__finishWithFuture___block_invoke;
  v7[3] = &unk_1E62A5928;
  v7[4] = self;
  objc_msgSend(v4, "addSuccessBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __30__EFFuture__finishWithFuture___block_invoke_2;
  v6[3] = &unk_1E62A5888;
  v6[4] = self;
  objc_msgSend(v4, "addFailureBlock:", v6);

}

uint64_t __36__EFFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (BOOL)tryCancel
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EFFuture finishWithResult:error:](self, "finishWithResult:error:", 0, v3);

  if (v4)
    -[EFFuture didCancel](self, "didCancel");
  return v4;
}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__EFFuture_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E62A5F50;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (id)result:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nullFuture
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)futureWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[EFPromise promise](EFPromise, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithError:", v3);
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)futureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "onScheduler:futureWithBlock:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  +[EFPromise promise](EFPromise, "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __40__EFFuture_onScheduler_futureWithBlock___block_invoke;
  v15 = &unk_1E62A5D70;
  v8 = v6;
  v17 = v8;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v5, "performBlock:", &v12);
  objc_msgSend(v9, "future", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __40__EFFuture_onScheduler_futureWithBlock___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v4);

}

+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__EFFuture__always_withBlock_scheduler___block_invoke;
  v15[3] = &unk_1E62A5900;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v9, v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __40__EFFuture__always_withBlock_scheduler___block_invoke_2;
  v13[3] = &unk_1E62A5D98;
  v12 = v11;
  v14 = v12;
  objc_msgSend(v7, "onScheduler:addFailureBlock:", v9, v13);

}

uint64_t __40__EFFuture__always_withBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__EFFuture__always_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__EFFuture__then_withBlock_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[EFPromise promise](EFPromise, "promise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __41__EFFuture__recover_withBlock_scheduler___block_invoke;
  v20[3] = &unk_1E62A5928;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v9, v20);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __41__EFFuture__recover_withBlock_scheduler___block_invoke_2;
  v17[3] = &unk_1E62A5DE8;
  v13 = v8;
  v19 = v13;
  v14 = v12;
  v18 = v14;
  objc_msgSend(v7, "onScheduler:addFailureBlock:", v9, v17);
  objc_msgSend(v14, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __41__EFFuture__recover_withBlock_scheduler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __41__EFFuture__recover_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:");

}

+ (id)chain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "ef_tail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __18__EFFuture_chain___block_invoke;
    v17[3] = &unk_1E62A5E10;
    v19 = a1;
    v9 = v7;
    v18 = v9;
    objc_msgSend(v5, "then:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __18__EFFuture_chain___block_invoke_2;
    v14[3] = &unk_1E62A5E38;
    v16 = a1;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "recover:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
  }

  return v6;
}

id __18__EFFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4 == v3)
    objc_msgSend(v5, "chain:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __18__EFFuture_chain___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "chain:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)combine:(id)a3
{
  objc_msgSend(a1, "_join:ignoreFailures:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __33__EFFuture__join_ignoreFailures___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __33__EFFuture__join_ignoreFailures___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

+ (id)sequence:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v15, "ef_tail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        v10 = v4;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
          v18[0] = v7;
          v18[1] = 3221225472;
          v18[2] = __21__EFFuture_sequence___block_invoke;
          v18[3] = &unk_1E62A5F00;
          v19 = v3;
          v20 = v11;
          objc_msgSend(v10, "then:", v18);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v4;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __21__EFFuture_sequence___block_invoke_2;
    v16[3] = &unk_1E62A5F28;
    v12 = v3;
    v17 = v12;
    objc_msgSend(v4, "then:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EFFuture futureWithResult:](EFFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __21__EFFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return *(id *)(a1 + 40);
}

id __21__EFFuture_sequence___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  +[EFFuture futureWithResult:](EFFuture, "futureWithResult:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)result
{
  return -[EFFuture result:](self, "result:", 0);
}

- (BOOL)isCancelled
{
  BOOL v3;

  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[EFFuture _nts_isFinished](self, "_nts_isFinished"))
    v3 = -[NSError ef_isCancelledError](self->_error, "ef_isCancelledError");
  else
    v3 = 0;
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v3;
}

uint64_t __30__EFFuture__finishWithFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (BOOL)finishWithError:(id)a3
{
  return -[EFFuture finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EFFuture_BOOLErrorCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E62A5F78;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

void __45__EFFuture_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v7);

  }
  else
  {
    objc_msgSend(v6, "finishWithError:", v5);
  }

}

- (id)errorOnlyCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EFFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E62A5888;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

void __45__EFFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v4, "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v5);

  }
}

- (EFObserver)firstResultObserverAdapter
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke;
  v5[3] = &unk_1E62A5928;
  v5[4] = self;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke_2;
  v4[3] = &unk_1E62A5860;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke_3;
  v3[3] = &unk_1E62A5888;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v5, v4, v3);
  return (EFObserver *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __38__EFFuture_firstResultObserverAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __38__EFFuture_firstResultObserverAdapter__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:");

}

uint64_t __38__EFFuture_firstResultObserverAdapter__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (EFObserver)resultsObserverAdapter
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__EFFuture_resultsObserverAdapter__block_invoke;
  v11[3] = &unk_1E62A5928;
  v12 = v3;
  v8[4] = self;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __34__EFFuture_resultsObserverAdapter__block_invoke_2;
  v9[3] = &unk_1E62A58B0;
  v9[4] = self;
  v10 = v12;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __34__EFFuture_resultsObserverAdapter__block_invoke_3;
  v8[3] = &unk_1E62A5888;
  v5 = v12;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v11, v9, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObserver *)v6;
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __40__EFFuture_onScheduler_addFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__EFFuture_onScheduler_addFailureBlock___block_invoke_2;
  v7[3] = &unk_1E62A5D70;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __40__EFFuture_onScheduler_addFailureBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)always:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture onScheduler:always:](self, "onScheduler:always:", v4, v5);

}

- (void)onScheduler:(id)a3 always:(id)a4
{
  +[EFFuture _always:withBlock:scheduler:](EFFuture, "_always:withBlock:scheduler:", self, a4, a3);
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture onScheduler:recover:](self, "onScheduler:recover:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 recover:(id)a4
{
  +[EFFuture _recover:withBlock:scheduler:](EFFuture, "_recover:withBlock:scheduler:", self, a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)map:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFFuture onScheduler:map:](self, "onScheduler:map:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 map:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__EFFuture_onScheduler_map___block_invoke;
  v10[3] = &unk_1E62A6018;
  v11 = v6;
  v7 = v6;
  -[EFFuture onScheduler:then:](self, "onScheduler:then:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __28__EFFuture_onScheduler_map___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)

  return v3;
}

@end
