@implementation AMSBiometricsSignatureTask

- (AMSBiometricsSignatureTask)initWithRequest:(id)a3
{
  id v5;
  AMSBiometricsSignatureTask *v6;
  AMSBiometricsSignatureTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsSignatureTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (id)performSignature
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSSetLogKeyIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Perform signature task - determine the context", buf, 0x16u);

  }
  v21 = 0;
  v8 = -[AMSBiometricsSignatureTask _fetchCardEnrollmentConfigurations:](self, "_fetchCardEnrollmentConfigurations:", &v21);
  v9 = v21;
  if (v8)
  {
    -[AMSBiometricsSignatureTask request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keychainOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "purpose") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Music")) & 1) != 0)
      {
        v14 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "processName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v17, "isEqualToString:", CFSTR("AppStore"));

      }
    }
    else
    {
      v14 = 0;
    }

    v18 = AMSIsEntitledForDirectKeychainAccess();
    if ((v14 & 1) != 0 || !v18)
    {
      -[AMSBiometricsSignatureTask _performSignatureOutOfProcess](self, "_performSignatureOutOfProcess");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AMSBiometricsSignatureTask _performSignatureInProcess](self, "_performSignatureInProcess");
      v15 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v15;

  return v19;
}

- (id)performSignatureFromService
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSSetLogKeyIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Perform signature task from service", (uint8_t *)&v9, 0x16u);

  }
  -[AMSBiometricsSignatureTask _performSignatureInProcess](self, "_performSignatureInProcess");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_performSignatureOutOfProcess
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  AMSSigningSecurityService *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSSetLogKeyIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting OOP signature operation", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = objc_alloc_init(AMSSigningSecurityService);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__12;
  v13[4] = __Block_byref_object_dispose__12;
  -[AMSBiometricsSignatureTask request](self, "request");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
  -[AMSBiometricsSignatureTask request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signatureForRequest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__AMSBiometricsSignatureTask__performSignatureOutOfProcess__block_invoke;
  v12[3] = &unk_1E253F820;
  v12[4] = buf;
  v12[5] = v13;
  objc_msgSend(v10, "addFinishBlock:", v12);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __59__AMSBiometricsSignatureTask__performSignatureOutOfProcess__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (id)_performSignatureInProcess
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  AMSPromise *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AMSMutablePromise *v17;
  AMSMutablePromise *v18;
  id v19;
  AMSMutablePromise *v20;
  AMSMutablePromise *v21;
  AMSMutablePromise *v23;
  _QWORD v24[5];
  id v25;
  AMSMutablePromise *v26;
  _QWORD v27[5];
  AMSMutablePromise *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = (id)objc_opt_class();
    v31 = 2114;
    v32 = v3;
    v6 = v30;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting signature operation", buf, 0x16u);

  }
  v23 = objc_alloc_init(AMSMutablePromise);
  v7 = objc_alloc_init(AMSPromise);
  -[AMSBiometricsSignatureTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localAuthContext");
  v9 = (void *)v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBiometricsSignatureTask request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "localAuthAccessControlRef");
  -[AMSBiometricsSignatureTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localAuthOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "evaluateAccessControl:operation:options:reply:", v12, 3, v14, v15);

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke;
  v27[3] = &unk_1E253D950;
  v27[4] = self;
  v17 = v23;
  v28 = v17;
  -[AMSPromise addErrorBlock:](v7, "addErrorBlock:", v27);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_13;
  v24[3] = &unk_1E253F848;
  v24[4] = self;
  v25 = v9;
  v18 = v17;
  v26 = v18;
  v19 = v9;
  -[AMSPromise addSuccessBlock:](v7, "addSuccessBlock:", v24);
  v20 = v26;
  v21 = v18;

  return v21;
}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] evaluateAccessControl reply with error: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  if (objc_msgSend(v3, "code") == -2 || objc_msgSend(v3, "code") == -4)
  {
    AMSError(6, CFSTR("Biometrics dialog failed"), CFSTR("Biometrics dialog cancelled"), v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v3;
  }
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);

}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  id v30;
  void *v31;
  AMSBiometricsSignatureResult *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v41 = a1;
  v3 = *(void **)(a1 + 32);
  v45 = 0;
  objc_msgSend(v3, "_performCardEnrollmentCheck:", &v45);
  v4 = v45;
  if (v4)
  {
    v5 = v4;
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v47 = v8;
      v48 = 2114;
      v49 = v9;
      v50 = 2114;
      v51 = v5;
      v10 = v8;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing biometric signature due to auto-enrollment check: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(v41 + 48), "finishWithError:", v5);
  }
  else
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keychainOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "style");
    objc_msgSend(*(id *)(a1 + 32), "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localAuthContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "keychainOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v21 = objc_msgSend(v11, "copyPrivateKeyWithStyle:context:account:options:error:", v14, v16, v18, v20, &v44);
    v5 = v44;

    if (v5)
    {
      +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        v25 = *(_QWORD *)(v41 + 40);
        *(_DWORD *)buf = 138543874;
        v47 = v24;
        v48 = 2114;
        v49 = v25;
        v50 = 2114;
        v51 = v5;
        v26 = v24;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing biometric signature due to auto-enrollment check: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(v41 + 48), "finishWithError:", v5);
    }
    else if (v21)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_18;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v21;
      v27 = (void (**)(_QWORD))_Block_copy(aBlock);
      v28 = *(void **)(v41 + 32);
      v42 = 0;
      objc_msgSend(v28, "signWithPrivateKey:error:", v21, &v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v42;
      v31 = v30;
      if (!v29 || v30)
      {
        AMSError(602, CFSTR("Signature Failed"), CFSTR("Fatal error prior to signing data"), 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v41 + 48), "finishWithError:", v5);
      }
      else
      {
        v32 = objc_alloc_init(AMSBiometricsSignatureResult);
        objc_msgSend((id)objc_opt_class(), "fetchPublicKeyDataFromPrivateKey:error:", v21, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSBiometricsSignatureResult setPublicKey:](v32, "setPublicKey:", v33);

        objc_msgSend(*(id *)(v41 + 32), "request");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSBiometricsSignatureResult setOriginalRequest:](v32, "setOriginalRequest:", v34);

        -[AMSBiometricsSignatureResult setSignature:](v32, "setSignature:", v29);
        +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v35, "OSLogObject");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_opt_class();
          v38 = *(_QWORD *)(v41 + 40);
          *(_DWORD *)buf = 138543618;
          v47 = v37;
          v48 = 2114;
          v49 = v38;
          v39 = v37;
          _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Signature operation completed successfully", buf, 0x16u);

        }
        objc_msgSend(*(id *)(v41 + 48), "finishWithResult:", v32);

        v5 = 0;
      }

      v27[2](v27);
    }
    else
    {
      AMSError(602, CFSTR("Signature Failed"), CFSTR("Failed to get private key reference"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v41 + 32), "regenerateAttestationKeys");
      objc_msgSend(*(id *)(v41 + 48), "finishWithError:", v5);
    }
  }

}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_18(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)_fetchCardEnrollmentConfigurations:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
    -[AMSBiometricsSignatureTask request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isDualAction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543874;
    v42 = v8;
    v43 = 2114;
    v44 = v5;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Start fetch CardEnrollment setting for dual-action=%@", (uint8_t *)&v41, 0x20u);

  }
  -[AMSBiometricsSignatureTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isDualAction");

  if (!v14)
    goto LABEL_12;
  -[AMSBiometricsSignatureTask request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSBiometricsSignatureTask request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[AMSCardEnrollment shouldUseApplePayClassicWithBag:](AMSCardEnrollment, "shouldUseApplePayClassicWithBag:", v18);
    -[AMSBiometricsSignatureTask request](self, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUseApplePayClassic:", v19);

    -[AMSBiometricsSignatureTask request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:](AMSCardEnrollment, "shouldUseAutoEnrollmentWithBag:", v22);
    -[AMSBiometricsSignatureTask request](self, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUseAutoEnrollment:", v23);

    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_opt_class();
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = v27;
      -[AMSBiometricsSignatureTask request](self, "request");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithBool:", objc_msgSend(v30, "shouldUseApplePayClassic"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB37E8];
      -[AMSBiometricsSignatureTask request](self, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "shouldUseAutoEnrollment"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138544130;
      v42 = v27;
      v43 = 2114;
      v44 = v5;
      v45 = 2112;
      v46 = v31;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Get CardEnrollment setting for dual-action, useApplePayClassic=%@, useAutoEnrollment=%@", (uint8_t *)&v41, 0x2Au);

    }
LABEL_12:
    v35 = 1;
    goto LABEL_13;
  }
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v37, "OSLogObject");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    v39 = (void *)objc_opt_class();
    v41 = 138543618;
    v42 = v39;
    v43 = 2114;
    v44 = v5;
    v40 = v39;
    _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Buy params indicate a dual-action buy but no bag available", (uint8_t *)&v41, 0x16u);

  }
  if (a3)
  {
    AMSError(601, CFSTR("Biometric Signature Failure"), CFSTR("No bag available for dual-action buy"), 0);
    v35 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
LABEL_13:

  return v35;
}

- (BOOL)_performCardEnrollmentCheck:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  _BYTE v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBiometricsSignatureTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDualAction");

  if (!v7)
  {
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 138543618;
      *(_QWORD *)&v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2114;
      *(_QWORD *)&v38[14] = v5;
      v21 = *(id *)&v38[4];
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping card enrollment check for no dual-action buy", v38, 0x16u);

    }
    goto LABEL_21;
  }
  -[AMSBiometricsSignatureTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "localAuthAccessControlRef");

  if (v9)
    goto LABEL_3;
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "OSLogObject");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v38 = 138543618;
    *(_QWORD *)&v38[4] = objc_opt_class();
    *(_WORD *)&v38[12] = 2114;
    *(_QWORD *)&v38[14] = v5;
    v33 = *(id *)&v38[4];
    _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed for dual-action buy for no ACL", v38, 0x16u);

  }
  AMSError(601, CFSTR("Biometric Signature Failure"), CFSTR("No ACL available for dual-action buy"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
LABEL_3:
    -[AMSBiometricsSignatureTask request](self, "request", *(_OWORD *)v38, *(_QWORD *)&v38[16], v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldUseApplePayClassic");

    if (v11)
    {
      +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
        *(_DWORD *)v38 = 138543618;
        *(_QWORD *)&v38[4] = v14;
        *(_WORD *)&v38[12] = 2114;
        *(_QWORD *)&v38[14] = v5;
        v15 = v14;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking dual-action buy ACL for apple-pay-classic capability", v38, 0x16u);

      }
      -[AMSBiometricsSignatureTask request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "localAuthAccessControlRef");
      v18 = 4;
    }
    else
    {
      -[AMSBiometricsSignatureTask request](self, "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "shouldUseAutoEnrollment");

      if (!v23)
      {
LABEL_21:
        v29 = 0;
        goto LABEL_22;
      }
      +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)v38 = 138543618;
        *(_QWORD *)&v38[4] = v26;
        *(_WORD *)&v38[12] = 2114;
        *(_QWORD *)&v38[14] = v5;
        v27 = v26;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking dual-action buy ACL for auto-enrollment capability", v38, 0x16u);

      }
      -[AMSBiometricsSignatureTask request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "localAuthAccessControlRef");
      v18 = 3;
    }
    v28 = +[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", v18, v17);

    if (v28)
      goto LABEL_21;
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v34, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)v38 = 138543618;
      *(_QWORD *)&v38[4] = v36;
      *(_WORD *)&v38[12] = 2114;
      *(_QWORD *)&v38[14] = v5;
      v37 = v36;
      _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed dual-action buy for insufficient ACL capabilities", v38, 0x16u);

    }
    AMSError(601, CFSTR("Biometric Signature Failure"), CFSTR("ACL does not support dual-action buy"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  if (a3)
    *a3 = objc_retainAutorelease(v29);

  return v29 == 0;
}

- (void)regenerateAttestationKeys
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Required to regenerate attestation.", buf, 0x16u);

  }
  -[AMSBiometricsSignatureTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keychainOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v10, "setRegenerateKeys:", 1);
  v19 = 0;
  +[AMSAttestation attestationWithOptions:error:](AMSAttestation, "attestationWithOptions:error:", v10, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  v13 = v12;
  if (!v11 || v12)
  {
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v18;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-attestation failed. error: %{public}@", buf, 0x20u);

    }
  }

}

