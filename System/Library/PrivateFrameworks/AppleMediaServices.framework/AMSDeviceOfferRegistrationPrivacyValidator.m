@implementation AMSDeviceOfferRegistrationPrivacyValidator

- (AMSDeviceOfferRegistrationPrivacyValidator)initWithAccount:(id)a3
{
  id v5;
  AMSDeviceOfferRegistrationPrivacyValidator *v6;
  AMSDeviceOfferRegistrationPrivacyValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeviceOfferRegistrationPrivacyValidator;
  v6 = -[AMSDeviceOfferRegistrationPrivacyValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (BOOL)canMasterDevicePerformRegistration
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_masterEligibilityPrivacyOptionsIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[AMSDeviceOfferRegistrationPrivacyValidator account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "_isPrivacyAcknowledgementForIdentifiers:satisfiedOnAccount:", v3, v5);

  return (char)v4;
}

- (BOOL)isPrivacyRequirementMetForOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_identifiersForValidationOptions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  -[AMSDeviceOfferRegistrationPrivacyValidator account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "_isPrivacyAcknowledgementForIdentifiers:satisfiedOnAccount:", v4, v6);

  return (char)v5;
}

+ (id)_identifiersForValidationOptions:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    v15 = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Identifier check value: %lu.", (uint8_t *)&v15, 0x20u);

  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  v8 = (void *)objc_opt_new();
  if ((a3 & 1) != 0)
  {
    +[AMSAcknowledgePrivacyTask _appleIDPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleIDPrivacyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    if ((a3 & 2) == 0)
    {
LABEL_8:
      if ((a3 & 4) == 0)
        goto LABEL_9;
LABEL_16:
      +[AMSAcknowledgePrivacyTask _appleMusicAppPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleMusicAppPrivacyIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

      if ((a3 & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_8;
  }
  +[AMSAcknowledgePrivacyTask _appleArcadePrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleArcadePrivacyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  if ((a3 & 4) != 0)
    goto LABEL_16;
LABEL_9:
  if ((a3 & 8) != 0)
  {
LABEL_10:
    +[AMSAcknowledgePrivacyTask _appleTVAppPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleTVAppPrivacyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
LABEL_11:
  v10 = (void *)objc_msgSend(v8, "copy");

  return v10;
}

+ (BOOL)_isPrivacyAcknowledgementForIdentifier:(id)a3 satisfiedOnAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_minimumAcknowledgementVersionForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = +[AMSAcknowledgePrivacyTask hasPreviouslyAcknowledgedPrivacyIdentifier:account:minimumVersion:](AMSAcknowledgePrivacyTask, "hasPreviouslyAcknowledgedPrivacyIdentifier:account:minimumVersion:", v6, v7, v8);
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No version specified for GDPR identifier [%{public}@], returning false", (uint8_t *)&v15, 0x20u);

    }
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_isPrivacyAcknowledgementForIdentifiers:(id)a3 satisfiedOnAccount:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __105__AMSDeviceOfferRegistrationPrivacyValidator__isPrivacyAcknowledgementForIdentifiers_satisfiedOnAccount___block_invoke;
    v14[3] = &unk_1E2541110;
    v16 = &v18;
    v17 = a1;
    v15 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);

    v8 = *((_BYTE *)v19 + 24) != 0;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No required GDPR identifiers.", buf, 0x16u);

    }
    v8 = 1;
    *((_BYTE *)v19 + 24) = 1;
  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __105__AMSDeviceOfferRegistrationPrivacyValidator__isPrivacyAcknowledgementForIdentifiers_satisfiedOnAccount___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 48), "_isPrivacyAcknowledgementForIdentifier:satisfiedOnAccount:", v5, *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v6 + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
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
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v13 = 138544130;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v5;
    v19 = 1024;
    v20 = v12;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Identifier check %{public}@ : %i.", (uint8_t *)&v13, 0x26u);

  }
}

+ (id)_masterEligibilityPrivacyOptionsIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
}

+ (id)_minimumAcknowledgementVersionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "_privacyVersionMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)_privacyVersionMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  +[AMSAcknowledgePrivacyTask _appleIDPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleIDPrivacyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSAcknowledgePrivacyTask _appleArcadePrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleArcadePrivacyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSAcknowledgePrivacyTask _appleMusicAppPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleMusicAppPrivacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSAcknowledgePrivacyTask _appleTVAppPrivacyIdentifier](AMSAcknowledgePrivacyTask, "_appleTVAppPrivacyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF458, v3);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF458, v4);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF470, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E25AF488, v6);
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
