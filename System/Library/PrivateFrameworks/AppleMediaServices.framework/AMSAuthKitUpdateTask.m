@implementation AMSAuthKitUpdateTask

- (AMSAuthKitUpdateTask)initWithAccount:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  AMSAuthKitUpdateTask *v9;
  AMSAuthKitUpdateTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthKitUpdateTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)performAuthKitUpdate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  id *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  void *v22;
  void *v23;
  AMSMutablePromise *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  AMSMutablePromise *v30;
  AMSMutablePromise *v31;
  id v32;
  void *v33;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  void *v38;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  _QWORD v45[4];
  AMSMutablePromise *v46;
  _QWORD v47[5];
  id v48;
  AMSMutablePromise *v49;
  _BYTE *v50;
  _BYTE buf[24];
  void (*v52)(uint64_t, uint64_t);
  _BYTE v53[20];
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "OSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id *)(a1 + 32);
    v35 = objc_opt_class();
    AMSLogKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v38);
    v36 = (void (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_password");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("****");
    if (v5)
      v7 = CFSTR("****");
    else
      v7 = 0;
    objc_msgSend(*v3, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_rawPassword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v6 = 0;
    objc_msgSend(*v3, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2114;
    v52 = v36;
    *(_WORD *)v53 = 2114;
    *(_QWORD *)&v53[2] = v7;
    *(_WORD *)&v53[10] = 2114;
    *(_QWORD *)&v53[12] = v6;
    v54 = 2114;
    v55 = v11;
    _os_log_impl(&dword_18C849000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an AuthKit authentication. account = %{public}@ | account.ams_password = %{public}@ | account.ams_rawPassword = %{public}@ | options = %{public}@", buf, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientInfo");
      v20 = (void (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v52 = v20;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An authentication was performed without a debugReason. client = %{public}@", buf, 0x20u);

    }
  }
  v21 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_updateAccountRawPasswordUsingSecondaryAccounts:options:", v22, v23);

  v24 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "_createAuthKitContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_configureAuthKitContext:", v25);
  objc_msgSend(*(id *)(a1 + 32), "_createAuthKitController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3042000000;
  v52 = __Block_byref_object_copy__5;
  *(_QWORD *)v53 = __Block_byref_object_dispose__5;
  *(_QWORD *)&v53[8] = 0;
  v27 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_16;
  v47[3] = &unk_1E253E3A0;
  v28 = *(_QWORD *)(a1 + 32);
  v50 = buf;
  v47[4] = v28;
  v29 = v25;
  v48 = v29;
  v30 = v24;
  v49 = v30;
  objc_msgSend(v26, "addSuccessBlock:", v47);
  v45[0] = v27;
  v45[1] = 3221225472;
  v45[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_2;
  v45[3] = &unk_1E253E120;
  v31 = v30;
  v46 = v31;
  objc_msgSend(v26, "addErrorBlock:", v45);
  v44[0] = v27;
  v44[1] = 3221225472;
  v44[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_3;
  v44[3] = &unk_1E253E3C8;
  v44[4] = buf;
  -[AMSPromise addFinishBlock:](v31, "addFinishBlock:", v44);
  v42[0] = v27;
  v42[1] = 3221225472;
  v42[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_4;
  v42[3] = &unk_1E253E3F0;
  v42[4] = *(_QWORD *)(a1 + 32);
  v32 = v29;
  v43 = v32;
  -[AMSMutablePromise thenWithBlock:](v31, "thenWithBlock:", v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v27;
  v41[1] = 3221225472;
  v41[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_9;
  v41[3] = &unk_1E253E148;
  v41[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v33, "addSuccessBlock:", v41);
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_28;
  v40[3] = &unk_1E253E120;
  v40[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v33, "addErrorBlock:", v40);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak((id *)&v53[8]);

  return v33;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_16(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = a2;
  objc_storeWeak(v3, v4);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticateWithContext:completion:", v5, v6);

}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(WeakRetained, "setDelegate:", 0);

}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  AMSAuthKitUpdateResult *v12;
  id v13;
  AMSMutablePromise *v14;
  AMSAuthKitUpdateResult *v15;
  void *v16;
  void *v17;
  void *v19;
  int v20;
  void *v21;
  AMSMutablePromise *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  AMSMutablePromise *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[4];
  AMSMutablePromise *v34;
  _QWORD v35[5];
  id v36;
  AMSMutablePromise *v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logPromptSummaryForResults:context:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v4, "length")
    || !objc_msgSend(v4, "length")
    && objc_msgSend(v11, "length")
    && (objc_msgSend(*(id *)(a1 + 32), "options"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "serviceTokenOnly"),
        v19,
        v20))
  {
    v12 = [AMSAuthKitUpdateResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "account");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "options");
    v14 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSAuthKitUpdateResult initWithAccount:authenticationResults:options:](v12, "initWithAccount:authenticationResults:options:", v13, v3, v14);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v4, "length") || !objc_msgSend(v11, "length"))
    {
      AMSError(101, CFSTR("Unknown AuthKit Failure"), CFSTR("The AuthKit authentication succeeded, but the results did not contain a password."), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "_createAuthKitContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_configureAuthKitContext:", v21);
    objc_msgSend(v21, "setServiceIdentifiers:", MEMORY[0x1E0C9AA60]);
    v22 = objc_alloc_init(AMSMutablePromise);
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3042000000;
    v39[3] = __Block_byref_object_copy__5;
    v39[4] = __Block_byref_object_dispose__5;
    v40 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_createAuthKitController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_5;
    v35[3] = &unk_1E253E3A0;
    v25 = *(_QWORD *)(a1 + 32);
    v38 = v39;
    v35[4] = v25;
    v13 = v21;
    v36 = v13;
    v26 = v22;
    v37 = v26;
    objc_msgSend(v23, "addSuccessBlock:", v35);
    v33[0] = v24;
    v33[1] = 3221225472;
    v33[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_6;
    v33[3] = &unk_1E253E120;
    v14 = v26;
    v34 = v14;
    objc_msgSend(v23, "addErrorBlock:", v33);
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_7;
    v32[3] = &unk_1E253E3C8;
    v32[4] = v39;
    -[AMSPromise addFinishBlock:](v14, "addFinishBlock:", v32);
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_8;
    v29[3] = &unk_1E253E3F0;
    v27 = v5;
    v28 = *(_QWORD *)(a1 + 32);
    v30 = v27;
    v31 = v28;
    -[AMSMutablePromise thenWithBlock:](v14, "thenWithBlock:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v39, 8);
    objc_destroyWeak(&v40);
  }

LABEL_10:
  return v16;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = a2;
  objc_storeWeak(v3, v4);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticateWithContext:completion:", v5, v6);

}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  objc_msgSend(WeakRetained, "setDelegate:", 0);

}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSAuthKitUpdateResult *v6;
  void *v7;
  void *v8;
  void *v9;
  AMSAuthKitUpdateResult *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CFFF70]);
    v6 = [AMSAuthKitUpdateResult alloc];
    objc_msgSend(*(id *)(a1 + 40), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(*(id *)(a1 + 40), "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSAuthKitUpdateResult initWithAccount:authenticationResults:options:](v6, "initWithAccount:authenticationResults:options:", v7, v8, v9);

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(101, CFSTR("Unknown AuthKit Failure"), CFSTR("The AuthKit authentication succeeded, but the results did not contain a password."), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    AMSHashIfNeeded(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The AuthKit authentication succeeded. result = %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "code");
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v4 != -7048)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = objc_opt_class();
    AMSLogKey();
    v15 = objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v3);
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v19;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The AuthKit authentication failed. error = %{public}@", buf, 0x20u);
    goto LABEL_15;
  }
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v3);
    v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User requested alternate action. error = %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = +[AMSAuthenticateTask loadCreateAppleIDWithClientInfo:bag:error:](AMSAuthenticateTask, "loadCreateAppleIDWithClientInfo:bag:error:", v12, 0, &v20);
  v6 = v20;

  if (!v13)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v16 = objc_opt_class();
    AMSLogKey();
    v17 = objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v16;
    v23 = 2114;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error loading Create Apple ID Flow. error = %{public}@", buf, 0x20u);

