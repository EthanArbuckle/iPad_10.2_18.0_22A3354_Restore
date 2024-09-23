@implementation AMSPACTokenTask

- (AMSPACTokenTask)initWithSimLabelID:(id)a3
{
  id v5;
  AMSPACTokenTask *v6;
  AMSPACTokenTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPACTokenTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_simLabelID, a3);

  return v7;
}

- (id)perform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSPACTokenTask simLabelID](self, "simLabelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSPACTokenTask simLabelID](self, "simLabelID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPACTokenTask signingData](self, "signingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPACTokenTask tokenForSimLabelID:withQueue:signingData:](AMSPACTokenTask, "tokenForSimLabelID:withQueue:signingData:", v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(12, CFSTR("Cannot fetch PAC token"), CFSTR("SIM labelID is missing"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)tokenForSimLabelID:(id)a3 withQueue:(id)a4 signingData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34330]), "initWithQueue:", v10);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__AMSPACTokenTask_tokenForSimLabelID_withQueue_signingData___block_invoke;
  v18[3] = &unk_1E2544498;
  v13 = v11;
  v20 = v8;
  v21 = a1;
  v19 = v13;
  v14 = v8;
  objc_msgSend(v12, "generatePhoneAuthenticationSignatureOverData:withCompletion:", v9, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __60__AMSPACTokenTask_tokenForSimLabelID_withQueue_signingData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v11 = a1 + 40;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v11 + 8);
    objc_msgSend(v5, "authenticationCertificateSignatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signatureForSimLabelID:fromSignatures:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithResult:", v13);

  }
  else if (v6)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PAC retrieval failed: %{public}@", (uint8_t *)&v25, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
  }
  else
  {
    AMSError(0, CFSTR("Signing result missing"), CFSTR("No signing result or error provided"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v22;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PAC retrieval failed: %{public}@", (uint8_t *)&v25, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v19);

  }
}

+ (id)signatureMapFromServerSignatures:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "serverVerifiableEncoding", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subscriptionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)signatureForSimLabelID:(id)a3 fromSignatures:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "signatureMapFromServerSignatures:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)simLabelID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)signingData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSigningData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingData, 0);
  objc_storeStrong((id *)&self->_simLabelID, 0);
}

@end
