@implementation AMSBiometrics

+ (id)handleResponse:(id)a3 session:(id)a4 taskInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  AMSBiometricsTokenUpdateTask *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  AMSBiometricsTokenUpdateTask *v24;
  void *v25;
  void *v26;
  AMSBiometricsTokenUpdateTask *v27;
  uint64_t v28;
  AMSBiometricsTokenUpdateTask *v29;
  AMSBiometricsPresentationProxy *v30;
  void *v31;
  uint64_t v32;
  AMSBiometricsTokenUpdateTask *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v45;
  AMSBiometricsTokenUpdateTask *v46;
  AMSBiometricsTokenUpdateTask *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "disableBiometricsResponseHandling");

  if (!v12)
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v15 = (AMSBiometricsTokenUpdateTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-TID-Action"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_18;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v47 = v15;
      v20 = v9;
      v21 = a1;
      v22 = v19;
      AMSSetLogKey(0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v19;
      v56 = 2114;
      v57 = v23;
      v58 = 2114;
      v59 = v16;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received touch ID action: %{public}@", buf, 0x20u);

      a1 = v21;
      v9 = v20;
      v15 = v47;
    }

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("RP")))
    {
      v24 = [AMSBiometricsTokenUpdateTask alloc];
      objc_msgSend(v10, "properties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "account");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[AMSBiometricsTokenUpdateTask initWithAccount:](v24, "initWithAccount:", v26);

      -[AMSBiometricsTokenUpdateTask performUpdate](v27, "performUpdate");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v15;
LABEL_17:

      v15 = (AMSBiometricsTokenUpdateTask *)v28;
      goto LABEL_18;
    }
    if (!objc_msgSend(v16, "isEqualToString:", CFSTR("EP")))
    {
LABEL_18:
      -[AMSBiometricsTokenUpdateTask promiseAdapter](v15, "promiseAdapter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __49__AMSBiometrics_handleResponse_session_taskInfo___block_invoke;
      v49[3] = &unk_1E253F630;
      v50 = v8;
      v51 = v16;
      v52 = v10;
      v53 = a1;
      v43 = v16;
      objc_msgSend(v42, "continueWithBlock:", v49);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v48 = a1;
    v30 = [AMSBiometricsPresentationProxy alloc];
    objc_msgSend(v10, "task");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[AMSBiometricsPresentationProxy initWithSession:task:](v30, "initWithSession:task:", v9, v31);

    v33 = [AMSBiometricsTokenUpdateTask alloc];
    objc_msgSend(v10, "properties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "account");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AMSBiometricsTokenUpdateTask initWithAccount:](v33, "initWithAccount:", v35);

    v46 = (AMSBiometricsTokenUpdateTask *)v32;
    -[AMSBiometricsTokenUpdateTask setPresentationDelegate:](v29, "setPresentationDelegate:", v32);
    -[AMSBiometricsTokenUpdateTask setShouldRequestConfirmation:](v29, "setShouldRequestConfirmation:", 1);
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "properties");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "purchaseInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "buyParams");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "parameterForKey:", CFSTR("mtTopic"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v39;

      if (v40)
      {
        v41 = v45;
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v40, CFSTR("topic"));
        v27 = v46;
LABEL_16:
        -[AMSBiometricsTokenUpdateTask setAdditionalDialogMetrics:](v29, "setAdditionalDialogMetrics:", v41);
        -[AMSBiometricsTokenUpdateTask performUpdate](v29, "performUpdate");
        v28 = objc_claimAutoreleasedReturnValue();

        a1 = v48;
        goto LABEL_17;
      }
    }
    else
    {

      v40 = 0;
    }
    v41 = v45;
    v27 = v46;
    goto LABEL_16;
  }
  +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v14;
}

