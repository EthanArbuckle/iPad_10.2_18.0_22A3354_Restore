@implementation AMSCarrierOfferRegistrationTask

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  AMSURLRequestEncoder *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  AMSURLRequestEncoder *v13;
  void *v14;
  AMSCarrierOfferRegistrationTask *v15;

  v5 = a4;
  v6 = a3;
  +[AMSDevice carrierNames](AMSDevice, "carrierNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v5);
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice phoneNumber](AMSDevice, "phoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice voicePreferredPACToken](AMSDevice, "voicePreferredPACToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v5);
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSCarrierOfferRegistrationTask initWithAccount:bag:carriers:checkOfferRequestEncoder:deviceGUID:msisdn:pacTokenPromise:privacyMappingResolver:registrationRequestEncoder:urlSession:](self, "initWithAccount:bag:carriers:checkOfferRequestEncoder:deviceGUID:msisdn:pacTokenPromise:privacyMappingResolver:registrationRequestEncoder:urlSession:", v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);

  return v15;
}

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 deviceGUID:(id)a6 msisdn:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AMSURLRequestEncoder *v19;
  void *v20;
  AMSCarrierOfferRegistrationTask *v21;
  void *v24;
  AMSURLRequestEncoder *v25;
  id v26;

  v26 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v24 = v12;
  if (!v12)
  {
    +[AMSDevice carrierNames](AMSDevice, "carrierNames");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v11);
  v15 = v13;
  if (v13)
  {
    if (v14)
    {
LABEL_5:
      v16 = 0;
      v17 = v14;
      goto LABEL_8;
    }
  }
  else
  {
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_5;
  }
  +[AMSDevice phoneNumber](AMSDevice, "phoneNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice voicePreferredPACToken](AMSDevice, "voicePreferredPACToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v18 = objc_opt_class();
  v19 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v11);
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AMSCarrierOfferRegistrationTask initWithAccount:bag:carriers:checkOfferRequestEncoder:deviceGUID:msisdn:pacTokenPromise:privacyMappingResolver:registrationRequestEncoder:urlSession:](self, "initWithAccount:bag:carriers:checkOfferRequestEncoder:deviceGUID:msisdn:pacTokenPromise:privacyMappingResolver:registrationRequestEncoder:urlSession:", v26, v11, v24, v25, v15, v17, v16, v18, v19, v20);

  if (v14)
  {
    if (v13)
      goto LABEL_10;
  }
  else
  {

    if (v13)
      goto LABEL_10;
  }

LABEL_10:
  if (!v12)

  return v21;
}

- (AMSCarrierOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 carriers:(id)a5 checkOfferRequestEncoder:(id)a6 deviceGUID:(id)a7 msisdn:(id)a8 pacTokenPromise:(id)a9 privacyMappingResolver:(Class)a10 registrationRequestEncoder:(id)a11 urlSession:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  AMSCarrierOfferRegistrationTask *v22;
  AMSCarrierOfferRegistrationTask *v23;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v18 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v26 = a7;
  v28 = a7;
  v27 = a8;
  v19 = a9;
  v20 = a11;
  v21 = a12;
  v32.receiver = self;
  v32.super_class = (Class)AMSCarrierOfferRegistrationTask;
  v22 = -[AMSTask init](&v32, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_account, a3);
    objc_storeStrong((id *)&v23->_bag, a4);
    objc_storeStrong((id *)&v23->_carriers, a5);
    objc_storeStrong((id *)&v23->_checkOfferRequestEncoder, a6);
    objc_storeStrong((id *)&v23->_deviceGUID, v26);
    objc_storeStrong((id *)&v23->_msisdn, a8);
    objc_storeStrong((id *)&v23->_pacTokenPromise, a9);
    objc_storeStrong((id *)&v23->_privacyMappingResolver, a10);
    objc_storeStrong((id *)&v23->_registrationRequestEncoder, a11);
    objc_storeStrong((id *)&v23->_urlSession, a12);
  }

  return v23;
}

