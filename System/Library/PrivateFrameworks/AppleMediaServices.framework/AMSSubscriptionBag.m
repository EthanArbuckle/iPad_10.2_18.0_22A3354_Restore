@implementation AMSSubscriptionBag

- (AMSSubscriptionBag)init
{
  AMSSubscriptionBag *v2;
  AMSFairPlayContext *v3;
  AMSFairPlayContext *fairPlayContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSSubscriptionBag;
  v2 = -[AMSSubscriptionBag init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSFairPlayContext);
    fairPlayContext = v2->_fairPlayContext;
    v2->_fairPlayContext = v3;

  }
  return v2;
}

+ (AMSSubscriptionBag)sharedInstance
{
  if (_MergedGlobals_143 != -1)
    dispatch_once(&_MergedGlobals_143, &__block_literal_global_121);
  return (AMSSubscriptionBag *)(id)qword_1ECEAD888;
}

void __36__AMSSubscriptionBag_sharedInstance__block_invoke()
{
  AMSSubscriptionBag *v0;
  void *v1;

  v0 = objc_alloc_init(AMSSubscriptionBag);
  v1 = (void *)qword_1ECEAD888;
  qword_1ECEAD888 = (uint64_t)v0;

}

- (id)subscriptionBagSyncDataForAccount:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  qi864985u0(-1, (uint64_t)&v21, (uint64_t)&v19 + 4, (uint64_t)&v20, (uint64_t)&v19);
  v5 = 0;
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", v21, HIDWORD(v19), 0);
    objc_msgSend(v4, "ams_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = 0;
    -[AMSSubscriptionBag _generateSubscriptionBagRequestWithAccountIdentifier:transactionType:machineIDData:returningSubscriptionBagData:error:](self, "_generateSubscriptionBagRequestWithAccountIdentifier:transactionType:machineIDData:returningSubscriptionBagData:error:", v9, 303, v8, &v18, &v17);
    v5 = v18;
    v10 = v17;

    if (v10)
    {
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
        AMSLogableError(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2114;
        v25 = v14;
        v26 = 2114;
        v27 = v15;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating subscription bag request. error = %{public}@", buf, 0x20u);

      }
    }

  }
  if (v21)
    jk24uiwqrg(v21);
  if (v20)
    jk24uiwqrg(v20);

  return v5;
}

- (BOOL)_generateSubscriptionBagRequestWithAccountIdentifier:(id)a3 transactionType:(unsigned int)a4 machineIDData:(id)a5 returningSubscriptionBagData:(id *)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  unsigned int v25;
  uint64_t v26;
  id v27;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  -[AMSSubscriptionBag fairPlayContext](self, "fairPlayContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v15 = objc_msgSend(v14, "fairplayContextIDWithError:", &v27);
  v16 = v27;

  if (v16)
  {
    if (a7)
    {
      v16 = objc_retainAutorelease(v16);
      v17 = 0;
      *a7 = v16;
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_13;
  }
  v26 = 0;
  v25 = 0;
  v18 = objc_msgSend(v12, "unsignedLongLongValue");
  v19 = objc_retainAutorelease(v13);
  V3lNO(v15, v18, v10, objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), (uint64_t)&v26, (uint64_t)&v25);
  if (v20)
  {
    AMSError(505, CFSTR("Fairplay Error"), 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
    {
      v22 = objc_alloc(MEMORY[0x1E0C99D50]);
      v21 = (void *)objc_msgSend(v22, "initWithBytesNoCopy:length:deallocator:", v26, v25, &__block_literal_global_5_0);
      v16 = 0;
      goto LABEL_10;
    }
    v16 = 0;
  }
  v21 = 0;
LABEL_10:
  v23 = objc_retainAutorelease(v21);
  *a6 = v23;
  if (a7)
    *a7 = objc_retainAutorelease(v16);
  v17 = v16 == 0;

LABEL_13:
  return v17;
}

void __140__AMSSubscriptionBag__generateSubscriptionBagRequestWithAccountIdentifier_transactionType_machineIDData_returningSubscriptionBagData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

- (AMSFairPlayContext)fairPlayContext
{
  return self->_fairPlayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayContext, 0);
}

@end
