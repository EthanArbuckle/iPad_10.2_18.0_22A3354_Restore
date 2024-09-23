@implementation AMSPaymentValidationService

+ (BOOL)_isEntitledForDirectAccess
{
  void *v2;
  void *v3;
  char v4;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  return v4;
}

+ (id)paymentHardwareStatusHeaders
{
  Class v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  AMSDaemonConnection *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "_isEntitledForDirectAccess"))
  {
    v4 = NSClassFromString(CFSTR("AMSDPaymentValidationService"));
    NSSelectorFromString(CFSTR("sharedService"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class performSelector:](v4, "performSelector:", sel_sharedService);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "performPaymentHardwareStatusWithService:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    else
    {
      v10 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          if (v14)
          {
            AMSLogKey();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            a2 = (SEL)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v16, v17, a2);
          }
          else
          {
            NSStringFromSelector(a2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@ "), v16, v17);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct access, does not respond to sharedService selector", (uint8_t *)&buf, 0xCu);
          if (v14)
          {

            v18 = (void *)a2;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          if (v20)
          {
            AMSLogKey();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            a2 = (SEL)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v22, v23, a2);
          }
          else
          {
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: %@ "), v22, v23);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct access, does not respond to sharedService selector", (uint8_t *)&buf, 0xCu);
          if (v20)
          {

            v24 = (void *)a2;
          }

        }
      }

      AMSError(12, CFSTR("Method Not Found"), CFSTR("Either payment validation service class is Nil or it does not respond to +sharedService."), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      return v26;
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__56;
    v31 = __Block_byref_object_dispose__56;
    v32 = objc_alloc_init(AMSDaemonConnection);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "paymentValidationServiceProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke;
    v27[3] = &unk_1E2544918;
    v27[4] = &buf;
    v27[5] = a1;
    objc_msgSend(v8, "thenWithBlock:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&buf, 8);
    return v9;
  }
}

id __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 40), "performPaymentHardwareStatusWithService:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke_2;
  v5[3] = &unk_1E253E520;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addFinishBlock:", v5);
  return v3;
}

void __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

+ (id)performPaymentHardwareStatusWithService:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  AMSMutablePromise *v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;
  id v10;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__AMSPaymentValidationService_performPaymentHardwareStatusWithService___block_invoke;
  v8[3] = &unk_1E2544940;
  v10 = a1;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "paymentHardwareStatusHeaderWithCompletion:", v8);

  return v6;
}

void __71__AMSPaymentValidationService_performPaymentHardwareStatusWithService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get payment hardware status header with error: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Getting payment hardware status header failed with no response dictionary", (uint8_t *)&v16, 0x16u);

    }
    AMSError(12, CFSTR("Payment hardware status Error"), CFSTR("Empty response dictionary"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v15);

  }
}

@end