id __49__AMSBiometrics_handleResponse_session_taskInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-TID-Challenge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-TID-Pkeyid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("EXT"));
  if (*(_QWORD *)(a1 + 40) || (v3 ? (v6 = v5 == 0) : (v6 = 1), v6))
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keychainOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v9, "setPurpose:", 1);
    +[AMSLogConfig sharedBiometricsConfig](AMSLogConfig, "sharedBiometricsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      v15 = v14;
      if (v12)
      {
        AMSLogKey();
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v26);
      }
      else
      {
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "purpose"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Signing challenge: %{public}@", buf, 0x16u);

      if (v12)
      {

        v16 = (void *)v26;
      }

    }
    v19 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clientInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "signAndReturnChallenge:withAccount:clientInfo:options:", v3, v21, v23, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __49__AMSBiometrics_handleResponse_session_taskInfo___block_invoke_75;
    v27[3] = &unk_1E253F608;
    v30 = *(_QWORD *)(a1 + 56);
    v28 = v3;
    v29 = *(id *)(a1 + 48);
    objc_msgSend(v24, "continueWithBlock:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

+ (int64_t)deviceState
{
  unint64_t v2;

  v2 = objc_msgSend(a1, "type");
  if (v2 <= 7
    && ((1 << v2) & 0x8C) != 0
    && +[AMSDefaults deviceBiometricsState](AMSDefaults, "deviceBiometricsState") != 2)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

+ (NSArray)identityMap
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    v2 = 0;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getBiometricKitClass_softClass;
    v12 = getBiometricKitClass_softClass;
    if (!getBiometricKitClass_softClass)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __getBiometricKitClass_block_invoke;
      v8[3] = &unk_1E253DDB8;
      v8[4] = &v9;
      __getBiometricKitClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    objc_msgSend(v4, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identities:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v6;
}

+ (BOOL)isIdentityMapValid
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[AMSDefaults deviceBiometricIdentities](AMSDefaults, "deviceBiometricIdentities");
    v5 = objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __35__AMSBiometrics_isIdentityMapValid__block_invoke;
    v33[3] = &unk_1E253F5B8;
    v36 = a1;
    v9 = v3;
    v34 = v9;
    v4 = v8;
    v35 = v4;
    -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v33);
    if (objc_msgSend(v4, "count"))
    {
      +[AMSBiometrics identityMap](AMSBiometrics, "identityMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "count");
      if (v11 == objc_msgSend(v10, "count"))
      {
        v25 = v5;
        v26 = v3;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = v4;
        v12 = v4;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "uuid", v24, v25, v26);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __35__AMSBiometrics_isIdentityMapValid__block_invoke_52;
              v27[3] = &unk_1E253F5E0;
              v28 = v18;
              v19 = v18;
              if (objc_msgSend(v10, "indexOfObjectPassingTest:", v27) != 0x7FFFFFFFFFFFFFFFLL)
                ++v15;

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v14);
        }
        else
        {
          v15 = 0;
        }

        v7 = v15 == objc_msgSend(v10, "count");
        v5 = v25;
        v3 = v26;
        v4 = v24;
        goto LABEL_27;
      }
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
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v38 = v21;
        v39 = 2114;
        v40 = v9;
        v22 = v21;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping identity map check for no cached identities", buf, 0x16u);

      }
    }
    v7 = 0;
LABEL_27:

    goto LABEL_28;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = (id)objc_opt_class();
    v39 = 2114;
    v40 = v3;
    v6 = v38;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping identity map check for audio accessory", buf, 0x16u);

  }
  v7 = 0;
LABEL_28:

  return v7;
}

void __35__AMSBiometrics_isIdentityMapValid__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getBiometricKitIdentityClass(), v4, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
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
        v9 = (void *)objc_opt_class();
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        v17 = 2114;
        v18 = v6;
        v11 = v9;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize biometric identity with error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      getBiometricKitIdentityClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }

  }
}

uint64_t __35__AMSBiometrics_isIdentityMapValid__block_invoke_52(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (int64_t)type
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = MGCopyAnswerWithError();
  v3 = (const void *)v2;
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v2 != *MEMORY[0x1E0C9AE50])
  {
    v5 = (const void *)MGCopyAnswerWithError();
    if (v5 == v4)
      v6 = 2;
    else
      v6 = 1;
    if (v5)
    {
      CFRelease(v5);
      if (!v3)
        goto LABEL_15;
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
        v9 = objc_opt_class();
        AMSLogKey();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v9;
        v18 = 2114;
        v19 = v10;
        v20 = 1026;
        v21 = 0;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain touch identifier capability: %{public}d", buf, 0x1Cu);

      }
      if (!v3)
        goto LABEL_15;
    }
LABEL_9:
    CFRelease(v3);
    return v6;
  }
  v6 = 3;
  if (v2)
    goto LABEL_9;
LABEL_15:
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
    *(_DWORD *)buf = 138543874;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    v20 = 1026;
    v21 = 0;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain pearl identifier capability: %{public}d", buf, 0x1Cu);

  }
  return v6;
}

