@implementation AMSDeviceOfferEligibilityTask

- (AMSDeviceOfferEligibilityTask)initWithBag:(id)a3 deviceGUID:(id)a4 masterSerialNumber:(id)a5 urlSession:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSDeviceOfferEligibilityTask *v15;
  AMSDeviceOfferEligibilityTask *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSDeviceOfferEligibilityTask;
  v15 = -[AMSDeviceOfferEligibilityTask init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bag, a3);
    objc_storeStrong((id *)&v16->_deviceGUID, a4);
    objc_storeStrong((id *)&v16->_urlSession, a6);
    objc_storeStrong((id *)&v16->_masterSerialNumber, a5);
  }

  return v16;
}

- (id)performAnonymousDeviceEligibility:(id)a3 clientInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing anonymous device eligibility check.", buf, 0x16u);

    }
    -[AMSDeviceOfferEligibilityTask _eligibilityRequest](self, "_eligibilityRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke;
    v22[3] = &unk_1E2540FD0;
    v22[4] = self;
    v23 = v7;
    v24 = v6;
    objc_msgSend(v12, "thenWithBlock:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_2;
    v21[3] = &unk_1E253DB08;
    v21[4] = self;
    objc_msgSend(v14, "thenWithBlock:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
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
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No registration groups for device eligibility check - preemptively returning", buf, 0x16u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_deviceEligibilityEncoderWithBag:clientInfo:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_deviceEligibilityRequestParametersWithGroups:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestByEncodingRequest:parameters:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "urlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataTaskPromiseWithRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_3;
  v9[3] = &unk_1E253E418;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __78__AMSDeviceOfferEligibilityTask_performAnonymousDeviceEligibility_clientInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received anonymous device eligibility response.", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_offersDecodedFromResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_deviceEligibilityRequestParametersWithGroups:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("companionDevices"));
  -[AMSDeviceOfferEligibilityTask masterSerialNumber](self, "masterSerialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));

  -[AMSDeviceOfferEligibilityTask deviceGUID](self, "deviceGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("guid"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

id __79__AMSDeviceOfferEligibilityTask__deviceEligibilityRequestParametersWithGroups___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "registrationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceGroup"));
  return v3;
}

id __79__AMSDeviceOfferEligibilityTask__deviceEligibilityRequestParametersWithGroups___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("serialNumber"));

  objc_msgSend(v2, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("productType"));

  objc_msgSend(v2, "validationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("certificate"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)_deviceEligibilityEncoderWithBag:(id)a3 clientInfo:(id)a4
{
  id v5;
  id v6;
  AMSURLRequestEncoder *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v6);

  -[AMSURLRequestEncoder setRequestEncoding:](v7, "setRequestEncoding:", 2);
  -[AMSURLRequestEncoder setDialogOptions:](v7, "setDialogOptions:", 1);
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v7, "setLogUUID:", v8);

  -[AMSURLRequestEncoder setEnableRemoteSecuritySigning:](v7, "setEnableRemoteSecuritySigning:", 1);
  if (v5)
    -[AMSURLRequestEncoder setClientInfo:](v7, "setClientInfo:", v5);

  return v7;
}

- (id)performAccountEligibility:(id)a3 forOffers:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "count"))
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
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing account eligibility check against device offers.", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_24_0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSDeviceOfferEligibilityTask _eligibilityRequest](self, "_eligibilityRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_2;
    v29[3] = &unk_1E2541058;
    v29[4] = self;
    v30 = v8;
    v31 = v10;
    v32 = v17;
    v20 = v17;
    objc_msgSend(v18, "thenWithBlock:", v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_3;
    v28[3] = &unk_1E253DB08;
    v28[4] = self;
    objc_msgSend(v21, "thenWithBlock:", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
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
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      v35 = 2114;
      v36 = v26;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] There are no offers to verify eligibility for - skipping account eligibility verification.", buf, 0x16u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

uint64_t __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offerIdentifier");
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accountEligibilityEncoderWithBag:account:clientInfo:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_accountEligibilityRequestParametersWithIdentifiers:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestByEncodingRequest:parameters:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "urlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataTaskPromiseWithRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_4;
  v9[3] = &unk_1E253E418;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __80__AMSDeviceOfferEligibilityTask_performAccountEligibility_forOffers_clientInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received account eligibility response", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_offersDecodedFromResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accountEligibilityRequestParametersWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("services"));

    -[AMSDeviceOfferEligibilityTask masterSerialNumber](self, "masterSerialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("serialNumber"));

    -[AMSDeviceOfferEligibilityTask deviceGUID](self, "deviceGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("guid"));

    v9 = (void *)objc_msgSend(v5, "copy");
  }
  else
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offer identifiers need account eligibility verification.", (uint8_t *)&v15, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (id)_accountEligibilityEncoderWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[AMSDeviceOfferEligibilityTask _deviceEligibilityEncoderWithBag:clientInfo:](self, "_deviceEligibilityEncoderWithBag:clientInfo:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccount:", v8);

  return v9;
}

- (id)_offersDecodedFromResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__AMSDeviceOfferEligibilityTask__offersDecodedFromResult___block_invoke;
  v10[3] = &unk_1E2541080;
  v10[4] = self;
  objc_msgSend(v7, "ams_mapWithTransform:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

AMSDeviceOffer *__58__AMSDeviceOfferEligibilityTask__offersDecodedFromResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  AMSDeviceOffer *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Decoding %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v7 = -[AMSDeviceOffer initWithDictionary:]([AMSDeviceOffer alloc], "initWithDictionary:", v2);

  return v7;
}

- (id)_eligibilityRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AMSDeviceOfferEligibilityTask bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", 0x1E254C8C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thenWithBlock:", &__block_literal_global_32_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__AMSDeviceOfferEligibilityTask__eligibilityRequest__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0C92C28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithURL:", v3);

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  v5 = (void *)objc_msgSend(v4, "copy");
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSString)masterSerialNumber
{
  return self->_masterSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterSerialNumber, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
