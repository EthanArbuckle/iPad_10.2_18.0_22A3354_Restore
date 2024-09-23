@implementation DMFiCloudPolicyMonitor

- (DMFiCloudPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4;
  DMFiCloudPolicyMonitor *v5;
  uint64_t v6;
  NSArray *policyTypes;
  uint64_t v8;
  NSUUID *identifier;
  DMFPolicyRegistration *v10;
  void *v11;
  DMFPolicyRegistration *v12;
  void *v13;
  NSUUID *v14;
  _QWORD v16[4];
  DMFiCloudPolicyMonitor *v17;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFiCloudPolicyMonitor;
  v5 = -[DMFiCloudPolicyMonitor init](&v18, sel_init);
  if (v5)
  {
    v19[0] = CFSTR("icloudaccountlogout");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    policyTypes = v5->_policyTypes;
    v5->_policyTypes = (NSArray *)v6;

    v8 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    if (v4)
    {
      v10 = [DMFPolicyRegistration alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5->_policyTypes);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[DMFPolicyRegistration initWithIdentifier:policyTypes:callback:](v10, "initWithIdentifier:policyTypes:callback:", CFSTR("dmf.policy.monitor.icloud.account.logout"), v11, v4);

      +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5->_identifier;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v16[3] = &unk_1E6ED7C28;
      v17 = v5;
      objc_msgSend(v13, "addRegistration:forPolicyMonitorIdentifier:completionHandler:", v12, v14, v16);

    }
  }

  return v5;
}

void __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!a2)
  {
    DMFPolicyLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidatePolicyMonitor:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)DMFiCloudPolicyMonitor;
  -[DMFiCloudPolicyMonitor dealloc](&v4, sel_dealloc);
}

+ (id)iCloudLogoutPolicyForPoliciesByType:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("icloudaccountlogout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "defaultPolicy");
  else
    v5 = 0;
  DMFPolicyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    DMFPolicyUnlocalizedDisplayName(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1B8C0C000, v6, OS_LOG_TYPE_DEFAULT, "iCloud logout has policy %{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)requestiCloudLogoutPolicyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFiCloudPolicyMonitor policyTypes](self, "policyTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "requestPoliciesForTypes:withError:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    +[DMFiCloudPolicyMonitor iCloudLogoutPolicyForPoliciesByType:](DMFiCloudPolicyMonitor, "iCloudLogoutPolicyForPoliciesByType:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DMFPolicyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DMFCommunicationPolicyMonitor requestPoliciesByBundleIdentifierWithError:].cold.1(self);

    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v9;
}

- (void)requestiCloudLogoutPolicyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[DMFPolicyMonitor policyMonitor](DMFPolicyMonitor, "policyMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFiCloudPolicyMonitor policyTypes](self, "policyTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6ED7E50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "requestPoliciesForTypes:completionHandler:", v6, v8);

}

void __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    +[DMFiCloudPolicyMonitor iCloudLogoutPolicyForPoliciesByType:](DMFiCloudPolicyMonitor, "iCloudLogoutPolicyForPoliciesByType:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    DMFPolicyLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __88__DMFCommunicationPolicyMonitor_requestPoliciesByBundleIdentifierWithCompletionHandler___block_invoke_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (DMFiCloudPolicyMonitor)init
{
  DMFiCloudPolicyMonitor *v2;
  _QWORD v4[4];
  DMFiCloudPolicyMonitor *v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__DMFiCloudPolicyMonitor_init__block_invoke;
  v4[3] = &unk_1E6ED7D40;
  v5 = self;
  v2 = -[DMFiCloudPolicyMonitor initWithPolicyChangeHandler:](v5, "initWithPolicyChangeHandler:", v4);

  return v2;
}

void __30__DMFiCloudPolicyMonitor_init__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "requestiCloudLogoutPolicyWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "setICloudLogoutPolicy:", objc_msgSend(v2, "integerValue"));
    v2 = v3;
  }

}

- (int64_t)iCloudLogoutPolicy
{
  void *v3;
  void *v4;
  uint64_t iCloudLogoutPolicy;

  -[DMFiCloudPolicyMonitor requestiCloudLogoutPolicyWithError:](self, "requestiCloudLogoutPolicyWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    iCloudLogoutPolicy = objc_msgSend(v3, "integerValue");
    self->_iCloudLogoutPolicy = iCloudLogoutPolicy;
  }
  else
  {
    iCloudLogoutPolicy = self->_iCloudLogoutPolicy;
  }

  return iCloudLogoutPolicy;
}

- (void)setICloudLogoutPolicy:(int64_t)a3
{
  self->_iCloudLogoutPolicy = a3;
}

- (NSArray)policyTypes
{
  return self->_policyTypes;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_policyTypes, 0);
}

void __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = 138543874;
  v6 = v4;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_ERROR, "Failed to register iCloud policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
