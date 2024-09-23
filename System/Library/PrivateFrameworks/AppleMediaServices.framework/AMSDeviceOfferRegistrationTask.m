@implementation AMSDeviceOfferRegistrationTask

- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AMSDeviceOffersStore *v10;
  void *v11;
  AMSDeviceOfferEligibilityTask *v12;
  AMSDeviceOfferRegistrationPrivacyValidator *v13;
  void *v14;
  AMSDeviceOfferRegistrationTask *v15;

  v6 = a4;
  v7 = a3;
  +[AMSDevice serialNumber](AMSDevice, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(AMSDeviceOffersStore);
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSDeviceOfferEligibilityTask initWithBag:deviceGUID:masterSerialNumber:urlSession:]([AMSDeviceOfferEligibilityTask alloc], "initWithBag:deviceGUID:masterSerialNumber:urlSession:", v6, v9, v8, v11);
  v13 = -[AMSDeviceOfferRegistrationPrivacyValidator initWithAccount:]([AMSDeviceOfferRegistrationPrivacyValidator alloc], "initWithAccount:", v7);
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSDeviceOfferRegistrationTask initWithAccount:bag:deviceGUID:deviceOffersStore:eligibilityTask:masterSerialNumber:privacyValidator:urlSession:](self, "initWithAccount:bag:deviceGUID:deviceOffersStore:eligibilityTask:masterSerialNumber:privacyValidator:urlSession:", v7, v6, v9, v10, v12, v8, v13, v14);

  return v15;
}

- (AMSDeviceOfferRegistrationTask)initWithAccount:(id)a3 bag:(id)a4 deviceGUID:(id)a5 deviceOffersStore:(id)a6 eligibilityTask:(id)a7 masterSerialNumber:(id)a8 privacyValidator:(id)a9 urlSession:(id)a10
{
  id v17;
  id v18;
  AMSDeviceOfferRegistrationTask *v19;
  AMSDeviceOfferRegistrationTask *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v17 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v22 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AMSDeviceOfferRegistrationTask;
  v19 = -[AMSTask init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_account, a3);
    objc_storeStrong((id *)&v20->_bag, a4);
    objc_storeStrong((id *)&v20->_deviceGUID, a5);
    objc_storeStrong((id *)&v20->_deviceOffersStore, a6);
    objc_storeStrong((id *)&v20->_eligibilityTask, a7);
    objc_storeStrong((id *)&v20->_masterSerialNumber, a8);
    objc_storeStrong((id *)&v20->_privacyValidator, a9);
    objc_storeStrong((id *)&v20->_urlSession, a10);
  }

  return v20;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AMSDeviceOfferRegistrationTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__AMSDeviceOfferRegistrationTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "masterSerialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
      v40 = 138543618;
      v41 = v13;
      v42 = 2114;
      v43 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Registration cannot be performed: Missing serial number. Check entitlements", (uint8_t *)&v40, 0x16u);

    }
    v9 = CFSTR("Invalid Parameter");
    v10 = CFSTR("No serial number found for primary/master device");
    v15 = 2;
    goto LABEL_31;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_isRegistrationAllowed") & 1) == 0)
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
      v40 = 138543618;
      v41 = v18;
      v42 = 2114;
      v43 = v19;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration temporarily disabled", (uint8_t *)&v40, 0x16u);

    }
    v9 = CFSTR("Action Denied");
    v10 = CFSTR("Registration is temporarily disabled");
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(a1 + 32), "registrationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isDeviceGroupRegistrationAllowed");

    if ((v4 & 1) == 0)
    {
      +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
        v40 = 138543618;
        v41 = v7;
        v42 = 2114;
        v43 = v8;
        _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration temporarily disabled for task with device groups", (uint8_t *)&v40, 0x16u);

      }
      v9 = CFSTR("Action Denied");
      v10 = CFSTR("Registration is temporarily disabled for device group calls");
LABEL_30:
      v15 = 11;
