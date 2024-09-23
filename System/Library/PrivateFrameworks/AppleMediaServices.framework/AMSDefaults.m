@implementation AMSDefaults

+ (NSString)forwardedForIPAddress
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSUserDefaultsForwardedForIPAddress"));
}

+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

+ (id)_valueForKey:(id)a3
{
  return (id)objc_msgSend(a1, "_valueForKey:domain:", a3, CFSTR("com.apple.AppleMediaServices"));
}

+ (NSDictionary)storefrontSuffixes
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSStorefrontSuffixes"));
}

+ (NSDictionary)bagOverrides
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("BagOverrides"));
}

+ (NSArray)bagOverrideIgnoredKeys
{
  return (NSArray *)objc_msgSend(a1, "_valueForKey:", CFSTR("BagOverrideIgnoredKeys"));
}

+ (NSString)metricsCanaryIdentifier
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMetricsCanaryIdentifier"));
}

+ (BOOL)shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a1, "_cleanupSampleSessions");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AMSSamplingSession"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(a1, "_resultFromSampleSession:isActive:", v10, &v20);
  if (v20)
  {
    LOBYTE(v12) = v11;
  }
  else
  {
    +[AMSRandomNumberGenerator normalizedRandomDouble](AMSRandomNumberGenerator, "normalizedRandomDouble");
    v14 = v13 >= 0.0;
    if (v13 > 1.0)
      v14 = 0;
    v12 = v13 <= a3 && v14;
    if (a4 > 0.0)
    {
      v21[0] = CFSTR("date");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      v21[1] = CFSTR("result");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v16;
      v21[2] = CFSTR("duration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_setValue:forKey:", v18, v9);
    }
  }

  return v12;
}

+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (BOOL)_resultFromSampleSession:(id)a3 isActive:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("result"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_4:
    v8 = 0;
    if (a4)
      *a4 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "dateByAddingTimeInterval:", (double)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "compare:", v12) != -1)
  {

    goto LABEL_4;
  }
  if (a4)
    *a4 = 1;

LABEL_9:
  return v8;
}

+ (void)_cleanupSampleSessions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AMSDefaults__cleanupSampleSessions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_cleanupSampleSessions_onceToken[0] != -1)
    dispatch_once(_cleanupSampleSessions_onceToken, block);
}

+ (int64_t)forceLoadUrlMetrics
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSForceLoadUrlMetrics"), 0);
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5
{
  __CFString *v7;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppIntegerValue;
  else
    return a4;
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (int64_t)acknowledgePrivacyOverride
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSAcknowledgePrivacyOverride"), 0);
}

+ (BOOL)disablePrivacyAcknowledgement
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("DisableGDPR"), 0, CFSTR("com.apple.itunesstored"));
}

+ (BOOL)enableRemoteSecuritySigning
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSEnableRemoteSecuritySigning"), 1);
}

+ (BOOL)includeFullResponseInHARLogging
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSIncludeFullResponseInHARLogging"), 0);
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (BOOL)logHARData
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSLogHARData"), 0);
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  __CFString *v7;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppBooleanValue != 0;
  else
    return a4;
}

+ (BOOL)QAMode
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSQAMode"), 0);
  return has_internal_content;
}

+ (void)shouldSampleWithPercentageValue:(id)a3 sessionDurationValue:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke;
    v20[3] = &unk_1E2540A90;
    v21 = v14;
    v25 = a1;
    v22 = v12;
    v24 = v13;
    v23 = v11;
    v15 = v14;
    objc_msgSend(v10, "valueWithCompletion:", v20);

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
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No percentage provided for identifier: %{public}@", buf, 0x20u);

    }
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

+ (BOOL)ss_ignoreServerTrustEvaluation
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("ISIgnoreExtendedValidation"), 0, CFSTR("com.apple.itunesstored"));
}

+ (BOOL)ignoreServerTrustEvaluation
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSIgnoreServerTrustEvaluation"), 0);
}

+ (BOOL)includeFullRequestInHARLogging
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSIncludeFullRequestInHARLogging"), 0);
}

+ (BOOL)alwaysSendGUID
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSAlwaysSendGuid"), 0);
}

+ (BOOL)engagementExtendTimeouts
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("extendTimeouts"), 0, CFSTR("com.apple.AppleMediaServices"));
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, a4, CFSTR("com.apple.AppleMediaServices"));
}

+ (int64_t)reversePushEnabled
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSReversePushEnabled"), 0);
}

