@implementation AMSMediaInvokeAuthenticationCoordinator

- (AMSMediaInvokeAuthenticationCoordinator)init
{
  AMSMediaInvokeAuthenticationCoordinator *v2;
  NSMutableArray *v3;
  NSMutableArray *invokeAuthQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSMediaInvokeAuthenticationCoordinator;
  v2 = -[AMSMediaInvokeAuthenticationCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    invokeAuthQueue = v2->_invokeAuthQueue;
    v2->_invokeAuthQueue = v3;

    v2->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (AMSMediaInvokeAuthenticationCoordinator)sharedInstance
{
  if (_MergedGlobals_119 != -1)
    dispatch_once(&_MergedGlobals_119, &__block_literal_global_74);
  return (AMSMediaInvokeAuthenticationCoordinator *)(id)qword_1ECEAD598;
}

void __57__AMSMediaInvokeAuthenticationCoordinator_sharedInstance__block_invoke()
{
  AMSMediaInvokeAuthenticationCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(AMSMediaInvokeAuthenticationCoordinator);
  v1 = (void *)qword_1ECEAD598;
  qword_1ECEAD598 = (uint64_t)v0;

}

- (id)addToQueueAndPerformAuthFromResponseIfNeeded:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSMediaInvokeAuthenticationQueuedObject *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = objc_alloc_init(AMSMediaInvokeAuthenticationQueuedObject);
  -[AMSMediaInvokeAuthenticationQueuedObject setResponse:](v9, "setResponse:", v6);
  -[AMSMediaInvokeAuthenticationQueuedObject setTaskInfo:](v9, "setTaskInfo:", v7);

  -[AMSMediaInvokeAuthenticationQueuedObject setPendingPromise:](v9, "setPendingPromise:", v8);
  v10 = objc_msgSend(v6, "ams_statusCode") >= 200 && objc_msgSend(v6, "ams_statusCode") < 400;
  -[AMSMediaInvokeAuthenticationQueuedObject setIgnoringResult:](v9, "setIgnoringResult:", v10);
  os_unfair_lock_lock(&self->_queueLock);
  -[AMSMediaInvokeAuthenticationCoordinator invokeAuthQueue](self, "invokeAuthQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v9);

  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v25 = v14;
    v26 = v6;
    AMSSetLogKeyIfNeeded();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaInvokeAuthenticationCoordinator invokeAuthQueue](self, "invokeAuthQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    v31 = 2048;
    v32 = objc_msgSend(v16, "count");
    v33 = 1024;
    v34 = -[AMSMediaInvokeAuthenticationQueuedObject ignoringResult](v9, "ignoringResult");
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queued up Invoke Media API Authentication. Current queue count: %lu. Will ignore result: %d", buf, 0x26u);

    v6 = v26;
  }

  os_unfair_lock_unlock(&self->_queueLock);
  -[AMSMediaInvokeAuthenticationCoordinator updateQueueIfNeeded](self, "updateQueueIfNeeded");
  if (-[AMSMediaInvokeAuthenticationQueuedObject ignoringResult](v9, "ignoringResult"))
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject", v25);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      AMSSetLogKeyIfNeeded();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Successful response, returned empty promise for Invoke Media API Authentication allowing handling of original response to continue while we deal with the authentication separately.", buf, 0x16u);

    }
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AMSMediaInvokeAuthenticationQueuedObject pendingPromise](v9, "pendingPromise");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (void)updateQueueIfNeeded
{
  os_unfair_lock_s *p_queueLock;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  -[AMSMediaInvokeAuthenticationCoordinator inflightAuthPromise](self, "inflightAuthPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_3:
    os_unfair_lock_unlock(p_queueLock);
    v5 = 0;
    v6 = 0;
    goto LABEL_4;
  }
  -[AMSMediaInvokeAuthenticationCoordinator invokeAuthQueue](self, "invokeAuthQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_3;
  -[AMSMediaInvokeAuthenticationCoordinator invokeAuthQueue](self, "invokeAuthQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  -[AMSMediaInvokeAuthenticationCoordinator setInflightAuthPromise:](self, "setInflightAuthPromise:", v6);
  os_unfair_lock_unlock(p_queueLock);
  if (v6)
  {
    objc_msgSend(v5, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMediaInvokeAuthenticationHandler performAuthFromResponse:taskInfo:](AMSMediaInvokeAuthenticationHandler, "performAuthFromResponse:taskInfo:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithPromise:", v12);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__AMSMediaInvokeAuthenticationCoordinator_updateQueueIfNeeded__block_invoke;
    v13[3] = &unk_1E2542DF0;
    v13[4] = self;
    v5 = v5;
    v14 = v5;
    objc_msgSend(v6, "addFinishBlock:", v13);

  }
LABEL_4:

}

void __62__AMSMediaInvokeAuthenticationCoordinator_updateQueueIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSSetLogKeyIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v9;
    v22 = 2114;
    v23 = v11;
    v24 = 2112;
    v25 = (uint64_t)v6;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Authentication finished with error: %@", (uint8_t *)&v20, 0x20u);
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(v5, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = (void *)objc_opt_class();
    v10 = v13;
    AMSSetLogKeyIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v13;
    v22 = 2114;
    v23 = v11;
    v24 = 2048;
    v25 = objc_msgSend(v14, "actionType");
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Authentication finished with result: %ld", (uint8_t *)&v20, 0x20u);

    goto LABEL_11;
  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setInflightAuthPromise:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invokeAuthQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectAtIndex:", 0);

  objc_msgSend(*(id *)(a1 + 32), "invokeAuthQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(*(id *)(a1 + 32), "invokeAuthQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_finishQueueWithAuthResult:queuedObjects:", v5, v17);
  objc_msgSend(*(id *)(a1 + 40), "pendingPromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "finishWithResult:", v5);

  objc_msgSend(*(id *)(a1 + 32), "updateQueueIfNeeded");
}

- (void)_finishQueueWithAuthResult:(id)a3 queuedObjects:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v41;
    *(_QWORD *)&v8 = 138543618;
    v36 = v8;
    v37 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      v39 = v9;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "ignoringResult", v36) & 1) == 0)
        {
          objc_msgSend(v5, "value");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13
            && (v14 = (void *)v13,
                objc_msgSend(v5, "value"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = objc_msgSend(v15, "actionType"),
                v15,
                v14,
                v16 == 3))
          {
            +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v17, "OSLogObject");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = (void *)objc_opt_class();
              v20 = v19;
              AMSSetLogKeyIfNeeded();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v36;
              v45 = v19;
              v46 = 2114;
              v47 = v21;
              _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoke Media API Previous authentication finished with cancel, ignoring remaining queued up authentication requests.", buf, 0x16u);

              v10 = v37;
            }

            objc_msgSend(v12, "pendingPromise");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "finishWithResult:", v5);
          }
          else
          {
            +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v23, "OSLogObject");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_opt_class();
              v38 = v25;
              AMSSetLogKeyIfNeeded();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "response");
              v27 = v5;
              v28 = v6;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "URL");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v25;
              v46 = 2114;
              v47 = v26;
              v48 = 2112;
              v49 = v30;
              _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying queued up request with Invoke Media API Authentication for URL: %@", buf, 0x20u);

              v6 = v28;
              v5 = v27;

              v10 = v37;
            }

            +[AMSURLAction retryAction](AMSURLAction, "retryAction");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setRetryIdentifier:", 0x1E254B620);
            objc_msgSend(v22, "setReason:", CFSTR("authentication"));
            objc_msgSend(v5, "value");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              objc_msgSend(v5, "value");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "authenticateResult");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setAuthenticateResult:", v33);

            }
            objc_msgSend(v12, "pendingPromise");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v22);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "finishWithResult:", v35);

            v9 = v39;
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v9);
  }

}

- (os_unfair_lock_s)queueLock
{
  return self->_queueLock;
}

- (NSMutableArray)invokeAuthQueue
{
  return self->_invokeAuthQueue;
}

- (AMSPromise)inflightAuthPromise
{
  return self->_inflightAuthPromise;
}

- (void)setInflightAuthPromise:(id)a3
{
  objc_storeStrong((id *)&self->_inflightAuthPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflightAuthPromise, 0);
  objc_storeStrong((id *)&self->_invokeAuthQueue, 0);
}

@end