+ (void)setDeviceState:(int64_t)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _QWORD v31[3];
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  AMSSetLogKey(0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults setDeviceBiometricsState:](AMSDefaults, "setDeviceBiometricsState:", a3);
  if (a3 == 2)
  {
    v30 = 0;
    objc_msgSend(a1, "deleteKeysWithError:", &v30);
    v4 = v30;
    if (v4)
    {
      +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
        *(_DWORD *)buf = 138543874;
        v34 = v7;
        v35 = 2114;
        v36 = v23;
        v37 = 2114;
        v38 = v4;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting biometrics keys: %{public}@", buf, 0x20u);
      }

    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v31[0] = AMSAccountMediaTypeAppStore;
  v31[1] = AMSAccountMediaTypeBooks;
  v31[2] = AMSAccountMediaTypeiTunes;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v27;
    *(_QWORD *)&v11 = 138543874;
    v22 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14), v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_activeiTunesAccount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && (objc_msgSend(v8, "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v16);
          objc_msgSend(a1, "setState:forAccount:", 0, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          objc_msgSend(v17, "resultWithError:", &v25);
          v18 = v25;

          if (v18)
          {
            +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "OSLogObject");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = objc_opt_class();
              *(_DWORD *)buf = v22;
              v34 = v21;
              v35 = 2114;
              v36 = v23;
              v37 = 2114;
              v38 = v18;
              _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error unsetting biometrics state: %{public}@", buf, 0x20u);
            }

          }
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v12);
  }

}

+ (id)ACLVersionForAccessControl:(__SecAccessControl *)a3
{
  void *v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    CFRetain(a3);
    SecAccessControlGetConstraints();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ACLVersionForConstraints:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(a3);

    return v6;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSSetLogKeyIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL version evaluation failed for no ACL", (uint8_t *)&v13, 0x16u);

    }
    return 0;
  }
}

+ (id)ACLVersionForAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "ACLVersionForAccessControl:", +[AMSKeychain copyAccessControlRefWithAccount:options:error:](AMSKeychain, "copyAccessControlRefWithAccount:options:error:", a3, a4, a5));
}

+ (id)ACLVersionForConstraints:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 7, v4))
  {
    v5 = a1;
    v6 = 7;
LABEL_13:
    objc_msgSend(v5, "minimumACLVersionForAction:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 6, v4))
  {
    v5 = a1;
    v6 = 6;
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 5, v4))
  {
    v5 = a1;
    v6 = 5;
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 3, v4))
  {
    v5 = a1;
    v6 = 3;
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 1, v4))
  {
    v5 = a1;
    v6 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(a1, "isActionSupported:withConstraints:", 0, v4))
  {
    v5 = a1;
    v6 = 0;
    goto LABEL_13;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    AMSSetLogKeyIfNeeded();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine version for ACL", (uint8_t *)&v14, 0x16u);

  }
  v7 = 0;
LABEL_14:

  return v7;
}

+ (id)disableForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  +[AMSBiometrics deleteKeysWithError:](AMSBiometrics, "deleteKeysWithError:", &v12);
  v5 = v12;
  if (v5)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
      v8 = objc_opt_class();
      AMSSetLogKey(0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error disabling biometrics keys: %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(a1, "setState:forAccount:", 2, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)deleteKeysWithError:(id *)a3
{
  if (AMSIsEntitledForDirectKeychainAccess())
    return +[AMSBiometrics deleteAllKeysWithError:](AMSBiometrics, "deleteAllKeysWithError:", a3);
  else
    return +[AMSBiometrics proxyDeleteAllKeysWithError:](AMSBiometrics, "proxyDeleteAllKeysWithError:", a3);
}

+ (BOOL)deleteAllKeysWithError:(id *)a3
{
  void *v5;
  AMSKeychainOptions *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  AMSKeychainOptions *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  AMSSetLogKey(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setPurpose:](v6, "setPurpose:", 0);
  -[AMSKeychainOptions setStyle:](v6, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  v19 = 0;
  objc_msgSend(a1, "_deleteKeysWithOptions:error:", v6, &v19);
  v7 = v19;
  v8 = v7 == 0;
  if (v7)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting primary keys: %{public}@", buf, 0x20u);
    }

  }
  v12 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setPurpose:](v12, "setPurpose:", 1);
  -[AMSKeychainOptions setStyle:](v12, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  v18 = v7;
  objc_msgSend(a1, "_deleteKeysWithOptions:error:", v12, &v18);
  v13 = v18;

  if (v13)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting extended keys: %{public}@", buf, 0x20u);
    }

    v8 = 0;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v8;
}