+ (NSDate)mescalCertExpiration
{
  return (NSDate *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSFPCertExpiration"));
}

+ (NSDictionary)bagURLCookies
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSBagURLCookies"));
}

+ (BOOL)alwaysSendCacheBuster
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSAlwaysSendBuster"), 0);
}

+ (NSDictionary)treatmentOverrides
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  objc_msgSend(a1, "_valueForKey:", CFSTR("AMSTreatmentOverrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

+ (void)setIncludeFullResponseInHARLogging:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSIncludeFullResponseInHARLogging"));
}

+ (void)setIncludeFullRequestInHARLogging:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSIncludeFullRequestInHARLogging"));
}

+ (NSString)multiUserContainerID
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMultiUserContainerID"));
}

+ (NSString)mediaTokenOverride
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMediaTokenOverride"));
}

+ (NSDictionary)mediaClientIdOverrides
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMediaClientIdOverrides"));
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPropertyListRef *v6;

  v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v6 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue((CFStringRef)a4, *v6, a5);
  CFPreferencesAppSynchronize(a5);
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (v7)
  {
    if (objc_msgSend(v7, "ams_isBagValueMissingError"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_2;
      block[3] = &unk_1E2540A40;
      v34 = *(_QWORD *)(a1 + 64);
      v9 = *(id *)(a1 + 40);
      v33 = v9;
      if (kAMSUserDefaultsDebugUIMessagingUI_block_invoke_logOnceToken__COUNTER__ == -1)
      {
        v10 = v9;
      }
      else
      {
        dispatch_once(&kAMSUserDefaultsDebugUIMessagingUI_block_invoke_logOnceToken__COUNTER__, block);
        v10 = v33;
      }
      goto LABEL_16;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_15:

LABEL_16:
      v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_17;
    }
    v19 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v36 = v19;
    v37 = 2114;
    v38 = v14;
    v39 = 2114;
    v40 = v20;
    v41 = 2114;
    v42 = v7;
    v16 = "%{public}@: [%{public}@] Unable to fetch percentage for identifier: %{public}@. %{public}@";
    v17 = v12;
    v18 = 42;
LABEL_14:
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);

    goto LABEL_15;
  }
  objc_msgSend(v6, "doubleValue");
  if (v11 == 0.0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v13 = objc_opt_class();
    AMSLogKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v36 = v13;
    v37 = 2114;
    v38 = v14;
    v39 = 2114;
    v40 = v15;
    v16 = "%{public}@: [%{public}@] Expected non-zero percentage for identifier: %{public}@.";
    v17 = v12;
    v18 = 32;
    goto LABEL_14;
  }
  v22 = v11;
  v23 = *(void **)(a1 + 48);
  if (v23)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_223;
    v26[3] = &unk_1E2540A68;
    v24 = *(id *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 64);
    v27 = v24;
    v30 = v25;
    v28 = *(id *)(a1 + 40);
    v31 = v22;
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v23, "valueWithCompletion:", v26);

    goto LABEL_18;
  }
  +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", *(_QWORD *)(a1 + 40), v11, 0.0);
  v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_17:
  v21();
LABEL_18:

}

+ (NSDictionary)accountFlagOverrides
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSAccountFlagOverrides"));
}

+ (NSDictionary)deviceOfferEligibility
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("AMSDeviceOfferEligibility"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Percentage bag value not provided for identifier: %{public}@.", (uint8_t *)&v7, 0x20u);

  }
}

void __37__AMSDefaults__cleanupSampleSessions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  dispatch_get_global_queue(-2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__AMSDefaults__cleanupSampleSessions__block_invoke_2;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v8;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 1000000000);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke;
  block[3] = &unk_1E253DC28;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  dispatch_after(v6, v2, block);

}

void __37__AMSDefaults__cleanupSampleSessions__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138543618;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("AMSSamplingSession"), v13))
        {
          v14 = 0;
          objc_msgSend(*(id *)(a1 + 32), "_valueForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_resultFromSampleSession:isActive:", v9, &v14);
          if (!v14)
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
              *(_DWORD *)buf = v13;
              v20 = v12;
              v21 = 2114;
              v22 = v8;
              _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing expired sampling session: %{public}@", buf, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "_setValue:forKey:", 0, v8);
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

+ (BOOL)useNewCookieStorage
{
  return 1;
}

+ (id)allKeys
{
  return (id)objc_msgSend(a1, "_allKeysForDomain:", CFSTR("com.apple.AppleMediaServices"));
}

+ (id)_allKeysForDomain:(__CFString *)a3
{
  CFPreferencesAppSynchronize(a3);
  return CFPreferencesCopyKeyList(a3, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (BOOL)allowDuplicateAccounts
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("kAMSUserDefaultsAllowDuplicateAccounts"), 0);
}

+ (int64_t)applePayClassic
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSApplePayClassic"), 0);
}

