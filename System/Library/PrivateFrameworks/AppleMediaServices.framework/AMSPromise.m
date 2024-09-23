@implementation AMSPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseResult, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (AMSPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  void (**v6)(id, void *);
  os_unfair_lock_s *p_stateLock;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  v6 = (void (**)(id, void *))a4;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  -[AMSPromise promiseResult](self, "promiseResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    os_unfair_lock_unlock(p_stateLock);
    v6[2](v6, v8);
  }
  else
  {
    v9[2]();
    os_unfair_lock_unlock(p_stateLock);
  }

}

- (AMSPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
  objc_storeStrong((id *)&self->_promiseResult, a3);
}

- (AMSPromise)init
{
  AMSPromise *v2;
  AMSPromiseCompletionBlocks *v3;
  AMSPromiseCompletionBlocks *completionBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSPromise;
  v2 = -[AMSPromise init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v2->_retainedSelf, v2);
  }
  return v2;
}

+ (AMSPromise)promiseWithResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    +[AMSFinishedPromise promiseWithResult:](AMSFinishedPromise, "promiseWithResult:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init((Class)a1);
    +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v5, v4);
  }

  return (AMSPromise *)v5;
}

uint64_t __29__AMSPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

AMSMutablePromise *__32__AMSPromise_continueWithBlock___block_invoke(uint64_t a1)
{
  AMSMutablePromise *v2;
  void *v3;
  void *v4;
  AMSMutablePromise *v5;
  id v6;
  AMSMutablePromise *v7;
  AMSMutablePromise *v8;
  _QWORD v10[4];
  id v11;
  AMSMutablePromise *v12;
  id v13;

  v2 = objc_alloc_init(AMSMutablePromise);
  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__AMSPromise_continueWithBlock___block_invoke_2;
  v10[3] = &unk_1E2544B78;
  v11 = v3;
  v13 = *(id *)(a1 + 40);
  v5 = v2;
  v12 = v5;
  v6 = v3;
  objc_msgSend(v4, "addCompletionBlock:", v10);

  v7 = v12;
  v8 = v5;

  return v8;
}

- (id)continueWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__AMSPromise_continueWithBlock___block_invoke;
  v11[3] = &unk_1E2544BA0;
  v11[4] = self;
  v12 = v4;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __32__AMSPromise_continueWithBlock___block_invoke_3;
  v9[3] = &unk_1E2544BC8;
  v10 = v12;
  v6 = v12;
  -[AMSPromise valueFromAddingBlock:orCallWithResult:](self, "valueFromAddingBlock:orCallWithResult:", v11, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[AMSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__AMSPromise_addSuccessBlock___block_invoke;
  v12[3] = &unk_1E253DC28;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __30__AMSPromise_addSuccessBlock___block_invoke_2;
  v9[3] = &unk_1E2544B00;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[AMSPromise addBlock:orCallWithResult:](self, "addBlock:orCallWithResult:", v12, v9);

}

- (void)addErrorBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[AMSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__AMSPromise_addErrorBlock___block_invoke;
  v12[3] = &unk_1E253DC28;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __28__AMSPromise_addErrorBlock___block_invoke_2;
  v9[3] = &unk_1E2544B00;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[AMSPromise addBlock:orCallWithResult:](self, "addBlock:orCallWithResult:", v12, v9);

}

- (void)addFinishBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[AMSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__AMSPromise_addFinishBlock___block_invoke;
  v12[3] = &unk_1E253DC28;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __29__AMSPromise_addFinishBlock___block_invoke_2;
  v9[3] = &unk_1E2544B00;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[AMSPromise addBlock:orCallWithResult:](self, "addBlock:orCallWithResult:", v12, v9);

}

- (BOOL)isFinished
{
  AMSPromise *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[AMSPromise isFinishedWithLock](v2, "isFinishedWithLock");
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

uint64_t __30__AMSPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callSuccessBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __28__AMSPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callErrorBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", self, a3, a4);
}

uint64_t __29__AMSPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__AMSPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addErrorBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__AMSPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSuccessBlock:", *(_QWORD *)(a1 + 40));
}

