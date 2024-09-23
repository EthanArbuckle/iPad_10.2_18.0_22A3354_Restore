@implementation AMSPushParsableEngagementEvent

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[3];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "logKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = AMSSetLogKey(v9);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_opt_class();
    objc_msgSend(v7, "logKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement event", buf, 0x16u);

  }
  objc_msgSend(v7, "aps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mi"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  objc_msgSend(v7, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_eventForMapiPayload:account:bag:", v17, v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "aps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("static"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  objc_msgSend(a1, "_eventForStaticAssetPayload:bag:", v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aps");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("event"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;

  if (v26)
    v27 = v26;
  else
    v27 = (id)MEMORY[0x1E0C9AA70];
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v19;
  v40[1] = v23;
  v40[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke;
  v34[3] = &unk_1E2542480;
  v35 = v7;
  v36 = v19;
  v37 = v28;
  v38 = v23;
  v39 = a1;
  v30 = v23;
  v31 = v28;
  v32 = v19;
  v33 = v7;
  objc_msgSend(a1, "_waitForPromises:completion:", v29, v34);

}

void __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AMSEngagement *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AMSSetLogKey(v2);

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AMSPushHandler"), CFSTR("source"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("engagementPush"), CFSTR("eventType"));
  objc_msgSend(*(id *)(a1 + 40), "resultWithError:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = MEMORY[0x1E0C9AA70];
  if (v5)
    v8 = v5;
  else
    v8 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("mi"));

  objc_msgSend(*(id *)(a1 + 48), "resultWithError:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = v7;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("event"));

  objc_msgSend(*(id *)(a1 + 56), "resultWithError:", 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = v7;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("static"));

  v15 = objc_msgSend(v4, "count");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (AMSEngagement *)v16;
  if (v15)
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (AMSEngagement *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSEngagement OSLogObject](v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing event: %@", buf, 0x20u);

    }
    v17 = objc_alloc_init(AMSEngagement);
    -[AMSEngagement enqueueData:](v17, "enqueueData:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke_30;
    v25[3] = &unk_1E25453C8;
    v27 = *(_QWORD *)(a1 + 64);
    v26 = *(id *)(a1 + 32);
    objc_msgSend(v21, "addFinishBlock:", v25);

    v22 = v26;
  }
  else
  {
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (AMSEngagement *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSEngagement OSLogObject](v17, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Engagement event contains no fields", buf, 0x16u);

    }
  }

}

void __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished enqueueing event. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (id)_eventForMapiPayload:(id)a3 account:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  AMSMarketingItemTask *v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v14;
    else
      v35 = 0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v15;
    else
      v34 = 0;
    v33 = v8;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("placement"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v34;
    v19 = v35;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("params"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v9;

    if (v11 && v35 && v34 && v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_opt_class();
        AMSLogKey();
        v32 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2114;
        v39 = v26;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found MAPI request", buf, 0x16u);

        v11 = v32;
      }

      v9 = v22;
      v18 = v34;
      v19 = v35;
      v27 = -[AMSMarketingItemTask initWithBag:clientIdentifier:clientVersion:placement:serviceType:]([AMSMarketingItemTask alloc], "initWithBag:clientIdentifier:clientVersion:placement:serviceType:", v22, v11, v35, v17, v34);
      -[AMSMarketingItemTask setAccount:](v27, "setAccount:", v33);
      -[AMSMarketingItemTask setContextInfo:](v27, "setContextInfo:", v21);
      -[AMSMarketingItemTask perform](v27, "perform");
      v28 = v11;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "thenWithBlock:", &__block_literal_global_109);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v28;
    }
    else
    {
      AMSError(7, CFSTR("MAPI keys Not Found"), 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v22;
    }

    v8 = v33;
  }
  else
  {
    AMSError(11, CFSTR("Engagement Push MI Failure"), CFSTR("Failed to locate account"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __67__AMSPushParsableEngagementEvent__eventForMapiPayload_account_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "rawValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = v2;
  else
    v4 = MEMORY[0x1E0C9AA70];
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_eventForStaticAssetPayload:(id)a3 bag:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  AMSURLRequestEncoder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
LABEL_10:
    AMSError(7, CFSTR("Static Key Not Found"), 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v7 = v6;

  if (!v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found static request", (uint8_t *)&v21, 0x16u);

  }
  v14 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v5);
  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v14, "requestWithMethod:URL:parameters:", 2, v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataTaskPromiseWithRequestPromise:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "thenWithBlock:", &__block_literal_global_48_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v18;
}

id __66__AMSPushParsableEngagementEvent__eventForStaticAssetPayload_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "object");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = v2;
  else
    v4 = MEMORY[0x1E0C9AA70];
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_waitForPromises:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v5, "count"))
  {
    +[AMSPromise promiseWithAny:](AMSPromise, "promiseWithAny:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__AMSPushParsableEngagementEvent__waitForPromises_completion___block_invoke;
    v8[3] = &unk_1E2544D50;
    v9 = v6;
    objc_msgSend(v7, "addFinishBlock:", v8);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __62__AMSPushParsableEngagementEvent__waitForPromises_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
