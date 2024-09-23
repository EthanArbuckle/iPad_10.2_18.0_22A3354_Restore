@implementation AMSCarrierLinkTask

- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 linkParams:(id)a5 productCode:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSURLRequestEncoder *v18;
  AMSCarrierLinkParams *v20;
  AMSURLSession *v21;
  void *v22;
  void *v23;
  AMSEngagement *v24;
  AMSCarrierLinkTask *v26;
  void *v27;

  v9 = (void *)MEMORY[0x1E0C92CA0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_configurationWithProcessInfo:bag:", v14, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v27, 0, 0);
  v24 = objc_alloc_init(AMSEngagement);
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AMSCarrierLinkParams initWithString:]([AMSCarrierLinkParams alloc], "initWithString:", v11);

  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "msisdn");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice voicePreferredPACToken](AMSDevice, "voicePreferredPACToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v12);
  v26 = -[AMSCarrierLinkTask initWithAccount:bag:engagementHandler:guid:linkParams:metrics:msisdn:pacTokenPromise:productCode:requestEncoder:urlSession:](self, "initWithAccount:bag:engagementHandler:guid:linkParams:metrics:msisdn:pacTokenPromise:productCode:requestEncoder:urlSession:", v13, v12, v24, v23, v20, v15, v16, v17, v10, v18, v21);

  return v26;
}

- (AMSCarrierLinkTask)initWithAccount:(id)a3 bag:(id)a4 engagementHandler:(id)a5 guid:(id)a6 linkParams:(id)a7 metrics:(id)a8 msisdn:(id)a9 pacTokenPromise:(id)a10 productCode:(id)a11 requestEncoder:(id)a12 urlSession:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  AMSCarrierLinkTask *v22;
  AMSCarrierLinkTask *v23;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v33 = a5;
  v26 = a6;
  v32 = a6;
  v27 = a7;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  v36.receiver = self;
  v36.super_class = (Class)AMSCarrierLinkTask;
  v22 = -[AMSTask init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_account, a3);
    objc_storeStrong((id *)&v23->_bag, a4);
    objc_storeStrong((id *)&v23->_engagementHandler, a5);
    objc_storeStrong((id *)&v23->_guid, v26);
    objc_storeStrong((id *)&v23->_linkParams, v27);
    objc_storeStrong((id *)&v23->_metrics, a8);
    objc_storeStrong((id *)&v23->_msisdn, a9);
    objc_storeStrong((id *)&v23->_pacTokenPromise, a10);
    objc_storeStrong((id *)&v23->_productCode, a11);
    objc_storeStrong((id *)&v23->_requestEncoder, a12);
    objc_storeStrong((id *)&v23->_urlSession, a13);
    -[AMSURLSession setDelegate:](v23->_urlSession, "setDelegate:", v23);
  }

  return v23;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__AMSCarrierLinkTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __29__AMSCarrierLinkTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_performLinkingWithValidations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "resultWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_metricsEventFromCarrierLinkResult:error:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_recordEngagementMetricsEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waitUntilFinished");

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "flush");
  return v2;
}

- (void)_delegateHandleEngagementRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSCarrierLinkTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v12 = CFSTR("Delegate method not implemented");
    v13 = CFSTR("Delegate cannot handle this engagement request");
  }
  else
  {
    v12 = CFSTR("No delegate available");
    v13 = CFSTR("There is no delegate set to handle this engagement request");
  }
  AMSError(12, v12, v13, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There is no delegate set to handle engagement request challenge: %{public}@ for this task. Terminating carrier linking", (uint8_t *)&v23, 0x20u);

    }
  }
LABEL_12:
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    v23 = 138543618;
    v24 = v20;
    v25 = 2114;
    v26 = v21;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle engagement request", (uint8_t *)&v23, 0x16u);

  }
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleEngagementRequest:completion:", v7, v6);

}

- (id)_linkFailureFromResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "statusCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      AMSError(0, CFSTR("Carrier linking failed"), CFSTR("Unknown error - no status code or error in response"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_6:
    v9 = v7;
    v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v3, "statusCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "integerValue");

  if (v6)
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown error - no error on server response. Code: %ld"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(0, CFSTR("Carrier linking failed"), v8, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      v9 = 0;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_10:

  return v6;
}