- (id)signWithPrivateKey:(__SecKey *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  objc_msgSend((id)objc_opt_class(), "fetchPublicKeyDataFromPrivateKey:error:", a3, &v44);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v44;
  if (v7)
  {
    v9 = (void *)objc_opt_class();
    -[AMSBiometricsSignatureTask request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "challenge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v8;
    objc_msgSend(v9, "fetchDataToSignWithPublicKeyData:challenge:error:", v7, v11, &v43);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v43;

    if (v12)
    {
      v42 = v13;
      objc_msgSend((id)objc_opt_class(), "signDataWithPrivateKey:dataToSign:error:", a3, v12, &v42);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v42;

      if (v14)
      {
        objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          v16 = v15;
        }
        else
        {
          +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v33, "OSLogObject");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = (void *)objc_opt_class();
            v41 = v35;
            AMSLogKey();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v35;
            v47 = 2114;
            v48 = v36;
            _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode the signed string", buf, 0x16u);

          }
          if (a4)
          {
            AMSError(0, CFSTR("Signature Failed"), CFSTR("Failed to encode the signed string."), 0);
            v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
        }

      }
      else
      {
        +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v27, "OSLogObject");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_opt_class();
          v40 = v29;
          AMSLogKey();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v29;
          v47 = 2114;
          v48 = v30;
          v49 = 2114;
          v50 = v8;
          _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed fatal error when signing data with error: %{public}@", buf, 0x20u);

        }
        objc_msgSend(v8, "domain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CC1280]))
          v32 = objc_msgSend(v8, "code") != -2;
        else
          v32 = 0;

        objc_msgSend(v8, "domain");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0CA9B28]))
          v38 = objc_msgSend(v8, "code") == -3;
        else
          v38 = 0;

        if (v32 || v38)
          -[AMSBiometricsSignatureTask regenerateAttestationKeys](self, "regenerateAttestationKeys");
        if (a4)
        {
          AMSError(602, CFSTR("Signature Failed"), CFSTR("Fatal error when signing data."), v8);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
      }

    }
    else
    {
      +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        v25 = v24;
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v24;
        v47 = 2114;
        v48 = v26;
        v49 = 2114;
        v50 = v13;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the data to sign from the challenge with error: %{public}@", buf, 0x20u);

      }
      if (a4)
      {
        AMSError(0, CFSTR("Signature Failed"), CFSTR("Failed to fetch the data to sign from the challenge."), v13);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v8 = v13;
    }

  }
  else
  {
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v19;
      v47 = 2114;
      v48 = v21;
      v49 = 2114;
      v50 = v8;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the public key for the private key with error: %{public}@", buf, 0x20u);

    }
    if (a4)
    {
      AMSError(0, CFSTR("Signature Failed"), CFSTR("Failed to fetch the public key for the private key."), v8);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (__SecKey)copyPrivateKeyWithStyle:(unint64_t)a3 context:(id)a4 account:(id)a5 options:(id)a6 error:(id *)a7
{
  if (a3)
    return +[AMSKeychain copyPrivateKeyWithContext:account:options:error:](AMSKeychain, "copyPrivateKeyWithContext:account:options:error:", a4, a5, a6, a7);
  else
    return +[AMSKeychain copyCertificatePrivateKeyWithContext:account:options:error:](AMSKeychain, "copyCertificatePrivateKeyWithContext:account:options:error:", a4, a5, a6, a7);
}

+ (id)fetchPublicKeyDataFromPrivateKey:(__SecKey *)a3 error:(id *)a4
{
  __SecKey *v5;
  __SecKey *v6;
  CFDataRef v7;
  CFErrorRef error;

  error = 0;
  v5 = SecKeyCopyPublicKey(a3);
  if (!v5)
  {
    v7 = 0;
    if (!a4)
      return v7;
    goto LABEL_3;
  }
  v6 = v5;
  v7 = SecKeyCopyExternalRepresentation(v5, &error);
  CFRelease(v6);
  if (a4)
LABEL_3:
    *a4 = error;
  return v7;
}

+ (id)fetchDataToSignWithPublicKeyData:(id)a3 challenge:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E2548760;
  objc_msgSend(v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  if (a5 && !v13)
  {
    AMSError(0, CFSTR("Signature Failed"), CFSTR("No data to sign"), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)signDataWithPrivateKey:(__SecKey *)a3 dataToSign:(id)a4 error:(id *)a5
{
  CFDataRef v6;
  CFErrorRef error;

  error = 0;
  v6 = SecKeyCreateSignature(a3, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)a4, &error);
  if (a5)
    *a5 = error;
  return v6;
}

- (AMSBiometricsSignatureRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
