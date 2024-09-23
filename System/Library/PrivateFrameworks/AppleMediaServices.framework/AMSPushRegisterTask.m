@implementation AMSPushRegisterTask

- (AMSPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSPushRegisterTask *v15;
  AMSPushRegisterTask *v16;
  uint64_t v17;
  NSData *token;
  uint64_t v19;
  NSString *environment;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSPushRegisterTask;
  v15 = -[AMSTask init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    v17 = objc_msgSend(v12, "copy");
    token = v16->_token;
    v16->_token = (NSData *)v17;

    v19 = objc_msgSend(v13, "copy");
    environment = v16->_environment;
    v16->_environment = (NSString *)v19;

    objc_storeStrong((id *)&v16->_bag, a6);
  }

  return v16;
}

- (id)performTask
{
  void *v3;
  void *v4;
  __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  -[AMSPushRegisterTask environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSPushRegisterTask token](self, "token");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v10[1] = 3221225472;
      v10[2] = __34__AMSPushRegisterTask_performTask__block_invoke;
      v10[3] = &unk_1E253DB80;
      v10[4] = self;
      v9.receiver = self;
      v9.super_class = (Class)AMSPushRegisterTask;
      v10[0] = MEMORY[0x1E0C809B0];
      -[AMSTask performTaskWithPromiseBlock:](&v9, sel_performTaskWithPromiseBlock_, v10);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = CFSTR("Missing Token");
  }
  else
  {
    v6 = CFSTR("Missing Environment");
  }
  AMSError(2, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __34__AMSPushRegisterTask_performTask__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AMSURLRequestEncoder *v14;
  void *v15;
  AMSURLRequestEncoder *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  v23[0] = CFSTR("environment");
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = CFSTR("token");
  objc_msgSend(*(id *)(a1 + 32), "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  v23[2] = CFSTR("guid");
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithDictionary:", v6);

  +[AMSDevice deviceName](AMSDevice, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("device-name-data"));

  +[AMSDevice serialNumber](AMSDevice, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("serial-number"));

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForKey:account:", 0x1E254D2C0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [AMSURLRequestEncoder alloc];
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSURLRequestEncoder initWithBag:](v14, "initWithBag:", v15);

  -[AMSURLRequestEncoder setRequestEncoding:](v16, "setRequestEncoding:", 2);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v16, "setAccount:", v17);

  -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v16, "requestWithMethod:bagURL:parameters:", 4, v13, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataTaskPromiseWithRequestPromise:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __34__AMSPushRegisterTask_performTask__block_invoke_2;
  v22[3] = &unk_1E2542D20;
  v22[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v20, "addSuccessBlock:", v22);

  return v20;
}

void __34__AMSPushRegisterTask_performTask__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  AMSStorageDatabase *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
  objc_msgSend(v2, "_updateStorageWithResult:storage:", v3, v4);

}

- (void)_updateStorageWithResult:(id)a3 storage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;

        if (v9)
        {
          if (objc_msgSend(v9, "integerValue"))
          {
            +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
            v10 = objc_claimAutoreleasedReturnValue();
            if (!v10)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v10 = objc_claimAutoreleasedReturnValue();
            }
            -[NSObject OSLogObject](v10, "OSLogObject");
            v11 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              goto LABEL_42;
            v12 = objc_opt_class();
            AMSLogKey();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v12;
            v32 = 2114;
            v33 = v13;
            _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Status is not 0, cannot use response", buf, 0x16u);
          }
          else
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lasset"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v11 = v18;
            else
              v11 = 0;

            +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "OSLogObject");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = objc_opt_class();
              AMSLogKey();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v31 = v21;
              v32 = 2114;
              v33 = v22;
              v34 = 2114;
              v35 = v11;
              _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: lasset received %{public}@", buf, 0x20u);

            }
            if (v11)
            {
              v29 = 0;
              objc_msgSend(v5, "setIsLasset:error:", v11, &v29);
              v10 = v29;
              if (!v10)
              {
LABEL_42:

                goto LABEL_43;
              }
              +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v13, "OSLogObject");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = objc_opt_class();
                AMSLogKey();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                AMSLogableError(v10);
                v26 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v31 = v24;
                v32 = 2114;
                v33 = v25;
                v34 = 2114;
                v35 = v26;
                _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: failed to update lasset value, %{public}@", buf, 0x20u);

              }
            }
            else
            {
              +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v13, "OSLogObject");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v27 = objc_opt_class();
                AMSLogKey();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v31 = v27;
                v32 = 2114;
                v33 = v28;
                _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No lasset, keeping current", buf, 0x16u);

              }
              v10 = 0;
            }

          }
          goto LABEL_42;
        }
      }
      else
      {

      }
      +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_opt_class();
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v16;
        v32 = 2114;
        v33 = v17;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No status, cannot update", buf, 0x16u);

      }
      v9 = 0;
      goto LABEL_42;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No response content", buf, 0x16u);

  }
  v7 = 0;
LABEL_43:

}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