id __28__AMSPromise_thenWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __29__AMSPromise_catchWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", a2);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_3;
  v5[3] = &unk_1E2544C68;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  v9 = v4;
  v6 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "addCompletionBlock:", v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

}

- (id)catchWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__AMSPromise_catchWithBlock___block_invoke;
  v8[3] = &unk_1E2544B50;
  v9 = v4;
  v5 = v4;
  -[AMSPromise continueWithBlock:](self, "continueWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thenWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__AMSPromise_thenWithBlock___block_invoke;
  v8[3] = &unk_1E2544B50;
  v9 = v4;
  v5 = v4;
  -[AMSPromise continueWithBlock:](self, "continueWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (AMSPromise)promiseWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    +[AMSFinishedPromise promiseWithError:](AMSFinishedPromise, "promiseWithError:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init((Class)a1);
    +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", v5, v4);
  }

  return (AMSPromise *)v5;
}

- (AMSPromise)promiseWithTimeout:(double)a3
{
  AMSMutablePromise *v4;

  v4 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", a3);
  +[AMSMutablePromise finishPromise:withPromise:](AMSMutablePromise, "finishPromise:withPromise:", v4, self);
  return (AMSPromise *)v4;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  NSCondition *v8;
  NSCondition *condition;
  NSCondition *v10;
  NSCondition *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  +[AMSConcurrency logFaultFromSwiftConcurrencyOnInternalBuild](AMSConcurrency, "logFaultFromSwiftConcurrencyOnInternalBuild");
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (-[AMSPromise isFinishedWithLock](self, "isFinishedWithLock"))
  {
    -[AMSPromise promiseResult](self, "promiseResult");
    v8 = (NSCondition *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_stateLock);
LABEL_11:
    -[NSCondition result](v8, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && !v14)
    {
      -[NSCondition error](v8, "error");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NSCondition result](v8, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    condition = self->_condition;
    if (!condition)
    {
      v10 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
      v11 = self->_condition;
      self->_condition = v10;

      condition = self->_condition;
    }
    v8 = condition;
    os_unfair_lock_unlock(&self->_stateLock);
    -[NSCondition lock](v8, "lock");
    do
    {
      if (-[AMSPromise conditionHasSignaled](self, "conditionHasSignaled"))
      {
        -[NSCondition unlock](v8, "unlock");
        os_unfair_lock_lock_with_options();
        -[AMSPromise promiseResult](self, "promiseResult");
        v13 = objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(p_stateLock);

        v8 = (NSCondition *)v13;
        goto LABEL_11;
      }
    }
    while (-[NSCondition waitUntilDate:](v8, "waitUntilDate:", v6));
    -[NSCondition unlock](v8, "unlock");
    if (a4)
    {
      AMSError(1, CFSTR("Promise timed out"), 0, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)binaryPromiseAdapter
{
  return -[AMSPromise binaryPromiseAdapterForClass:](self, "binaryPromiseAdapterForClass:", objc_opt_class());
}

+ (AMSPromise)promiseWithAll:(id)a3
{
  return (AMSPromise *)objc_msgSend(a1, "promiseWithAll:timeout:", a3, 0.0);
}

uint64_t __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(a1[5] + 16))();
  if ((_DWORD)result)
    return +[AMSPromise _enumeratePromises:startingAt:block:](AMSPromise, "_enumeratePromises:startingAt:block:", a1[4], a1[7] + 1, a1[6]);
  return result;
}

void __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "result");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(uint64_t (**)(uint64_t, id, void *, _QWORD))(v3 + 16))(v3, v6, v5, a1[6]);
}

uint64_t __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t i;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v9 == a4)
    v11 = 0;
  else
    v11 = v10;
  if ((v11 & 1) == 0)
  {
    for (i = a4 + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSMutablePromise cancelPromise:](AMSMutablePromise, "cancelPromise:", v13);

    }
  }

  return v11;
}

