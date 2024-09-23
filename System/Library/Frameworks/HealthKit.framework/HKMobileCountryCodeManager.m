@implementation HKMobileCountryCodeManager

- (HKMobileCountryCodeManager)init
{
  HKMobileCountryCodeManager *v2;
  HKMobileCountryCodeManager *v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *coreTelephonyClient;
  RadiosPreferences *v7;
  RadiosPreferences *radiosPreferences;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMobileCountryCodeManager;
  v2 = -[HKMobileCountryCodeManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    HKCreateSerialDispatchQueue(v2, CFSTR("mobile-country-code.telephony"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v4);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v3->_coreTelephonyClient, "setDelegate:", v3);
    v3->_coreTelephonyServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    v7 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x1E0CFA9B8]);
    radiosPreferences = v3->_radiosPreferences;
    v3->_radiosPreferences = v7;

  }
  return v3;
}

- (void)dealloc
{
  __CTServerConnection *coreTelephonyServerConnection;
  objc_super v4;

  coreTelephonyServerConnection = self->_coreTelephonyServerConnection;
  if (coreTelephonyServerConnection)
    CFRelease(coreTelephonyServerConnection);
  v4.receiver = self;
  v4.super_class = (Class)HKMobileCountryCodeManager;
  -[HKMobileCountryCodeManager dealloc](&v4, sel_dealloc);
}

- (void)fetchISOCountryCodeFromCellularWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__HKMobileCountryCodeManager_fetchISOCountryCodeFromCellularWithCompletion___block_invoke;
  v6[3] = &unk_1E37F8360;
  v7 = v4;
  v5 = v4;
  -[HKMobileCountryCodeManager fetchMobileCountryCodeFromCellularWithCompletion:](self, "fetchMobileCountryCodeFromCellularWithCompletion:", v6);

}

void __76__HKMobileCountryCodeManager_fetchISOCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "ISOCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, HKMobileCountryCode *);
  BOOL v5;
  HKMobileCountryCode *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  HKMobileCountryCode *v10;
  CoreTelephonyClient *coreTelephonyClient;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, HKMobileCountryCode *);
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, HKMobileCountryCode *))a3;
  v14 = 0;
  v5 = -[HKMobileCountryCodeManager _isLocationAvailableWithError:](self, "_isLocationAvailableWithError:", &v14);
  v6 = (HKMobileCountryCode *)v14;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_overrideISOCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v16 = v9;
        v17 = 2114;
        v18 = v7;
        _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", buf, 0x16u);
      }

      if (objc_msgSend(v7, "isEqualToString:", CFSTR("NONE")))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 109, CFSTR("OVERRIDE: No estimate available"));
        v10 = (HKMobileCountryCode *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v10);
      }
      else
      {
        v10 = -[HKMobileCountryCode initWithMobileCountryCode:ISOCode:isOverridden:]([HKMobileCountryCode alloc], "initWithMobileCountryCode:ISOCode:isOverridden:", &stru_1E37FD4C0, v7, 1);
        ((void (**)(id, HKMobileCountryCode *, HKMobileCountryCode *))v4)[2](v4, v10, 0);
      }

    }
    else
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke;
      v12[3] = &unk_1E37F0EC8;
      v12[4] = self;
      v13 = v4;
      -[CoreTelephonyClient getCurrentDataSubscriptionContext:](coreTelephonyClient, "getCurrentDataSubscriptionContext:", v12);

    }
  }
  else
  {
    v4[2](v4, 0, v6);
  }

}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(v6 + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22;
    v11[3] = &unk_1E37F0EA0;
    v11[4] = v6;
    v12 = v7;
    objc_msgSend(v8, "copyMobileCountryCode:completion:", a2, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 109, CFSTR("Failed to get current data subscription context"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Nil data subscription context"), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 109, CFSTR("Failed to get mobile country code"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Error getting mobile country code"), 0);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v12 = 0;
    objc_msgSend(v10, "_wrapperWithMobileCountryCode:error:", a2, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v6)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22_cold_1();

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
  }
  v9();

}

- (id)mobileCountryCodeFromCellularWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  HKMobileCountryCode *v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v10;
  id v11;
  CoreTelephonyClient *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[HKMobileCountryCodeManager _isLocationAvailableWithError:](self, "_isLocationAvailableWithError:"))
    return 0;
  objc_msgSend((id)objc_opt_class(), "_overrideISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v20 = objc_opt_class();
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", buf, 0x16u);
    }

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("NONE")))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 109, CFSTR("OVERRIDE: No estimate available"));
      v7 = 0;
    }
    else
    {
      v7 = -[HKMobileCountryCode initWithMobileCountryCode:ISOCode:isOverridden:]([HKMobileCountryCode alloc], "initWithMobileCountryCode:ISOCode:isOverridden:", &stru_1E37FD4C0, v5, 1);
    }
  }
  else
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v18 = 0;
    -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](coreTelephonyClient, "getCurrentDataSubscriptionContextSync:", &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (v10)
    {
      v12 = self->_coreTelephonyClient;
      v17 = v11;
      v13 = (void *)-[CoreTelephonyClient copyMobileCountryCode:error:](v12, "copyMobileCountryCode:error:", v10, &v17);
      v14 = v17;

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 109, CFSTR("Failed to get mobile country code"), v14);
        _HKInitializeLogging();
        HKLogInfrastructure();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:].cold.2();

        -[HKMobileCountryCodeManager _submitAnalyticsForError:mobileCountryCode:](self, "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Error getting mobile country code"), 0);
        v7 = 0;
      }
      else
      {
        -[HKMobileCountryCodeManager _wrapperWithMobileCountryCode:error:](self, "_wrapperWithMobileCountryCode:error:", v13, a3);
        v7 = (HKMobileCountryCode *)objc_claimAutoreleasedReturnValue();
      }

      v11 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 109, CFSTR("Failed to get current data subscription context"), v11);
      _HKInitializeLogging();
      HKLogInfrastructure();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:].cold.1();

      -[HKMobileCountryCodeManager _submitAnalyticsForError:mobileCountryCode:](self, "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Nil data subscription context"), 0);
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)_isLocationAvailableWithError:(id *)a3
{
  int v5;
  NSObject *v6;

  -[RadiosPreferences refresh](self->_radiosPreferences, "refresh");
  v5 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 109, CFSTR("Location not available"));
    _HKInitializeLogging();
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HKMobileCountryCodeManager _isLocationAvailableWithError:].cold.1((uint64_t)self, v6);

  }
  return v5 ^ 1;
}