id __49__AMSBiometrics_handleResponse_session_taskInfo___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v28;
  const __CFString *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSSetLogKey(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Successfully signed extended action.", buf, 0x16u);

    }
    +[AMSURLAction retryAction](AMSURLAction, "retryAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReason:", CFSTR("extended biometrics"));
    objc_msgSend(v12, "setRetryIdentifier:", 0x1E2564240);
    objc_msgSend(v5, "publicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 32);
    v36[0] = CFSTR("X-Apple-TID-Challenge");
    v36[1] = CFSTR("X-Apple-TID-Pkey");
    v37[0] = v15;
    v37[1] = v14;
    v36[2] = CFSTR("X-Apple-TID-Signature");
    objc_msgSend(v5, "signature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = CFSTR("X-Apple-TID-SignatureVersion");
    v37[2] = v16;
    v37[3] = CFSTR("1");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUpdatedHeaders:", v17);

  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      AMSSetLogKey(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v19;
      v32 = 2114;
      v33 = v20;
      v34 = 2114;
      v35 = v6;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Biometrics signature failed. Error: %{public}@", buf, 0x20u);

    }
    if (objc_msgSend(v6, "code") == 6)
    {
      +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        AMSSetLogKey(0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v24;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Falling back to password.", buf, 0x16u);

      }
      +[AMSURLAction retryAction](AMSURLAction, "retryAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setReason:", CFSTR("extended biometric fallback"));
      objc_msgSend(v12, "setRetryIdentifier:", 0x1E2564240);
      v28 = CFSTR("X-Apple-TID-Action");
      v29 = CFSTR("FB");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUpdatedHeaders:", v25);

    }
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)headersWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __SecKey *v12;
  __SecKey *v13;
  CFDataRef v14;
  CFErrorRef v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CFErrorRef v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v10 || !objc_msgSend(v9, "purpose") || objc_msgSend(v9, "purpose") == 1)
  {
    if (AMSIsEntitledForDirectKeychainAccess())
    {
      v24 = 0;
      v12 = +[AMSKeychain copyPublicKeyForAccount:options:error:](AMSKeychain, "copyPublicKeyForAccount:options:error:", v8, v9, &v24);
      if (v12)
      {
        v13 = v12;
        v23 = 0;
        v14 = SecKeyCopyExternalRepresentation(v12, &v23);
        CFRelease(v13);
        v15 = v23;
        -[__CFData base64EncodedStringWithOptions:](v14, "base64EncodedStringWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("X-Apple-TID-Pkey"));

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      +[AMSKeychain publicKeyHeaderWithAccount:options:signatureResult:](AMSKeychain, "publicKeyHeaderWithAccount:options:signatureResult:", v8, v9, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v11, "addEntriesFromDictionary:", v17);

    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("X-Apple-TID-SignatureVersion"));
  }
  objc_msgSend(a1, "_stateHeaderValueForAccount:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("X-Apple-TID-State"));
  objc_msgSend(v10, "originalRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "challenge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("X-Apple-TID-Challenge"));
  if (v10)
  {
    objc_msgSend(v10, "signature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("X-Apple-TID-Signature"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("X-Apple-TID-SignatureVersion"));
    }

  }
  return v11;
}

+ (BOOL)isActionSupported:(int64_t)a3 withAccessControl:(__SecAccessControl *)a4
{
  int64_t v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = a3;
    CFRetain(a4);
    SecAccessControlGetConstraints();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(a1, "isActionSupported:withConstraints:", v6, v7);
    CFRelease(a4);

    return v6;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] LocalAuth action evaluation failed for no ACL", (uint8_t *)&v14, 0x16u);

    }
    return 0;
  }
}