uint64_t __38__AMSPromise_promiseWithSome_timeout___block_invoke(id *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a2;
  v8 = a3;
  if (v7)
    objc_msgSend(a1[4], "addObject:", v7);
  if (v8)
    objc_msgSend(a1[5], "addObject:", v8);
  if ((a4 & 1) != 0 || objc_msgSend(a1[6], "isFinished"))
  {
    if (objc_msgSend(a1[4], "count") || !objc_msgSend(a1[5], "count"))
    {
      objc_msgSend(a1[6], "finishWithResult:error:logDuplicateFinishes:", a1[4], 0, 0);
    }
    else
    {
      v9 = (void *)objc_msgSend(a1[5], "copy");
      AMSErrorWithMultipleUnderlyingErrors(15, 0, 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "finishWithResult:error:logDuplicateFinishes:", 0, v10, 0);
    }
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __37__AMSPromise_promiseWithAll_timeout___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  v8 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  if (v8 || (a4 & 1) != 0)
  {
    if (v8)
    {
      v10 = *(void **)(a1 + 40);
      v11 = 0;
      v12 = v8;
LABEL_10:
      objc_msgSend(v10, "finishWithResult:error:logDuplicateFinishes:", v11, v12, 0);
      v9 = 0;
      goto LABEL_11;
    }
LABEL_9:
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isFinished") & 1) != 0)
    goto LABEL_9;
  v9 = 1;
LABEL_11:

  return v9;
}

+ (AMSPromise)promiseWithSome:(id)a3 timeout:(double)a4
{
  id v6;
  AMSMutablePromise *v7;
  id v8;
  id v9;
  AMSMutablePromise *v10;
  id v11;
  AMSMutablePromise *v12;
  AMSMutablePromise *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  AMSMutablePromise *v18;

  v6 = a3;
  v7 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", a4);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__AMSPromise_promiseWithSome_timeout___block_invoke;
    v15[3] = &unk_1E2544AB8;
    v16 = v8;
    v17 = v9;
    v10 = v7;
    v18 = v10;
    v11 = v9;
    objc_msgSend(a1, "_enumeratePromises:startingAt:block:", v6, 0, v15);
    v12 = v18;
    v13 = v10;

  }
  else
  {
    -[AMSMutablePromise finishWithResult:error:logDuplicateFinishes:](v7, "finishWithResult:error:logDuplicateFinishes:", v8, 0, 0);
  }

  return (AMSPromise *)v7;
}

+ (AMSPromise)promiseWithAll:(id)a3 timeout:(double)a4
{
  id v6;
  AMSMutablePromise *v7;
  id v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  AMSMutablePromise *v11;
  _QWORD v13[4];
  id v14;
  AMSMutablePromise *v15;

  v6 = a3;
  v7 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", a4);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__AMSPromise_promiseWithAll_timeout___block_invoke;
    v13[3] = &unk_1E2544A68;
    v14 = v8;
    v9 = v7;
    v15 = v9;
    objc_msgSend(a1, "_enumeratePromises:startingAt:block:", v6, 0, v13);
    v10 = v15;
    v11 = v9;

  }
  else
  {
    -[AMSMutablePromise finishWithResult:error:logDuplicateFinishes:](v7, "finishWithResult:error:logDuplicateFinishes:", v8, 0, 0);
  }

  return (AMSPromise *)v7;
}

+ (void)_enumeratePromises:(id)a3 startingAt:(int64_t)a4 block:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  int64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD aBlock[4];
  id v32;
  id v33;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke;
  aBlock[3] = &unk_1E2544C40;
  v10 = v7;
  v32 = v10;
  v11 = v8;
  v33 = v11;
  v12 = _Block_copy(aBlock);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  while (a4 < (unint64_t)objc_msgSend(v10, "count") && *((_BYTE *)v28 + 24))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_2;
    v20[3] = &unk_1E2544C90;
    v14 = v13;
    v21 = v14;
    v15 = v12;
    v23 = v15;
    v26 = a4;
    v22 = v10;
    v24 = v11;
    v25 = &v27;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_4;
    v16[3] = &unk_1E2544CB8;
    v18 = &v27;
    v17 = v15;
    v19 = a4;
    objc_msgSend(v14, "addBlock:orCallWithResult:", v20, v16);

    ++a4;
  }
  _Block_object_dispose(&v27, 8);

}

- (AMSPromise)initWithTimeout:(double)a3
{
  AMSPromise *v4;

  v4 = -[AMSPromise init](self, "init");
  if (v4)
    +[AMSMutablePromise startTimeoutForPromise:timeout:](AMSMutablePromise, "startTimeoutForPromise:timeout:", v4, a3);
  return v4;
}

