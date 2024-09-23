@implementation AMSURLRequestDecoration

+ (id)addMescalHeaderToRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 logKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = AMSSetLogKey(v12);
  if (objc_msgSend(v10, "ams_requestIsBagLoad"))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSMescal signaturePromiseFromRequest:type:bag:](AMSMescal, "signaturePromiseFromRequest:type:bag:", v10, a4, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __68__AMSURLRequestDecoration_addMescalHeaderToRequest_type_bag_logKey___block_invoke;
    v21 = &unk_1E2546A40;
    v22 = v12;
    v23 = a1;
    objc_msgSend(v15, "continueWithBlock:", &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "ams_addHeadersFromPromise:", v16, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

id __68__AMSURLRequestDecoration_addMescalHeaderToRequest_type_bag_logKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
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
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  v8 = AMSSetLogKey(v6);
  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
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
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      v15 = v14;
      if (v12)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, a1);
      }
      else
      {
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2114;
      v35 = v27;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to add mescal header. Error: %{public}@", buf, 0x16u);
      if (v12)
      {

        v16 = (void *)a1;
      }

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v19 = (void *)v28;
    goto LABEL_20;
  }
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_opt_class();
      v25 = v24;
      if (v22)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, a1);
      }
      else
      {
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v26;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@No Mescal signature was generated. No headers will be created for additon to request.", buf, 0xCu);
      if (v22)
      {

        v26 = (void *)a1;
      }

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("X-Apple-ActionSignature");
  v31 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v19;
}

+ (id)addAbsintheHeadersToRequest:(id)a3 buyParams:(id)a4 bag:(id)a5 shouldUseRemoteSigningIfAvailable:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (+[AMSDefaults enableRemoteSecuritySigning](AMSDefaults, "enableRemoteSecuritySigning"))
    v13 = !v6;
  else
    v13 = 1;
  if (!v13)
  {
    +[AMSSigningSecurityService sharedService](AMSSigningSecurityService, "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "headersForRequest:buyParams:bag:", v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_addHeadersFromPromise:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  if (!objc_msgSend(v10, "ams_requestIsBagLoad"))
  {
    +[AMSAbsinthe headersForRequest:buyParams:bag:](AMSAbsinthe, "headersForRequest:buyParams:bag:", v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_addHeadersFromPromise:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  AMSLogKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__AMSURLRequestDecoration_addAbsintheHeadersToRequest_buyParams_bag_shouldUseRemoteSigningIfAvailable___block_invoke;
  v20[3] = &unk_1E2543D68;
  v21 = v17;
  v22 = a1;
  v18 = v17;
  objc_msgSend(v16, "addErrorBlock:", v20);

  return v16;
}

void __103__AMSURLRequestDecoration_addAbsintheHeadersToRequest_buyParams_bag_shouldUseRemoteSigningIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_opt_class();
    if (v7)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to add security signing headers. error = %{public}@", buf, 0x16u);

  }
}

+ (id)addAnisetteHeadersToRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v10, "ams_isEphemeralAccount");
  if (a5 != 2 && v12 || objc_msgSend(v9, "ams_requestIsBagLoad"))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSAnisette headersForRequest:account:type:bag:](AMSAnisette, "headersForRequest:account:type:bag:", v9, v10, a5, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_addHeadersFromPromise:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)addABPayloadHeaderToRequest:(id)a3 forTreatmentNamespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      if (v8)
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v8);
      else
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v20;
      v40 = 2114;
      v41 = v7;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching treatment areas (namespace: %{public}@)", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSTreatmentStore defaultTreatmentStore](AMSTreatmentStore, "defaultTreatmentStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "areasForNamespaces:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __77__AMSURLRequestDecoration_addABPayloadHeaderToRequest_forTreatmentNamespace___block_invoke;
    v34[3] = &unk_1E2546A88;
    v35 = v7;
    v25 = v8;
    v36 = v25;
    v37 = a1;
    objc_msgSend(v23, "continueWithBlock:", v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v24;
    v31[1] = 3221225472;
    v31[2] = __77__AMSURLRequestDecoration_addABPayloadHeaderToRequest_forTreatmentNamespace___block_invoke_2;
    v31[3] = &unk_1E2543D68;
    v32 = v25;
    v33 = a1;
    v27 = v25;
    objc_msgSend(v26, "addErrorBlock:", v31);
    objc_msgSend(v6, "ams_addHeadersFromPromise:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

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
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      v18 = v17;
      if (v15)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v18, a1);
      }
      else
      {
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: "), v17);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v19;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@No treatname namespace was provided. Skipping header creation.", buf, 0xCu);
      if (v15)
      {

        v19 = a1;
      }

    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

id __77__AMSURLRequestDecoration_addABPayloadHeaderToRequest_forTreatmentNamespace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = *(_QWORD *)(a1 + 40);
      v8 = objc_opt_class();
      if (v7)
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 40));
      else
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching treatments payload", buf, 0xCu);

    }
    +[AMSTreatmentStore defaultTreatmentStore](AMSTreatmentStore, "defaultTreatmentStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "treatmentsPayloadForAreas:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "thenWithBlock:", &__block_literal_global_133);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __77__AMSURLRequestDecoration_addABPayloadHeaderToRequest_forTreatmentNamespace___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    v6 = CFSTR("x-apple-ab");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __77__AMSURLRequestDecoration_addABPayloadHeaderToRequest_forTreatmentNamespace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_opt_class();
    if (v7)
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed adding AB payload header. error = %{public}@", buf, 0x16u);

  }
}