+ (BOOL)isActionSupported:(int64_t)a3 withConstraints:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  _BOOL4 v79;
  void *v80;
  NSObject *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  int v88;
  int v89;
  _BOOL4 v90;
  NSObject *v91;
  int v92;
  _BOOL4 v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  BOOL v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  char isKindOfClass;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  BOOL v111;
  BOOL v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  BOOL v120;
  BOOL v121;
  _BOOL4 v122;
  void *v123;
  BOOL v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  char v134;
  int v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  char v140;
  int v141;
  char v142;
  BOOL v143;
  void *v145;
  void *v146;
  char v147;
  int v148;
  id v149;
  int v150;
  id v151;
  void *v152;
  id v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  NSObject *v158;
  uint8_t buf[4];
  void *v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  void *v166;
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v9 = (void *)objc_opt_class();
    v10 = v9;
    AMSSetLogKeyIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v160 = v9;
    v161 = 2114;
    v162 = v11;
    v163 = 2114;
    v164 = v12;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluating ACL constraints for LocalAuth action: %{public}@", buf, 0x20u);

  }
  switch(a3)
  {
    case 0:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("oa"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odel"));
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("cbio"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("cbio"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v33 = -[NSObject BOOLValue](v14, "BOOLValue") ^ 1;
      else
        v33 = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v89 = -[NSObject BOOLValue](v30, "BOOLValue") ^ 1;
      else
        v89 = 1;
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "objectForKey:", CFSTR("pbiot"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v98, "integerValue") == 1;

      }
      else
      {
        v99 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "objectForKey:", CFSTR("pbiot"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v123, "integerValue") == 1;

      }
      else
      {
        v124 = 0;
      }
      if (((v33 | v89) & 1) != 0)
        goto LABEL_172;
      LOBYTE(v47) = v99 && v124;
      goto LABEL_173;
    case 1:
      if (!objc_msgSend(a1, "isActionSupported:withConstraints:", 0, v6))
        goto LABEL_20;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ckon"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v36 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ckon"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("cbio"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("pbiot"));
      v40 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ckon"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v14 = v36;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ckon"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("cbio"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("pbiot"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v46 = -[NSObject BOOLValue](v36, "BOOLValue") ^ 1;
      else
        v46 = 1;
      v30 = v40;
      v122 = (objc_opt_respondsToSelector() & 1) == 0 || -[NSObject integerValue](v40, "integerValue") != 2;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v142 = objc_msgSend(v18, "BOOLValue");
      else
        v142 = 0;
      v143 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v20, "integerValue") == 2;
      if (((v46 | v122) & 1) != 0)
LABEL_172:
        LOBYTE(v47) = 0;
      else
        LOBYTE(v47) = v142 & v143;
      goto LABEL_173;
    case 2:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("ckon"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ckon"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (objc_opt_respondsToSelector() & 1) == 0 || -[NSObject integerValue](v14, "integerValue") != 1;
      v90 = (objc_opt_respondsToSelector() & 1) == 0 || -[NSObject integerValue](v30, "integerValue") != 1;
      v100 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "integerValue") == 1;
      v120 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v20, "integerValue") == 1;
      if (v54 || v90)
        goto LABEL_172;
      LOBYTE(v47) = v100 && v120;
      goto LABEL_173;
    case 3:
    case 4:
      if (!objc_msgSend(a1, "isActionSupported:withConstraints:", 1, v6))
      {
LABEL_20:
        LOBYTE(v47) = 0;
        goto LABEL_177;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ckon"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v156 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pmoc"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ckon"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (objc_opt_respondsToSelector() & 1) == 0 || -[NSObject integerValue](v14, "integerValue") != 2;
      v87 = (objc_opt_respondsToSelector() & 1) == 0 || -[NSObject integerValue](v156, "integerValue") != 2;
      v93 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v18, "integerValue") != 1;
      v111 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v20, "integerValue") == 2;
      v121 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v23, "integerValue") == 2;
      LOBYTE(v47) = !v24 && !v87 && !v93 && v111 && v121;
      v30 = v156;

LABEL_173:
      goto LABEL_174;
    case 5:
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v55 = (void *)objc_opt_class();
        v56 = v55;
        AMSSetLogKeyIfNeeded();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v160 = v55;
        v161 = 2114;
        v162 = v57;
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PSD2 Passcode ACL not supported on platform", buf, 0x16u);

      }
      goto LABEL_81;
    case 6:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("oa"));
      v58 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v59 = -[NSObject BOOLValue](v58, "BOOLValue") ^ 1;
      else
        v59 = 1;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odel"));
      v91 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v92 = -[NSObject BOOLValue](v91, "BOOLValue") ^ 1;
      else
        v92 = 1;
      v148 = v92;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v102, "BOOLValue");
      v152 = v102;
      v155 = v58;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("cup"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v106 = v6;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("cup"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("poffwrist"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          v110 = objc_msgSend(v109, "BOOLValue");
        else
          v110 = 0;

      }
      else
      {
        v106 = v6;
        v110 = 0;
      }
      objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("osgn"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      v158 = v91;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v127 = objc_msgSend(v126, "BOOLValue") ^ 1;
      else
        v127 = 1;
      v150 = v127;
      objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("osgn"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("pmuc"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v130 = objc_msgSend(v129, "BOOLValue") ^ 1;
      else
        v130 = 1;
      v131 = v106;
      objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("osgn"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("cup"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v134 = objc_opt_isKindOfClass();

      if ((v134 & 1) != 0)
      {
        v147 = v110;
        v135 = v59;
        v136 = v131;
        objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("osgn"));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("cup"));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("poffwrist"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
          v140 = objc_msgSend(v139, "BOOLValue");
        else
          v140 = 0;
        v14 = v155;
        v141 = v148;

        v6 = v136;
        v59 = v135;
        v110 = v147;
      }
      else
      {
        v140 = 0;
        v6 = v131;
        v14 = v155;
        v141 = v148;
      }
      if (((v59 | v141 | v150 | v130) & 1) != 0)
        LOBYTE(v47) = 0;
      else
        LOBYTE(v47) = v110 & v140;

      v30 = v158;
      goto LABEL_175;
    case 7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
      v30 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_81;
      }
      v14 = v30;

      if (!v14)
        goto LABEL_132;
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v30 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_81;
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("cbtn"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "BOOLValue");

      if (!v61)
      {
LABEL_132:
        LOBYTE(v47) = 0;
        goto LABEL_176;
      }
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("cbio"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v62;

        if (!v30)
          goto LABEL_81;
        -[NSObject objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("pbiot"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_180;
        -[NSObject objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("pbiot"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "integerValue");

        if (v64 != 3)
          goto LABEL_81;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
        v65 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v65;

          if (!v18)
            goto LABEL_180;
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("cbtn"));
          v65 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("cbtn"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "BOOLValue");

            if (v67)
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("cbio"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v65 = v68;
              else
                v65 = 0;

              objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("pbiot"));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("pbiot"));
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v47) = objc_msgSend(v146, "integerValue") == 3;

              }
              else
              {
                LOBYTE(v47) = 0;
              }

              goto LABEL_183;
            }
LABEL_180:
            LOBYTE(v47) = 0;
LABEL_174:

            goto LABEL_175;
          }
        }
        else
        {
          v18 = 0;
        }
        LOBYTE(v47) = 0;
LABEL_183:

        goto LABEL_174;
      }

      v30 = 0;
      goto LABEL_81;
    default:
      if ((unint64_t)(a3 - 101) < 2)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("oa"));
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odel"));
        v26 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = -[NSObject BOOLValue](v25, "BOOLValue") ^ 1;
        else
          v27 = 1;
        v154 = v25;
        v157 = v26;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v69 = -[NSObject BOOLValue](v26, "BOOLValue") ^ 1;
        else
          v69 = 1;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("pmuc"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("pmuc"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v75, "integerValue") == 1;
        v79 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v77, "integerValue") == 1;
        if (((v27 | v69) & 1) != 0)
          v47 = 0;
        else
          v47 = v78 & v79;
        v151 = v6;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v80)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v80, "OSLogObject");
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = (void *)objc_opt_class();
          v83 = v82;
          AMSSetLogKeyIfNeeded();
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v160 = v82;
          v161 = 2114;
          v162 = v84;
          v163 = 2114;
          v164 = v85;
          v165 = 2114;
          v166 = v86;
          _os_log_impl(&dword_18C849000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluated extended action %{public}@ with result: %{public}@", buf, 0x2Au);

        }
        v6 = v151;