LABEL_15:
LABEL_16:

LABEL_17:
  }

}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v9;
  id v10;
  _UNKNOWN **v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v44;
  id v45;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v48 = a4;
  v9 = a5;
  v10 = a6;
  v11 = &off_1E2519000;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v47 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
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
      v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v16, v17, v11);
    }
    else
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@ "), v16, v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v18;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@began.", buf, 0xCu);
    if (v14)
    {

      v18 = v11;
    }

    v10 = v47;
  }

  +[AMSLogConfig sharedAccountsOversizeConfig](AMSLogConfig, "sharedAccountsOversizeConfig");
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
    v21 = v9;
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = objc_opt_class();
    v25 = v24;
    if (v22)
    {
      AMSLogKey();
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v44);
    }
    else
    {
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v49);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "ak_redactedCopy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v51 = v26;
    v52 = 2114;
    v53 = v27;
    v54 = 2114;
    v55 = v29;
    v56 = 2114;
    v57 = v30;
    v58 = 2114;
    v59 = v31;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@controller = %{public}@ | results = %{public}@ | error = %{public}@ | context = %{public}@", buf, 0x34u);

    if (v22)
    {

      v26 = (void *)v44;
    }

    v9 = v21;
    v10 = v47;
  }

  objc_msgSend(v10, "clientInfo");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setClientInfo:", v32);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("metricsAuthenticationAttempts"));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("metricsAuthenticationAttempts"));
    }
  }
  else
  {
    v33 = 0;
  }
  +[AMSMetricsEvent metricsAuthenticationAttemptDictionaryForAuthKitError:](AMSMetricsEvent, "metricsAuthenticationAttemptDictionaryForAuthKitError:", v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v33, "addObject:", v34);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v35, "OSLogObject");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v45 = v9;
    AMSLogKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = objc_opt_class();
    if (v37)
    {
      AMSLogKey();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v39, v40, v10);
    }
    else
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: %@ "), v39, v40);
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CFSTR("false");
    v9 = v45;
    if (!v45)
      v42 = CFSTR("true");
    *(_DWORD *)buf = 138543618;
    v51 = v41;
    v52 = 2114;
    v53 = v42;
    _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEBUG, "%{public}@returning %{public}@", buf, 0x16u);
    if (v37)
    {

      v41 = v10;
    }

    v10 = v47;
  }

  return v9 == 0;
}

