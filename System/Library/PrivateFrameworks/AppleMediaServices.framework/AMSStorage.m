@implementation AMSStorage

+ (id)bagURLCookies
{
  return +[AMSDefaults bagURLCookies](AMSDefaults, "bagURLCookies");
}

+ (id)deviceOfferEligibility
{
  return (id)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("AMSDeviceOfferEligibility"), CFSTR("com.apple.AppleMediaServices"));
}

+ (id)sharedStoreReviewMetricsForProcess:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AMSSharedStoreReviewMetrics"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setBagURLCookies:(id)a3
{
  +[AMSDefaults setBagURLCookies:](AMSDefaults, "setBagURLCookies:", a3);
}

+ (void)setDeviceOfferEligibility:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("AMSDeviceOfferEligibility"), CFSTR("com.apple.AppleMediaServices"));
}

+ (void)setSharedStoreReviewMetrics:(id)a3 forProcess:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AMSSharedStoreReviewMetrics"), a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:domain:", v7, v8, CFSTR("com.apple.AppleMediaServices"));

}

+ (id)_allKeysWithDomain:(id)a3
{
  id v3;
  AMSStorageDatabase *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v4 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v3);
    v14 = 0;
    -[AMSStorageDatabase allKeysForDomain:withError:](v4, "allKeysForDomain:withError:", v3, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v16 = v9;
        v17 = 2114;
        v18 = v10;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed fetching all keys for database with error: %{public}@", buf, 0x20u);

      }
      v12 = 0;
    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v4 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, &v4->super, OS_LOG_TYPE_DEFAULT, "AMSStorage database unsupported. The AMSStorage database feature flag is turned off.", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v13;

  v8 = a3;
  v9 = a5;
  v13 = 0;
  v10 = objc_msgSend(a1, "_integerFromDatabaseForKey:defaultValue:domain:error:", v8, a4, v9, &v13);
  if (v13)
    v10 = objc_msgSend(a1, "_integerFromCFPreferencesForKey:defaultValue:domain:", v8, a4, v9);
  v11 = v10;

  return v11;
}

+ (int64_t)_integerFromDatabaseForKey:(id)a3 defaultValue:(int64_t)a4 domain:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AMSStorageDatabase *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  id v22;

  v9 = a3;
  v10 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v16 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v10);
    v22 = 0;
    a4 = -[AMSStorageDatabase integerForKey:error:](v16, "integerForKey:error:", v9, &v22);
    v17 = v22;
    v18 = v17;
    if (a6 && v17)
      *a6 = objc_retainAutorelease(v17);

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v11, v12, v13, v14, v15, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (a6)
    {
      v18 = objc_retainAutorelease(v19);
      *a6 = v18;
    }
  }

  return a4;
}

+ (int64_t)_integerFromCFPreferencesForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5
{
  __CFString *v8;
  CFIndex AppIntegerValue;
  int64_t v10;
  Boolean keyExistsAndHasValidFormat;

  v8 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v8, a5, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v10 = AppIntegerValue;
    objc_msgSend(a1, "_migrateIntegerToDatabase:forKey:domain:", AppIntegerValue, v8, a5);

    a4 = v10;
  }

  return a4;
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setInteger:forKey:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (!objc_msgSend(a1, "_setIntegerWithDatabase:forKey:domain:error:", a3, v8, v9, &v10) || v10)
    objc_msgSend(a1, "_setIntegerWithCFPreferences:forKey:domain:", a3, v8, v9);

}

+ (BOOL)_setIntegerWithDatabase:(int64_t)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AMSStorageDatabase *v16;
  BOOL v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  id v23;

  v9 = a4;
  v10 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v16 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v10);
    v23 = 0;
    v17 = -[AMSStorageDatabase setInteger:forKey:error:](v16, "setInteger:forKey:error:", a3, v9, &v23);
    v18 = v23;
    v19 = v18;
    if (a6 && v18)
      *a6 = objc_retainAutorelease(v18);

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v11, v12, v13, v14, v15, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    if (a6)
    {
      v19 = objc_retainAutorelease(v20);
      v17 = 0;
      *a6 = v19;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

+ (void)_setIntegerWithCFPreferences:(int64_t)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  void *v7;
  __CFString *v8;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (__CFString *)a4;
  CFPreferencesSetAppValue(v8, (CFPropertyListRef)objc_msgSend(v7, "numberWithInteger:", a3), a5);

  CFPreferencesAppSynchronize(a5);
}

+ (void)_migrateIntegerToDatabase:(int64_t)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  AMSStorageDatabase *v10;
  id v11;
  id v12;

  v8 = a4;
  v9 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v10 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v9);
    v12 = 0;
    -[AMSStorageDatabase setInteger:forKey:error:](v10, "setInteger:forKey:error:", a3, v8, &v12);
    v11 = v12;
    if (!v11)
      objc_msgSend(a1, "_setValueWithCFPreferences:forKey:domain:", 0, v8, v9);

  }
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  char v10;
  BOOL v11;
  uint64_t v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13 = 0;
  v10 = objc_msgSend(a1, "_BOOLFromDatabaseForKey:defaultValue:domain:error:", v8, v6, v9, &v13);
  if (v13)
    v10 = objc_msgSend(a1, "_BOOLFromCFPreferencesForKey:defaultValue:domain:", v8, v6, v9);
  v11 = v10;

  return v11;
}

