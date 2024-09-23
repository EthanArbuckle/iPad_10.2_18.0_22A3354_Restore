@implementation CNFutureTask

- (CNFutureTask)init
{
  return -[CNFutureTask initWithTask:](self, "initWithTask:", 0);
}

- (CNFutureTask)initWithTask:(id)a3
{
  id v5;
  CNFutureTask *v6;
  CNFutureTask *v7;
  uint64_t v8;
  NSConditionLock *stateLock;
  CNFutureCompletionBlocks *v10;
  CNFutureCompletionBlocks *completionBlocks;
  CNFutureResult *v12;
  CNFutureResult *futureResult;
  CNFutureTask *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNFutureTask;
  v6 = -[CNFutureTask init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v7->_stateLock;
    v7->_stateLock = (NSConditionLock *)v8;

    -[NSConditionLock setName:](v7->_stateLock, "setName:", CFSTR("ABFuture state lock"));
    v10 = objc_alloc_init(CNFutureCompletionBlocks);
    completionBlocks = v7->_completionBlocks;
    v7->_completionBlocks = v10;

    v12 = objc_alloc_init(CNFutureResult);
    futureResult = v7->_futureResult;
    v7->_futureResult = v12;

    v14 = v7;
  }

  return v7;
}

- (id)result:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFutureTask resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[NSConditionLock lockWhenCondition:beforeDate:](self->_stateLock, "lockWhenCondition:beforeDate:", 2, a3))
  {
    v6 = (void *)-[CNFutureResult copy](self->_futureResult, "copy");
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    objc_msgSend(v6, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFoundationError ifResultIsNil:setOutputError:toError:](CNFoundationError, "ifResultIsNil:setOutputError:toError:", v7, a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNFoundationError timeoutError](CNFoundationError, "timeoutError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFutureTask resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isFinished
{
  BOOL v3;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[CNFutureTask nts_isFinished](self, "nts_isFinished");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v3;
}

- (BOOL)isCancelled
{
  void *v3;
  BOOL v4;

  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[CNFutureTask nts_isFinished](self, "nts_isFinished"))
  {
    -[CNFutureResult error](self->_futureResult, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", v3);

  }
  else
  {
    v4 = 0;
  }
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v4;
}

- (BOOL)nts_isFinished
{
  return -[NSConditionLock condition](self->_stateLock, "condition") == 2;
}

- (BOOL)cancel
{
  NSInteger v3;
  void *v4;
  CNTask *task;
  CNTask *v6;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[NSConditionLock condition](self->_stateLock, "condition");
  if (v3 == 2)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFutureResult setError:](self->_futureResult, "setError:", v4);

    -[CNFutureCompletionBlocks setShouldCallImmediately:](self->_completionBlocks, "setShouldCallImmediately:", 1);
    task = self->_task;
    self->_task = 0;
    v6 = task;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 2);
    -[CNTask cancel](v6, "cancel");

    -[CNFutureTask _flushCompletionBlocks](self, "_flushCompletionBlocks");
    -[CNFutureTask didCancel](self, "didCancel");
  }
  return v3 != 2;
}

- (BOOL)run
{
  NSInteger v3;
  NSConditionLock *stateLock;
  CNTask *v5;
  void *v6;
  id v7;
  id v9;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[NSConditionLock condition](self->_stateLock, "condition");
  if (v3)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    stateLock = self->_stateLock;
    v5 = self->_task;
    -[NSConditionLock unlockWithCondition:](stateLock, "unlockWithCondition:", 1);
    v9 = 0;
    -[CNTask run:](v5, "run:", &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    -[CNFutureTask finishWithResult:error:](self, "finishWithResult:error:", v6, v7);

  }
  return v3 == 0;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSInteger v8;
  CNTask *task;

  v6 = a3;
  v7 = a4;
  -[NSConditionLock lock](self->_stateLock, "lock");
  v8 = -[NSConditionLock condition](self->_stateLock, "condition");
  if (v8 == 2)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    -[CNFutureResult setResult:error:](self->_futureResult, "setResult:error:", v6, v7);
    -[CNFutureCompletionBlocks setShouldCallImmediately:](self->_completionBlocks, "setShouldCallImmediately:", 1);
    task = self->_task;
    self->_task = 0;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 2);
    -[CNFutureTask _flushCompletionBlocks](self, "_flushCompletionBlocks");
  }

  return v8 != 2;
}

- (BOOL)finishWithResult:(id)a3
{
  return -[CNFutureTask finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (BOOL)finishWithError:(id)a3
{
  return -[CNFutureTask finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (void)addSuccessBlock:(id)a3
{
  CNFutureCompletionBlocks *completionBlocks;
  id v5;
  id v6;

  completionBlocks = self->_completionBlocks;
  v5 = a3;
  -[CNFutureTask futureResult](self, "futureResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFutureCompletionBlocks addSuccessBlock:orCallWithFutureResult:](completionBlocks, "addSuccessBlock:orCallWithFutureResult:", v5, v6);

}

- (void)addSuccessBlock:(id)a3 scheduler:(id)a4
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
  v10[2] = __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke;
  v10[3] = &unk_1E29BAB48;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CNFutureTask addSuccessBlock:](self, "addSuccessBlock:", v10);

}

void __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E29B8D88;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addFailureBlock:(id)a3
{
  CNFutureCompletionBlocks *completionBlocks;
  id v5;
  id v6;

  completionBlocks = self->_completionBlocks;
  v5 = a3;
  -[CNFutureTask futureResult](self, "futureResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFutureCompletionBlocks addFailureBlock:orCallWithFutureResult:](completionBlocks, "addFailureBlock:orCallWithFutureResult:", v5, v6);

}

- (void)addFailureBlock:(id)a3 scheduler:(id)a4
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
  v10[2] = __42__CNFutureTask_addFailureBlock_scheduler___block_invoke;
  v10[3] = &unk_1E29BA9C8;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CNFutureTask addFailureBlock:](self, "addFailureBlock:", v10);

}

void __42__CNFutureTask_addFailureBlock_scheduler___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __42__CNFutureTask_addFailureBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E29B8D88;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __42__CNFutureTask_addFailureBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)futureResult
{
  void *v3;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = (void *)-[CNFutureResult copy](self->_futureResult, "copy");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v3;
}

- (void)_flushCompletionBlocks
{
  CNFutureCompletionBlocks *completionBlocks;
  id v3;

  completionBlocks = self->_completionBlocks;
  -[CNFutureTask futureResult](self, "futureResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFutureCompletionBlocks flushCompletionBlocksWithFutureResult:](completionBlocks, "flushCompletionBlocksWithFutureResult:", v3);

}

- (id)flatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFuture flatMap:withBlock:schedulerProvider:](CNFuture, "flatMap:withBlock:schedulerProvider:", self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFuture recover:withBlock:schedulerProvider:](CNFuture, "recover:withBlock:schedulerProvider:", self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_futureResult, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