- (id)_linkParameters
{
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

  v3 = (void *)objc_opt_new();
  -[AMSCarrierLinkTask guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("guid"));

  -[AMSCarrierLinkTask msisdn](self, "msisdn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channelCustomerId"));

  -[AMSCarrierLinkTask linkParams](self, "linkParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkParamsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkParams"));

  -[AMSCarrierLinkTask productCode](self, "productCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("productCode"));

  -[AMSCarrierLinkTask _pacToken](self, "_pacToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pac"));

  -[AMSCarrierLinkTask additionalLinkingParameters](self, "additionalLinkingParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSCarrierLinkTask additionalLinkingParameters](self, "additionalLinkingParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)_linkURLRequest
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  -[AMSCarrierLinkTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForKey:", 0x1E254C780);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "valuePromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__AMSCarrierLinkTask__linkURLRequest__block_invoke;
    v9[3] = &unk_1E253FE80;
    v9[4] = self;
    objc_msgSend(v5, "thenWithBlock:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSError(2, CFSTR("URL Request could not be created"), CFSTR("bagURL is nil"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

id __37__AMSCarrierLinkTask__linkURLRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(*(id *)(a1 + 32), "requestEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestEncoding:", 3);

  objc_msgSend(*(id *)(a1 + 32), "requestEncoder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "_linkParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestByEncodingRequest:parameters:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_metricsEventFromCarrierLinkResult:(id)a3 error:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    objc_msgSend((id)v6, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = (void *)v7;
    v8 = v15;

    v16 = -[AMSMetricsEvent initForEngagement]([AMSMetricsEvent alloc], "initForEngagement");
    objc_msgSend(v16, "setProperty:forBodyKey:", CFSTR("carrier-link"), CFSTR("eventType"));
    objc_msgSend(v16, "setProperty:forBodyKey:", CFSTR("AMS"), CFSTR("source"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 == 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v17, CFSTR("success"));

    objc_msgSend((id)v6, "channelCustomerId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v18, CFSTR("channelCustomerId"));

    objc_msgSend((id)v6, "linkParams");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v20, CFSTR("linkParams"));

    objc_msgSend((id)v6, "productCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v21, CFSTR("productCode"));

    objc_msgSend((id)v6, "response");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsEvent sanitizedObject:](AMSMetricsEvent, "sanitizedObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v23, CFSTR("responseDictionary"));

    -[AMSCarrierLinkTask additionalLinkingParameters](self, "additionalLinkingParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetricsEvent sanitizedObject:](AMSMetricsEvent, "sanitizedObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v25, CFSTR("additionalLinkingParameters"));

    -[AMSCarrierLinkTask account](self, "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ams_DSID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forBodyKey:", v28, CFSTR("accountId"));

    -[AMSCarrierLinkTask metricsOverlay](self, "metricsOverlay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __63__AMSCarrierLinkTask__metricsEventFromCarrierLinkResult_error___block_invoke;
    v42[3] = &unk_1E253FA48;
    v12 = v16;
    v43 = v12;
    objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v42);

    if (v7)
    {
      v44[0] = CFSTR("code");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v7, "code"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v30;
      v44[1] = CFSTR("domain");
      objc_msgSend((id)v7, "domain");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
        v33 = (const __CFString *)v31;
      else
        v33 = &stru_1E2548760;
      v45[1] = v33;
      v44[2] = CFSTR("title");
      objc_msgSend((id)v7, "ams_title");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (const __CFString *)v34;
      else
        v36 = &stru_1E2548760;
      v45[2] = v36;
      v44[3] = CFSTR("message");
      objc_msgSend((id)v7, "ams_message");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
        v39 = (const __CFString *)v37;
      else
        v39 = &stru_1E2548760;
      v45[3] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", v40, CFSTR("error"));
    }
    v9 = v43;
  }
  else
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v10;
      v48 = 2114;
      v49 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No result or error to form metrics around.", buf, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

uint64_t __63__AMSCarrierLinkTask__metricsEventFromCarrierLinkResult_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forBodyKey:", a3, a2);
}

- (id)_pacToken
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AMSCarrierLinkTask pacTokenPromise](self, "pacTokenPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_9;
  -[AMSCarrierLinkTask pacTokenPromise](self, "pacTokenPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "resultWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v6)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not retrieve PAC. Error: %{public}@", buf, 0x20u);

    }
  }

  if (!v5)
  {
LABEL_9:
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No PAC token available", buf, 0x16u);

    }
    v5 = 0;
  }
  return v5;
}

