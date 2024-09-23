@implementation AMSFinishedPromise

+ (void)logUnavailableInitWithSelector:(SEL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = v9;
    if (v7)
    {
      AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, a1);
    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Attempt to initialize AMSFinishedPromise using %@. A mutable promise will be returned instead.", buf, 0x16u);
    if (v7)
    {

      v11 = a1;
    }

  }
}

- (AMSFinishedPromise)init
{
  AMSFinishedPromise *v3;

  +[AMSFinishedPromise logUnavailableInitWithSelector:](AMSFinishedPromise, "logUnavailableInitWithSelector:", a2);
  v3 = objc_alloc_init(AMSMutablePromise);

  return v3;
}

- (AMSFinishedPromise)initWithTimeout:(double)a3
{
  AMSFinishedPromise *v5;

  +[AMSFinishedPromise logUnavailableInitWithSelector:](AMSFinishedPromise, "logUnavailableInitWithSelector:", a2);
  v5 = -[AMSMutablePromise initWithTimeout:]([AMSMutablePromise alloc], "initWithTimeout:", a3);

  return v5;
}

+ (id)promiseWithError:(id)a3
{
  id v4;
  id v5;
  AMSPromiseResult *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = -[AMSPromiseResult initWithResult:error:]([AMSPromiseResult alloc], "initWithResult:error:", 0, v4);

  v7 = (void *)objc_msgSend(v5, "initWithPromiseResult:", v6);
  return v7;
}

+ (id)promiseWithResult:(id)a3
{
  id v4;
  id v5;
  AMSPromiseResult *v6;
  id v7;

  v4 = a3;
  if ((id)*MEMORY[0x1E0C9AE50] == v4 && (id)objc_opt_class() == a1)
  {
    if (_MergedGlobals_107 != -1)
      dispatch_once(&_MergedGlobals_107, &__block_literal_global_59);
    v7 = (id)qword_1ECEAD200;
  }
  else
  {
    v5 = objc_alloc((Class)a1);
    v6 = -[AMSPromiseResult initWithResult:error:]([AMSPromiseResult alloc], "initWithResult:error:", v4, 0);
    v7 = (id)objc_msgSend(v5, "initWithPromiseResult:", v6);

  }
  return v7;
}

void __40__AMSFinishedPromise_promiseWithResult___block_invoke()
{
  AMSFinishedPromise *v0;
  AMSPromiseResult *v1;
  uint64_t v2;
  void *v3;
  AMSPromiseResult *v4;

  v0 = [AMSFinishedPromise alloc];
  v1 = [AMSPromiseResult alloc];
  v4 = -[AMSPromiseResult initWithResult:error:](v1, "initWithResult:error:", MEMORY[0x1E0C9AAB0], 0);
  v2 = -[AMSPromise initWithPromiseResult:](v0, "initWithPromiseResult:", v4);
  v3 = (void *)qword_1ECEAD200;
  qword_1ECEAD200 = v2;

}

+ (id)promiseWithPromiseResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPromiseResult:", v4);

  return v5;
}

- (void)addErrorBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[AMSPromise promiseResult](self, "promiseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6[2](v6, v5);

}

- (void)addFinishBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, void *, void *))a3;
  -[AMSPromise promiseResult](self, "promiseResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, v6);

}

- (void)addSuccessBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[AMSPromise promiseResult](self, "promiseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6[2](v6, v5);

}

- (id)resultWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AMSPromise promiseResult](self, "promiseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    objc_msgSend(v4, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return -[AMSFinishedPromise resultWithError:](self, "resultWithError:", a4);
}

- (void)resultWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, void *, void *))a3;
  -[AMSPromise promiseResult](self, "promiseResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, v6);

}

- (void)resultBeforeDate:(id)a3 completion:(id)a4
{
  -[AMSFinishedPromise resultWithCompletion:](self, "resultWithCompletion:", a4);
}

- (id)continueWithBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *, void *))a3;
  -[AMSPromise promiseResult](self, "promiseResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AMSPromise promiseResult](self, "promiseResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[AMSPromise promiseResult](self, "promiseResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)binaryPromiseAdapterForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSPromise promiseResult](self, "promiseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[objc_class promiseWithSuccess](a3, "promiseWithSuccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class promiseWithError:](a3, "promiseWithError:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isFinished
{
  return 1;
}

- (BOOL)isFinishedWithLock
{
  return 1;
}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[AMSPromise promiseResult](self, "promiseResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_errorIsCanceledError:", v5);

  return (char)v3;
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

- (id)condition
{
  return 0;
}

- (id)BOOLCompletionHandlerAdapter
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, self);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      v9 = self;
    }

  }
  return &__block_literal_global_9_1;
}

- (id)completionHandlerAdapter
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, self);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      v9 = self;
    }

  }
  return &__block_literal_global_11_1;
}

- (id)nilValueCompletionHandlerAdapter
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      self = (AMSFinishedPromise *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, self);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@Attempted to get a completion handler for an already-finished promise, which will have no effect when called.", buf, 0xCu);
    if (v5)
    {

      v9 = self;
    }

  }
  return &__block_literal_global_12_1;
}

@end