LABEL_115:
        v14 = v154;
        v30 = v157;
        goto LABEL_175;
      }
      if (a3 == 100)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("oa"));
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odel"));
        v157 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v29 = -[NSObject BOOLValue](v28, "BOOLValue") ^ 1;
        else
          v29 = 1;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v88 = -[NSObject BOOLValue](v157, "BOOLValue") ^ 1;
        else
          v88 = 1;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ock"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("cbio"));
        v95 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osgn"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("cbio"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (((v29 | v88) & 1) != 0)
        {
          v47 = 0;
        }
        else
        {
          if (v95)
            v112 = v97 == 0;
          else
            v112 = 1;
          v47 = !v112;
        }
        v113 = (void *)v95;
        v154 = v28;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v114)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v114, "OSLogObject");
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          v116 = (void *)objc_opt_class();
          v149 = v116;
          AMSSetLogKeyIfNeeded();
          v153 = v6;
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v160 = v116;
          v161 = 2114;
          v162 = v117;
          v163 = 2114;
          v164 = v118;
          v165 = 2114;
          v166 = v119;
          _os_log_impl(&dword_18C849000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluated extended action %{public}@ with result: %{public}@", buf, 0x2Au);

          v6 = v153;
        }

        goto LABEL_115;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v14, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v70 = (void *)objc_opt_class();
        v71 = v70;
        AMSSetLogKeyIfNeeded();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v160 = v70;
        v161 = 2114;
        v162 = v72;
        v163 = 2114;
        v164 = v73;
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] LocalAuth action evaluation failed for unrecognized action type: %{public}@", buf, 0x20u);

      }
LABEL_81:
      LOBYTE(v47) = 0;
LABEL_175:

LABEL_176:
LABEL_177:

      return v47;
  }
}