- (id)perform
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v15[5];

  -[AMSCarrierOfferRegistrationTask carriers](self, "carriers");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AMSCarrierOfferRegistrationTask carriers](self, "carriers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        !v6))
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_class();
    v13 = CFSTR("Task is missing carrier names");
LABEL_8:
    objc_msgSend(v12, "invalidParameterError:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v10);
    goto LABEL_9;
  }
  -[AMSCarrierOfferRegistrationTask msisdn](self, "msisdn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_class();
    v13 = CFSTR("Task is missing a phone number/msisdn");
    goto LABEL_8;
  }
  -[AMSCarrierOfferRegistrationTask deviceGUID](self, "deviceGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_class();
    v13 = CFSTR("Task is missing device GUID");
    goto LABEL_8;
  }
  -[AMSCarrierOfferRegistrationTask account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_class();
    v13 = CFSTR("Task is missing account");
    goto LABEL_8;
  }
  -[AMSCarrierOfferRegistrationTask _evaluationRequiredPrivacyMappingPair](self, "_evaluationRequiredPrivacyMappingPair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__AMSCarrierOfferRegistrationTask_perform__block_invoke;
  v15[3] = &unk_1E253FF40;
  v15[4] = self;
  objc_msgSend(v10, "thenWithBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

id __42__AMSCarrierOfferRegistrationTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v3, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

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
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_opt_class();
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "second");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v8;
        v29 = 2114;
        v30 = v9;
        v31 = 2114;
        v32 = v10;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Privacy requirements found: %{public}@", (uint8_t *)&v27, 0x20u);

      }
      v11 = (void *)MEMORY[0x1E0C99E40];
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v3, "second");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_allowedServiceIdentifiersFromPrivacyMapping:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "orderedSetWithSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
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
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_opt_class();
          AMSLogKey();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v18;
          v29 = 2114;
          v30 = v19;
          v31 = 2114;
          v32 = v15;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lobs qualifying: %{public}@", (uint8_t *)&v27, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_performRegistrationFlowLimitedByAllowedServiceIdentifiers:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        AMSError(6, CFSTR("Short circuiting carrier registration"), CFSTR("No LoBs meet criteria for inclusion"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_21;
    }
  }
  else
  {

  }
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
    v27 = 138543618;
    v28 = v23;
    v29 = 2114;
    v30 = v24;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No additional privacy reqs", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_performRegistrationFlowLimitedByAllowedServiceIdentifiers:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v20;
}

+ (id)pollingIntervalFromBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "doubleForKey:", 0x1E254C700);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thenWithBlock:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__AMSCarrierOfferRegistrationTask_pollingIntervalFromBag___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v2, "numberWithDouble:", v3 * 3600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_performRegistrationFlowLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__AMSCarrierOfferRegistrationTask__performRegistrationFlowLimitedByAllowedServiceIdentifiers___block_invoke;
  v8[3] = &unk_1E253FF68;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __94__AMSCarrierOfferRegistrationTask__performRegistrationFlowLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_includesAllowedCarrier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v4, "resultWithError:", &v50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v50;

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
      objc_msgSend(*(id *)(a1 + 32), "carriers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v9;
      v53 = 2114;
      v54 = v10;
      v55 = 2114;
      v56 = v11;
      v57 = 2114;
      v58 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Qualification check failed for carrier(s) %{public}@. Error: %{public}@.", buf, 0x2Au);

    }
    v13 = 0;
    *a2 = objc_retainAutorelease(v6);
  }
  else if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_hasOffersLimitedByAllowedServiceIdentifiers:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v14, "resultWithError:", &v49);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v49;

    if (v16)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v47 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "msisdn");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v52 = v19;
        v53 = 2114;
        v54 = v20;
        v55 = 2114;
        v56 = v21;
        v57 = 2114;
        v58 = v22;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to check offers for msisdn %{public}@. Error: %{public}@.", buf, 0x2Au);

        v15 = v47;
      }

      v13 = 0;
      *a2 = objc_retainAutorelease(v16);
    }
    else if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers:", *(_QWORD *)(a1 + 40));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v29 = objc_msgSend(v28, "resultWithError:", &v48);
      v30 = v48;

      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v30)
      {
        if (!v31)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v32, "OSLogObject");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = objc_opt_class();
          AMSLogKey();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v30);
          v36 = v15;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v34;
          v53 = 2114;
          v54 = v35;
          v55 = 2114;
          v56 = v37;
          _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Registration failed. Error: %{public}@.", buf, 0x20u);

          v15 = v36;
          v16 = 0;

        }
        v13 = 0;
        *a2 = objc_retainAutorelease(v30);
      }
      else
      {
        if (!v31)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v32, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = objc_opt_class();
          AMSLogKey();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v44;
          v53 = 2114;
          v54 = v45;
          v55 = 1024;
          LODWORD(v56) = v29;
          _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration succeeded: %d", buf, 0x1Cu);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        AMSLogKey();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "msisdn");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v40;
        v53 = 2114;
        v54 = v41;
        v55 = 2114;
        v56 = v42;
        _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offers for msisdn %{public}@", buf, 0x20u);

      }
      v13 = (void *)MEMORY[0x1E0C9AAA0];
    }

  }
  else
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      objc_msgSend(*(id *)(a1 + 32), "carriers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v25;
      v53 = 2114;
      v54 = v26;
      v55 = 2114;
      v56 = v27;
      _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Carrier(s) do not qualify: %{public}@", buf, 0x20u);

    }
    v13 = (void *)MEMORY[0x1E0C9AAA0];
  }

  return v13;
}

