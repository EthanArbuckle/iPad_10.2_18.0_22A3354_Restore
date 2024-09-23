@implementation AMSURLResult

- (NSData)data
{
  return self->_data;
}

- (int64_t)responseStatusCode
{
  void *v2;
  int64_t v3;

  -[AMSURLResult response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ams_statusCode");

  return v3;
}

- (NSDictionary)responseHeaders
{
  void *v2;
  void *v3;

  -[AMSURLResult response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_allHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSURLResponse)response
{
  return self->_response;
}

+ (id)URLResultPromiseWithTaskInfo:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "createMetricsContextForDecodedObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsLoadURLEvent loadURLEventPromiseWithContext:](AMSMetricsLoadURLEvent, "loadURLEventPromiseWithContext:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__AMSURLResult_URLResultPromiseWithTaskInfo_object___block_invoke;
    v15[3] = &unk_1E2546C20;
    v19 = a1;
    v16 = v6;
    v17 = v8;
    v18 = v7;
    objc_msgSend(v12, "addFinishBlock:", v15);

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskInfo:object:loadURLEventDictionary:", v6, v7, 0);
    objc_msgSend(v8, "finishWithResult:", v13);

  }
  return v8;
}

- (AMSURLResult)initWithTaskInfo:(id)a3 object:(id)a4 loadURLEventDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSURLResult *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "task");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[AMSURLResult initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:](self, "initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:", v11, v12, v13, v9, v15, v16, v8);
  return v17;
}

- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6 logUUID:(id)a7 taskMetrics:(id)a8 loadURLEventDictionary:(id)a9
{
  id v16;
  id v17;
  id v18;
  AMSURLResult *v19;
  AMSURLResult *v20;
  uint64_t v21;
  NSString *logUUID;
  uint64_t v23;
  NSDictionary *loadURLEventDictionary;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)AMSURLResult;
  v19 = -[AMSURLResult init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_task, a3);
    objc_storeStrong((id *)&v20->_response, a4);
    objc_storeStrong((id *)&v20->_data, a5);
    objc_storeStrong(&v20->_object, a6);
    v21 = objc_msgSend(v16, "copy", v26, v27, v28, v29);
    logUUID = v20->_logUUID;
    v20->_logUUID = (NSString *)v21;

    objc_storeStrong((id *)&v20->_taskMetrics, a8);
    v23 = objc_msgSend(v18, "copy");
    loadURLEventDictionary = v20->_loadURLEventDictionary;
    v20->_loadURLEventDictionary = (NSDictionary *)v23;

  }
  return v20;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (id)object
{
  return self->_object;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_loadURLEventDictionary, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)responseCorrelationId
{
  void *v2;
  void *v3;

  -[AMSURLResult response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Jingle-Correlation-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (AMSURLResult)initWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AMSURLResult *v12;

  v4 = a3;
  objc_msgSend(v4, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadURLEventDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AMSURLResult initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:](self, "initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

void __52__AMSURLResult_URLResultPromiseWithTaskInfo_object___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "properties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create Load URL event. %{public}@", (uint8_t *)&v19, 0x20u);

    }
  }
  v13 = *(void **)(a1 + 40);
  v14 = objc_alloc(*(Class *)(a1 + 56));
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "dictionaryForPosting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithTaskInfo:object:loadURLEventDictionary:", v15, v16, v17);
  objc_msgSend(v13, "finishWithResult:", v18);

}

- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6
{
  return -[AMSURLResult initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:](self, "initWithTask:response:data:object:logUUID:taskMetrics:loadURLEventDictionary:", a3, a4, a5, a6, 0, 0, 0);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)loadURLEventDictionary
{
  return self->_loadURLEventDictionary;
}

- (void)setLogUUID:(id)a3
{
  objc_storeStrong((id *)&self->_logUUID, a3);
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

@end