+ (BOOL)isAvailableForAccount:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  if (+[AMSBiometrics stateForAccount:](AMSBiometrics, "stateForAccount:", a3) != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPasscodeSet"))
  {
    +[AMSBiometrics identityMap](AMSBiometrics, "identityMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)minimumACLVersionForAction:(int64_t)a3
{
  id result;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = CFSTR("1");
  if (a3 > 99)
  {
    if (a3 != 100)
    {
      if (a3 == 101)
      {
        return CFSTR("2");
      }
      else if (a3 == 102)
      {
        return CFSTR("3");
      }
      else
      {
LABEL_16:
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)objc_opt_class();
          v12 = v11;
          AMSSetLogKeyIfNeeded();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543874;
          v16 = v11;
          v17 = 2114;
          v18 = v13;
          v19 = 2114;
          v20 = v14;
          _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine ACL version for LocalAuth action type: %{public}@", (uint8_t *)&v15, 0x20u);

        }
LABEL_21:

        return 0;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return result;
      case 1:
      case 2:
        result = CFSTR("1.5");
        break;
      case 3:
      case 4:
        return CFSTR("3");
      case 5:
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          v7 = (void *)objc_opt_class();
          v8 = v7;
          AMSSetLogKeyIfNeeded();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = v7;
          v17 = 2114;
          v18 = v9;
          _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Passcode ACLs not supported on platform", (uint8_t *)&v15, 0x16u);

        }
        goto LABEL_21;
      case 6:
        result = CFSTR("4");
        break;
      case 7:
        result = CFSTR("1.7");
        break;
      default:
        goto LABEL_16;
    }
  }
  return result;
}

+ (id)resumptionHeadersFromRequest:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v32[7];
  _QWORD v33[8];

  v33[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allHTTPHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v32[0] = CFSTR("X-Apple-TID-Pkey");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E2548760;
  v33[0] = v7;
  v32[1] = CFSTR("X-Apple-TID-Challenge");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E2548760;
  v33[1] = v10;
  v32[2] = CFSTR("X-Apple-TID-Signature");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E2548760;
  v33[2] = v13;
  v32[3] = CFSTR("X-Apple-TID-State");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E2548760;
  v33[3] = v16;
  v32[4] = CFSTR("X-Apple-TID-SignatureVersion");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E2548760;
  v33[4] = v19;
  v32[5] = CFSTR("X-Apple-AMD");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_1E2548760;
  v33[5] = v22;
  v32[6] = CFSTR("X-Apple-AMD-M");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = &stru_1E2548760;
  v33[6] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v4, "initWithDictionary:", v26);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("X-Apple-TID-Pkey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("X-Apple-TID-Signature"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      v30 = CFSTR("PK");
    else
      v30 = CFSTR("FB");
    objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("X-Apple-TID-Action"));
  }

  return v27;
}

+ (void)saveIdentityMap
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[AMSBiometrics identityMap](AMSBiometrics, "identityMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[AMSBiometrics identityMap](AMSBiometrics, "identityMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v28;
      v10 = 0x1E0CB3000uLL;
      *(_QWORD *)&v7 = 138543874;
      v23 = v7;
      v24 = v5;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11);
          v13 = *(void **)(v10 + 1784);
          v26 = 0;
          objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v26, v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v26;
          if (v14)
          {
            objc_msgSend(v4, "addObject:", v14);
          }
          else
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "OSLogObject");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = v8;
              v19 = v9;
              v20 = v4;
              v21 = (void *)objc_opt_class();
              v25 = v21;
              AMSSetLogKeyIfNeeded();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v32 = v21;
              v4 = v20;
              v9 = v19;
              v8 = v18;
              v33 = 2114;
              v34 = v22;
              v35 = 2114;
              v36 = v15;
              _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive identity. Error = %{public}@", buf, 0x20u);

              v5 = v24;
              v10 = 0x1E0CB3000;

            }
          }

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v8);
    }

  }
  else
  {
    v4 = 0;
  }
  +[AMSDefaults setDeviceBiometricIdentities:](AMSDefaults, "setDeviceBiometricIdentities:", v4);

}