LABEL_31:
      AMSError(v15, v9, v10, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v23);
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v25 = (void *)v30;
      goto LABEL_33;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "privacyValidator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "canMasterDevicePerformRegistration");

  if ((v21 & 1) == 0)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v28;
      v42 = 2114;
      v43 = v29;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Master device failed GDPR validation", (uint8_t *)&v40, 0x16u);

    }
    v9 = CFSTR("Action Denied");
    v10 = CFSTR("Master device lacks necessary GDPR acknowledgments");
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(a1 + 32), "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    AMSError(2, CFSTR("Invalid Parameter"), CFSTR("No account specified for registering device offers"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    goto LABEL_33;
  }
  v23 = v22;
  if (!objc_msgSend(v22, "ams_isLocalAccount"))
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_opt_class();
      AMSLogKey();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543874;
      v41 = v35;
      v42 = 2114;
      v43 = v36;
      v44 = 2114;
      v45 = v37;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting device offer registration task. account = %{public}@", (uint8_t *)&v40, 0x20u);

    }
    v38 = objc_msgSend(*(id *)(a1 + 32), "lightweightCheckOnly");
    v39 = *(void **)(a1 + 32);
    if (v38)
      objc_msgSend(v39, "_performLightweightRequestWithAccount:", v23);
    else
      objc_msgSend(v39, "_performRegistrationRequestWithAccount:", v23);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  AMSError(2, CFSTR("Invalid Parameter"), CFSTR("We cannot use the local account to register and retrive device offers."), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v25;
}