+ (NSDate)authenticationStarted
{
  return (NSDate *)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("AuthenticationStarted"), CFSTR("com.apple.itunesstored"));
}

+ (BOOL)automationMode
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AutomationMode"), 0);
}

+ (NSDictionary)bagOverrideInserts
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("BagOverrideInserts"));
}

+ (int64_t)cardEnrollmentAutomatic
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSCardEnrollmentAutomatic"), 0);
}

+ (int64_t)cardEnrollmentManual
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSCardEnrollmentManual"), 0);
}

+ (int64_t)cardEnrollmentSilent
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSCardEnrollmentSilent"), 0);
}

+ (int64_t)cardEnrollmentUpsell
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSCardEnrollmentUpsell"), 0);
}

+ (id)debugUI
{
  return (id)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSDebugUI"));
}

+ (BOOL)debugUIDynamicUIEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[AMSDefaults debugUI](AMSDefaults, "debugUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DynamicUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DynamicUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (BOOL)debugUIMessagingUIEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[AMSDefaults debugUI](AMSDefaults, "debugUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MessagingUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MessagingUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (NSString)defaultPaymentPassIdentifier
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSDefaultPaymentPassIdentifier"));
}

+ (NSArray)deviceBiometricIdentities
{
  return (NSArray *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSDeviceBiometricsIdentities"));
}

+ (int64_t)deviceBiometricsState
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSDeviceBiometricsState"), 0);
}

+ (NSArray)deviceGroups
{
  return (NSArray *)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("deviceGroups"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (BOOL)deviceIsBundleOverride
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDeviceIsBundleOverride"), 0);
  return has_internal_content;
}

+ (NSArray)deviceRegistrationDenyList
{
  return (NSArray *)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("deviceRegistrationBlacklist"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (NSString)deviceOffersSerialNumber
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:domain:", CFSTR("AMSDeviceOffersSerialNumber"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (BOOL)devMode
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDevMode"), 0);
  return has_internal_content;
}

+ (BOOL)didFetchBundleOwnerStatus
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDidFetchBundleOwnerStatus"), 0);
}

+ (BOOL)didRetrieveDeviceOffers
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("AMSDidRetrieveDeviceOffers"), 0, CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (BOOL)didRetrieveDeviceOffersEligibility
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("AMSDidRetrieveDeviceOffersEligibility"), 0, CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (BOOL)didRetrieveTVOffers
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("AMSDidRetrieveTVOffers"), 0, CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (BOOL)didSetUpServerDataCache
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDidSetUpServerDataCache"), 0);
}

+ (BOOL)disableHARLogging
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDisableHARLogging"), 0);
}

+ (BOOL)disableStubbedMarketingItems
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSDisableStubbedMarketingItems"), 1);
}

+ (BOOL)enableCameraRedeem
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSEnableCameraRedeem"), 1);
}

+ (BOOL)enablePurchaseQueue
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSEnablePurchaseQueue"), 0);
}

+ (BOOL)forceEngagementPurchaseSuccess
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSForceEngagementPurchaseSuccess"), 0);
}

+ (NSDictionary)harURLFilters
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSHARURLFilters"));
}

+ (id)journeysURLOverride
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_valueForKey:", CFSTR("AMSJourneysURLOverride"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (NSDictionary)journeysURLOverrides
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_valueForKey:domain:", CFSTR("urlOverrides"), CFSTR("com.apple.amsengagementd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

AMSPair *__35__AMSDefaults_journeysURLOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (NSDictionary)jsVersionMap
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSJSVersionMap"));
}

+ (NSDate)lastCarrierOfferRegistrationDate
{
  return (NSDate *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSLastCarrierOfferRegistrationDate"));
}

+ (NSString)lastMigratedBuildVersion
{
  return (NSString *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSLastMigratedBuildVersion"));
}

+ (NSDictionary)marketingItemOverrides
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMarketingItemOverrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
    goto LABEL_5;
  }
  v3 = v2;

  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSDictionary *)v4;
}

+ (NSDate)metricsTimingWindowStartTime
{
  return (NSDate *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSMetricsTimingWindowStartTime"));
}

+ (BOOL)migratedDeviceOffers
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSMigratedDeviceOffers"), 0);
}

