@implementation AMSMutablePromise

+ (BOOL)_finishPromise:(id)a3 withResult:(id)a4 error:(id)a5 logDuplicateFinishes:(BOOL)a6
{
  _BOOL4 v6;
  os_unfair_lock_s *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  NSObject *v20;
  AMSPromiseResult *v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = (os_unfair_lock_s *)a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = (void *)v12;
  if (v11 && v12)
  {
    +[AMSLogConfig sharedPromiseConfig](AMSLogConfig, "sharedPromiseConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = 138543874;
      v25 = a1;
      v26 = 2114;
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Someone is finishing a promise with both a result and an error. This will result in both the success and error blocks being called. result = %{public}@ error = %{public}@", (uint8_t *)&v24, 0x20u);
    }

  }
  else if (!(v11 | v12))
  {
    +[AMSLogConfig sharedPromiseConfig](AMSLogConfig, "sharedPromiseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = 138543362;
      v25 = a1;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Someone is finishing a promise with neither a result nor an error.", (uint8_t *)&v24, 0xCu);
    }

    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("Some attempted to finish a promise without a result/error."), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock_with_options();
  v18 = -[os_unfair_lock_s isFinishedWithLock](v10, "isFinishedWithLock");
  if (v18)
  {
    if (v6)
    {
      +[AMSLogConfig sharedPromiseConfig](AMSLogConfig, "sharedPromiseConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138543362;
        v25 = a1;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Someone is attempting to finish or cancel a finished AMSPromise.", (uint8_t *)&v24, 0xCu);
      }

    }
    os_unfair_lock_unlock(v10 + 2);
  }
  else
  {
    v21 = -[AMSPromiseResult initWithResult:error:]([AMSPromiseResult alloc], "initWithResult:error:", v11, v13);
    -[os_unfair_lock_s setPromiseResult:](v10, "setPromiseResult:", v21);
    -[os_unfair_lock_s condition](v10, "condition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v10 + 2);
    if (v22)
    {
      objc_msgSend(v22, "lock");
      -[os_unfair_lock_s setConditionHasSignaled:](v10, "setConditionHasSignaled:", 1);
      objc_msgSend(v22, "broadcast");
      objc_msgSend(v22, "unlock");
    }
    -[os_unfair_lock_s flushCompletionBlocksWithResult:](v10, "flushCompletionBlocksWithResult:", v21);
    -[os_unfair_lock_s stopRetainingSelf](v10, "stopRetainingSelf");

  }
  return v18 ^ 1;
}

+ (BOOL)finishPromise:(id)a3 withResult:(id)a4
{
  return objc_msgSend(a1, "_finishPromise:withResult:error:logDuplicateFinishes:", a3, a4, 0, 1);
}

+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "isFinished");
  if ((v7 & 1) == 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__AMSMutablePromise_finishPromise_withPromise___block_invoke;
    v13[3] = &unk_1E253D398;
    v9 = v5;
    v14 = v9;
    objc_msgSend(v6, "addSuccessBlock:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __47__AMSMutablePromise_finishPromise_withPromise___block_invoke_2;
    v11[3] = &unk_1E253E120;
    v12 = v9;
    objc_msgSend(v6, "addErrorBlock:", v11);

  }
  return v7 ^ 1;
}

BOOL __47__AMSMutablePromise_finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", *(_QWORD *)(a1 + 32), a2);
}

+ (BOOL)finishPromise:(id)a3 withResult:(id)a4 error:(id)a5
{
  return objc_msgSend(a1, "_finishPromise:withResult:error:logDuplicateFinishes:", a3, a4, a5, 1);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[AMSMutablePromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

BOOL __47__AMSMutablePromise_finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", *(_QWORD *)(a1 + 32), a2);
}

- (BOOL)finishWithError:(id)a3
{
  return -[AMSMutablePromise finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)thenWithBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise thenWithBlock:](&v7, sel_thenWithBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutablePromiseWrappingPromise:](self, "_mutablePromiseWrappingPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)continueWithBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise continueWithBlock:](&v7, sel_continueWithBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutablePromiseWrappingPromise:](self, "_mutablePromiseWrappingPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)finishPromise:(id)a3 withError:(id)a4
{
  return objc_msgSend(a1, "_finishPromise:withResult:error:logDuplicateFinishes:", a3, 0, a4, 1);
}

- (id)catchWithBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise catchWithBlock:](&v7, sel_catchWithBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutablePromiseWrappingPromise:](self, "_mutablePromiseWrappingPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return -[AMSMutablePromise finishWithResult:error:logDuplicateFinishes:](self, "finishWithResult:error:logDuplicateFinishes:", a3, a4, 1);
}

- (AMSMutablePromise)initWithTimeout:(double)a3
{
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;

  v4 = -[AMSPromise init](self, "init");
  v5 = v4;
  if (v4)
    -[AMSMutablePromise startTimeout:](v4, "startTimeout:", a3);
  return v5;
}