- (void)_performDelegateAuthenticationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD, void *);
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSCarrierLinkTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
      goto LABEL_11;
    v11 = CFSTR("Delegate does not handle authentication requests");
  }
  else
  {
    v11 = CFSTR("Delegate does not exist");
  }
  AMSError(12, CFSTR("AMSCarrierLinkTask failed"), v11, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform auth request. Error: %{public}@", buf, 0x20u);

    }
    v7[2](v7, 0, v13);
    goto LABEL_16;
  }
LABEL_11:
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v21;
    v28 = 2114;
    v29 = v22;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle authentication request", buf, 0x16u);

  }
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__AMSCarrierLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke;
  v24[3] = &unk_1E253FEA8;
  v25 = v7;
  objc_msgSend(v23, "handleAuthenticateRequest:completion:", v6, v24);

  v13 = v25;
LABEL_16:

}

uint64_t __75__AMSCarrierLinkTask__performDelegateAuthenticationWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_performLinkingWithValidations
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[AMSCarrierLinkTask linkParams](self, "linkParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    AMSError(7, CFSTR("Missing required field."), CFSTR("linkParams is missing"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
LABEL_12:
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v10;
    v36 = 2114;
    v37 = v11;
    v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Aborting carrier link task. Error: %{public}@.", buf, 0x20u);

LABEL_13:
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  -[AMSCarrierLinkTask productCode](self, "productCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    AMSError(7, CFSTR("Missing required field."), CFSTR("productCode is missing"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    goto LABEL_12;
  }
  -[AMSCarrierLinkTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSCarrierLinkTask _performLinking](self, "_performLinking");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Account is missing. Prompting for account.", buf, 0x16u);

    }
    -[AMSCarrierLinkTask _promptForAccount](self, "_promptForAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v18, "resultWithError:", &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v33;

    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v20)
    {
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_opt_class();
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v24;
        v36 = 2114;
        v37 = v25;
        v38 = 2114;
        v39 = v26;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get account. Error: %{public}@.", buf, 0x20u);

      }
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_opt_class();
        AMSLogKey();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v29;
        v36 = 2114;
        v37 = v30;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authentication prompt succeeded. Updating account value.", buf, 0x16u);

      }
      objc_msgSend(v19, "account");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSCarrierLinkTask setAccount:](self, "setAccount:", v31);

      -[AMSCarrierLinkTask _performLinking](self, "_performLinking");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v27;

    return v32;
  }
}

- (id)_performLinking
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v5;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning linking.", buf, 0x16u);

  }
  -[AMSCarrierLinkTask account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AMSCarrierLinkTask account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCarrierLinkTask requestEncoder](self, "requestEncoder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccount:", v8);

    v10 = (void *)objc_opt_new();
    -[AMSCarrierLinkTask urlSession](self, "urlSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCarrierLinkTask _linkURLRequest](self, "_linkURLRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataTaskPromiseWithRequestPromise:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__AMSCarrierLinkTask__performLinking__block_invoke;
    v23[3] = &unk_1E253DB58;
    v23[4] = self;
    v14 = v10;
    v24 = v14;
    objc_msgSend(v13, "addFinishBlock:", v23);

    v15 = v24;
    v16 = v14;

    v17 = v16;
  }
  else
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Linking failure. Account is nil.", buf, 0x16u);

    }
    AMSError(12, CFSTR("Carrier linking failed"), CFSTR("No account at link time"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __37__AMSCarrierLinkTask__performLinking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_resultDecodingURLResult:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_linkFailureFromResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v15;
        v20 = 2114;
        v21 = v16;
        v22 = 2114;
        v23 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Carrier Linking failed. Error: %{public}@.", (uint8_t *)&v18, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v11);
    }

  }
}

