@implementation AMSDelegatePaymentSheetTask

- (AMSDelegatePaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  AMSDelegatePaymentSheetTask *v8;
  AMSDelegatePaymentSheetTask *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDelegatePaymentSheetTask;
  v8 = -[AMSPaymentSheetTask initWithRequest:bag:](&v11, sel_initWithRequest_bag_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_request, a3);

  return v9;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__AMSDelegatePaymentSheetTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  AMSMutablePromise *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v3, "OSLogObject");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_opt_class();
        AMSLogKey();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v5;
        v32 = 2114;
        v33 = v6;
        _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);

      }
      AMSError(6, CFSTR("Early Cancellation"), CFSTR("The task was cancelled before it began."), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v12;
        v32 = 2114;
        v33 = v14;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting delegate payment sheet task", buf, 0x16u);

      }
      v15 = objc_alloc_init(AMSMutablePromise);
      objc_msgSend(*(id *)(a1 + 32), "setPaymentSheetPromise:", v15);

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_9;
      v28[3] = &unk_1E2540B78;
      objc_copyWeak(&v29, (id *)buf);
      objc_msgSend(v16, "addSuccessBlock:", v28);

      objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_11;
      v26[3] = &unk_1E253F408;
      objc_copyWeak(&v27, (id *)buf);
      objc_msgSend(v18, "addErrorBlock:", v26);

      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "paymentRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_presentPaymentSheetWithPaymentRequest:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v17;
      v24[1] = 3221225472;
      v24[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_13;
      v24[3] = &unk_1E253F408;
      objc_copyWeak(&v25, (id *)buf);
      objc_msgSend(v22, "addErrorBlock:", v24);

      objc_msgSend(*(id *)(a1 + 32), "paymentSheetPromise");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    AMSError(2, CFSTR("Delegate Payment Sheet Failed"), CFSTR("Delegate payment request is nil"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(WeakRetained, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task completed successfully", (uint8_t *)&v7, 0x16u);

  }
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    objc_msgSend(WeakRetained, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PaymentSheet completed with error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    objc_msgSend(WeakRetained, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task completed with error: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(WeakRetained, "paymentSheetPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isFinished");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "paymentSheetPromise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v3);

  }
}

- (AMSDelegatePaymentSheetRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