+ (void)startTimeoutForPromise:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v14[4];
  id v15[2];
  id location;
  _QWORD block[4];
  id v18;
  id v19;

  v6 = a3;
  if (a4 > 0.0)
  {
    objc_initWeak(&location, v6);
    dispatch_get_global_queue(17, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__AMSMutablePromise_startTimeoutForPromise_timeout___block_invoke;
    v14[3] = &unk_1E2543290;
    objc_copyWeak(v15, &location);
    v15[1] = a1;
    v9 = v7;
    v10 = v14;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 * 1000000000.0 <= 9.22337204e18)
      v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    else
      v12 = -1;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_5;
    block[3] = &unk_1E253DC28;
    v18 = v11;
    v19 = v10;
    v13 = v11;
    dispatch_after(v12, v9, block);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

}

- (void)startTimeout:(double)a3
{
  objc_msgSend((id)objc_opt_class(), "startTimeoutForPromise:timeout:", self, a3);
}

void __52__AMSMutablePromise_startTimeoutForPromise_timeout___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    AMSError(1, CFSTR("Promise Timed Out"), 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_finishPromise:withResult:error:logDuplicateFinishes:", WeakRetained, 0, v2, 0);

  }
}

- (BOOL)finishWithPromise:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "finishPromise:withPromise:", self, v4);

  return (char)self;
}

+ (BOOL)cancelPromise:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB28A8];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3072, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "finishPromise:withResult:error:", v6, 0, v7);

  return (char)a1;
}

+ (AMSMutablePromise)promiseWithAll:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  objc_msgSendSuper2(&v4, sel_promiseWithAll_, a3);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

+ (AMSMutablePromise)promiseWithAll:(id)a3 timeout:(double)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  objc_msgSendSuper2(&v5, sel_promiseWithAll_timeout_, a3, a4);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

+ (AMSMutablePromise)promiseWithAny:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  objc_msgSendSuper2(&v4, sel_promiseWithAny_, a3);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

+ (AMSMutablePromise)promiseWithAny:(id)a3 timeout:(double)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  objc_msgSendSuper2(&v5, sel_promiseWithAny_timeout_, a3, a4);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

+ (AMSMutablePromise)promiseWithFlattenedPromises:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AMSMutablePromise;
  objc_msgSendSuper2(&v4, sel_promiseWithFlattenedPromises_, a3);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

- (AMSMutablePromise)promiseWithTimeout:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSMutablePromise;
  -[AMSPromise promiseWithTimeout:](&v4, sel_promiseWithTimeout_, a3);
  return (AMSMutablePromise *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)catchWithBinaryPromiseBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise catchWithBinaryPromiseBlock:](&v7, sel_catchWithBinaryPromiseBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutableBinaryPromiseWrappingBinaryPromise:](self, "_mutableBinaryPromiseWrappingBinaryPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)continueWithBinaryPromiseBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise continueWithBinaryPromiseBlock:](&v7, sel_continueWithBinaryPromiseBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutableBinaryPromiseWrappingBinaryPromise:](self, "_mutableBinaryPromiseWrappingBinaryPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)thenWithBinaryPromiseBlock:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSMutablePromise;
  -[AMSPromise thenWithBinaryPromiseBlock:](&v7, sel_thenWithBinaryPromiseBlock_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMutablePromise _mutableBinaryPromiseWrappingBinaryPromise:](self, "_mutableBinaryPromiseWrappingBinaryPromise:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mutableBinaryPromiseWrappingBinaryPromise:(id)a3
{
  id v3;
  AMSMutableBinaryPromise *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (AMSMutableBinaryPromise *)v3;
  }
  else
  {
    v4 = objc_alloc_init(AMSMutableBinaryPromise);
    -[AMSMutableBinaryPromise finishWithPromise:](v4, "finishWithPromise:", v3);
  }

  return v4;
}

- (id)_mutablePromiseWrappingPromise:(id)a3
{
  id v3;
  AMSMutablePromise *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (AMSMutablePromise *)v3;
  }
  else
  {
    v4 = objc_alloc_init(AMSMutablePromise);
    -[AMSMutablePromise finishWithPromise:](v4, "finishWithPromise:", v3);
  }

  return v4;
}

- (BOOL)cancel
{
  return objc_msgSend((id)objc_opt_class(), "cancelPromise:", self);
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

  LOBYTE(self) = -[AMSMutablePromise finishWithResult:error:logDuplicateFinishes:](self, "finishWithResult:error:logDuplicateFinishes:", v5, v6, 1);
  return (char)self;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4 logDuplicateFinishes:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  LOBYTE(v5) = objc_msgSend((id)objc_opt_class(), "_finishPromise:withResult:error:logDuplicateFinishes:", self, v9, v8, v5);

  return v5;
}

@end