- (id)_performLightweightRequestWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[AMSDeviceOfferRegistrationTask _lightweightDeviceOffersURL](self, "_lightweightDeviceOffersURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask _registrationRequestEncoderWithAccount:](self, "_registrationRequestEncoderWithAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDeviceOfferRegistrationTask _urlRequestWithBagURL:](self, "_urlRequestWithBagURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke;
  v16[3] = &unk_1E2541138;
  v17 = v6;
  v9 = v6;
  objc_msgSend(v7, "thenWithBlock:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke_2;
  v15[3] = &unk_1E253DB08;
  v15[4] = self;
  objc_msgSend(v10, "thenWithBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask _sanitizedResultPromise:](self, "_sanitizedResultPromise:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask _handleRegistrationResult:](self, "_handleRegistrationResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(*(id *)(a1 + 32), "requestByEncodingRequest:parameters:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__AMSDeviceOfferRegistrationTask__performLightweightRequestWithAccount___block_invoke_2(uint64_t a1, void *a2)
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
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network component of registration request", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "urlSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataTaskPromiseWithRequest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_performRegistrationRequestWithAccount:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  AMSDeviceOfferRegistrationTask *v69;
  _QWORD v70[5];
  _QWORD v71[5];
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSDeviceOfferRegistrationTask _latestDeviceGroups](self, "_latestDeviceGroups");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask _filteredRegistrationGroups:](self, "_filteredRegistrationGroups:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)v5;
  objc_msgSend(v7, "setCachedRegistrationGroups:", v5);

  v8 = (void *)MEMORY[0x1E0C99E20];
  -[AMSDeviceOfferRegistrationTask _serialNumberDenyList](self, "_serialNumberDenyList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDeviceOfferRegistrationTask _eligibilityQualifiedRegistrationGroupsWithAccount:pendingRegistrationGroups:](self, "_eligibilityQualifiedRegistrationGroupsWithAccount:pendingRegistrationGroups:", v4, v6);
  v78 = 0;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "resultWithError:", &v78);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v11;
  v65 = v78;
  v62 = v6;
  if (v65)
  {
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v65);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v81 = v14;
      v82 = 2114;
      v83 = v15;
      v84 = 2114;
      v85 = v16;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine qualifying device groups. Proceeding with registration without groups. Error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v12 = v6;
    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v75 != v19)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "registrationItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ams_mapWithTransform:", &__block_literal_global_42);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v22);

        }
        v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v18);
      v11 = v64;
    }
  }

  -[AMSDeviceOfferRegistrationTask _companionSerialNumbers](self, "_companionSerialNumbers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v4;
  v57 = v23;
  if (-[AMSDeviceOfferRegistrationTask ignoreRegistrationDenyList](self, "ignoreRegistrationDenyList")
    || objc_msgSend(v11, "count")
    || objc_msgSend(v23, "count")
    || (-[AMSDeviceOfferRegistrationTask masterSerialNumber](self, "masterSerialNumber"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v10, "containsObject:", v24),
        v24,
        !v25))
  {
    -[AMSDeviceOfferRegistrationTask _deviceOffersURL](self, "_deviceOffersURL");
    v30 = objc_claimAutoreleasedReturnValue();
    -[AMSDeviceOfferRegistrationTask _registrationRequestEncoderWithAccount:](self, "_registrationRequestEncoderWithAccount:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v30;
    -[AMSDeviceOfferRegistrationTask _urlRequestWithBagURL:](self, "_urlRequestWithBagURL:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDeviceOfferRegistrationTask _registrationEndpointPOSTParametersWithRegistrationGroups:companionSerialNumbers:](self, "_registrationEndpointPOSTParametersWithRegistrationGroups:companionSerialNumbers:", v11, v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v34, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_opt_class();
      AMSLogKey();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v36;
      v82 = 2114;
      v83 = v37;
      _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration parameters generated.", buf, 0x16u);

    }
    v38 = MEMORY[0x1E0C809B0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_54;
    v71[3] = &unk_1E2541180;
    v71[4] = self;
    v72 = v31;
    v73 = v33;
    v39 = v33;
    v56 = v31;
    v40 = v32;
    objc_msgSend(v32, "thenWithBlock:", v71);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v38;
    v70[1] = 3221225472;
    v70[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_57;
    v70[3] = &unk_1E253DB08;
    v70[4] = self;
    objc_msgSend(v41, "thenWithBlock:", v70);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDeviceOfferRegistrationTask _sanitizedResultPromise:](self, "_sanitizedResultPromise:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v38;
    v66[1] = 3221225472;
    v66[2] = __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_58;
    v66[3] = &unk_1E25411A8;
    v67 = v57;
    v68 = v10;
    v69 = self;
    objc_msgSend(v43, "addSuccessBlock:", v66);
    -[AMSDeviceOfferRegistrationTask _handleRegistrationResult:](self, "_handleRegistrationResult:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v57;
    v45 = v58;
    v46 = v60;
    v28 = v62;
    v11 = v64;
  }
  else
  {
    +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v62;
    if (v26)
      v29 = v26;
    else
      v29 = (id)objc_opt_new();
    v48 = v29;

    v59 = v48;
    objc_msgSend(v48, "allObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ams_mapWithTransform:", &__block_literal_global_50);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "OSLogObject");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = objc_opt_class();
      AMSLogKey();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v81 = v52;
      v82 = 2114;
      v83 = v53;
      v84 = 2114;
      v85 = v40;
      _os_log_impl(&dword_18C849000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] All device groups, companions, and master are registered. Returning cached offers: %{public}@", buf, 0x20u);

      v23 = v57;
    }

    -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDeviceRegistrationDenyList:", v55);

    v45 = v59;
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v59);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v60;
  }

  return v44;
}

uint64_t __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialNumber");
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Building registration request.", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "ams_addRequestTimestampHeader");
  objc_msgSend(*(id *)(a1 + 40), "requestByEncodingRequest:parameters:", v3, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_57(uint64_t a1, void *a2)
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
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network component of registration request", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "urlSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataTaskPromiseWithRequest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __73__AMSDeviceOfferRegistrationTask__performRegistrationRequestWithAccount___block_invoke_58(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "masterSerialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 48), "deviceOffersStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceRegistrationDenyList:", v4);

}

- (id)_registrationEndpointPOSTCompanionBodyWithDeviceGroups:(id)a3 companionSerialNumbers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[AMSDeviceOfferRegistrationTask _registrationEndpointPOSTDeviceGroupsBody:](self, "_registrationEndpointPOSTDeviceGroupsBody:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_61_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addObjectsFromArray:", v7);
  objc_msgSend(v9, "addObjectsFromArray:", v8);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

id __112__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTCompanionBodyWithDeviceGroups_companionSerialNumbers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("serialNumber");
  v7[0] = a2;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_registrationEndpointPOSTDeviceGroupsBody:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_65);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __76__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTDeviceGroupsBody___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "registrationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_68_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceGroup"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

id __76__AMSDeviceOfferRegistrationTask__registrationEndpointPOSTDeviceGroupsBody___block_invoke_2(uint64_t a1, void *a2)
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

- (id)_registrationEndpointPOSTParametersWithRegistrationGroups:(id)a3 companionSerialNumbers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSDeviceOfferRegistrationTask deviceGUID](self, "deviceGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("guid"));
  -[AMSDeviceOfferRegistrationTask masterSerialNumber](self, "masterSerialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("serialNumber"));
  -[AMSDeviceOfferRegistrationTask _registrationEndpointPOSTCompanionBodyWithDeviceGroups:companionSerialNumbers:](self, "_registrationEndpointPOSTCompanionBodyWithDeviceGroups:companionSerialNumbers:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("companionDevices"));

  -[AMSDeviceOfferRegistrationTask offerIdentifiers](self, "offerIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13)
  {
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v10;
      v17 = v9;
      v18 = v7;
      v19 = v6;
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOfferRegistrationTask offerIdentifiers](self, "offerIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v6 = v19;
      v7 = v18;
      v9 = v17;
      v10 = v31;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v22;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Offer identifiers were specified for request: %{public}@", buf, 0x20u);

    }
    -[AMSDeviceOfferRegistrationTask offerIdentifiers](self, "offerIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortedArrayUsingDescriptors:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("services"));
  }
  else
  {
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v27;
      v35 = 2114;
      v36 = v28;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No offer identifiers were specified for the request.", buf, 0x16u);

    }
  }

  v29 = (void *)objc_msgSend(v8, "copy");
  return v29;
}

- (id)_accountEligibleSerialsFromDeviceOffers:(id)a3 accountOffers:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  _UNKNOWN **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_74);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v30 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v11;
    v40 = 2114;
    v41 = v12;
    v42 = 2114;
    v43 = v30;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Matching serials to offers. Eligible identifiers: %{public}@.", buf, 0x20u);

    v8 = v30;
  }

  v31 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v15 = &off_1E2519000;
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v34;
    *(_QWORD *)&v14 = 138543874;
    v29 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v19, "offerIdentifier", v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && objc_msgSend(v8, "containsObject:", v20))
        {
          objc_msgSend(v15[274], "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            objc_msgSend(v15[274], "sharedConfig");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v21, "OSLogObject");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_opt_class();
            AMSLogKey();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "serialNumbers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v39 = v23;
            v8 = v30;
            v40 = 2114;
            v41 = v24;
            v42 = 2114;
            v43 = v25;
            _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Adding serials: %{public}@.", buf, 0x20u);

            v15 = &off_1E2519000;
          }

          objc_msgSend(v19, "serialNumbers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "unionSet:", v26);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  v27 = (void *)objc_msgSend(v31, "copy");
  return v27;
}

uint64_t __88__AMSDeviceOfferRegistrationTask__accountEligibleSerialsFromDeviceOffers_accountOffers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offerIdentifier");
}