+ (id)addGUIDParameterToRequest:(id)a3 bag:(id)a4 preservingQueryEncoding:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "arrayForKey:", 0x1E254D240);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "valuePromise");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v31;
      objc_msgSend(v9, "arrayForKey:", 0x1E254D280);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valuePromise");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v30 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __81__AMSURLRequestDecoration_addGUIDParameterToRequest_bag_preservingQueryEncoding___block_invoke;
      v33[3] = &unk_1E2546AB0;
      v36 = a1;
      v15 = v9;
      v16 = v8;
      v17 = v8;
      v34 = v17;
      v10 = v10;
      v35 = v10;
      objc_msgSend(v14, "continueWithBlock:", v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v17;
      v8 = v16;
      v9 = v15;
      objc_msgSend(a1, "_addGUIDParameterToRequest:fromPromise:shouldPreserveEncoding:", v19, v18, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = v8;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_opt_class();
      v27 = v26;
      if (v24)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] "), v27, a1);
      }
      else
      {
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: "), v26);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v28;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@Skipping GUID parameter addition as bag was not provided.", buf, 0xCu);
      if (v24)
      {

        v28 = a1;
      }

    }
    AMSError(2, CFSTR("Failed to add GUID parameter"), CFSTR("Bag was not provided"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
  }

  return v20;
}

id __81__AMSURLRequestDecoration_addGUIDParameterToRequest_bag_preservingQueryEncoding___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  AMSOptional *v13;
  uint64_t v14;
  AMSOptional *v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "ams_isBagValueMissingError"))
    {
      +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 48), "_shouldSendGUIDForRequest:patterns:schemes:", *(_QWORD *)(a1 + 32), v10, v11);
    v13 = [AMSOptional alloc];
    v14 = 0;
    if (v12)
      v14 = *(_QWORD *)(a1 + 40);
    v15 = -[AMSOptional initWithValue:](v13, "initWithValue:", v14);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)addStoreFrontHeaderToRequest:(id)a3 forAccount:(id)a4 mediaType:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSMutablePromise *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = objc_alloc_init(AMSMutablePromise);
  -[AMSPromise completionHandlerAdapter](v14, "completionHandlerAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSStorefrontHeaderValueCreation storefrontHeaderValueForAccount:bag:mediaType:allowFailedSuffixFetch:completionHandler:](AMSStorefrontHeaderValueCreation, "storefrontHeaderValueForAccount:bag:mediaType:allowFailedSuffixFetch:completionHandler:", v13, v11, v12, 1, v15);

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke;
  v24[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v24[4] = a1;
  -[AMSPromise addErrorBlock:](v14, "addErrorBlock:", v24);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke_29;
  v21[3] = &unk_1E2546AD8;
  v22 = v10;
  v23 = a1;
  v17 = v10;
  -[AMSMutablePromise thenWithBlock:](v14, "thenWithBlock:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ams_addHeadersFromPromise:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_opt_class();
    v9 = v8;
    if (v6)
    {
      AMSLogKey();
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v9, a1);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: "), v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to create storefront header. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }

  }
}

id __81__AMSURLRequestDecoration_addStoreFrontHeaderToRequest_forAccount_mediaType_bag___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        AMSLogKey();
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, a1);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Request already has storefront header set which will be replaced. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x20u);
      if (v7)
      {

        v11 = (void *)a1;
      }

    }
  }
  v17 = CFSTR("X-Apple-Store-Front");
  v18 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)_shouldSendGUIDForRequest:(id)a3 patterns:(id)a4 schemes:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[AMSDefaults alwaysSendGUID](AMSDefaults, "alwaysSendGUID"))
  {
    LOBYTE(v10) = 1;
  }
  else if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v7, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v9, "containsObject:", v12);

    if ((_DWORD)v10)
    {
      objc_msgSend(v7, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v15 = v8;
      v10 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v16 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v15);
            if (objc_msgSend(v14, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), 1024, (_QWORD)v19) != 0x7FFFFFFFFFFFFFFFLL)
            {
              LOBYTE(v10) = 1;
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (id)_addGUIDParameterToRequest:(id)a3 fromPromise:(id)a4 shouldPreserveEncoding:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke;
  v14[3] = &unk_1E2546B28;
  v16 = v8;
  v17 = a1;
  v15 = v9;
  v18 = a5;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v10, "ams_modifyRequestWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke_2;
  v7[3] = &unk_1E2546B00;
  v10 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 56);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "addFinishBlock:", v7);

}

void __89__AMSURLRequestDecoration__addGUIDParameterToRequest_fromPromise_shouldPreserveEncoding___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v3);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@GUID parameter creation failed. error = %{public}@", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v3;
      }

    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("guid");
    objc_msgSend(v6, "value");
    v9 = objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_URLByAppendingQueryParameters:preservingQueryEncoding:", v16, *(unsigned __int8 *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setURL:", v17);

LABEL_13:
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)addPaymentHardwareStatusToRequest:(id)a3
{
  void *v3;
  void *v4;

  AMSError(5, CFSTR("Payment hardware status header not added"), CFSTR("Platform not supported"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