- (id)_checkOffersRequestLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[AMSCarrierOfferRegistrationTask checkOfferRequestEncoder](self, "checkOfferRequestEncoder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestEncoding:", 3);

  -[AMSCarrierOfferRegistrationTask clientInfo](self, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierOfferRegistrationTask checkOfferRequestEncoder](self, "checkOfferRequestEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientInfo:", v6);

  -[AMSCarrierOfferRegistrationTask _checkOffersBodyLimitedByAllowedServiceIdentifiers:](self, "_checkOffersBodyLimitedByAllowedServiceIdentifiers:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSCarrierOfferRegistrationTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForKey:", 0x1E254C6E0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSCarrierOfferRegistrationTask checkOfferRequestEncoder](self, "checkOfferRequestEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithMethod:bagURL:parameters:", 4, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_hasOffersLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  -[AMSCarrierOfferRegistrationTask urlSession](self, "urlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierOfferRegistrationTask _checkOffersRequestLimitedByAllowedServiceIdentifiers:](self, "_checkOffersRequestLimitedByAllowedServiceIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataTaskPromiseWithRequestPromise:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__AMSCarrierOfferRegistrationTask__hasOffersLimitedByAllowedServiceIdentifiers___block_invoke;
  v10[3] = &unk_1E253E418;
  v10[4] = self;
  objc_msgSend(v7, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __80__AMSCarrierOfferRegistrationTask__hasOffersLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_parseCheckOffersResult:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_includesAllowedCarrier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  AMSCarrierOfferRegistrationTask *v12;

  v3 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", 0x1E254C760);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__AMSCarrierOfferRegistrationTask__includesAllowedCarrier__block_invoke;
  v10[3] = &unk_1E253DCA0;
  v7 = v3;
  v11 = v7;
  v12 = self;
  objc_msgSend(v6, "addFinishBlock:", v10);

  v8 = v7;
  return v8;
}

void __58__AMSCarrierOfferRegistrationTask__includesAllowedCarrier__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    if (a2)
      v4 = a2;
    else
      v4 = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "carriers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "intersectsSet:", v5);
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      v16 = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 1024;
      v21 = v9;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Qualification result: %i", (uint8_t *)&v16, 0x1Cu);

    }
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithResult:", v15);

  }
}

- (id)_checkOffersBodyLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask msisdn](self, "msisdn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("msisdn"));

  objc_msgSend(v4, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("validLobs"));
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (id)_pacToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask pacTokenPromise](self, "pacTokenPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak((id *)location, self);
    -[AMSCarrierOfferRegistrationTask pacTokenPromise](self, "pacTokenPromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__AMSCarrierOfferRegistrationTask__pacToken__block_invoke;
    v12[3] = &unk_1E253FF90;
    objc_copyWeak(&v14, (id *)location);
    v13 = v3;
    objc_msgSend(v5, "addFinishBlock:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v8;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No PAC token available", location, 0x16u);

    }
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v10);

  }
  return v3;
}

void __44__AMSCarrierOfferRegistrationTask__pacToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not retrieve PAC. Error: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    v13 = *(void **)(a1 + 32);
    +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
  objc_msgSend(v13, "finishWithResult:", v14);

}

- (id)_parseCheckOffersResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("msisdnsWithOffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSCarrierOfferRegistrationTask msisdn](self, "msisdn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v7, "containsObject:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_registrationBodyLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask msisdn](self, "msisdn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("msisdn"));

  -[AMSCarrierOfferRegistrationTask deviceGUID](self, "deviceGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("guid"));

  objc_msgSend(v4, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("lobs"));
  -[AMSCarrierOfferRegistrationTask _pacToken](self, "_pacToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__AMSCarrierOfferRegistrationTask__registrationBodyLimitedByAllowedServiceIdentifiers___block_invoke;
  v14[3] = &unk_1E253FFB8;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

AMSPromise *__87__AMSCarrierOfferRegistrationTask__registrationBodyLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("pac"));

  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)_registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask urlSession](self, "urlSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierOfferRegistrationTask _registrationRequestLimitedByAllowedServiceIdentifiers:](self, "_registrationRequestLimitedByAllowedServiceIdentifiers:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataTaskPromiseWithRequestPromise:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__AMSCarrierOfferRegistrationTask__registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers___block_invoke;
  v11[3] = &unk_1E253FFE0;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v8, "addFinishBlock:", v11);

  return v9;
}

