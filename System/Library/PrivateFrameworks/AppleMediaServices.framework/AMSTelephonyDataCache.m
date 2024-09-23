@implementation AMSTelephonyDataCache

+ (id)sharedCache
{
  if (_MergedGlobals_146 != -1)
    dispatch_once(&_MergedGlobals_146, &__block_literal_global_126);
  return (id)qword_1ECEAD8D8;
}

void __36__AMSTelephonyDataCache_sharedCache__block_invoke()
{
  AMSTelephonyDataCache *v0;
  void *v1;

  v0 = -[AMSTelephonyDataCache initWithClientClass:]([AMSTelephonyDataCache alloc], "initWithClientClass:", objc_opt_class());
  v1 = (void *)qword_1ECEAD8D8;
  qword_1ECEAD8D8 = (uint64_t)v0;

}

- (AMSTelephonyDataCache)initWithClientClass:(Class)a3
{
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  AMSTelephonyDataCache *v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.AppleMediaServices.CoreTelephonyDataCache", v5);

  v7 = (void *)objc_msgSend([a3 alloc], "initWithQueue:", v6);
  v8 = -[AMSTelephonyDataCache initWithTelephonyClient:queue:](self, "initWithTelephonyClient:queue:", v7, v6);

  return v8;
}

- (AMSTelephonyDataCache)initWithTelephonyClient:(id)a3 queue:(id)a4
{
  uint64_t v4;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  AMSTelephonyDataCache *v17;
  AMSTelephonyDataCache *v18;
  void *v19;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v21 = v9;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v15 = v14;
    if (v12)
    {
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v4);
    }
    else
    {
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v16;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating a new telephony data cache.", buf, 0xCu);
    if (v12)
    {

      v16 = (void *)v4;
    }

    v9 = v21;
  }

  v22.receiver = self;
  v22.super_class = (Class)AMSTelephonyDataCache;
  v17 = -[AMSTelephonyDataCache init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_client, a3);
    objc_msgSend(v8, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_queue, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel__clearCaches_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  }
  return v18;
}

- (CTXPCContexts)activeContexts
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[AMSTelephonyDataCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__66;
  v12 = __Block_byref_object_dispose__66;
  v13 = 0;
  -[AMSTelephonyDataCache queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__AMSTelephonyDataCache_activeContexts__block_invoke;
  v7[3] = &unk_1E2542338;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CTXPCContexts *)v5;
}

void __39__AMSTelephonyDataCache_activeContexts__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v4)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        AMSLogKey();
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v1);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v2;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching active contexts.", buf, 0xCu);
      if (v7)
      {

        v2 = (void *)v1;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v11, "getActiveContexts:", &v34);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v34;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 8);
    *(_QWORD *)(v14 + 8) = v12;

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = objc_opt_class();
        v23 = v22;
        if (v20)
        {
          AMSLogKey();
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v2);
        }
        else
        {
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched active contexts.", buf, 0xCu);
        if (v20)
        {

          v24 = v2;
        }

      }
    }
    else
    {
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        v27 = objc_opt_class();
        v28 = v27;
        if (v25)
        {
          AMSLogKey();
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v28, v2);
        }
        else
        {
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: "), v27);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2114;
        v38 = v30;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@An error occurred fetching active contexts. error = %{public}@", buf, 0x16u);
        if (v25)
        {

          v29 = v2;
        }

      }
    }

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  v31 = objc_msgSend(v4, "copy");
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v31;

}

- (NSArray)carrierNames
{
  return (NSArray *)-[AMSTelephonyDataCache carrierNamesWithError:](self, "carrierNamesWithError:", 0);
}

- (id)carrierNamesWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
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
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = (uint64_t)self;
  v31 = *MEMORY[0x1E0C80C00];
  -[AMSTelephonyDataCache client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v5, "getSubscriptionInfoWithError:", &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;

  if (v6 || !v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "subscriptionsInUse");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __47__AMSTelephonyDataCache_carrierNamesWithError___block_invoke;
        v24[3] = &unk_1E25463B8;
        v24[4] = v4;
        v17 = v16;
        v25 = v17;
        objc_msgSend(v15, "ams_mapWithTransformIgnoresNil:", v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "count");
        if (v19 == objc_msgSend(v15, "count"))
        {
          if (a3)
          {
            v20 = (void *)objc_msgSend(v17, "copy");
            AMSErrorWithMultipleUnderlyingErrors(15, CFSTR("Error fetching carrier names"), 0, v20);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          v21 = 0;
        }
        else
        {
          v21 = v18;
        }

      }
      else
      {
        v21 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v21 = (id)MEMORY[0x1E0C9AA60];
    }
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v4 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v4);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching subscription info: %{public}@", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v4;
      }

    }
    v21 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v21;
}

