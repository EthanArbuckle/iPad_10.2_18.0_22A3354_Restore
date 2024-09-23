@implementation AMSSyncPasswordSettingsTask

- (AMSSyncPasswordSettingsTask)initWithAccount:(id)a3 freeSetting:(unint64_t)a4 paidSetting:(unint64_t)a5 delegate:(id)a6 bag:(id)a7
{
  id v13;
  id v14;
  id v15;
  AMSSyncPasswordSettingsTask *v16;
  AMSSyncPasswordSettingsTask *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AMSSyncPasswordSettingsTask;
  v16 = -[AMSTask init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    v17->_freeSetting = a4;
    v17->_paidSetting = a5;
    objc_storeStrong((id *)&v17->_bag, a7);
    objc_storeWeak((id *)&v17->_delegate, v14);
  }

  return v17;
}

- (id)performSync
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke;
  v4[3] = &unk_1E253DB80;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSSyncPasswordSettingsTask;
  v4[0] = MEMORY[0x1E0C809B0];
  -[AMSTask performTaskWithPromiseBlock:](&v3, sel_performTaskWithPromiseBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSURLRequestEncoder *v17;
  void *v18;
  AMSURLRequestEncoder *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "freeSetting");
    v9 = objc_msgSend(*(id *)(a1 + 32), "paidSetting");
    *(_DWORD *)buf = 138544386;
    v30 = v4;
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v7;
    v35 = 2048;
    v36 = v8;
    v37 = 2048;
    v38 = v9;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing password settings. account = %{public}@ | settings = Free: %lu, paid: %lu", buf, 0x34u);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27[0] = CFSTR("free");
  objc_msgSend((id)objc_opt_class(), "serverValueForFreePasswordSetting:", objc_msgSend(*(id *)(a1 + 32), "freeSetting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("paid");
  v28[0] = v11;
  objc_msgSend((id)objc_opt_class(), "serverValueForPaidPasswordSetting:", objc_msgSend(*(id *)(a1 + 32), "paidSetting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("settings"));

  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setNullableObject:forKey:", v14, CFSTR("guid"));

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLForKey:", 0x1E254C380);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [AMSURLRequestEncoder alloc];
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AMSURLRequestEncoder initWithBag:](v17, "initWithBag:", v18);

  objc_msgSend(*(id *)(a1 + 32), "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v19, "setAccount:", v20);

  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setClientInfo:](v19, "setClientInfo:", v21);

  -[AMSURLRequestEncoder setRequestEncoding:](v19, "setRequestEncoding:", 3);
  AMSLogKey();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v19, "setLogUUID:", v22);

  -[AMSURLRequestEncoder setRequestEncoding:](v19, "setRequestEncoding:", 2);
  -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:](v19, "requestWithMethod:bagURL:parameters:", 4, v16, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_23;
  v26[3] = &unk_1E253DB08;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v23, "thenWithBlock:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_23(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AMSURLSession *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = (void *)MEMORY[0x1E0C92CA0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_configurationWithProcessInfo:bag:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AMSURLSession initWithConfiguration:]([AMSURLSession alloc], "initWithConfiguration:", v8);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLSession setDelegate:](v9, "setDelegate:", v10);

  -[AMSURLSession dataTaskPromiseWithRequest:](v9, "dataTaskPromiseWithRequest:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_2;
  v14[3] = &unk_1E253E418;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __42__AMSSyncPasswordSettingsTask_performSync__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  AMSSyncPasswordSettingsResult *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_setFreePasswordPromptSetting:", objc_msgSend(*(id *)(a1 + 32), "freeSetting"));

  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setPaidPasswordPromptSetting:", objc_msgSend(*(id *)(a1 + 32), "paidSetting"));

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "ams_saveAccount:", v5);

  v7 = objc_alloc_init(AMSSyncPasswordSettingsResult);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)serverValueForFreePasswordSetting:(unint64_t)a3
{
  if (a3 > 3)
    return &stru_1E2548760;
  else
    return off_1E2546160[a3];
}

+ (id)serverValueForPaidPasswordSetting:(unint64_t)a3
{
  if (a3 > 3)
    return &stru_1E2548760;
  else
    return off_1E2546180[a3];
}

+ (unint64_t)freePasswordSettingFromServerValue:(unint64_t)a3
{
  unint64_t v3;

  v3 = 3;
  if ((a3 & 0xC) != 0xC)
    v3 = (a3 & 0xC) == 4;
  if ((a3 & 0xC) == 8)
    return 2;
  else
    return v3;
}

+ (unint64_t)paidPasswordSettingFromServerValue:(unint64_t)a3
{
  unint64_t v3;

  v3 = (a3 & 3) == 1;
  if ((a3 & 3) == 3)
    v3 = 3;
  if ((a3 & 3) == 2)
    return 2;
  else
    return v3;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_16 != -1)
    dispatch_once(&_MergedGlobals_1_16, &__block_literal_global_122);
  return (NSString *)(id)qword_1ECEACC18;
}

void __44__AMSSyncPasswordSettingsTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACC18;
  qword_1ECEACC18 = (uint64_t)CFSTR("Accounts");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACC20 != -1)
    dispatch_once(&qword_1ECEACC20, &__block_literal_global_39_2);
  return (NSString *)(id)qword_1ECEACC28;
}

void __51__AMSSyncPasswordSettingsTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACC28;
  qword_1ECEACC28 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSURLSessionDelegate)delegate
{
  return (NSURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)freeSetting
{
  return self->_freeSetting;
}

- (unint64_t)paidSetting
{
  return self->_paidSetting;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
