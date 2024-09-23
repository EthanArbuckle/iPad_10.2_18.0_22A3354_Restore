@implementation VSVerificationStateResetOperation

- (VSVerificationStateResetOperation)init
{
  VSVerificationStateResetOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSOperationQueue *privateQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSVerificationStateResetOperation;
  v2 = -[VSVerificationStateResetOperation init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x1E0CB3828];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queueWithName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;

  }
  return v2;
}

- (void)_resetVerificationStateWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Resetting verification state with URL %@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0CB39F8];
  -[VSVerificationStateResetOperation auditToken](self, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D00140]);
  objc_msgSend(v8, "set_appleIDContext:", v9);

  objc_msgSend(v8, "setTimeoutIntervalForRequest:", 30.0);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:", v4);
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__VSVerificationStateResetOperation__resetVerificationStateWithURL___block_invoke;
  v13[3] = &unk_1E939F6B0;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVerificationStateResetOperation setResetStateTask:](self, "setResetStateTask:", v12);
  objc_msgSend(v12, "resume");

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __68__VSVerificationStateResetOperation__resetVerificationStateWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v18)
    {
      v8 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99778];
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpectedly, response was %@, instead of NSHTTPURLResponse."), v12);

        }
        v13 = objc_msgSend(v8, "statusCode") - 200;

        if (v13 <= 0x63)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0DE7910]);
          +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v16 = (void *)v15;
          +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setResult:", v17);

          objc_msgSend(WeakRetained, "finishExecutionIfPossible");
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    VSPrivateError(-15, v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

}

- (void)executionDidBegin
{
  __CFString *v3;
  VSAMSBagLoadOperation *v4;
  __CFString *v5;
  void *v6;
  _QWORD v7[4];
  __CFString *v8;
  id v9;
  id v10;
  id from;
  id location;

  v3 = CFSTR("gsOtp");
  v4 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v4, "setBagKey:", v3);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__VSVerificationStateResetOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_1E939F6D8;
  objc_copyWeak(&v9, &from);
  objc_copyWeak(&v10, &location);
  v5 = v3;
  v8 = v5;
  -[VSAMSBagLoadOperation setCompletionBlock:](v4, "setCompletionBlock:", v7);
  -[VSVerificationStateResetOperation privateQueue](self, "privateQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __54__VSVerificationStateResetOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)MEMORY[0x1E0C99DA0];
          v9 = *MEMORY[0x1E0C99778];
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpectedly, value was %@, instead of NSString."), v11);

        }
        v7 = v7;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
        v12 = objc_claimAutoreleasedReturnValue();
        VSDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            v15 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            v23 = v12;
            v24 = 2112;
            v25 = v15;
            _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Did load URL value (%@) for bag key %@", buf, 0x16u);
          }

          objc_msgSend(WeakRetained, "_resetVerificationStateWithURL:", v12);
          goto LABEL_20;
        }
        if (v14)
        {
          v19 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v23 = v7;
          v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@ but could not create a URL", buf, 0x16u);
        }

      }
      else
      {
        VSDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v23 = v7;
          v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_1D2419000, v17, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@ but it was NOT a string", buf, 0x16u);
        }

      }
    }
    else
    {
      VSDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v23 = v16;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Did NOT load value for bag key %@: %@", buf, 0x16u);
      }
    }

    VSPrivateError(-14, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v21);

    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
LABEL_20:

  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSVerificationStateResetOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSVerificationStateResetOperation resetStateTask](self, "resetStateTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSURLSessionTask)resetStateTask
{
  return self->_resetStateTask;
}

- (void)setResetStateTask:(id)a3
{
  objc_storeStrong((id *)&self->_resetStateTask, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_resetStateTask, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