id __47__AMSTelephonyDataCache_carrierNamesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v3 = a1;
  v35 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
  v30 = 0;
  v8 = (void *)objc_msgSend(v6, "copyCarrierBundleValue:key:bundleType:error:", v5, CFSTR("CarrierName"), v7, &v30);

  v9 = v30;
  if (v9)
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
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v15, v2);
      }
      else
      {
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: "), v14);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v25;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error copying carrier name: %{public}@", buf, 0x16u);
      if (v12)
      {

        v16 = (void *)v2;
      }

    }
    objc_msgSend(*(id *)(v3 + 40), "addObject:", v9);
LABEL_24:
    v17 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = objc_opt_class();
      v23 = v22;
      if (v20)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v3);
      }
      else
      {
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: "), v22);
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2114;
      v34 = v28;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error copying carrier name. Expected an NSString, got %{public}@", buf, 0x16u);

      if (v20)
      {

        v24 = (void *)v3;
      }

    }
    goto LABEL_24;
  }
  v17 = v8;
LABEL_25:

  return v17;
}

- (id)carrierNamesPromise
{
  AMSPromise *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = objc_alloc_init(AMSPromise);
  -[AMSTelephonyDataCache client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v3, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSubscriptionInfo:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke;
  v8[3] = &unk_1E2546430;
  v8[4] = self;
  -[AMSPromise thenWithBlock:](v3, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a2, "subscriptionsInUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_2;
    v8[3] = &unk_1E2546408;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ams_mapWithTransform:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithSome:](AMSPromise, "promiseWithSome:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

AMSMutablePromise *__44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  AMSMutablePromise *v4;
  void *v5;
  void *v6;
  AMSMutablePromise *v7;
  _QWORD v9[4];
  AMSMutablePromise *v10;

  v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(*(id *)(a1 + 32), "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_3;
  v9[3] = &unk_1E25463E0;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "copyCarrierBundleValue:key:bundleType:completion:", v3, CFSTR("CarrierName"), v6, v9);

  return v7;
}

void __44__AMSTelephonyDataCache_carrierNamesPromise__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v10 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  v7 = v10;

  v8 = *(void **)(a1 + 32);
  if (!v7)
  {
LABEL_5:
    AMSError(7, CFSTR("Carrier Name Not Found"), CFSTR("Did not receive a carrier name."), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "finishWithResult:", v7);
LABEL_6:

}

- (void)_clearCaches:(id)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = v9;
    if (v7)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v3);
    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@Received UIApplicationDidEnterBackgroundNotification notification, clearing caches.", buf, 0xCu);
    if (v7)
    {

      v11 = (void *)v3;
    }

  }
  -[AMSTelephonyDataCache queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v12);

  -[AMSTelephonyDataCache queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AMSTelephonyDataCache__clearCaches___block_invoke;
  block[3] = &unk_1E253DBD8;
  block[4] = self;
  dispatch_async(v13, block);

}

void __38__AMSTelephonyDataCache__clearCaches___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)activeSubscriptionsDidChange
{
  uint64_t v2;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CTXPCContexts *activeContexts;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AMSTelephonyDataCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v2);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    if (v8)
    {

      v12 = (void *)v2;
    }

  }
  activeContexts = self->_activeContexts;
  self->_activeContexts = 0;

}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CTXPCContexts *activeContexts;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AMSTelephonyDataCache queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    v12 = v11;
    if (v9)
    {
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
    }
    else
    {
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    if (v9)
    {

      v13 = (void *)v3;
    }

  }
  activeContexts = self->_activeContexts;
  self->_activeContexts = 0;

}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activeContexts, 0);
}

@end