- (BOOL)_canPresentBackgroundPrompt
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;

  -[AMSAuthKitUpdateTask options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 1;
  if (_MergedGlobals_1_0 != -1)
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_11);
  v6 = (id)qword_1ECEACA38;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  return v9;
}

void __51__AMSAuthKitUpdateTask__canPresentBackgroundPrompt__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("amstool"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.amsaccountsd"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.dt.xctest.tool"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.AppleMediaServicesUITestsHost"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.AppleMediaServicesTests.xctrunner"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.appstoreagent"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.appstored"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.appstorecomponentsd"));
  objc_msgSend(v0, "addObject:", CFSTR("com.apple.AppStoreOverlays.ViewService"));
  v1 = objc_msgSend(v0, "copy");

  v2 = (void *)qword_1ECEACA38;
  qword_1ECEACA38 = v1;

}

- (unint64_t)_authenticationType
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AMSAuthKitUpdateTask options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authenticationType");

  -[AMSAuthKitUpdateTask options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRemoteProxyAuthentication");

  if (v6 && v4 == 2)
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding authenticationType with AKAppleIDAuthenticationTypeSilentPreferred. Performing a remote proxy authentication.", (uint8_t *)&v16, 0x16u);

    }
    v4 = 0;
  }
  if (!-[AMSAuthKitUpdateTask _canPresentBackgroundPrompt](self, "_canPresentBackgroundPrompt") && v4 != 1)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding authenticationType with AKAppleIDAuthenticationTypeSilent. The current process cannot perform a background prompt.", (uint8_t *)&v16, 0x16u);

    }
    return 1;
  }
  return v4;
}

