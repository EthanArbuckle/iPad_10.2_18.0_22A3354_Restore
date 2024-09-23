@implementation AMSDeviceAccountPrivacyAcknowledgementTask

- (AMSDeviceAccountPrivacyAcknowledgementTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSDeviceAccountPrivacyAcknowledgementTask *v9;
  AMSDeviceAccountPrivacyAcknowledgementTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDeviceAccountPrivacyAcknowledgementTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performPrivacyAcknowledgement
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__AMSDeviceAccountPrivacyAcknowledgementTask_performPrivacyAcknowledgement__block_invoke;
  v3[3] = &unk_1E253DF08;
  v3[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __75__AMSDeviceAccountPrivacyAcknowledgementTask_performPrivacyAcknowledgement__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_verifyGDPRStatusForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resultWithError:", a2);

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
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 1024;
    v17 = v6;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task complete. Result: %d", (uint8_t *)&v12, 0x1Cu);

  }
  return v6;
}

- (id)_verifyGDPRStatusForAccount:(id)a3
{
  id v4;
  AMSBinaryPromise *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AMSBinaryPromise *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  AMSBinaryPromise *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  AMSBinaryPromise *v29;
  AMSDeviceAccountPrivacyAcknowledgementTask *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AMSBinaryPromise);
  objc_msgSend(v4, "ams_isBundleOwner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    if ((v8 & 1) != 0)
      +[AMSAcknowledgePrivacyTask _appleBundleOwnerPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleBundleOwnerPrivacyIdentifier");
    else
      +[AMSAcknowledgePrivacyTask _appleBundleHolderPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleBundleHolderPrivacyIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:account:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:account:", v15, v4);
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        AMSLogKey();
        v31 = self;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hashedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v20;
        v37 = 2114;
        v38 = v21;
        v39 = 2114;
        v40 = v15;
        v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requesting gdpr presentation for id: %{public}@ for %{public}@", buf, 0x2Au);

        self = v31;
      }

      -[AMSDeviceAccountPrivacyAcknowledgementTask _presentGDPREngagementRequestForAccount:bundleOwnerStatus:](self, "_presentGDPREngagementRequestForAccount:bundleOwnerStatus:", v4, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __74__AMSDeviceAccountPrivacyAcknowledgementTask__verifyGDPRStatusForAccount___block_invoke;
      v32[3] = &unk_1E2540E68;
      v32[4] = self;
      v33 = v4;
      v34 = v15;
      objc_msgSend(v23, "continueWithBlock:", v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBinaryPromise finishWithPromise:](v5, "finishWithPromise:", v24);
      v25 = v5;

    }
    else
    {
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_opt_class();
        AMSLogKey();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v27;
        v37 = 2114;
        v38 = v28;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping subscription bundle acknowledgement - already acknowledged", buf, 0x16u);

      }
      -[AMSBinaryPromise finishWithSuccess](v5, "finishWithSuccess");
      v29 = v5;
    }

  }
  else
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v11;
      v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine bundle owner status", buf, 0x16u);

    }
    AMSError(7, CFSTR("Missing bundle owner status"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBinaryPromise finishWithError:](v5, "finishWithError:", v13);

    v14 = v5;
  }

  return v5;
}

id __74__AMSDeviceAccountPrivacyAcknowledgementTask__verifyGDPRStatusForAccount___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
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
      AMSLogableError(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v9;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Presentation error %{public}@", (uint8_t *)&v28, 0x20u);

    }
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = (void *)v12;
    goto LABEL_24;
  }
  if ((a2 & 1) != 0)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presentation succeeded. Verifying that privacy criteria is met.", (uint8_t *)&v28, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "reload");
    v17 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:account:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:account:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v20;
      v30 = 2114;
      v31 = v21;
      v32 = 1024;
      LODWORD(v33) = !v17;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did acknowledge: %d", (uint8_t *)&v28, 0x1Cu);

    }
    if (v17)
    {
      AMSError(0, CFSTR("Presentation ended without privacy being acknowledgement"), 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_24;
    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = objc_opt_class();
    AMSLogKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v24;
    v30 = 2114;
    v31 = v25;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Presentation errored silently.", (uint8_t *)&v28, 0x16u);

  }
  AMSError(0, CFSTR("Presentation returned false with no error"), 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v13;
}

- (id)_presentGDPREngagementRequestForAccount:(id)a3 bundleOwnerStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSEngagementRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[AMSDeviceAccountPrivacyAcknowledgementTask bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", CFSTR("dynamic-ui-bundle-gdpr-url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "valueWithError:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (AMSEngagementRequest *)v18;

  if (!v10 || v11)
  {
    if (!v11)
    {
      AMSError(7, CFSTR("Missing dynamic ui gdpr route"), 0, 0);
      v11 = (AMSEngagementRequest *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "finishWithError:", v11);
    v15 = v7;
  }
  else
  {
    v11 = objc_alloc_init(AMSEngagementRequest);
    -[AMSEngagementRequest setSuppressInteractiveModalDismissal:](v11, "setSuppressInteractiveModalDismissal:", 1);
    -[AMSEngagementRequest setAccount:](v11, "setAccount:", v6);
    objc_msgSend(v10, "absoluteURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementRequest setURL:](v11, "setURL:", v12);

    v19[0] = CFSTR("bundleOwner");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("context");
    v20[0] = v13;
    v20[1] = CFSTR("auth-plugin");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementRequest setClientData:](v11, "setClientData:", v14);

    -[AMSDeviceAccountPrivacyAcknowledgementTask _presentEngagementRequest:](self, "_presentEngagementRequest:", v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (id)_presentEngagementRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AMSSystemEngagementTask *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting engagement to get GDPR consent", buf, 0x16u);

  }
  v9 = (void *)objc_opt_new();
  v10 = -[AMSSystemEngagementTask initWithRequest:]([AMSSystemEngagementTask alloc], "initWithRequest:", v4);

  -[AMSSystemEngagementTask present](v10, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__AMSDeviceAccountPrivacyAcknowledgementTask__presentEngagementRequest___block_invoke;
  v16[3] = &unk_1E253FED0;
  v16[4] = self;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v11, "addFinishBlock:", v16);

  v13 = v17;
  v14 = v12;

  return v14;
}

void __72__AMSDeviceAccountPrivacyAcknowledgementTask__presentEngagementRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
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
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task failed %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
  }

}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile](AMSURLRequestEncoder, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion](AMSURLRequestEncoder, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile](AMSURLRequestEncoder, "createBagForSubProfile");
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