+ (BOOL)_BOOLFromDatabaseForKey:(id)a3 defaultValue:(BOOL)a4 domain:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AMSStorageDatabase *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  id v22;

  v9 = a3;
  v10 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v16 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v10);
    v22 = 0;
    a4 = -[AMSStorageDatabase BOOLeanForKey:error:](v16, "BOOLeanForKey:error:", v9, &v22);
    v17 = v22;
    v18 = v17;
    if (a6 && v17)
      *a6 = objc_retainAutorelease(v17);

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v11, v12, v13, v14, v15, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (a6)
    {
      v18 = objc_retainAutorelease(v19);
      *a6 = v18;
    }
  }

  return a4;
}

+ (BOOL)_BOOLFromCFPreferencesForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  _BOOL8 v6;
  __CFString *v8;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  LOBYTE(v6) = a4;
  v8 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v8, a5, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v6 = AppBooleanValue != 0;
    objc_msgSend(a1, "_migrateBoolToDatabase:forKey:domain:", v6, v8, a5);

  }
  return v6;
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (!objc_msgSend(a1, "_setBoolWithDatabase:forKey:domain:error:", v6, v8, v9, &v10) || v10)
    objc_msgSend(a1, "_setBoolWithCFPreferences:forKey:domain:", v6, v8, v9);

}

+ (BOOL)_setBoolWithDatabase:(BOOL)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AMSStorageDatabase *v16;
  BOOL v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v16 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v10);
    v23 = 0;
    v17 = -[AMSStorageDatabase setBoolean:forKey:error:](v16, "setBoolean:forKey:error:", v8, v9, &v23);
    v18 = v23;
    v19 = v18;
    if (a6 && v18)
      *a6 = objc_retainAutorelease(v18);

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v11, v12, v13, v14, v15, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    if (a6)
    {
      v19 = objc_retainAutorelease(v20);
      v17 = 0;
      *a6 = v19;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

+ (void)_setBoolWithCFPreferences:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPropertyListRef *v6;

  v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue((CFStringRef)a4, *v6, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (void)_migrateBoolToDatabase:(BOOL)a3 forKey:(id)a4 domain:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  AMSStorageDatabase *v10;
  id v11;
  id v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v10 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v9);
    v12 = 0;
    -[AMSStorageDatabase setBoolean:forKey:error:](v10, "setBoolean:forKey:error:", v6, v8, &v12);
    v11 = v12;
    if (!v11)
      objc_msgSend(a1, "_setValueWithCFPreferences:forKey:domain:", 0, v8, v9);

  }
}

+ (id)_valueForKey:(id)a3
{
  return (id)objc_msgSend(a1, "_valueForKey:domain:", a3, CFSTR("com.apple.AppleMediaServices"));
}

+ (id)_valueForKey:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  objc_msgSend(a1, "_valueFromDatabaseForKey:domain:error:", v6, v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "_valueFromCFPreferencesForKey:domain:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1, "_migrateValueToDatabase:forKey:domain:", v9, v6, v7);
      v8 = (void *)v9;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (id)_valueFromDatabaseForKey:(id)a3 domain:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AMSStorageDatabase *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  id v22;

  v7 = a3;
  v8 = a4;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v14 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v8);
    v22 = 0;
    -[AMSStorageDatabase valueForKey:error:](v14, "valueForKey:error:", v7, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
    v17 = v16;
    if (a5 && v16)
      *a5 = objc_retainAutorelease(v16);
    v18 = v15;

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v9, v10, v11, v12, v13, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    if (a5)
    {
      v17 = objc_retainAutorelease(v19);
      v18 = 0;
      *a5 = v17;
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

+ (id)_valueFromCFPreferencesForKey:(id)a3 domain:(__CFString *)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if (!objc_msgSend(a1, "_setValueWithDatabase:forKey:domain:error:", v8, v9, v10, &v11) || v11)
    objc_msgSend(a1, "_setValueWithCFPreferences:forKey:domain:", v8, v9, v10);

}

+ (BOOL)_setValueWithDatabase:(id)a3 forKey:(id)a4 domain:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AMSStorageDatabase *v17;
  AMSStorageDatabase *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v25;
  void *v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v17 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v11);
    v18 = v17;
    if (v9)
    {
      v25 = 0;
      v19 = -[AMSStorageDatabase setValue:forKey:error:](v17, "setValue:forKey:error:", v9, v10, &v25);
      v20 = v25;
    }
    else
    {
      v26 = 0;
      v19 = -[AMSStorageDatabase deleteForKey:error:](v17, "deleteForKey:error:", v10, &v26);
      v20 = v26;
    }
    v23 = v20;
    v22 = v23;
    if (a6 && v23)
    {
      v22 = objc_retainAutorelease(v23);
      *a6 = v22;
    }

  }
  else
  {
    AMSErrorWithFormat(12, CFSTR("AMSStorage database unsupported."), CFSTR("The AMSStorage database feature flag is turned off."), v12, v13, v14, v15, v16, (uint64_t)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a6)
    {
      v22 = objc_retainAutorelease(v21);
      v19 = 0;
      *a6 = v22;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

+ (void)_migrateValueToDatabase:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSStorageDatabase *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[AMSStorageDatabase isFeatureSupported](AMSStorageDatabase, "isFeatureSupported"))
  {
    v11 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v10);
    v13 = 0;
    -[AMSStorageDatabase setValue:forKey:error:](v11, "setValue:forKey:error:", v8, v9, &v13);
    v12 = v13;
    if (!v12)
      objc_msgSend(a1, "_setValueWithCFPreferences:forKey:domain:", 0, v9, v10);

  }
}

+ (void)_setValueWithCFPreferences:(id)a3 forKey:(id)a4 domain:(id)a5
{
  __CFString *applicationID;

  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

@end