- (id)_filteredRegistrationGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  -[AMSDeviceOfferRegistrationTask _serialNumberDenyList](self, "_serialNumberDenyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedRegistrationGroups");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v6, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke;
  v16[3] = &unk_1E2541238;
  v16[4] = self;
  v17 = v11;
  v18 = v5;
  v12 = v5;
  v13 = v11;
  objc_msgSend(v4, "ams_filterUsingTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543874;
    v30 = v6;
    v31 = 2114;
    v32 = v7;
    v33 = 2114;
    v34 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking privacy requirements for: %{public}@.", buf, 0x20u);

  }
  objc_msgSend(a1[4], "privacyValidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPrivacyRequirementMetForOptions:", objc_msgSend(v3, "validationOptions"));

  if ((v9 & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v33 = 2114;
      v34 = v3;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Privacy requirement not met for: %{public}@", buf, 0x20u);

    }
    v21 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend(a1[5], "containsObject:", v3) && a1[6])
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
      v14 = a1[6];
      *(_DWORD *)buf = 138544130;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      v33 = 2114;
      v34 = v3;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking denylist for: %{public}@. Denylist: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(v3, "registrationItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke_75;
    v27[3] = &unk_1E2541210;
    v28 = a1[6];
    v16 = objc_msgSend(v15, "ams_allWithTest:", v27);

    if (v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v19;
        v31 = 2114;
        v32 = v20;
        v33 = 2114;
        v34 = v3;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Group not eligible: %{public}@", buf, 0x20u);

      }
      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
    v22 = v28;
LABEL_26:

    goto LABEL_27;
  }
  v21 = 1;
LABEL_27:

  return v21;
}

