@implementation HKRegulatoryDomainManager

- (HKRegulatoryDomainManager)init
{
  return -[HKRegulatoryDomainManager initWithCurrentEstimatesProvider:](self, "initWithCurrentEstimatesProvider:", &__block_literal_global_22);
}

id __33__HKRegulatoryDomainManager_init__block_invoke()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRDEstimateClass_softClass;
  v7 = getRDEstimateClass_softClass;
  if (!getRDEstimateClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRDEstimateClass_block_invoke;
    v3[3] = &unk_1E37E8690;
    v3[4] = &v4;
    __getRDEstimateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "currentEstimates");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HKRegulatoryDomainManager)initWithCurrentEstimatesProvider:(id)a3
{
  id v4;
  HKRegulatoryDomainManager *v5;
  uint64_t v6;
  id currentEstimatesProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRegulatoryDomainManager;
  v5 = -[HKRegulatoryDomainManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    currentEstimatesProvider = v5->_currentEstimatesProvider;
    v5->_currentEstimatesProvider = (id)v6;

  }
  return v5;
}

- (id)currentCountryCode
{
  void *v2;
  void *v3;

  -[HKRegulatoryDomainManager currentEstimate](self, "currentEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ISOCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentEstimate
{
  void *v3;
  NSObject *v4;
  HKRegulatoryDomainEstimate *v5;
  void *v6;
  void *v7;
  HKRegulatoryDomainEstimate *v8;
  HKRegulatoryDomainEstimate *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HKRegulatoryDomainEstimateOverrideISOCode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    (*((void (**)(void))self->_currentEstimatesProvider + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_firstObjectPassingTest:", &__block_literal_global_47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (HKRegulatoryDomainEstimate *)-[HKRegulatoryDomainEstimate initWithEstimate:]([HKRegulatoryDomainEstimate alloc], v7);
LABEL_8:
    v5 = v8;

    goto LABEL_9;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = objc_opt_class();
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) == 0)
  {
    v9 = [HKRegulatoryDomainEstimate alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKRegulatoryDomainEstimate initWithISOCode:timestamp:provenance:](v9, "initWithISOCode:timestamp:provenance:", v3, v7, 103);
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

uint64_t __44__HKRegulatoryDomainManager_currentEstimate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unsigned int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (unsigned int *)getkRDPriorityServingCellMCCSymbolLoc_ptr;
  v10 = getkRDPriorityServingCellMCCSymbolLoc_ptr;
  if (!getkRDPriorityServingCellMCCSymbolLoc_ptr)
  {
    v4 = (void *)RegulatoryDomainLibrary();
    v3 = (unsigned int *)dlsym(v4, "kRDPriorityServingCellMCC");
    v8[3] = (uint64_t)v3;
    getkRDPriorityServingCellMCCSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    __44__HKRegulatoryDomainManager_currentEstimate__block_invoke_cold_1();
  v5 = objc_msgSend(v2, "priorityIsAtLeast:", *v3, v7);

  return v5;
}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *);

  v6 = (void (**)(id, void *, void *))a3;
  -[HKRegulatoryDomainManager currentEstimate](self, "currentEstimate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 109, CFSTR("No location determined"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, v4, v5);

}

+ (id)registerForUpdatesWithBlock:(id)a3 queue:(id)a4
{
  id v5;
  NSObject *v6;
  id *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  int out_token;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  out_token = -1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = (id *)getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr;
  v23 = getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr;
  if (!getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr)
  {
    v8 = (void *)RegulatoryDomainLibrary();
    v7 = (id *)dlsym(v8, "kRegulatoryDomainUpdateNotification");
    v21[3] = (uint64_t)v7;
    getkRegulatoryDomainUpdateNotificationSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
    +[HKRegulatoryDomainManager registerForUpdatesWithBlock:queue:].cold.1();
  v9 = objc_retainAutorelease(*v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __63__HKRegulatoryDomainManager_registerForUpdatesWithBlock_queue___block_invoke;
  v17 = &unk_1E37EB2F8;
  v11 = v5;
  v18 = v11;
  LODWORD(v10) = notify_register_dispatch(v10, &out_token, v6, &v14);

  if ((_DWORD)v10)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __63__HKRegulatoryDomainManager_registerForUpdatesWithBlock_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)unregisterForUpdatesWithToken:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "intValue") != -1 && notify_cancel(objc_msgSend(v3, "intValue")) == 0;

  return v4;
}

+ (BOOL)isOverridePresent
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "overrideISOCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (void)setOverrideISOCountryCode:(id)a3
{
  const __CFString *v3;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesSetAppValue(CFSTR("HealthRegulatoryDomainISOCountryCodeOverride"), a3, (CFStringRef)*MEMORY[0x1E0C9B228]);
  CFPreferencesAppSynchronize(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentEstimatesProvider, 0);
}

void __44__HKRegulatoryDomainManager_currentEstimate__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "unsigned int getkRDPriorityServingCellMCC(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HKRegulatoryDomainManager.m"), 38, CFSTR("%s"), dlerror());

  __break(1u);
}

+ (void)registerForUpdatesWithBlock:queue:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkRegulatoryDomainUpdateNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HKRegulatoryDomainManager.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
