@implementation WDClinicalAuthorizationSettingsViewController

- (WDClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (WDClinicalAuthorizationSettingsViewController)initWithProfile:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WDClinicalAuthorizationSettingsViewController *v9;
  WDClinicalAuthorizationSettingsViewController *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "contextUsingProfile:source:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)WDClinicalAuthorizationSettingsViewController;
  v9 = -[HKClinicalAuthorizationSettingsViewController initWithContext:style:](&v12, sel_initWithContext_style_, v8, 0);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_profile, v6);

  return v10;
}

+ (id)contextUsingProfile:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v19;

  v5 = a4;
  v19 = 0;
  v6 = a3;
  objc_msgSend(v5, "_fetchBundleWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (!v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      +[WDClinicalAuthorizationSettingsViewController contextUsingProfile:source:].cold.1((uint64_t)v5, (uint64_t)v8, v9);
  }
  objc_msgSend(v6, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthRecordsStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F628]), "initWithHealthStore:healthRecordsStore:source:typesRequestedForReading:", v10, v11, v5, 0);
  v13 = objc_alloc(MEMORY[0x1E0D2F620]);
  objc_msgSend(v7, "objectForInfoDictionaryKey:", *MEMORY[0x1E0D2F470]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E74EA150;
  v17 = (void *)objc_msgSend(v13, "initWithHealthStore:healthRecordsStore:authorizationController:readUsageDescription:source:", v10, v11, v12, v16, v5);

  return v17;
}

- (HRProfile)profile
{
  return (HRProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

+ (void)contextUsingProfile:(os_log_t)log source:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1BC30A000, log, OS_LOG_TYPE_ERROR, "Failed to fetch app bundle for source %@. Using fallback values for authorization settings controller. Fetch error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