+ (BOOL)migratedDeviceOffersForWatch
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSMigratedDeviceOffersForWatch"), 0);
}

+ (BOOL)migratedPrivacyAcknowledgements
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSMigratedPrivacyAcknowledgements"), 0);
}

+ (BOOL)migratedStorageToDefaultsForNonAMSInternal
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSMigratedStorageToDefaultsForNonAMSInternal"), 0);
}

+ (BOOL)cleanedUpUserDefaultsDataAfterMigrationToStorage
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSCleanedUpUserDefaultsDataAfterMigrationToStorage"), 0);
}

+ (NSDictionary)jsSourceOverrides
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_valueForKey:", CFSTR("AMSJSSourceOverrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_208);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

AMSPair *__32__AMSDefaults_jsSourceOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (BOOL)migratedToNewCookieStorage
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSMigratedToNewCookieStorage"), 0);
}

+ (BOOL)perfomedDeviceOfferSetup
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:domain:", CFSTR("AMSPerformedDeviceOfferSetup"), 0, CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (int64_t)pushEnvironment
{
  return objc_msgSend(a1, "_integerForKey:defaultValue:", CFSTR("AMSPushEnvironment"), 0);
}

+ (BOOL)autoSyncDisabledForMetricsIdentifierStore
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSAutoSyncDisabledForMetricsIdentifierStore"), 0);
  return has_internal_content;
}

+ (BOOL)autoSyncDisabledForAccountData
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSAutoSyncDisabledForAccountData"), 0);
  return has_internal_content;
}

+ (NSDictionary)regulatoryEligibilityAttributes
{
  return (NSDictionary *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSRegulatoryEligibilityAttributes"));
}

+ (BOOL)reviewComposerDemoMode
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSReviewComposerDemoMode"), 0);
  return has_internal_content;
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

+ (BOOL)showSandboxAccountUI
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSShowSandboxAccountUI"), 0);
}

+ (BOOL)showSpyglassPurchases
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSShowSpyglassPurchasesTab"), 0);
}

+ (NSDictionary)sourceOverrides
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_valueForKey:", CFSTR("AMSSourceOverrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_212);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

AMSPair *__30__AMSDefaults_sourceOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (BOOL)streamHARToDisk
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSStreamHARToDisk"), 0);
}

+ (NSDate)lastFraudScoreStateCleanupDate
{
  return (NSDate *)objc_msgSend(a1, "_valueForKey:", CFSTR("AMSFraudReportLastStateCleanupDate"));
}

+ (void)setLastFraudScoreStateCleanupDate:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSFraudReportLastStateCleanupDate"));
}

+ (void)setAcknowledgePrivacyOverride:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSAcknowledgePrivacyOverride"));
}

+ (void)setAllowDuplicateAccounts:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("kAMSUserDefaultsAllowDuplicateAccounts"));
}

+ (void)setAlwaysSendCacheBuster:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSAlwaysSendBuster"));
}

+ (void)setAlwaysSendGUID:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSAlwaysSendGuid"));
}

+ (void)setApplePayClassic:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSApplePayClassic"));
}

+ (void)setAuthenticationStarted:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("AuthenticationStarted"), CFSTR("com.apple.itunesstored"));
}

+ (void)setAutomationMode:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AutomationMode"));
}

+ (void)setBagOverrideIgnoredKeys:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("BagOverrideIgnoredKeys"));
}

+ (void)setBagOverrideInserts:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("BagOverrideInserts"));
}

+ (void)setBagOverrides:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("BagOverrides"));
}

+ (void)setBagURLCookies:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSBagURLCookies"));
}

+ (void)setCardEnrollmentAutomatic:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSCardEnrollmentAutomatic"));
}

+ (void)setCardEnrollmentManual:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSCardEnrollmentManual"));
}

+ (void)setCardEnrollmentSilent:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSCardEnrollmentSilent"));
}

+ (void)setCardEnrollmentUpsell:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSCardEnrollmentUpsell"));
}

+ (void)setDebugUI:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSDebugUI"));
}

+ (void)setDefaultPaymentPassIdentifier:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSDefaultPaymentPassIdentifier"));
}

+ (void)setDeviceBiometricIdentities:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSDeviceBiometricsIdentities"));
}

+ (void)setDeviceBiometricsState:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSDeviceBiometricsState"));
}

