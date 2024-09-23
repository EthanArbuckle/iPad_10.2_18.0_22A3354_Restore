@implementation AMSLazyPromise

- (void)addSuccessBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  -[AMSPromise addSuccessBlock:](&v5, sel_addSuccessBlock_, v4);

}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v9.receiver = self;
  v9.super_class = (Class)AMSLazyPromise;
  -[AMSPromise resultBeforeDate:error:](&v9, sel_resultBeforeDate_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addErrorBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  -[AMSPromise addErrorBlock:](&v5, sel_addErrorBlock_, v4);

}

- (void)addFinishBlock:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v5.receiver = self;
  v5.super_class = (Class)AMSLazyPromise;
  -[AMSPromise addFinishBlock:](&v5, sel_addFinishBlock_, v4);

}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v8.receiver = self;
  v8.super_class = (Class)AMSLazyPromise;
  -[AMSPromise addBlock:orCallWithResult:](&v8, sel_addBlock_orCallWithResult_, v7, v6);

}

- (BOOL)_runBlock
{
  os_unfair_lock_s *p_stateLock;
  BOOL v4;
  void (**v5)(_QWORD, _QWORD);

  p_stateLock = &self->super._stateLock;
  os_unfair_lock_lock_with_options();
  if (-[AMSPromise isFinishedWithLock](self, "isFinishedWithLock") || *(&self->_executedBlock + 4))
  {
    os_unfair_lock_unlock(p_stateLock);
    return 0;
  }
  else
  {
    v4 = 1;
    *(&self->_executedBlock + 4) = 1;
    os_unfair_lock_unlock(p_stateLock);
    -[AMSLazyPromise timeout](self, "timeout");
    +[AMSMutablePromise startTimeoutForPromise:timeout:](AMSMutablePromise, "startTimeoutForPromise:timeout:", self);
    -[AMSLazyPromise block](self, "block");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AMSLazyPromise *))v5)[2](v5, self);

  }
  return v4;
}

- (BOOL)executedBlock
{
  AMSLazyPromise *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->super._stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_executedBlock + 4);
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setExecutedBlock:(BOOL)a3
{
  *(&self->_executedBlock + 4) = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (AMSLazyPromise)initWithBlock:(id)a3
{
  uint64_t v3;
  id v5;
  AMSLazyPromise *v6;
  AMSLazyPromise *v7;
  uint64_t v8;
  void *block;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSLazyPromise;
  v6 = -[AMSPromise init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_timeout = 0.0;
    if (v5)
    {
      v8 = objc_msgSend(v5, "copy");
      block = v7->_block;
      v7->_block = (id)v8;
    }
    else
    {
      v10 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedPromiseConfig](AMSLogConfig, "sharedPromiseConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v10)
      {
        if (!v11)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = objc_opt_class();
          v17 = v16;
          if (v14)
          {
            AMSLogKey();
            v3 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v3);
          }
          else
          {
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@An AMSLazyPromise instance was unexpectedly initialized without a block. It will fail immediately with an error.", buf, 0xCu);
          if (v14)
          {

            v18 = (void *)v3;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedPromiseConfig](AMSLogConfig, "sharedPromiseConfig");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v19, 0);
      }
      else
      {
        if (!v11)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "OSLogObject");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = objc_opt_class();
          v23 = v22;
          if (v20)
          {
            AMSLogKey();
            v3 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v3);
          }
          else
          {
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v24;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_FAULT, "%{public}@An AMSLazyPromise instance was unexpectedly initialized without a block. It will fail immediately with an error.", buf, 0xCu);
          if (v20)
          {

            v24 = (void *)v3;
          }

        }
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AMSErrorDomain"), 2, 0);
      block = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSMutablePromise finishPromise:withError:](AMSMutablePromise, "finishPromise:withError:", v7, block);
    }

  }
  return v7;
}

- (id)resultWithError:(id *)a3
{
  objc_super v6;

  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v6.receiver = self;
  v6.super_class = (Class)AMSLazyPromise;
  -[AMSPromise resultWithError:](&v6, sel_resultWithError_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  objc_super v8;

  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v8.receiver = self;
  v8.super_class = (Class)AMSLazyPromise;
  -[AMSPromise resultWithTimeout:error:](&v8, sel_resultWithTimeout_error_, a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AMSLazyPromise)initWithTimeout:(double)a3 block:(id)a4
{
  AMSLazyPromise *result;

  result = -[AMSLazyPromise initWithBlock:](self, "initWithBlock:", a4);
  if (result)
    result->_timeout = a3;
  return result;
}

- (AMSLazyPromise)initWithPromiseResult:(id)a3
{
  id v4;
  id v5;
  AMSLazyPromise *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AMSLazyPromise_initWithPromiseResult___block_invoke;
  v8[3] = &unk_1E2542788;
  v9 = v4;
  v5 = v4;
  v6 = -[AMSLazyPromise initWithBlock:](self, "initWithBlock:", v8);

  return v6;
}

uint64_t __40__AMSLazyPromise_initWithPromiseResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithPromiseResult:", *(_QWORD *)(a1 + 32));
}

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[AMSLazyPromise _runBlock](self, "_runBlock");
  v10.receiver = self;
  v10.super_class = (Class)AMSLazyPromise;
  -[AMSPromise valueFromAddingBlock:orCallWithResult:](&v10, sel_valueFromAddingBlock_orCallWithResult_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

@end