uint64_t __62__AMSDeviceOfferRegistrationTask__filteredRegistrationGroups___block_invoke_75(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_companionSerialNumbers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "companionSerialNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSDeviceOfferRegistrationTask _serialNumberDenyList](self, "_serialNumberDenyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__AMSDeviceOfferRegistrationTask__companionSerialNumbers__block_invoke;
    v9[3] = &unk_1E253D348;
    v10 = v5;
    objc_msgSend(v4, "ams_filterUsingTest:", v9);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

uint64_t __57__AMSDeviceOfferRegistrationTask__companionSerialNumbers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_serialNumberDenyList
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AMSDeviceOfferRegistrationTask ignoreRegistrationDenyList](self, "ignoreRegistrationDenyList"))
  {
    v3 = 0;
  }
  else
  {
    -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceRegistrationDenyList");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_eligibilityQualifiedRegistrationGroupsWithAccount:(id)a3 pendingRegistrationGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  _QWORD v24[5];
  id v25;
  _BYTE *v26;
  _QWORD v27[5];
  id v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[AMSDeviceOfferRegistrationTask _isEligibilityCallsAllowed](self, "_isEligibilityCallsAllowed"))
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v31 = __Block_byref_object_copy__26;
      v32 = __Block_byref_object_dispose__26;
      v33 = (id)MEMORY[0x1E0C9AA60];
      -[AMSDeviceOfferRegistrationTask eligibilityTask](self, "eligibilityTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDeviceOfferRegistrationTask clientInfo](self, "clientInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performAnonymousDeviceEligibility:clientInfo:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke;
      v27[3] = &unk_1E2541260;
      v27[4] = self;
      v29 = buf;
      v28 = v6;
      objc_msgSend(v10, "thenWithBlock:", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke_82;
      v24[3] = &unk_1E2541260;
      v24[4] = self;
      v26 = buf;
      v25 = v7;
      objc_msgSend(v12, "thenWithBlock:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(buf, 8);
    }
    else
    {
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
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - No valid device groups, skipping group eligibility checks", buf, 0x16u);

      }
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AA60]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
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
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Eligibility calls disabled", buf, 0x16u);

    }
    AMSError(11, CFSTR("Action Denied"), CFSTR("Eligibility is temporarily disabled"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    v17 = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - Device offers retrieved from anonymous device eligibility@", (uint8_t *)&v17, 0x16u);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;
  v10 = v3;

  objc_msgSend(*(id *)(a1 + 32), "eligibilityTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performAccountEligibility:forOffers:clientInfo:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __111__AMSDeviceOfferRegistrationTask__eligibilityQualifiedRegistrationGroupsWithAccount_pendingRegistrationGroups___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration Request - Account eligibility complete@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_accountEligibleSerialsFromDeviceOffers:accountOffers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_registrationGroupsFrom:matching:", *(_QWORD *)(a1 + 40), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_registrationGroupsFrom:(id)a3 matching:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke;
  v9[3] = &unk_1E2541288;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "ams_filterUsingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "registrationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke_2;
  v6[3] = &unk_1E2541210;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ams_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

uint64_t __67__AMSDeviceOfferRegistrationTask__registrationGroupsFrom_matching___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_latestDeviceGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[AMSDeviceOfferRegistrationTask registrationGroups](self, "registrationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    -[AMSDeviceOfferRegistrationTask registrationGroups](self, "registrationGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedRegistrationGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke;
    v12[3] = &unk_1E2541288;
    v12[4] = self;
    objc_msgSend(v8, "ams_filterUsingTest:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v6, "addObjectsFromArray:", v9);
    objc_msgSend(v6, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedRegistrationGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "registrationGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke_2;
  v8[3] = &unk_1E2541288;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "ams_anyWithTest:", v8);

  return v6 ^ 1u;
}

uint64_t __53__AMSDeviceOfferRegistrationTask__latestDeviceGroups__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isModifiedVersionOfGroup:", *(_QWORD *)(a1 + 32));
}

- (id)_bucketedOffers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offerIdentifier"), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v13 = (void *)objc_opt_new();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)_handleRegistrationResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;
  _QWORD v15[4];
  id v16;
  AMSDeviceOfferRegistrationTask *v17;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke;
  v15[3] = &unk_1E253D950;
  v7 = v5;
  v16 = v7;
  v17 = self;
  objc_msgSend(v4, "addErrorBlock:", v15);
  objc_initWeak(&location, self);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_86;
  v11[3] = &unk_1E25412D8;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v9;
}

void __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Device offers registration failed: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

id __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_86(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[5];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
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
    *(_DWORD *)buf = 138543618;
    v32 = v6;
    v33 = 2114;
    v34 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registration response received.", buf, 0x16u);

  }
  v8 = AMSSetLogKey(a1[5]);
  objc_msgSend(v3, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_89;
  v30[3] = &unk_1E25412B0;
  v30[4] = a1[4];
  objc_msgSend(v12, "ams_mapWithTransform:", v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  +[AMSLogConfig sharedPrivacyConfig](AMSLogConfig, "sharedPrivacyConfig");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14)
  {
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained(a1 + 6);
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v19;
      v33 = 2114;
      v34 = v20;
      v35 = 2114;
      v36 = v13;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Device offers retrieved from server: %{public}@", buf, 0x20u);

    }
    objc_msgSend(a1[4], "_updateWithDeviceOffers:", v13);
  }
  else
  {
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_loadWeakRetained(a1 + 6);
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No device offers retrieved from server. Offers may exist locally.", buf, 0x16u);

    }
  }
  +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = v25;
  else
    v27 = MEMORY[0x1E0C9AA60];
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id __60__AMSDeviceOfferRegistrationTask__handleRegistrationResult___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v3;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ams_DSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("dsid"));

      v6 = v5;
    }
  }
  v11 = v6;

  return v11;
}

