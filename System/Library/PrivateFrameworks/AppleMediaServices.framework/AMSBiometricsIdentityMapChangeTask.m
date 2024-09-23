@implementation AMSBiometricsIdentityMapChangeTask

- (AMSBiometricsIdentityMapChangeTask)initWithAccount:(id)a3 session:(id)a4 task:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSBiometricsIdentityMapChangeTask *v12;
  AMSBiometricsIdentityMapChangeTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSBiometricsIdentityMapChangeTask;
  v12 = -[AMSTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_session, a4);
    objc_storeStrong((id *)&v13->_task, a5);
  }

  return v13;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke;
  v3[3] = &unk_1E253DF08;
  v3[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  AMSAuthenticateOptions *v20;
  int64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  __CFString *v33;
  AMSAuthenticateRequest *v34;
  void *v35;
  AMSAuthenticateRequest *v36;
  AMSPromise *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  AMSAuthenticateOptions *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBiometricsSecurityService isIdentityMapValid](AMSBiometricsSecurityService, "isIdentityMapValid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v6 = objc_msgSend(v5, "resultWithError:", &v56);
  v7 = v56;

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = a1;
    v13 = a2;
    v14 = v10;
    objc_msgSend(v11, "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v58 = v10;
    v59 = 2112;
    v60 = v4;
    v61 = 2114;
    v62 = v15;
    v63 = 2114;
    v64 = v7;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%@: [%@] Identity map check completed with result: %{public}@, error: %{public}@", buf, 0x2Au);

    a2 = v13;
    a1 = v12;
  }

  if ((v6 & 1) == 0)
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
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v58 = v18;
      v59 = 2114;
      v60 = v4;
      v19 = v18;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase for invalid biometric identity map", buf, 0x16u);

    }
    v20 = objc_alloc_init(AMSAuthenticateOptions);
    -[AMSAuthenticateOptions setAuthenticationType:](v20, "setAuthenticationType:", 2);
    -[AMSAuthenticateOptions setCanMakeAccountActive:](v20, "setCanMakeAccountActive:", 0);
    -[AMSAuthenticateOptions setDebugReason:](v20, "setDebugReason:", CFSTR("identity map"));
    v21 = +[AMSBiometrics type](AMSBiometrics, "type");
    switch(v21)
    {
      case 7:
        objc_msgSend(*(id *)(a1 + 32), "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = CFSTR("PROMPT_REASON_NEW_OPTIC_FORMAT_%@");
          goto LABEL_19;
        }
        v33 = CFSTR("PROMPT_REASON_NEW_OPTIC_ANONYMOUS");
        break;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = CFSTR("PROMPT_REASON_NEW_FACE_FORMAT_%@");
          goto LABEL_19;
        }
        v33 = CFSTR("PROMPT_REASON_NEW_FACE_ANONYMOUS");
        break;
      case 2:
        objc_msgSend(*(id *)(a1 + 32), "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = CFSTR("PROMPT_REASON_NEW_FINGERS_FORMAT_%@");
LABEL_19:
          AMSLocalizedString(v24, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "account");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "username");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSAuthenticateOptions setReason:](v20, "setReason:", v28);

LABEL_30:
LABEL_31:
          v34 = [AMSAuthenticateRequest alloc];
          objc_msgSend(*(id *)(a1 + 32), "account");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[AMSAuthenticateRequest initWithAccount:options:](v34, "initWithAccount:options:", v35, v20);

          -[AMSAuthenticateRequest setLogKey:](v36, "setLogKey:", v4);
          v37 = objc_alloc_init(AMSPromise);
          objc_msgSend(*(id *)(a1 + 32), "session");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_opt_respondsToSelector();

          if ((v40 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "session");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "delegate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "session");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "task");
            v43 = a1;
            v44 = v4;
            v45 = a2;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSPromise completionHandlerAdapter](v37, "completionHandlerAdapter");
            v47 = v20;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "AMSURLSession:task:handleAuthenticateRequest:completion:", v42, v46, v36, v48);

            v20 = v47;
            a2 = v45;
            v4 = v44;
            a1 = v43;

            v49 = 0;
          }
          else
          {
            AMSError(2, CFSTR("Biometric Identity Map Change Failed"), CFSTR("Failed to complete biometric map change, session delegate not observing callback"), 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke_30;
          v54[3] = &unk_1E253D950;
          v54[4] = *(_QWORD *)(a1 + 32);
          v55 = v4;
          -[AMSPromise addErrorBlock:](v37, "addErrorBlock:", v54);
          v53 = v49;
          v50 = -[AMSPromise resultWithError:](v37, "resultWithError:", &v53);
          v7 = v53;

LABEL_35:
          goto LABEL_36;
        }
        v33 = CFSTR("PROMPT_REASON_NEW_FINGERS_ANONYMOUS");
        break;
      default:
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v58 = v31;
          v59 = 2114;
          v60 = v4;
          v32 = v31;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine biometric type", buf, 0x16u);

        }
        AMSError(12, CFSTR("Identity Map Failure"), CFSTR("Failed to determine biometric type"), 0);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if (v7)
          goto LABEL_35;
        goto LABEL_31;
    }
    AMSLocalizedString(v33, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAuthenticateOptions setReason:](v20, "setReason:", v25);
    goto LABEL_30;
  }
LABEL_36:
  if (a2)
    *a2 = objc_retainAutorelease(v7);

  return v7 == 0;
}

void __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v3;
    v8 = v6;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Identity map authentication failed with error: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