+ (id)setState:(int64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "ams_setBiometricsState:", a3);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_saveAccount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)signChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "signAndReturnChallenge:withAccount:clientInfo:options:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thenWithBlock:", &__block_literal_global_20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __62__AMSBiometrics_signChallenge_withAccount_clientInfo_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "signature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)signAndReturnChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  AMSBiometricsSignatureRequest *v13;
  id v14;
  AMSBiometricsSignatureTask *v15;
  void *v16;
  id v18;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v18 = 0;
  v13 = -[AMSBiometricsSignatureRequest initWithAccount:clientInfo:challenge:localAuthContext:options:error:]([AMSBiometricsSignatureRequest alloc], "initWithAccount:clientInfo:challenge:localAuthContext:options:error:", v11, v10, v12, 0, v9, &v18);

  v14 = v18;
  if (v13)
  {
    v15 = -[AMSBiometricsSignatureTask initWithRequest:]([AMSBiometricsSignatureTask alloc], "initWithRequest:", v13);
    -[AMSBiometricsSignatureTask performSignature](v15, "performSignature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (int64_t)stateForAccount:(id)a3
{
  return +[AMSDefaults deviceBiometricsState](AMSDefaults, "deviceBiometricsState", a3);
}

+ (BOOL)_deleteKeysWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  id *v7;
  BOOL v8;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "style");
  if (v6 > 5)
  {
    v10 = 0;
    v9 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (((1 << v6) & 0x39) != 0)
  {
    v17 = 0;
    v7 = (id *)&v17;
    v8 = +[AMSKeychain deleteCertificateChainWithOptions:error:](AMSKeychain, "deleteCertificateChainWithOptions:error:", v5, &v17);
  }
  else
  {
    v16 = 0;
    v7 = (id *)&v16;
    v8 = +[AMSKeychain deleteKeyPairWithOptions:error:](AMSKeychain, "deleteKeyPairWithOptions:error:", v5, &v16);
  }
  v9 = v8;
  v10 = *v7;
  if (v10)
  {
    +[AMSLogConfig sharedAttestationConfig](AMSLogConfig, "sharedAttestationConfig");
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
      AMSSetLogKey(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting keys: %{public}@", buf, 0x20u);

    }
  }
  if (a4)
LABEL_12:
    *a4 = objc_retainAutorelease(v10);
LABEL_13:

  return v9;
}

+ (id)_stateHeaderValueForAccount:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  const __CFString *v7;

  v4 = a3;
  if (!objc_msgSend(a1, "_shouldAddBiometricHeader"))
    goto LABEL_9;
  v5 = +[AMSBiometrics stateForAccount:](AMSBiometrics, "stateForAccount:", v4);
  v6 = objc_msgSend(a1, "type");
  v7 = 0;
  if (v6 <= 7 && ((1 << v6) & 0x9C) != 0)
  {
    if (!v5)
    {
      v7 = CFSTR("U");
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      v7 = CFSTR("D");
      goto LABEL_10;
    }
    if (v5 == 1 && v6 - 2 < 6)
    {
      v7 = off_1E253F700[v6 - 2];
      goto LABEL_10;
    }
LABEL_9:
    v7 = 0;
  }
LABEL_10:

  return (id)v7;
}

+ (BOOL)_shouldAddBiometricHeader
{
  void *v2;
  void *v3;
  char v4;

  +[AMSBiometrics identityMap](AMSBiometrics, "identityMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPasscodeSet");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  AMSDaemonConnection *v28;

  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  v28 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v24[5], "securityServiceProxyWithDelegate:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke;
  v18[3] = &unk_1E253F6A0;
  v22 = a3;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = &v23;
  objc_msgSend(v10, "thenWithBlock:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v13, "resultWithError:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;
  LOBYTE(v8) = objc_msgSend(v14, "BOOLValue");

  _Block_object_dispose(&v23, 8);
  return (char)v8;
}

AMSMutablePromise *__64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AMSMutablePromise *v8;
  uint64_t v9;
  _QWORD v11[4];
  AMSMutablePromise *v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  v5 = a1[7];
  v6 = a1[4];
  v7 = a1[5];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke_2;
  v11[3] = &unk_1E253F678;
  v8 = v4;
  v9 = a1[6];
  v12 = v8;
  v13 = v9;
  objc_msgSend(v3, "isActionSupportedForType:account:options:completion:", v5, v6, v7, v11);

  return v8;
}

void __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
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

+ (BOOL)proxyDeleteAllKeysWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AMSDaemonConnection *v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = objc_alloc_init(AMSDaemonConnection);
  objc_msgSend((id)v12[5], "securityServiceProxyWithDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke;
  v10[3] = &unk_1E253F6C8;
  v10[4] = &v11;
  objc_msgSend(v3, "thenWithBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "resultWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = objc_msgSend(v5, "BOOLValue");

  _Block_object_dispose(&v11, 8);
  return v7;
}

AMSMutablePromise *__45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke_2;
  v8[3] = &unk_1E253F678;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "deleteAllKeysWithCompletion:", v8);

  return v5;
}

void __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
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