- (id)_promptForAccount
{
  void *v3;
  void *v4;
  void *v5;
  AMSAuthenticateRequest *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEnableAccountCreation:", 1);
  objc_msgSend(v4, "setAuthenticationType:", 2);
  -[AMSCarrierLinkTask clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientInfo:", v5);

  objc_msgSend(v4, "setDebugReason:", CFSTR("Account is not present while attempting carrier linking."));
  v6 = objc_alloc_init(AMSAuthenticateRequest);
  -[AMSAuthenticateRequest setOptions:](v6, "setOptions:", v4);
  objc_msgSend(v3, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierLinkTask _performDelegateAuthenticationWithRequest:completion:](self, "_performDelegateAuthenticationWithRequest:completion:", v6, v7);

  return v3;
}

- (id)_recordEngagementMetricsEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AMSMutableBinaryPromise *v12;
  uint64_t v13;
  AMSMutableBinaryPromise *v14;
  AMSMutableBinaryPromise *v15;
  _QWORD v17[5];
  _QWORD v18[4];
  AMSMutableBinaryPromise *v19;
  AMSCarrierLinkTask *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event.", buf, 0x16u);

  }
  -[AMSCarrierLinkTask engagementHandler](self, "engagementHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForPosting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "enqueueData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(AMSMutableBinaryPromise);
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke;
  v18[3] = &unk_1E253FEF8;
  v14 = v12;
  v19 = v14;
  v20 = self;
  objc_msgSend(v11, "addFinishBlock:", v18);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_104;
  v17[3] = &unk_1E253E120;
  v17[4] = self;
  -[AMSBinaryPromise addErrorBlock:](v14, "addErrorBlock:", v17);
  v15 = v14;

  return v15;
}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a3);
  }
  else
  {
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v6, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_2;
      v12[3] = &unk_1E253FED0;
      v11 = *(int8x16_t *)(a1 + 32);
      v10 = (id)v11.i64[0];
      v13 = vextq_s8(v11, v11, 8uLL);
      objc_msgSend(v8, "_delegateHandleEngagementRequest:completion:", v9, v12);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
    }
  }

}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement completed successfully", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", v4 == 0, v4);

}

void __52__AMSCarrierLinkTask__recordEngagementMetricsEvent___block_invoke_104(uint64_t a1, void *a2)
{
  __CFString *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E2548760;
    v9 = 138543874;
    v10 = v5;
    if (v2)
      v8 = v2;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Engagement failed. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (id)_resultDecodingURLResult:(id)a3
{
  void *v4;
  id v5;
  AMSCarrierLinkResult *v6;
  void *v7;
  AMSCarrierLinkResult *v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = [AMSCarrierLinkResult alloc];
  -[AMSCarrierLinkTask linkParams](self, "linkParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSCarrierLinkResult initWithResponse:linkParams:](v6, "initWithResponse:linkParams:", v5, v7);

  return v8;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = a5;
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSCarrierLinkTask delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
      goto LABEL_11;
    v13 = CFSTR("Delegate method not implemented");
    v14 = CFSTR("Delegate cannot handle this dialog request");
  }
  else
  {
    v13 = CFSTR("No delegate available");
    v14 = CFSTR("There is no delegate set to handle dialog requests");
  }
  AMSError(12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle dialog request. Error: %{public}@", (uint8_t *)&v26, 0x20u);

    }
  }
LABEL_11:
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_opt_class();
    AMSLogKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v23;
    v28 = 2114;
    v29 = v24;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to handle engagement request", (uint8_t *)&v26, 0x16u);

  }
  -[AMSCarrierLinkTask delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleDialogRequest:completion:", v9, v8);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  -[AMSCarrierLinkTask _delegateHandleEngagementRequest:completion:](self, "_delegateHandleEngagementRequest:completion:", a5, a6);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  -[AMSCarrierLinkTask _performDelegateAuthenticationWithRequest:completion:](self, "_performDelegateAuthenticationWithRequest:completion:", a5, a6);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_4 != -1)
    dispatch_once(&_MergedGlobals_1_4, &__block_literal_global_26);
  return (NSString *)(id)qword_1ECEACA98;
}

void __35__AMSCarrierLinkTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACA98;
  qword_1ECEACA98 = (uint64_t)CFSTR("AMSCarrierLinkTask");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACAA0 != -1)
    dispatch_once(&qword_1ECEACAA0, &__block_literal_global_116);
  return (NSString *)(id)qword_1ECEACAA8;
}

void __42__AMSCarrierLinkTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACAA8;
  qword_1ECEACAA8 = (uint64_t)CFSTR("1");

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

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)additionalLinkingParameters
{
  return self->_additionalLinkingParameters;
}

- (void)setAdditionalLinkingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLinkingParameters, a3);
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

- (AMSCarrierLinkTaskDelegate)delegate
{
  return (AMSCarrierLinkTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSCarrierLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productCode
{
  return self->_productCode;
}

- (AMSEngagement)engagementHandler
{
  return self->_engagementHandler;
}

- (NSString)guid
{
  return self->_guid;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSString)msisdn
{
  return self->_msisdn;
}

- (AMSURLRequestEncoder)requestEncoder
{
  return self->_requestEncoder;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (AMSPromise)pacTokenPromise
{
  return self->_pacTokenPromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pacTokenPromise, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_msisdn, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_engagementHandler, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalLinkingParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
