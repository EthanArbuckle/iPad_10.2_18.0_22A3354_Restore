@implementation AMSBiometricsSecurityService

+ (id)isAvailableForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  AMSDaemonConnection *v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v16[5], "securityServiceProxyWithDelegate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke;
  v12[3] = &unk_1E253F760;
  v7 = v4;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v5, "thenWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_3;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v11[4] = a1;
  objc_msgSend(v8, "addErrorBlock:", v11);
  objc_msgSend(v8, "binaryPromiseAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v9;
}

AMSMutablePromise *__54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke(uint64_t a1, void *a2)
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
  v9[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_2;
  v9[3] = &unk_1E253F678;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "isBiometricsAvailableForAccount:completion:", v5, v9);

  return v6;
}

void __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (v5)
    goto LABEL_5;
  if ((a2 & 1) == 0)
  {
    AMSError(11, CFSTR("Biometric Error"), CFSTR("Biometrics not available"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
LABEL_6:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSSetLogKeyIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch biometric availability: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

+ (id)isIdentityMapValid
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  AMSDaemonConnection *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v9[5], "securityServiceProxyWithDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke;
  v7[3] = &unk_1E253F7D0;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v3, "thenWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "binaryPromiseAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v8, 8);
  return v5;
}

AMSMutablePromise *__50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  _QWORD v7[4];
  AMSMutablePromise *v8;
  __int128 v9;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke_2;
  v7[3] = &unk_1E253F7A8;
  v5 = v4;
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "isIdentityMapValidWithCompletion:", v7);

  return v5;
}

void __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

  }
  else if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }
  else
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
      v9 = (void *)objc_opt_class();
      v10 = v9;
      AMSSetLogKeyIfNeeded();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometric identity map invalid", (uint8_t *)&v15, 0x16u);

    }
    AMSError(11, CFSTR("Biometric Error"), CFSTR("Invalid Identity Map"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v12);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

+ (id)saveIdentityMap
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  AMSDaemonConnection *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v8[5], "securityServiceProxyWithDelegate:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke;
  v6[3] = &unk_1E253F6C8;
  v6[4] = &v7;
  objc_msgSend(v2, "thenWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "binaryPromiseAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v7, 8);
  return v4;
}

AMSMutablePromise *__47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  uint64_t v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke_2;
  v8[3] = &unk_1E253F7F8;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "saveIdentityMapWithCompletion:", v8);

  return v5;
}

void __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v3, "finishWithError:", a2);
  else
    objc_msgSend(v3, "finishWithResult:", &unk_1E25AF020);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (id)verifyDevicePasscode
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  AMSDaemonConnection *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v8[5], "securityServiceProxyWithDelegate:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke;
  v6[3] = &unk_1E253F6C8;
  v6[4] = &v7;
  objc_msgSend(v2, "thenWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "binaryPromiseAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v7, 8);
  return v4;
}

AMSMutablePromise *__61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  uint64_t v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke_2;
  v8[3] = &unk_1E253F678;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "performDevicePasscodeVerificationWithCompletion:", v8);

  return v5;
}

void __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v5);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

@end