+ (void)setDeviceGroups:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("deviceGroups"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDeviceIsBundleOverride:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDeviceIsBundleOverride"));
}

+ (void)setDeviceOfferEligibility:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("AMSDeviceOfferEligibility"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDeviceRegistrationDenyList:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("deviceRegistrationBlacklist"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDevMode:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDevMode"));
}

+ (void)setDidFetchBundleOwnerStatus:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDidFetchBundleOwnerStatus"));
}

+ (void)setDidRetrieveDeviceOffers:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("AMSDidRetrieveDeviceOffers"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDidRetrieveDeviceOffersEligibility:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("AMSDidRetrieveDeviceOffersEligibility"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDidRetrieveTVOffers:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("AMSDidRetrieveTVOffers"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setDidSetUpServerDataCache:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDidSetUpServerDataCache"));
}

+ (void)setDisableHARLogging:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDisableHARLogging"));
}

+ (void)setDisablePrivacyAcknowledgement:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("DisableGDPR"), CFSTR("com.apple.itunesstored"));
}

+ (void)setDisableStubbedMarketingItems:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSDisableStubbedMarketingItems"));
}

+ (void)setEnableCameraRedeem:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSEnableCameraRedeem"));
}

+ (void)setEnablePurchaseQueue:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSEnablePurchaseQueue"));
}

+ (void)setEnableRemoteSecuritySigning:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSEnableRemoteSecuritySigning"));
}

+ (void)setEngagementExtendTimeouts:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("extendTimeouts"), CFSTR("com.apple.AppleMediaServices"));
}

+ (void)setForceEngagementPurchaseSuccess:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSForceEngagementPurchaseSuccess"));
}

+ (void)setForceLoadUrlMetrics:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSForceLoadUrlMetrics"));
}

+ (void)setIgnoreServerTrustEvaluation:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSIgnoreServerTrustEvaluation"));
}

+ (void)setJsSourceOverrides:(id)a3
{
  id v4;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_214);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v4, CFSTR("AMSJSSourceOverrides"));

}

AMSPair *__36__AMSDefaults_setJsSourceOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (void)setForwardedForIPAddress:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSUserDefaultsForwardedForIPAddress"));
}

+ (void)setJourneysURLOverride:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v4, CFSTR("AMSJourneysURLOverride"));

}

+ (void)setJourneysURLOverrides:(id)a3
{
  id v4;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_215);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:domain:", v4, CFSTR("urlOverrides"), CFSTR("com.apple.amsengagementd"));

}

AMSPair *__39__AMSDefaults_setJourneysURLOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (void)setHarURLFilters:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSHARURLFilters"));
}

+ (void)setJsVersionMap:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:domain:", a3, CFSTR("AMSJSVersionMap"), CFSTR("com.apple.AppleMediaServices"));
}

+ (void)setLastCarrierOfferRegistrationDate:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSLastCarrierOfferRegistrationDate"));
}

+ (void)setLastMigratedBuildVersion:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSLastMigratedBuildVersion"));
}

+ (void)setLogHARData:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSLogHARData"));
}

+ (void)setMarketingItemOverrides:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 4, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v4, CFSTR("AMSMarketingItemOverrides"));

}

+ (void)setMediaClientIdOverrides:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSMediaClientIdOverrides"));
}

+ (void)setMediaTokenOverride:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSMediaTokenOverride"));
}

+ (void)setMescalCertExpiration:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSFPCertExpiration"));
}

+ (void)setMetricsCanaryIdentifier:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSMetricsCanaryIdentifier"));
}

+ (void)setMetricsTimingWindowStartTime:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSMetricsTimingWindowStartTime"));
}

+ (void)setMigratedDeviceOffers:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSMigratedDeviceOffers"));
}

+ (void)setMigratedDeviceOffersForWatch:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSMigratedDeviceOffersForWatch"));
}

+ (void)setMigratedPrivacyAcknowledgements:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSMigratedPrivacyAcknowledgements"));
}

+ (void)setMigratedStorageToDefaultsForNonAMSInternal:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSMigratedStorageToDefaultsForNonAMSInternal"));
}

+ (void)setCleanedUpUserDefaultsDataAfterMigrationToStorage:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSCleanedUpUserDefaultsDataAfterMigrationToStorage"));
}

+ (void)setMigratedToNewCookieStorage:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSMigratedToNewCookieStorage"));
}

+ (void)setPerfomedDeviceOfferSetup:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:domain:", a3, CFSTR("AMSPerformedDeviceOfferSetup"), CFSTR("com.apple.AppleMediaServices.notbackedup"));
}