- (void)_configureAuthKitContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setAuthenticationType:", -[AMSAuthKitUpdateTask _authenticationType](self, "_authenticationType"));
  -[AMSAuthKitUpdateTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_rawPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setPassword:", v5);

  objc_msgSend(v12, "setServiceType:", 2);
  -[AMSAuthKitUpdateTask options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsEphemeral:", objc_msgSend(v6, "ephemeral"));

  -[AMSAuthKitUpdateTask options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setServiceType:", objc_msgSend(v7, "serviceType"));

  -[AMSAuthKitUpdateTask options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setServiceIdentifier:", v11);

  }
  -[AMSAuthKitUpdateTask _configureClientInfoForContext:](self, "_configureClientInfoForContext:", v12);
  -[AMSAuthKitUpdateTask _configureCompanionDeviceForContext:](self, "_configureCompanionDeviceForContext:", v12);
  -[AMSAuthKitUpdateTask _configureIdentifiersForContext:](self, "_configureIdentifiersForContext:", v12);
  -[AMSAuthKitUpdateTask _configureProxyIdentifiersForContext:](self, "_configureProxyIdentifiersForContext:", v12);
  -[AMSAuthKitUpdateTask _configureStringsForContext:](self, "_configureStringsForContext:", v12);

}

- (void)_configureClientInfoForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AMSAuthKitUpdateTask options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appProvidedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppProvidedContext:", v5);

  -[AMSAuthKitUpdateTask options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appProvidedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppProvidedData:", v7);

  objc_msgSend(v13, "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setClientInfo:", v8);
  }
  -[AMSAuthKitUpdateTask options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createAccountQueryParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v10, CFSTR("AMSAuthenticateOptionsCreateAccountQueryParamsKey"));

  -[AMSAuthKitUpdateTask options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userAgent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v12, CFSTR("AMSAuthenticateOptionsUserAgentKey"));

}

- (void)_configureCompanionDeviceForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AMSAuthKitUpdateTask options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "companionDeviceClientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v8 = objc_alloc_init(MEMORY[0x1E0D001D8]);
    objc_msgSend(v8, "setLinkType:", 2);
    -[AMSAuthKitUpdateTask options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "companionDeviceClientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setServerFriendlyDescription:", v10);

    -[AMSAuthKitUpdateTask options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "companionDeviceUDID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUniqueDeviceIdentifier:", v12);

    objc_msgSend(v13, "setCompanionDevice:", v8);
    goto LABEL_5;
  }
  -[AMSAuthKitUpdateTask options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "companionDeviceUDID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (void)_configureIdentifiersForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[AMSAuthKitUpdateTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AMSAuthKitUpdateTask account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAltDSID:", v8);

  }
  -[AMSAuthKitUpdateTask account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[AMSAuthKitUpdateTask account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_1E25AEFF0);

    if ((v14 & 1) != 0)
      goto LABEL_7;
    -[AMSAuthKitUpdateTask account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_DSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDSID:", v16);

  }
LABEL_7:
  -[AMSAuthKitUpdateTask account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    -[AMSAuthKitUpdateTask account](self, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "username");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUsername:", v20);

  }
  else
  {
    objc_msgSend(v23, "setUsername:", 0);
  }

  -[AMSAuthKitUpdateTask account](self, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "username");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIsUsernameEditable:", v22 == 0);

  if (objc_msgSend(v23, "authenticationType") == 1)
    objc_msgSend(v23, "setIsUsernameEditable:", 0);
  if (objc_msgSend(v23, "isUsernameEditable"))
  {
    objc_msgSend(v23, "setAltDSID:", 0);
    objc_msgSend(v23, "setDSID:", 0);
  }

}

- (void)_configureProxyIdentifiersForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[AMSAuthKitUpdateTask options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxyAppBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v14, "_setProxyingForApp:", 1);
    -[AMSAuthKitUpdateTask options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "proxyAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setProxiedAppBundleID:", v8);

  }
  -[AMSAuthKitUpdateTask options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "proxyAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v14, "_setProxyingForApp:", 1);
    -[AMSAuthKitUpdateTask options](self, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "proxyAppName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setProxiedAppName:", v13);

  }
}

- (void)_configureStringsForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[AMSAuthKitUpdateTask options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelButtonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelButtonString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCancelButtonString:", v8);

  }
  -[AMSAuthKitUpdateTask options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultButtonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[AMSAuthKitUpdateTask options](self, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultButtonString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDefaultButtonString:", v13);

  }
  -[AMSAuthKitUpdateTask options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "promptTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "set_passwordPromptTitle:", v15);

  -[AMSAuthKitUpdateTask options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setReason:", v17);

  -[AMSAuthKitUpdateTask options](self, "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "promptTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v19);

}

- (id)_createAuthKitContext
{
  return objc_alloc_init(MEMORY[0x1E0D00128]);
}

- (id)_createAuthKitController
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D00130]);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_logPromptSummaryForResults:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[7];

  v45[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0CFFFA8];
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = 0;
LABEL_5:
    if (!v9)
      goto LABEL_23;
    goto LABEL_6;
  }
  v11 = objc_msgSend(v10, "BOOLValue");
  if ((v11 & 1) == 0)
    goto LABEL_5;
LABEL_6:
  v30 = v11;
  v34 = v9;
  v35 = v6;
  v44[0] = CFSTR("authType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "authenticationType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v33;
  v44[1] = CFSTR("account");
  -[AMSAuthKitUpdateTask account](self, "account");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  AMSHashIfNeeded(v31);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E2548760;
  v45[1] = v14;
  v44[2] = CFSTR("reason");
  -[AMSAuthKitUpdateTask options](self, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugReason");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E2548760;
  v45[2] = v18;
  v44[3] = CFSTR("client");
  -[AMSAuthKitUpdateTask options](self, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[3] = v21;
  v44[4] = CFSTR("proxyApp");
  -[AMSAuthKitUpdateTask options](self, "options");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "proxyAppBundleID");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = &stru_1E2548760;
  if (v23)
    v25 = (const __CFString *)v23;
  v45[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_opt_class();
    AMSLogKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v28;
    v38 = 2114;
    v39 = v29;
    v40 = 1024;
    v41 = v30;
    v42 = 2114;
    v43 = v32;
    _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompted for credentials. (%d) %{public}@", buf, 0x26u);

  }
  v9 = v34;
  v6 = v35;
LABEL_23:

}

- (ACAccount)account
{
  return self->_account;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