+ (AMSPromise)promiseWithSome:(id)a3
{
  return (AMSPromise *)objc_msgSend(a1, "promiseWithSome:timeout:", a3, 0.0);
}

+ (id)unwrappedPromiseWithPromise:(id)a3
{
  return (id)objc_msgSend(a3, "thenWithBlock:", &__block_literal_global_105);
}

id __42__AMSPromise_unwrappedPromiseWithPromise___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_10_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__AMSPromise_unwrappedPromiseWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

+ (AMSPromise)promiseWithPromiseResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    +[AMSFinishedPromise promiseWithPromiseResult:](AMSFinishedPromise, "promiseWithPromiseResult:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init((Class)a1);
    objc_msgSend(v4, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", v5, v6, v7);

  }
  return (AMSPromise *)v5;
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutablePromise finishPromise:withPromise:](AMSMutablePromise, "finishPromise:withPromise:", self, a3);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[AMSPromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (BOOL)finishWithError:(id)a3
{
  return -[AMSPromise finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (BOOL)isCancelled
{
  os_unfair_lock_s *p_stateLock;
  void *v4;
  void *v5;
  BOOL v6;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (-[AMSPromise isFinishedWithLock](self, "isFinishedWithLock"))
  {
    -[AMSPromise promiseResult](self, "promiseResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[AMSPromise _errorIsCanceledError:](AMSPromise, "_errorIsCanceledError:", v5);

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v5 = objc_msgSend(v3, "code") == 3072;
  else
    v5 = 0;

  return v5;
}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__AMSPromise_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E25425C0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)cancel
{
  return +[AMSMutablePromise cancelPromise:](AMSMutablePromise, "cancelPromise:", self);
}

- (void)waitUntilFinished
{
  id v2;

  v2 = -[AMSPromise resultWithError:](self, "resultWithError:", 0);
}

- (BOOL)isTimedOut
{
  os_unfair_lock_s *p_stateLock;
  void *v4;
  void *v5;
  BOOL v6;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (-[AMSPromise isFinishedWithLock](self, "isFinishedWithLock"))
  {
    -[AMSPromise promiseResult](self, "promiseResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[AMSPromise _errorIsTimeOutError:](AMSPromise, "_errorIsTimeOutError:", v5);

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

+ (BOOL)_errorIsTimeOutError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AMSErrorDomain")))
    v5 = objc_msgSend(v3, "code") == 1;
  else
    v5 = 0;

  return v5;
}

BOOL __47__AMSPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    return +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", v2, a2);
  else
    return +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v2, MEMORY[0x1E0C9AAB0]);
}

BOOL __38__AMSPromise_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)errorOnlyCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E253E120;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)mutablePromiseAdapter
{
  AMSMutablePromise *v3;

  v3 = objc_alloc_init(AMSMutablePromise);
  -[AMSMutablePromise finishWithPromise:](v3, "finishWithPromise:", self);
  return v3;
}

- (AMSPromise)initWithPromiseResult:(id)a3
{
  id v5;
  AMSPromise *v6;
  AMSPromise *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPromise;
  v6 = -[AMSPromise init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promiseResult, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5
{
  return (AMSPromise *)objc_msgSend(a1, "promiseWithErrorCode:title:message:underlyingError:", a3, a4, a5, 0);
}

+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5 underlyingError:(id)a6
{
  void *v7;
  void *v8;

  AMSError(a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "promiseWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSPromise *)v8;
}

+ (AMSPromise)promiseWithAny:(id)a3
{
  return (AMSPromise *)objc_msgSend(a1, "promiseWithAny:timeout:", a3, 0.0);
}

+ (AMSPromise)promiseWithAny:(id)a3 timeout:(double)a4
{
  id v6;
  AMSMutablePromise *v7;
  void *v8;
  _QWORD v10[4];
  AMSMutablePromise *v11;

  v6 = a3;
  v7 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", a4);
  if (objc_msgSend(v6, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__AMSPromise_promiseWithAny_timeout___block_invoke;
    v10[3] = &unk_1E2544A90;
    v11 = v7;
    objc_msgSend(a1, "_enumeratePromises:startingAt:block:", v6, 0, v10);

  }
  else
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("No promises were provided to -promiseWithAny:."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithResult:error:logDuplicateFinishes:](v7, "finishWithResult:error:logDuplicateFinishes:", 0, v8, 0);

  }
  return (AMSPromise *)v7;
}

uint64_t __37__AMSPromise_promiseWithAny_timeout___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a2;
  v8 = a3;
  if (v7 || (a4 & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "isFinished"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:logDuplicateFinishes:", v7, v8, 0);
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (AMSPromise)promiseWithFlattenedPromises:(id)a3
{
  id v3;
  AMSMutablePromise *v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AMSPromise _configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:](AMSPromise, "_configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:", v4, v3, v5, 0, 0);

  return (AMSPromise *)v4;
}

- (NSCondition)condition
{
  os_unfair_lock_assert_owner(&self->_stateLock);
  return self->_condition;
}

- (void)resultBeforeDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "timeIntervalSinceNow");
  -[AMSPromise promiseWithTimeout:](self, "promiseWithTimeout:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultWithCompletion:", v6);

}

- (void)resultWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AMSPromise promiseWithTimeout:](self, "promiseWithTimeout:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultWithCompletion:", v6);

}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3;

  v3 = -[AMSPromise resultWithTimeout:error:](self, "resultWithTimeout:error:", 0, a3);
}

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, void *);
  os_unfair_lock_s *p_stateLock;
  void *v9;
  void *v10;

  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(id, void *))a4;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  -[AMSPromise promiseResult](self, "promiseResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_unlock(p_stateLock);
    v7[2](v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6[2](v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_stateLock);
  }

  return v10;
}

- (void)flushCompletionBlocksWithResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSPromise completionBlocks](self, "completionBlocks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushCompletionBlocksWithPromiseResult:", v4);

}

- (void)stopRetainingSelf
{
  os_unfair_lock_s *p_stateLock;
  AMSPromise *v3;

  p_stateLock = &self->_stateLock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  -[AMSPromise setRetainedSelf:](v3, "setRetainedSelf:", 0);
  os_unfair_lock_unlock(p_stateLock);

}

- (id)catchWithBinaryPromiseBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__AMSPromise_catchWithBinaryPromiseBlock___block_invoke;
  v8[3] = &unk_1E2544B28;
  v9 = v4;
  v5 = v4;
  -[AMSPromise continueWithBinaryPromiseBlock:](self, "continueWithBinaryPromiseBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __42__AMSPromise_catchWithBinaryPromiseBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)continueWithBinaryPromiseBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke;
  v11[3] = &unk_1E2544BA0;
  v11[4] = self;
  v12 = v4;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_3;
  v9[3] = &unk_1E2544BC8;
  v10 = v12;
  v6 = v12;
  -[AMSPromise valueFromAddingBlock:orCallWithResult:](self, "valueFromAddingBlock:orCallWithResult:", v11, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

AMSMutableBinaryPromise *__45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke(uint64_t a1)
{
  AMSMutableBinaryPromise *v2;
  void *v3;
  void *v4;
  AMSMutableBinaryPromise *v5;
  id v6;
  AMSMutableBinaryPromise *v7;
  AMSMutableBinaryPromise *v8;
  _QWORD v10[4];
  id v11;
  AMSMutableBinaryPromise *v12;
  id v13;

  v2 = objc_alloc_init(AMSMutableBinaryPromise);
  AMSLogKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_2;
  v10[3] = &unk_1E2544B78;
  v11 = v3;
  v13 = *(id *)(a1 + 40);
  v5 = v2;
  v12 = v5;
  v6 = v3;
  objc_msgSend(v4, "addCompletionBlock:", v10);

  v7 = v12;
  v8 = v5;

  return v8;
}

void __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = AMSSetLogKey(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "finishWithPromise:", v9);
}

id __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __32__AMSPromise_continueWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = AMSSetLogKey(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "finishWithPromise:", v9);
}