+ (void)setPushEnvironment:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSPushEnvironment"));
}

+ (void)setQAMode:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSQAMode"));
}

+ (void)setAutoSyncDisabledForMetricsIdentifierStore:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSAutoSyncDisabledForMetricsIdentifierStore"));
}

+ (void)setAutoSyncDisabledForAccountData:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSAutoSyncDisabledForAccountData"));
}

+ (void)setRegulatoryEligibilityAttributes:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSRegulatoryEligibilityAttributes"));
}

+ (void)setReversePushEnabled:(int64_t)a3
{
  objc_msgSend(a1, "_setInteger:forKey:", a3, CFSTR("AMSReversePushEnabled"));
}

+ (void)setReviewComposerDemoMode:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSReviewComposerDemoMode"));
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
  objc_msgSend(a1, "_setValue:forKey:", v7, v8);

}

+ (void)setShowSandboxAccountUI:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSShowSandboxAccountUI"));
}

+ (void)setShowSpyglassPurchases:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSShowSpyglassPurchasesTab"));
}

+ (void)setSourceOverrides:(id)a3
{
  id v4;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_216);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v4, CFSTR("AMSSourceOverrides"));

}

AMSPair *__34__AMSDefaults_setSourceOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  AMSPair *v6;
  void *v7;
  AMSPair *v8;

  v4 = a3;
  v5 = a2;
  v6 = [AMSPair alloc];
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPair initWithFirst:second:](v6, "initWithFirst:second:", v5, v7);
  return v8;
}

+ (void)setStorefrontSuffixes:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSStorefrontSuffixes"));
}

+ (void)setStreamHARToDisk:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSStreamHARToDisk"));
}

+ (void)setTreatmentOverrides:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSTreatmentOverrides"));
}

+ (void)setAccountFlagOverrides:(id)a3
{
  objc_msgSend(a1, "_setValue:forKey:", a3, CFSTR("AMSAccountFlagOverrides"));
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_223(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (v7)
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
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v15 = 138544130;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Unable to fetch duration for identifier: %{public}@. %{public}@", (uint8_t *)&v15, 0x2Au);

    }
  }
  objc_msgSend(v6, "doubleValue");
  +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)updateBadgeIdsForBundle:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    if (_MergedGlobals_95 != -1)
      dispatch_once(&_MergedGlobals_95, &__block_literal_global_225);
    v7 = (void *)qword_1ECEAD0A8;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke_2;
    block[3] = &unk_1E2540AD8;
    v11 = v9;
    v13 = a1;
    v12 = v6;
    v8 = v7;
    dispatch_sync(v8, block);

  }
}

void __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AMSDefaults.badging", 0);
  v1 = (void *)qword_1ECEAD0A8;
  qword_1ECEAD0A8 = (uint64_t)v0;

}

void __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Badges:%@"), *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_valueForKey:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    if (!objc_msgSend(v6, "count"))
    {

      v6 = 0;
    }
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setValue:forKey:", v8, v9);

  }
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setValue:forKey:", v8, v7);

}

+ (BOOL)allowUpsellEnrollmentForAppliedAccounts
{
  return objc_msgSend(a1, "_BOOLForKey:defaultValue:", CFSTR("AMSAllowUpsellForAppliedAccounts"), 0);
}

+ (id)demoAccount
{
  return 0;
}

+ (void)setAllowUpsellEnrollmentForAppliedAccounts:(BOOL)a3
{
  objc_msgSend(a1, "_setBool:forKey:", a3, CFSTR("AMSAllowUpsellForAppliedAccounts"));
}

+ (void)setDemoAccount:(id)a3
{
  id v3;
  AMSSetDemoAccountTask *v4;
  void *v5;
  void *v6;
  AMSSetDemoAccountTask *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [AMSSetDemoAccountTask alloc];
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AMSSetDemoAccountTask initWithUsername:password:](v4, "initWithUsername:password:", v5, v6);
  v8 = AMSAccountMediaTypeAppStoreSandbox;
  -[AMSSetDemoAccountTask clientInfo](v7, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccountMediaType:", v8);

  -[AMSSetDemoAccountTask performTask](v7, "performTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "resultWithError:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (!v11)
  {
    +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to setup the demo account. error = %{public}@", buf, 0x20u);

    }
  }

}

+ (id)sharedDatabaseChangeToken
{
  return 0;
}

+ (BOOL)useNewAccountStore
{
  return 1;
}

@end
