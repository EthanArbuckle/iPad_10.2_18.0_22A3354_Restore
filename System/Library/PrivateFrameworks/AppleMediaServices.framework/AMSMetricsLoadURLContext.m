@implementation AMSMetricsLoadURLContext

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (AMSURLRequestProperties)properties
{
  return self->_properties;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (NSURLSession)session
{
  return self->_session;
}

- (id)metricsDictionaryPromise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AMSMetricsLoadURLContext task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "ams_requestIsBagLoad") & 1) == 0)
  {

LABEL_7:
    -[AMSMetricsLoadURLContext bag](self, "bag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AMSMetricsLoadURLContext bag](self, "bag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryForKey:", 0x1E254BA80);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[AMSMetricsLoadURLContext bagContract](self, "bagContract");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[AMSMetricsLoadURLContext bagContract](self, "bagContract");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AMSMetricsLoadURLContext bagContract](self, "bagContract");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "metricsDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        if (v7)
        {
          objc_msgSend(v7, "valuePromise");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_24:
          v10 = (void *)v13;
          goto LABEL_25;
        }
LABEL_23:
        AMSError(204, CFSTR("Metrics dictionary missing"), CFSTR("The metrics dictionary is not present in the bag"), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      +[AMSLogConfig sharedURLLoadingConfig](AMSLogConfig, "sharedURLLoadingConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = objc_opt_class();
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load metrics dictionary from bag", (uint8_t *)&v19, 0xCu);
      }

    }
    goto LABEL_23;
  }
  -[AMSMetricsLoadURLContext decodedResponseBody](self, "decodedResponseBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  -[AMSMetricsLoadURLContext decodedResponseBody](self, "decodedResponseBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkTask _bagDataByApplyingOverridesToBagData:](AMSBagNetworkTask, "_bagDataByApplyingOverridesToBagData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_15:
    AMSError(204, CFSTR("Metrics dictionary missing"), CFSTR("The metrics dictionary is not present in the bag"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    goto LABEL_16;
  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_25:
  return v10;
}

- (NSDictionary)decodedResponseBody
{
  return self->_decodedResponseBody;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (NSError)error
{
  return self->_error;
}

- (AMSMetricsLoadURLContext)initWithTaskInfo:(id)a3 serverPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AMSMetricsLoadURLContext *v10;
  void *v11;
  uint64_t v12;
  AMSBagProtocol *bag;
  uint64_t v14;
  NSError *error;
  void *v16;
  uint64_t v17;
  AMSProcessInfo *processInfo;
  uint64_t v19;
  AMSURLRequestProperties *properties;
  uint64_t v21;
  NSData *responseBody;
  void *v23;
  uint64_t v24;
  NSURLSession *session;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *metricsOverlay;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSMetricsLoadURLContext initWithTask:metrics:](self, "initWithTask:metrics:", v8, v9);

  if (v10)
  {
    objc_msgSend(v6, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bag");
    v12 = objc_claimAutoreleasedReturnValue();
    bag = v10->_bag;
    v10->_bag = (AMSBagProtocol *)v12;

    objc_storeStrong((id *)&v10->_decodedResponseBody, a4);
    objc_msgSend(v6, "error");
    v14 = objc_claimAutoreleasedReturnValue();
    error = v10->_error;
    v10->_error = (NSError *)v14;

    objc_msgSend(v6, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientInfo");
    v17 = objc_claimAutoreleasedReturnValue();
    processInfo = v10->_processInfo;
    v10->_processInfo = (AMSProcessInfo *)v17;

    objc_msgSend(v6, "properties");
    v19 = objc_claimAutoreleasedReturnValue();
    properties = v10->_properties;
    v10->_properties = (AMSURLRequestProperties *)v19;

    objc_msgSend(v6, "data");
    v21 = objc_claimAutoreleasedReturnValue();
    responseBody = v10->_responseBody;
    v10->_responseBody = (NSData *)v21;

    objc_msgSend(v6, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "session");
    v24 = objc_claimAutoreleasedReturnValue();
    session = v10->_session;
    v10->_session = (NSURLSession *)v24;

    objc_msgSend(v6, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "purchaseInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "purchase");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "metricsOverlay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    metricsOverlay = v10->_metricsOverlay;
    v10->_metricsOverlay = (NSDictionary *)v30;

  }
  return v10;
}

- (AMSMetricsLoadURLContext)initWithTask:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  AMSMetricsLoadURLContext *v9;
  AMSMetricsLoadURLContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSMetricsLoadURLContext;
  v9 = -[AMSMetricsLoadURLContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_taskMetrics, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_decodedResponseBody, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

- (id)bagContract
{
  AMSDeprecatedBagContract *v3;
  void *v4;
  AMSDeprecatedBagContract *v5;

  v3 = [AMSDeprecatedBagContract alloc];
  -[AMSMetricsLoadURLContext bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSDeprecatedBagContract initWithBag:](v3, "initWithBag:", v4);

  return v5;
}

- (void)setBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;

  v4 = a3;
  v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  -[AMSMetricsLoadURLContext setBag:](self, "setBag:", v5);
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setProcessInfo:(id)a3
{
  objc_storeStrong((id *)&self->_processInfo, a3);
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (void)setResponseBody:(id)a3
{
  objc_storeStrong((id *)&self->_responseBody, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setTaskMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (void)setDecodedResponseBody:(id)a3
{
  objc_storeStrong((id *)&self->_decodedResponseBody, a3);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

@end