- (id)_wrapperWithMobileCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HKMobileCountryCode *v11;
  id v12;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "overrideMobileCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;

    v6 = v9;
  }
  objc_msgSend(v6, "hk_copyNonEmptyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "integerValue") != 0xFFFF)
  {
    v12 = -[HKMobileCountryCodeManager copyISOCountryCodeForMobileCountryCode:error:](self, "copyISOCountryCodeForMobileCountryCode:error:", v10, a4);
    if (v12)
    {
      v11 = -[HKMobileCountryCode initWithMobileCountryCode:ISOCode:isOverridden:]([HKMobileCountryCode alloc], "initWithMobileCountryCode:ISOCode:isOverridden:", v10, v12, v8 != 0);
    }
    else
    {
      -[HKMobileCountryCodeManager _submitAnalyticsForError:mobileCountryCode:](self, "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Nil ISO country code"), v10);
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 109, CFSTR("MCC is unknown"));
    -[HKMobileCountryCodeManager _submitAnalyticsForError:mobileCountryCode:](self, "_submitAnalyticsForError:mobileCountryCode:", CFSTR("Nil mobile country code"), 0);
    v11 = 0;
  }

  return v11;
}

- (id)copyISOCountryCodeForMobileCountryCode:(id)a3 error:(id *)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;

  if (self->_coreTelephonyServerConnection)
  {
    if (!_CTServerConnectionCopyISOForMCC())
    {
      objc_msgSend(0, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = CFSTR("CoreTelephony server copying ISO from MCC failed");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = CFSTR("CoreTelephony server connection was NULL");
  }
  objc_msgSend(v5, "hk_assignError:code:description:", a4, 100, v6);
  return 0;
}

+ (BOOL)isOverridePresent
{
  void *v3;
  BOOL v4;
  void *v5;

  objc_msgSend(a1, "overrideMobileCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "_overrideISOCountryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (void)setOverrideMobileCountryCode:(id)a3
{
  const __CFString *v3;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesSetAppValue(CFSTR("HKMobileCountryCodeOverride"), a3, (CFStringRef)*MEMORY[0x1E0C9B228]);
  CFPreferencesAppSynchronize(v3);
}

+ (id)overrideMobileCountryCode
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringForKey:", CFSTR("HKMobileCountryCodeOverride"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_copyNonEmptyString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543618;
        v8 = objc_opt_class();
        v9 = 2114;
        v10 = v4;
        _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning overridden MCC %{public}@.", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_submitAnalyticsForError:(id)a3 mobileCountryCode:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend((id)objc_opt_class(), "overrideMobileCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v12[0] = CFSTR("Error");
    v12[1] = CFSTR("MobileCountryCode");
    v8 = CFSTR("-1");
    if (v6)
      v8 = v6;
    v13[0] = v5;
    v13[1] = v8;
    v12[2] = CFSTR("UserLocale");
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (id)currentCountryCode
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:](self, "mobileCountryCodeFromCellularWithError:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (!v2)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v5;
      v12 = 2114;
      v13 = v3;
      v6 = v5;
      _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to retrieve country code: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v2, "ISOCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentEstimate
{
  void *v2;
  id v3;
  HKRegulatoryDomainEstimate *v4;
  NSObject *v5;
  void *v6;
  HKRegulatoryDomainEstimate *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:](self, "mobileCountryCodeFromCellularWithError:", &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v2)
  {
    v4 = [HKRegulatoryDomainEstimate alloc];
    objc_msgSend(v2, "ISOCode");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HKRegulatoryDomainEstimate initWithISOCode:timestamp:provenance:](v4, "initWithISOCode:timestamp:provenance:", v5, v6, objc_msgSend(v2, "provenance"));

  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v3;
      v9 = v8;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to retrieve country code: %{public}@", buf, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v0, v1, "[%{public}@]: Failed to get current data subscription context with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  objc_opt_class();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v0, v1, "[%{public}@]: Failed to retrieve ISO code for MCC with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_22_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v0, v1, "[%{public}@]: Failed to get mobile country code with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)mobileCountryCodeFromCellularWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v0, v1, "[%{public}@]: Failed to get current data subscription context with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)mobileCountryCodeFromCellularWithError:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_6(&dword_19A0E6000, v0, v1, "[%{public}@]: Failed to get mobile country code with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isLocationAvailableWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Location not available, airplane mode turned on.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