- (id)_latestOffersWithFetchedDeviceOffers:(id)a3 offersStore:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AMSDeviceOfferRegistrationTask offerIdentifiers](self, "offerIdentifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[AMSDeviceOfferRegistrationTask offerIdentifiers](self, "offerIdentifiers"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    v12 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v7, "deviceOffers");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = MEMORY[0x1E0C9AA60];
    -[AMSDeviceOfferRegistrationTask _bucketedOffers:](self, "_bucketedOffers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSDeviceOfferRegistrationTask _bucketedOffers:](self, "_bucketedOffers:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v21);
    }

    v26 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v17, "allValues", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v26, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v29);
    }

    v32 = (id)objc_msgSend(v26, "copy");
  }
  else
  {
    v32 = v6;
  }

  return v32;
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
  v10[2] = __59__AMSDeviceOfferRegistrationTask__offersDecodedFromResult___block_invoke;
  v10[3] = &unk_1E2541080;
  v10[4] = self;
  objc_msgSend(v7, "ams_mapWithTransform:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

AMSDeviceOffer *__59__AMSDeviceOfferRegistrationTask__offersDecodedFromResult___block_invoke(uint64_t a1, void *a2)
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

- (id)_sanitizedResultPromise:(id)a3
{
  return (id)objc_msgSend(a3, "thenWithBlock:", &__block_literal_global_96);
}

id __58__AMSDeviceOfferRegistrationTask__sanitizedResultPromise___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_8:
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Promise finished with server error code %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AMSError(0, CFSTR("Registration task failure"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (void)_updateWithDeviceOffers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[AMSDeviceOfferRegistrationTask account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:logKey:](AMSDevice, "tearDownAllDeviceOfferFollowUpsForAccount:logKey:", v5, v6);

  -[AMSDeviceOfferRegistrationTask deviceOffersStore](self, "deviceOffersStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask _latestOffersWithFetchedDeviceOffers:offersStore:](self, "_latestOffersWithFetchedDeviceOffers:offersStore:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSDevice saveDeviceOffers:](AMSDevice, "saveDeviceOffers:", v8);
  -[AMSDeviceOfferRegistrationTask account](self, "account");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDevice postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:](AMSDevice, "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:", v11, 0, v9, v10);

}

- (BOOL)_isRegistrationAllowed
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", 0x1E254C8A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("3")) ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (BOOL)_isEligibilityCallsAllowed
{
  void *v2;
  void *v3;
  void *v4;

  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", 0x1E254C8A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == 0;
}

- (BOOL)_isDeviceGroupRegistrationAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", 0x1E254C8A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] DISABLE STATE %{public}@", (uint8_t *)&v12, 0x20u);

  }
  if (v5)
  {
    if (-[AMSDeviceOfferRegistrationTask _isRegistrationAllowed](self, "_isRegistrationAllowed"))
      v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("2")) ^ 1;
    else
      LOBYTE(v10) = 0;
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (id)_lightweightDeviceOffersURL
{
  void *v2;
  void *v3;

  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", 0x1E254C8E0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_deviceOffersURL
{
  void *v2;
  void *v3;

  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", 0x1E254C880);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_urlRequestWithBagURL:(id)a3
{
  id v3;
  AMSMutablePromise *v4;
  AMSMutablePromise *v5;
  void *v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(AMSMutablePromise);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__AMSDeviceOfferRegistrationTask__urlRequestWithBagURL___block_invoke;
    v8[3] = &unk_1E2541340;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "valueWithCompletion:", v8);

  }
  else
  {
    AMSError(2, CFSTR("URL Request could not be created"), CFSTR("bagURL is nil"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v5 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __56__AMSDeviceOfferRegistrationTask__urlRequestWithBagURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);

  }
}

- (id)_registrationRequestEncoderWithAccount:(id)a3
{
  id v4;
  AMSURLRequestEncoder *v5;
  void *v6;
  AMSURLRequestEncoder *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [AMSURLRequestEncoder alloc];
  -[AMSDeviceOfferRegistrationTask bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSURLRequestEncoder initWithBag:](v5, "initWithBag:", v6);

  -[AMSURLRequestEncoder setRequestEncoding:](v7, "setRequestEncoding:", 2);
  -[AMSURLRequestEncoder setAccount:](v7, "setAccount:", v4);

  -[AMSURLRequestEncoder setDialogOptions:](v7, "setDialogOptions:", 1);
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v7, "setLogUUID:", v8);

  -[AMSURLRequestEncoder setEnableRemoteSecuritySigning:](v7, "setEnableRemoteSecuritySigning:", 1);
  -[AMSDeviceOfferRegistrationTask clientInfo](self, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSDeviceOfferRegistrationTask clientInfo](self, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setClientInfo:](v7, "setClientInfo:", v10);

  }
  return v7;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_7 != -1)
    dispatch_once(&_MergedGlobals_1_7, &__block_literal_global_113);
  return (NSString *)(id)qword_1ECEACAF8;
}

void __47__AMSDeviceOfferRegistrationTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACAF8;
  qword_1ECEACAF8 = (uint64_t)CFSTR("AMSDeviceOfferRegistrationTask");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACB00 != -1)
    dispatch_once(&qword_1ECEACB00, &__block_literal_global_116_0);
  return (NSString *)(id)qword_1ECEACB08;
}

void __54__AMSDeviceOfferRegistrationTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB08;
  qword_1ECEACB08 = (uint64_t)CFSTR("1");

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

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSSet)offerIdentifiers
{
  return self->_offerIdentifiers;
}

- (void)setOfferIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_offerIdentifiers, a3);
}

- (NSArray)registrationGroups
{
  return self->_registrationGroups;
}

- (void)setRegistrationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_registrationGroups, a3);
}

- (AMSDeviceOfferEligibilityTask)eligibilityTask
{
  return self->_eligibilityTask;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSString)masterSerialNumber
{
  return self->_masterSerialNumber;
}

- (AMSDeviceOffersTracking)deviceOffersStore
{
  return self->_deviceOffersStore;
}

- (AMSDeviceOfferRegistrationPrivacyValidator)privacyValidator
{
  return self->_privacyValidator;
}

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (BOOL)ignoreRegistrationDenyList
{
  return self->_ignoreRegistrationDenyList;
}

- (void)setIgnoreRegistrationDenyList:(BOOL)a3
{
  self->_ignoreRegistrationDenyList = a3;
}

- (BOOL)lightweightCheckOnly
{
  return self->_lightweightCheckOnly;
}

- (void)setLightweightCheckOnly:(BOOL)a3
{
  self->_lightweightCheckOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_privacyValidator, 0);
  objc_storeStrong((id *)&self->_deviceOffersStore, 0);
  objc_storeStrong((id *)&self->_masterSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_eligibilityTask, 0);
  objc_storeStrong((id *)&self->_registrationGroups, 0);
  objc_storeStrong((id *)&self->_offerIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