id __32__AMSPromise_continueWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thenWithBinaryPromiseBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AMSPromise_thenWithBinaryPromiseBlock___block_invoke;
  v8[3] = &unk_1E2544B28;
  v9 = v4;
  v5 = v4;
  -[AMSPromise continueWithBinaryPromiseBlock:](self, "continueWithBinaryPromiseBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __41__AMSPromise_thenWithBinaryPromiseBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)BOOLCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__AMSPromise_BOOLCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E253F570;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __42__AMSPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v4, "numberWithBool:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", v3);

  }
  else
  {
    v6 = a3;
    +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", v3, 0);
  }

}

- (id)nilValueCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__AMSPromise_nilValueCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E25425C0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __46__AMSPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v8 | v5)
  {
    if (v8)
      +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v6);
    else
      +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", v6, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v6, v7);

  }
}

+ (void)_configureFlattenedPromise:(id)a3 withPromises:(id)a4 results:(id)a5 previousError:(id)a6 currentPromiseIndex:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke;
  v31[3] = &unk_1E2544BF0;
  v17 = v13;
  v32 = v17;
  v36 = a7;
  v18 = v12;
  v33 = v18;
  v19 = v11;
  v34 = v19;
  v20 = v14;
  v35 = v20;
  objc_msgSend(v15, "addSuccessBlock:", v31);
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke_2;
  v25[3] = &unk_1E2544C18;
  v29 = v17;
  v30 = a7;
  v26 = v20;
  v27 = v18;
  v28 = v19;
  v21 = v17;
  v22 = v19;
  v23 = v18;
  v24 = v20;
  objc_msgSend(v15, "addErrorBlock:", v25);

}

uint64_t __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = *(_QWORD *)(a1 + 48);
  if (v3 == v4 - 1)
    return +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v5, *(_QWORD *)(a1 + 32));
  else
    return +[AMSPromise _configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:](AMSPromise, "_configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) + 1);
}

void __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "ams_title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AMSCustomError(v4, v5, v6, v7, v8, *(void **)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 64);
  v10 = objc_msgSend(*(id *)(a1 + 40), "count");
  v11 = *(_QWORD *)(a1 + 48);
  if (v9 == v10 - 1)
    +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", v11, v12);
  else
    +[AMSPromise _configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:](AMSPromise, "_configureFlattenedPromise:withPromises:results:previousError:currentPromiseIndex:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v12, *(_QWORD *)(a1 + 64) + 1);

}

- (BOOL)isFinishedWithLock
{
  AMSPromise *v2;
  void *v3;

  v2 = self;
  os_unfair_lock_assert_owner(&self->_stateLock);
  -[AMSPromise promiseResult](v2, "promiseResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 != 0;

  return (char)v2;
}

- (id)binaryPromiseAdapterForClass:(Class)a3
{
  _QWORD v4[5];
  _QWORD v5[6];

  v4[4] = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke;
  v5[3] = &unk_1E2544CE0;
  v5[4] = self;
  v5[5] = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_3;
  v4[3] = &__block_descriptor_40_e26__16__0__AMSPromiseResult_8lu32l8;
  -[AMSPromise valueFromAddingBlock:orCallWithResult:](self, "valueFromAddingBlock:orCallWithResult:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_2;
  v6[3] = &unk_1E25425C0;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "addCompletionBlock:", v6);

  return v4;
}

BOOL __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AMSMutableBinaryPromise finishPromise:withSuccess:error:](AMSMutableBinaryPromise, "finishPromise:withSuccess:error:", *(_QWORD *)(a1 + 32), a2 != 0, a3);
}

id __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "promiseWithSuccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "promiseWithError:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (AMSPromise)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSelf, a3);
}

- (BOOL)conditionHasSignaled
{
  return self->_conditionHasSignaled;
}

- (void)setConditionHasSignaled:(BOOL)a3
{
  self->_conditionHasSignaled = a3;
}

- (BOOL)finishWithPromiseResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", self, v5, v6);
  return (char)self;
}

+ (id)promiseFinishedWithDefaultErrorOrResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  AMSErrorWithFormat(12, CFSTR("No result found."), CFSTR("Completed promise without result."), v5, v6, v7, v8, v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "promiseWithResult:", v4);
  else
    objc_msgSend(a1, "promiseWithError:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
