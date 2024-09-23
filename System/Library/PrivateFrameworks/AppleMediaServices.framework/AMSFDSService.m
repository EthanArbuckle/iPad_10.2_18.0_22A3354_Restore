@implementation AMSFDSService

+ (id)cacheFDS:(id)a3 forPurchaseInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  AMSDaemonConnection *v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__31;
  v21 = __Block_byref_object_dispose__31;
  v22 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v18[5], "purchaseServiceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke;
  v13[3] = &unk_1E2541BE0;
  v8 = v6;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v7, "thenWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "binaryPromiseAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  return v11;
}

AMSMutablePromise *__42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AMSMutablePromise *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  AMSMutablePromise *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "purchase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke_5;
    v17[3] = &unk_1E253F7F8;
    v10 = v4;
    v11 = *(_QWORD *)(a1 + 48);
    v18 = v10;
    v19 = v11;
    objc_msgSend(v3, "cacheFDS:forPurchaseIdentifier:logKey:completion:", v7, v6, v9, v17);

    v12 = v18;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      AMSSetLogKeyIfNeeded();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);

    }
    AMSError(2, CFSTR("AFDS Error"), CFSTR("No Purchase Identifier"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v4, "finishWithError:", v12);
  }

  return v4;
}

void __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v3, "finishWithError:", a2);
  else
    objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (id)cachedFDSForPurchaseInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  AMSDaemonConnection *v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__31;
  v17 = __Block_byref_object_dispose__31;
  v18 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v14[5], "purchaseServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke;
  v9[3] = &unk_1E2541C30;
  v6 = v4;
  v11 = &v13;
  v12 = a1;
  v10 = v6;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v7;
}

AMSMutablePromise *__42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  AMSMutablePromise *v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "purchase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke_8;
    v14[3] = &unk_1E2541C08;
    v15 = v4;
    v16 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v3, "cachedFDSForPurchaseIdentifier:logKey:completion:", v6, v8, v14);

    v9 = v15;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      AMSSetLogKeyIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);

    }
    AMSError(2, CFSTR("AFDS Error"), CFSTR("No Purchase Identifier"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v4, "finishWithError:", v9);
  }

  return v4;
}

void __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
      goto LABEL_5;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find AFDS value", (uint8_t *)&v14, 0x16u);

    }
    AMSError(12, CFSTR("AFDS Error"), CFSTR("No AFDS"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

LABEL_5:
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

+ (id)didConsumeFDSForPurchaseInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  AMSMutablePromise *(*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  AMSDaemonConnection *v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__31;
  v19 = __Block_byref_object_dispose__31;
  v20 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v16[5], "purchaseServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke;
  v12 = &unk_1E2541C58;
  v5 = v3;
  v13 = v5;
  v14 = &v15;
  objc_msgSend(v4, "thenWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "binaryPromiseAdapter", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v7;
}

AMSMutablePromise *__46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSMutablePromise *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  AMSMutablePromise *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "purchase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke_12;
    v16[3] = &unk_1E253F7F8;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 40);
    v17 = v9;
    v18 = v10;
    objc_msgSend(v3, "didConsumeFDSForPurchaseIdentifier:logKey:completion:", v6, v8, v16);

    v11 = v17;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      AMSSetLogKeyIfNeeded();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);

    }
    AMSError(2, CFSTR("AFDS Error"), CFSTR("No Purchase Identifier"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v4, "finishWithError:", v11);
  }

  return v4;
}

void __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v3, "finishWithError:", a2);
  else
    objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (id)generateFDSWithRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AMSDaemonConnection *v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__31;
  v15 = __Block_byref_object_dispose__31;
  v16 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v12[5], "purchaseServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AMSFDSService_generateFDSWithRequest___block_invoke;
  v8[3] = &unk_1E2541C58;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v6;
}

AMSMutablePromise *__40__AMSFDSService_generateFDSWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AMSFDSService_generateFDSWithRequest___block_invoke_2;
  v9[3] = &unk_1E2541C80;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "generateFDSWithRequest:completion:", v5, v9);

  return v6;
}

void __40__AMSFDSService_generateFDSWithRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finishWithResult:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

+ (id)partialFDSAssessmentForRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AMSDaemonConnection *v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__31;
  v15 = __Block_byref_object_dispose__31;
  v16 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v12[5], "purchaseServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke;
  v8[3] = &unk_1E2541C58;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v6;
}

AMSMutablePromise *__48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  AMSMutablePromise *v6;
  uint64_t v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke_2;
  v9[3] = &unk_1E2541C80;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "partialFDSAssessmentForRequest:completion:", v5, v9);

  return v6;
}

void __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finishWithResult:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

@end
