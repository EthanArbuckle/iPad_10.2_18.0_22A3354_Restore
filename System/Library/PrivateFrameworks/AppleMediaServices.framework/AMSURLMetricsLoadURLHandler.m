@implementation AMSURLMetricsLoadURLHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsClass, 0);
}

id __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "setPreventSampling:", 1);
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_2;
  v9[3] = &unk_1E253EAE8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 40), "_enqueueLoadURLEvent:forContext:", v6, *(_QWORD *)(a1 + 32));
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "BOOLValue");
  +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((v4 & 1) != 0)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v29 = v8;
      objc_msgSend(v9, "properties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "task");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originalRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURLRequest((uint64_t)v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v8;
      v36 = 2114;
      v37 = v11;
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording LoadURL Metrics for URL request: %{public}@", buf, 0x20u);

    }
    +[AMSMetricsLoadURLEvent loadURLEventPromiseWithContext:](AMSMetricsLoadURLEvent, "loadURLEventPromiseWithContext:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_5;
    v30[3] = &unk_1E2546800;
    v16 = *(id *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 32);
    v31 = v16;
    v32 = v17;
    v33 = v3;
    objc_msgSend(v15, "thenWithBlock:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)objc_opt_class();
      v21 = *(void **)(a1 + 40);
      v22 = v20;
      objc_msgSend(v21, "properties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "task");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "originalRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURLRequest((uint64_t)v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v20;
      v36 = 2114;
      v37 = v24;
      v38 = 2114;
      v39 = v27;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Skip LoadURL Metrics due to sampling for URL request: %{public}@.", buf, 0x20u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_reportMetricsForContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  AMSURLMetricsLoadURLHandler *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableLoadURLMetrics");

  if (v6)
  {
    +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
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
      objc_msgSend(v4, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "task");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "originalRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURLRequest((uint64_t)v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v9;
      v28 = 2114;
      v29 = v12;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skip LoadURL Metrics due to client disabling for URL request: %{public}@.", buf, 0x20u);

    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSMetricsLoadURLEvent shouldCollectMetricsPromiseForContext:](AMSMetricsLoadURLEvent, "shouldCollectMetricsPromiseForContext:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke;
    v23 = &unk_1E253D688;
    v24 = self;
    v25 = v4;
    objc_msgSend(v17, "thenWithBlock:", &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "binaryPromiseAdapter", v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)_enqueueLoadURLEvent:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSURLMetricsLoadURLHandler metricsClass](self, "metricsClass");
  objc_msgSend(v6, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class internalInstanceUsingBag:](v8, "internalInstanceUsingBag:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "enqueueEvent:", v7);
}

- (Class)metricsClass
{
  return self->_metricsClass;
}

- (void)reportMetricsForContext:(id)a3
{
  id v3;

  v3 = -[AMSURLMetricsLoadURLHandler _reportMetricsForContext:](self, "_reportMetricsForContext:", a3);
}

- (AMSURLMetricsLoadURLHandler)initWithMetrics:(Class)a3
{
  AMSURLMetricsLoadURLHandler *v4;
  AMSURLMetricsLoadURLHandler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSURLMetricsLoadURLHandler;
  v4 = -[AMSURLMetricsLoadURLHandler init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_metricsClass, a3);
  return v5;
}

- (AMSURLMetricsLoadURLHandler)init
{
  return -[AMSURLMetricsLoadURLHandler initWithMetrics:](self, "initWithMetrics:", objc_opt_class());
}

uint64_t __56__AMSURLMetricsLoadURLHandler__reportMetricsForContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forBodyKey:", a3, a2);
}

@end
