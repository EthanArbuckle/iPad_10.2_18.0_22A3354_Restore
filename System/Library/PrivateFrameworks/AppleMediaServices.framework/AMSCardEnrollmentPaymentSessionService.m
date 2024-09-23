@implementation AMSCardEnrollmentPaymentSessionService

+ (id)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  AMSDaemonConnection *v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v19[5], "securityServiceProxyWithDelegate:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke;
  v13[3] = &unk_1E253F6A0;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v16 = &v18;
  v17 = a1;
  v15 = v10;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  return v11;
}

AMSMutablePromise *__84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  uint64_t v6;
  AMSMutablePromise *v7;
  uint64_t v8;
  AMSMutablePromise *v9;
  AMSMutablePromise *v10;
  _QWORD v12[4];
  id v13;
  AMSMutablePromise *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v6 = a1[4];
  v5 = (void *)a1[5];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke_2;
  v12[3] = &unk_1E253FD70;
  v16 = a1[7];
  v13 = v5;
  v7 = v4;
  v8 = a1[6];
  v14 = v7;
  v15 = v8;
  objc_msgSend(v3, "performSilentEnrollmentWithRequest:logKey:completion:", v6, v13, v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
      v10 = *(_QWORD *)(a1 + 32);
      v22 = 138543874;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent enrollment failed with error: %{public}@", (uint8_t *)&v22, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  if (!v5)
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
      v14 = *(_QWORD *)(a1 + 32);
      v22 = 138543618;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent enrollment failed with no response dictionary", (uint8_t *)&v22, 0x16u);
    }

    AMSError(12, CFSTR("Silent Enrollment Error"), CFSTR("Empty response dictionary"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v15);

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    v19 = *(_QWORD *)(a1 + 32);
    v22 = 138543618;
    v23 = v18;
    v24 = 2114;
    v25 = v19;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent enrollment succeeded", (uint8_t *)&v22, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

}

@end
