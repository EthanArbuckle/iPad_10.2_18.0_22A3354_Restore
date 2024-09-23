@implementation AMSFeatureEnabler

uint64_t __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      v11 = 138543874;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      v9 = v12;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: An ITFE key or value is of the wrong type. key = %{public}@ | value = %{public}@", (uint8_t *)&v11, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

+ (NSHTTPCookie)cookie
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  if (!os_variant_has_internal_content())
    return (NSHTTPCookie *)0;
  objc_msgSend(a1, "_fetchEnabledFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0C92C00]);
    v6 = *MEMORY[0x1E0C92AB0];
    v18[0] = CFSTR(".apple.com");
    v7 = *MEMORY[0x1E0C92AB8];
    v17[0] = v6;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31536000.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C92AD0];
    v18[1] = v8;
    v18[2] = CFSTR("itfe");
    v10 = *MEMORY[0x1E0C92AE0];
    v17[2] = v9;
    v17[3] = v10;
    v11 = *MEMORY[0x1E0C92B08];
    v18[3] = CFSTR("/");
    v18[4] = MEMORY[0x1E0C9AAB0];
    v12 = *MEMORY[0x1E0C92B10];
    v17[4] = v11;
    v17[5] = v12;
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("+"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v5, "initWithProperties:", v14);

    v3 = v4;
  }
  else
  {
    v15 = 0;
  }

  return (NSHTTPCookie *)v15;
}

+ (id)_fetchEnabledFeatures
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!+[AMSProcessInfo hasAMSEntitlement](AMSProcessInfo, "hasAMSEntitlement"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEBUG, "Current process is attempting to read from shared preferences but does not have the com.apple.private.applemediaservices entitlement.", buf, 2u);
    }

  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v5 = (id)CFPreferencesCopyAppValue(CFSTR("features"), CFSTR("com.apple.storeservices.itfe"));
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      v10 = v9;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Unable to generate the ITFE cookie. The features aren't stored in a dictionary.", buf, 0xCu);

    }
    v11 = 0;
  }
  else
  {
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("additionalFeatures"), CFSTR("com.apple.storeservices.itfe"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v5)
      {
        objc_msgSend(v5, "ams_dictionaryByAddingEntriesFromDictionary:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v7;
      }
      else
      {
        v5 = v6;
      }
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke;
    v14[3] = &__block_descriptor_40_e31_B24__0__NSString_8__NSNumber_16l;
    v14[4] = a1;
    objc_msgSend(v5, "ams_filterUsingTest:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ams_arrayUsingTransform:", &__block_literal_global_53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
  }

  return v11;
}

+ (void)clear
{
  CFPreferencesSetAppValue(CFSTR("features"), 0, CFSTR("com.apple.storeservices.itfe"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
}

id __42__AMSFeatureEnabler__fetchEnabledFeatures__block_invoke_39(uint64_t a1, void *a2)
{
  return a2;
}

@end