uint64_t __101__AMSCarrierOfferRegistrationTask__registerCarrierOffersToAccountLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithSuccess");
}

- (id)_evaluationRequiredPrivacyMappingPair
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  -[AMSCarrierOfferRegistrationTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", 0x1E254C740);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AMSCarrierOfferRegistrationTask__evaluationRequiredPrivacyMappingPair__block_invoke;
  v9[3] = &unk_1E2540008;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "addFinishBlock:", v9);

  return v7;
}

void __72__AMSCarrierOfferRegistrationTask__evaluationRequiredPrivacyMappingPair__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AMSPair *v9;
  void *v10;
  AMSPair *v11;
  void *v12;
  id v13;
  AMSPair *v14;
  AMSPair *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "code");
    v8 = *(void **)(a1 + 32);
    if (v7 != 204)
    {
      objc_msgSend(v8, "finishWithError:", v6);
      goto LABEL_7;
    }
    v9 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v14 = [AMSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v12 = v10;
    v13 = v16;
  }
  v15 = -[AMSPair initWithFirst:second:](v11, "initWithFirst:second:", v12, v13);
  objc_msgSend(v8, "finishWithResult:", v15);

LABEL_7:
}

- (id)_allowedServiceIdentifiersFromPrivacyMapping:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[AMSCarrierOfferRegistrationTask privacyMappingResolver](self, "privacyMappingResolver");
  -[AMSCarrierOfferRegistrationTask account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class allowedIdentifiersFrom:forAccount:](v5, "allowedIdentifiersFrom:forAccount:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_registrationRequestLimitedByAllowedServiceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  -[AMSCarrierOfferRegistrationTask registrationRequestEncoder](self, "registrationRequestEncoder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestEncoding:", 3);

  -[AMSCarrierOfferRegistrationTask account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierOfferRegistrationTask registrationRequestEncoder](self, "registrationRequestEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccount:", v6);

  -[AMSCarrierOfferRegistrationTask clientInfo](self, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCarrierOfferRegistrationTask registrationRequestEncoder](self, "registrationRequestEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClientInfo:", v8);

  -[AMSCarrierOfferRegistrationTask _registrationBodyLimitedByAllowedServiceIdentifiers:](self, "_registrationBodyLimitedByAllowedServiceIdentifiers:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__AMSCarrierOfferRegistrationTask__registrationRequestLimitedByAllowedServiceIdentifiers___block_invoke;
  v13[3] = &unk_1E2540030;
  v13[4] = self;
  objc_msgSend(v10, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __90__AMSCarrierOfferRegistrationTask__registrationRequestLimitedByAllowedServiceIdentifiers___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "URLForKey:", 0x1E254C720);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "registrationRequestEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithMethod:bagURL:parameters:", 4, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)invalidParameterError:(id)a3
{
  return AMSError(2, CFSTR("Cannot perform carrier offer registration"), a3, 0);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_5 != -1)
    dispatch_once(&_MergedGlobals_1_5, &__block_literal_global_52);
  return (NSString *)(id)qword_1ECEACAB8;
}

void __48__AMSCarrierOfferRegistrationTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACAB8;
  qword_1ECEACAB8 = (uint64_t)CFSTR("AMSCarrierOfferRegistrationTask");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACAC0 != -1)
    dispatch_once(&qword_1ECEACAC0, &__block_literal_global_55_0);
  return (NSString *)(id)qword_1ECEACAC8;
}

void __55__AMSCarrierOfferRegistrationTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACAC8;
  qword_1ECEACAC8 = (uint64_t)CFSTR("1");

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

- (NSArray)carriers
{
  return self->_carriers;
}

- (AMSURLRequestEncoder)checkOfferRequestEncoder
{
  return self->_checkOfferRequestEncoder;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)msisdn
{
  return self->_msisdn;
}

- (AMSURLRequestEncoder)registrationRequestEncoder
{
  return self->_registrationRequestEncoder;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (AMSPromise)pacTokenPromise
{
  return self->_pacTokenPromise;
}

- (Class)privacyMappingResolver
{
  return self->_privacyMappingResolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyMappingResolver, 0);
  objc_storeStrong((id *)&self->_pacTokenPromise, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_registrationRequestEncoder, 0);
  objc_storeStrong((id *)&self->_msisdn, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_checkOfferRequestEncoder, 0);
  objc_storeStrong((id *)&self->_carriers, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
