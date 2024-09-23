@implementation AMSDevice

+ (BOOL)deviceIsiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)deviceIsiPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (BOOL)deviceIsiPadSimulator
{
  return 0;
}

+ (NSString)productVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");

  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%ld.%ld"), 0, 0);
}

+ (NSString)operatingSystem
{
  return (NSString *)CFSTR("iOS");
}

+ (NSString)hardwareFamily
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain hardware family: %{public}d", buf, 0x1Cu);

    }
  }
  return (NSString *)v2;
}

+ (NSString)language
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  if (!+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory")
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "objectForKey:", CFSTR("AppleLanguageCodeSetup")),
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("AppleLanguages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v6, "firstObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      v3 = CFSTR("en");
  }
  return (NSString *)v3;
}

+ (BOOL)deviceIsAudioAccessory
{
  return 0;
}

+ (NSString)localIPAddress
{
  void *v2;
  ifaddrs *v3;
  void *v4;
  int v5;
  in_addr v6;
  ifaddrs *v8;

  v8 = 0;
  v2 = 0;
  if (!getifaddrs(&v8))
  {
    v3 = v8;
    if (v8)
    {
      while (1)
      {
        if (v3->ifa_addr->sa_family == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->ifa_name);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("en0"));

          if (v5)
            break;
        }
        v3 = v3->ifa_next;
        if (!v3)
        {
          v2 = 0;
          goto LABEL_8;
        }
      }
      v6.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", inet_ntoa(v6));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_8:
  MEMORY[0x18D789F60](v8);
  return (NSString *)v2;
}

+ (NSString)buildVersion
{
  __CFString *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain build version: %{public}d", buf, 0x1Cu);

    }
    v2 = CFSTR("1A0");
  }
  return (NSString *)v2;
}

+ (unint64_t)buildVariant
{
  if (qword_1ECEAD0E0 != -1)
    dispatch_once(&qword_1ECEAD0E0, &__block_literal_global_38);
  return qword_1ECEAD0D8;
}

+ (NSString)productType
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain product type: %{public}d", buf, 0x1Cu);

    }
  }
  return (NSString *)v2;
}

+ (BOOL)deviceIsAppleWatch
{
  return 0;
}

+ (NSString)hardwarePlatform
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain hardware platform: %{public}d", buf, 0x1Cu);

    }
  }
  return (NSString *)v2;
}

+ (BOOL)deviceIsAppleTV
{
  return 0;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

void __25__AMSDevice_buildVariant__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
  id v4;

  if (os_variant_has_internal_content())
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.da"));
    objc_msgSend(v4, "stringForKey:", CFSTR("ExperimentGroup"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v0)
    {
      if ((objc_msgSend(v0, "isEqual:", CFSTR("carry")) & 1) != 0)
      {
        v2 = 3;
      }
      else
      {
        v3 = objc_msgSend(v1, "isEqual:", CFSTR("walkabout"));
        v2 = 2;
        if (v3)
          v2 = 3;
      }
    }
    else
    {
      v2 = 1;
    }
    qword_1ECEAD0D8 = v2;

  }
}

+ (BOOL)deviceOffersContainType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AMSDevice_Offers__deviceOffersContainType___block_invoke;
  v6[3] = &unk_1E2540CC0;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  LOBYTE(a3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

+ (NSSet)deviceOffers
{
  void *v2;
  void *v3;
  void *v4;

  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceOffers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[AMSDeviceOffer offersSetFromArray:](AMSDeviceOffer, "offersSetFromArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSSet *)v4;
}

+ (BOOL)isRunningInStoreDemoMode
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)qword_1ECEAD0F0;
  v9 = qword_1ECEAD0F0;
  if (!qword_1ECEAD0F0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_1E253DDB8;
    v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "isRunningInStoreDemoMode");
}

+ (BOOL)expressedIntent
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expressedIntent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isEligibleForOffers
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isDeviceEligible"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isGift
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isGift"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)clearRegistrationDenyList
{
  AMSDeviceOffersStore *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_alloc_init(AMSDeviceOffersStore);
  -[AMSDeviceOffersStore setDeviceRegistrationDenyList:](v2, "setDeviceRegistrationDenyList:", 0);

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Cleared the device S/N denylist.", v5, 2u);
  }

}

uint64_t __45__AMSDevice_Offers__deviceOffersContainType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "offerType");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)deviceOffersForType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __41__AMSDevice_Offers__deviceOffersForType___block_invoke;
    v17 = &unk_1E2540CE8;
    v18 = v6;
    v19 = a3;
    v8 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v14);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v8, v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find device offers of type: %@", buf, 0xCu);

    }
    return 0;
  }
}

void __41__AMSDevice_Offers__deviceOffersForType___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "offerType") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bag:(id)a5 logKey:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __CFString **v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hashedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v13;
    v47 = 2114;
    v48 = v14;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting all follow ups for account: %{public}@", buf, 0x16u);

  }
  +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16)
  {
    v17 = v16;
    v43 = v10;
    v44 = v9;
    objc_msgSend(v15, "ams_filterUsingTest:", &__block_literal_global_37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    objc_msgSend(v15, "ams_filterUsingTest:", &__block_literal_global_22_0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = -[NSObject count](v20, "count");
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
      AMSLogKey();
      v41 = v15;
      v42 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      v26 = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v24;
      v47 = 2114;
      v48 = v27;
      v49 = 2114;
      v50 = v28;
      v51 = 2114;
      v52 = v29;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Offers count - Total: %{public}@, iCloud: %{public}@, Apple Music: %{public}@", buf, 0x2Au);

      v8 = v26;
      v20 = v25;
      v15 = v41;

      v18 = v42;
    }

    if (v19 && v21)
    {
      +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v32;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting unified followup for iCloud and Apple Music", buf, 0xCu);

      }
      v33 = &AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud;
    }
    else if (v19)
    {
      +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v36;
        v47 = 2114;
        v48 = v37;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Found %{public}@ iCloud offers, posting follow-up", buf, 0x16u);

      }
      v33 = &AMSDeviceOfferFollowUpIdentifieriCloud;
    }
    else
    {
      if (!v21)
      {
        v35 = 0;
        v10 = v43;
        v9 = v44;
        goto LABEL_35;
      }
      +[AMSLogConfig sharedAccountsAuthenticationPluginConfig](AMSLogConfig, "sharedAccountsAuthenticationPluginConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v20, "count"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v38;
        v47 = 2114;
        v48 = v39;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Found %{public}@ AppleMusic offers, posting follow-up", buf, 0x16u);

      }
      v33 = &AMSDeviceOfferFollowUpIdentifierAppleMusic;
    }

    v10 = v43;
    v9 = v44;
    v35 = +[AMSDevice postDeviceOfferFollowUpWithIdentifier:account:priority:bag:logKey:](AMSDevice, "postDeviceOfferFollowUpWithIdentifier:account:priority:bag:logKey:", *v33, v8, 0, v44, v43);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v34;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] No offers were found for which to post follow-up(s)", buf, 0xCu);

    }
    v35 = 0;
  }
LABEL_35:

  return v35;
}

BOOL __79__AMSDevice_Offers__postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offerType") == 2;
}

BOOL __79__AMSDevice_Offers__postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offerType") == 1;
}

+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6 logKey:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  AMSFollowUp *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  void *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "ams_DSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(AMSFollowUp);
    v31 = v12;
    +[AMSDevice _followUpItemWithIdentifier:account:priority:bag:](AMSDevice, "_followUpItemWithIdentifier:account:priority:bag:", v10, v11, a5, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLogKey:", v16);

    -[AMSFollowUp postFollowUpItem:](v14, "postFollowUpItem:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v18 = (id)objc_msgSend(v17, "resultWithTimeout:error:", &v32, 5.0);
    v19 = v32;
    v20 = v19 == 0;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v19)
    {
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v24;
      v35 = 2114;
      v36 = v10;
      v37 = 2114;
      v38 = v19;
      v25 = "AMSDevice+Offers: [%{public}@] Failed to post follow up with identifier: %{public}@, error: %{public}@";
      v26 = v23;
      v27 = OS_LOG_TYPE_ERROR;
      v28 = 32;
    }
    else
    {
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2114;
      v36 = v10;
      v25 = "AMSDevice+Offers: [%{public}@] Posted follow up with identifier: %{public}@";
      v26 = v23;
      v27 = OS_LOG_TYPE_DEBUG;
      v28 = 22;
    }
    _os_log_impl(&dword_18C849000, v26, v27, v25, buf, v28);

LABEL_17:
    v12 = v31;
    goto LABEL_18;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v14 = (AMSFollowUp *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v29;
    _os_log_impl(&dword_18C849000, &v14->super, OS_LOG_TYPE_INFO, "AMSDevice+Offers: [%{public}@] Failed to post device offer for account with <nil> DSID", buf, 0xCu);

  }
  v20 = 0;
LABEL_18:

  return v20;
}

+ (void)registerCompanionWithSerialNumber:(id)a3 bag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  AMSDeviceOfferRegistrationTask *v25;
  id v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Attempting to register companion serial number: %@", buf, 0xCu);
  }

  if (v5)
  {
    +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!v11)
    {
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find device offer eligibility dictionary, creating new instance", buf, 2u);
      }

      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v28 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("companionSerialNumbers"));
      goto LABEL_33;
    }
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Found device offer eligibility dictionary", buf, 2u);
    }

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("companionSerialNumbers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;

      if (v18)
      {
LABEL_32:
        objc_msgSend(v18, "addObject:", v5);
        v22 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("companionSerialNumbers"));

LABEL_33:
        v23 = (void *)objc_msgSend(v11, "copy");
        +[AMSDefaults setDeviceOfferEligibility:](AMSDefaults, "setDeviceOfferEligibility:", v23);

        +[AMSDefaults setDidRetrieveDeviceOffers:](AMSDefaults, "setDidRetrieveDeviceOffers:", 0);
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ams_activeiTunesAccount");
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v25 = -[AMSDeviceOfferRegistrationTask initWithAccount:bag:]([AMSDeviceOfferRegistrationTask alloc], "initWithAccount:bag:", v12, v6);
          v26 = -[AMSDeviceOfferRegistrationTask perform](v25, "perform");
        }
        else
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v25 = (AMSDeviceOfferRegistrationTask *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v25 = (AMSDeviceOfferRegistrationTask *)objc_claimAutoreleasedReturnValue();
          }
          -[AMSDeviceOfferRegistrationTask OSLogObject](v25, "OSLogObject");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Device offer registration could not be performed - no account", buf, 2u);
          }

        }
        goto LABEL_41;
      }
    }
    else
    {

    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find companion serial number array, creating new instance", buf, 2u);
    }

    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_32;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: Failed to register companion serial number for nil serial number", buf, 2u);
  }
LABEL_41:

}

+ (void)removeDeviceOfferRegistrationItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(a1, "_removeDeviceOfferRegistrationItem:fromDeviceOfferStore:", v4, v5);

}

+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5 logKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t, _BYTE *);
  void *v36;
  id v37;
  _BYTE *v38;
  uint8_t v39[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!+[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:logKey:](AMSDevice, "tearDownAllDeviceOfferFollowUpsForAccount:logKey:", v10, v12))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      objc_msgSend(v10, "hashedDescription");
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v46 = v15;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to tear down all follow ups while removing device offer: %{public}@ for account: %{public}@", buf, 0x20u);

    }
  }
  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("deviceOffers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (objc_msgSend(v21, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__25;
    v47 = __Block_byref_object_dispose__25;
    v48 = 0;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __72__AMSDevice_Offers__removeDeviceOfferWithIdentifier_account_bag_logKey___block_invoke;
    v36 = &unk_1E2540D50;
    v22 = v9;
    v37 = v22;
    v38 = buf;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", &v33);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v21, "removeObject:", v33, v34, v35, v36);
      v23 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("deviceOffers"));

      v24 = (void *)objc_msgSend(v18, "copy");
      +[AMSDefaults setDeviceOfferEligibility:](AMSDefaults, "setDeviceOfferEligibility:", v24);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v33, v34, v35, v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "hashedDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v39 = 138543874;
        v40 = v12;
        v41 = 2114;
        v42 = v22;
        v43 = 2114;
        v44 = v29;
        _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to find device offer: %{public}@ for account: %{public}@", v39, 0x20u);

      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "hashedDescription");
      v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v46 = v27;
      _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to find any offers to remove while removing device offer: %{public}@ for account: %{public}@", buf, 0x20u);

    }
  }
  +[AMSDefaults setDidRetrieveDeviceOffers:](AMSDefaults, "setDidRetrieveDeviceOffers:", 0);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v30, "OSLogObject");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "hashedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v32;
    _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting device offer followups for account: %{public}@", buf, 0x16u);

  }
  +[AMSDevice postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:](AMSDevice, "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:", v10, 0, v11, v12);

}

void __72__AMSDevice_Offers__removeDeviceOfferWithIdentifier_account_bag_logKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  AMSDeviceOffer *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = -[AMSDeviceOffer initWithDictionary:]([AMSDeviceOffer alloc], "initWithDictionary:", v10);
  -[AMSDeviceOffer offerIdentifier](v7, "offerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (BOOL)saveDeviceOffersForAccount:(id)a3 response:(id)a4 logKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  id v42;
  void *v43;
  unsigned int v44;
  void *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AMSDefaults setDidRetrieveDeviceOffersEligibility:](AMSDefaults, "setDidRetrieveDeviceOffersEligibility:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("deviceEligibility"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("companionSerialNumbers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("companionSerialNumbers"));
  if (v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v10;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Device is eligible, saving offers", buf, 0xCu);
    }

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("isDeviceEligible"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = objc_msgSend(v17, "BOOLValue");
    else
      v44 = 0;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("eligibilityCriteria"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v45 = v18;
    v46 = a1;
    v43 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("agreedToTerms"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = objc_msgSend(v20, "BOOLValue");
      else
        v41 = 0;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("expressedIntent"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v40 = objc_msgSend(v28, "BOOLValue");
      else
        v40 = 0;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("goodStanding"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = objc_msgSend(v29, "BOOLValue");
      else
        v24 = 0;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isGift"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = objc_msgSend(v30, "BOOLValue");
      else
        v39 = 0;
      v42 = v10;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isICloudFamily"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v32 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = objc_msgSend(v31, "BOOLValue");
      else
        v26 = 0;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("validPayment"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = objc_msgSend(v33, "BOOLValue");
      else
        v27 = 0;

      v9 = v32;
      v21 = v42;
      v23 = v40;
      v22 = v41;
      v25 = v39;
    }
    else
    {
      v21 = v10;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
    }
    objc_msgSend(v8, "ams_setAgreedToTerms:", v22);
    objc_msgSend(v8, "ams_setInGoodStanding:", v24);
    objc_msgSend(v8, "ams_setiCloudFamily:", v26);
    objc_msgSend(v8, "ams_setValidPayment:", v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, CFSTR("expressedIntent"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("isDeviceEligible"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, CFSTR("isGift"));

    a1 = v46;
    v10 = v21;
    v14 = v43;
  }
  v37 = (void *)objc_opt_new();
  objc_msgSend(a1, "_setDeviceEligibilityKeepingExistingDeviceOffers:offersStore:", v13, v37);

  return v12 != 0;
}

+ (void)saveDeviceOfferEligibility:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceOffers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setDeviceEligibilityKeepingExistingDeviceOffers:offersStore:", v4, v6);

  objc_msgSend(a1, "saveDeviceOffers:", v5);
}

+ (void)saveDeviceOffers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[AMSDefaults didRetrieveTVOffers](AMSDefaults, "didRetrieveTVOffers"))
  {
    objc_msgSend(v4, "ams_filterUsingTest:", &__block_literal_global_46);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  else if (objc_msgSend(v4, "ams_anyWithTest:", &__block_literal_global_47))
  {
    +[AMSDefaults setDidRetrieveTVOffers:](AMSDefaults, "setDidRetrieveTVOffers:", 1);
  }
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(a1, "_setRawDeviceOffers:offersStore:", v4, v6);

  if (v7)
  {
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
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Posting offers changed notification", (uint8_t *)&v12, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.AppleMediaServices.deviceOffersChanged"), 0, 0, 1u);
  }

}

uint64_t __38__AMSDevice_Offers__saveDeviceOffers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSDeviceOffer *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = -[AMSDeviceOffer initWithDictionary:]([AMSDeviceOffer alloc], "initWithDictionary:", v2);

  -[AMSDeviceOffer offerIdentifier](v3, "offerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.TV")) ^ 1;

  return v5;
}

uint64_t __38__AMSDevice_Offers__saveDeviceOffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  AMSDeviceOffer *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = -[AMSDeviceOffer initWithDictionary:]([AMSDeviceOffer alloc], "initWithDictionary:", v2);

  -[AMSDeviceOffer offerIdentifier](v3, "offerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.TV"));

  return v5;
}

+ (void)setDeviceOffersCheckEncodingForRequestParameters:(id)a3
{
  id v3;
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[AMSDefaults didRetrieveDeviceOffersEligibility](AMSDefaults, "didRetrieveDeviceOffersEligibility");
  if (v3)
  {
    v5 = v4;
    v6 = +[AMSProcessInfo isBuddyRunning](AMSProcessInfo, "isBuddyRunning");
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 || !v5)
    {
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v8, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Will decorate request parameters with serial number", (uint8_t *)&v24, 2u);
      }

      objc_msgSend(v3, "ams_setNullableObject:forKey:", CFSTR("true"), CFSTR("deviceOffersCheck"));
      +[AMSDefaults deviceOfferEligibility](AMSDefaults, "deviceOfferEligibility");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("companionSerialNumbers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v14;
      else
        v8 = 0;

      +[AMSDevice serialNumber](AMSDevice, "serialNumber");
      v15 = objc_claimAutoreleasedReturnValue();
      v9 = v15;
      if (v8)
      {
        if (v15)
          -[NSObject addObject:](v8, "addObject:", v15);
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
          v24 = 138412290;
          v25 = v8;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Decorating request parameters with serial numbers: %@", (uint8_t *)&v24, 0xCu);
        }

        objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("serialNumber"));
      }
      else
      {
        if (os_variant_has_internal_content())
        {
          +[AMSDefaults deviceOffersSerialNumber](AMSDefaults, "deviceOffersSerialNumber");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
              v24 = 138412290;
              v25 = v18;
              _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Internal deviceOffer serial number override found: %@", (uint8_t *)&v24, 0xCu);
            }

            v21 = v18;
            v9 = v21;
          }

        }
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
          v24 = 138412290;
          v25 = v9;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Decorating request parameters with serial number: %@", (uint8_t *)&v24, 0xCu);
        }

        objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, CFSTR("serialNumber"));
        v8 = 0;
      }
    }
    else
    {
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        v10 = "AMSDevice+Offers: Skipping decoration of request parameters with serial number";
LABEL_12:
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 2u);
      }
    }
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      v10 = "AMSDevice+Offers: Skipping decoration of request parameters with serial number for no request parameters";
      goto LABEL_12;
    }
  }

}

+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3
{
  return objc_msgSend(a1, "shouldPresentSetupOffersForAccount:issues:", a3, 0);
}

+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3 issues:(int64_t *)a4
{
  int64_t *v4;
  _BOOL8 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  void *v26;
  int64_t *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a4;
    v5 = +[AMSDevice isEligibleForOffers](AMSDevice, "isEligibleForOffers");
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_activeiCloudAccount");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_activeiTunesAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject ams_DSID](v7, "ams_DSID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          objc_msgSend(v8, "ams_DSID"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      -[NSObject ams_DSID](v7, "ams_DSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ams_DSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v12, "isEqualToNumber:", v13);

    }
    else
    {
      v30 = 0;
    }
    +[AMSDevice deviceOffers](AMSDevice, "deviceOffers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    -[NSObject hashedDescription](v7, "hashedDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hashedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v27 = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v26 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 != 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v32 = v29;
      v33 = 2112;
      v34 = v28;
      v35 = 2112;
      v36 = v18;
      v37 = 2112;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Determining setup device offer eligibility for iCloud account: %@, iTunes account: %@, isEligible: %@, isCombinedAccount: %@, hasOffers: %@", buf, 0x34u);

      v4 = v27;
      v6 = v26;
    }

    v21 = v5 & v30;
    if (v15)
      v22 = v5 & v30;
    else
      v22 = 0;
    if (v4)
    {
      *v4 = 0;
      if (!v15)
        v21 = 0;
      if (!v21)
      {
        v23 = 2;
        if (v5)
          v23 = 0;
        v24 = v23 | v30 ^ 1;
        if (!v15)
          v24 |= 4uLL;
        *v4 = v24;
      }
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", 0, a4);
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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: No account specified for offer check", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

+ (BOOL)tearDownAllDeviceOfferFollowUpsForAccount:(id)a3 logKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "hashedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Tearing down all follow ups for account: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v10 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:](AMSDevice, "tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:", AMSDeviceOfferFollowUpIdentifierAppleMusic, v5, v6);
  v11 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:](AMSDevice, "tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:", AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud, v5, v6);
  v12 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:](AMSDevice, "tearDownDeviceOfferFollowUpWithIdentifier:account:logKey:", AMSDeviceOfferFollowUpIdentifieriCloud, v5, v6);

  return v10 && v11 && v12;
}

+ (BOOL)tearDownDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 logKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  AMSFollowUp *v39;
  id obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37 = a5;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v36 = v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "hashedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v37;
    v50 = 2114;
    v51 = v36;
    v52 = 2114;
    v53 = v11;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Tearing down follow up with identifier: %{public}@, for account: %{public}@", buf, 0x20u);

    v7 = v36;
  }

  v39 = objc_alloc_init(AMSFollowUp);
  -[AMSFollowUp pendingFollowUps](v39, "pendingFollowUps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v12, "resultWithError:", &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;

  v15 = v14 == 0;
  v35 = v8;
  if (v14)
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
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v49 = v37;
      v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to locate pending items to tear down followup with identifier: %{public}@", buf, 0x16u);
    }

    v13 = 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v13;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v43;
    do
    {
      v21 = 0;
      v38 = v19;
      do
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v21);
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v7);

        if (v24)
        {
          -[AMSFollowUp clearFollowUpItem:](v39, "clearFollowUpItem:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v14;
          v26 = objc_msgSend(v25, "resultWithTimeout:error:", &v41, 5.0);
          v27 = v41;

          if (v27)
          {
            v28 = v20;
            v29 = v15;
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v30, "OSLogObject");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v22, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "account");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = v37;
              v50 = 2114;
              v51 = v32;
              v52 = 2114;
              v53 = v33;
              _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to tear down followup with identifier: %{public}@ account: %{public}@", buf, 0x20u);

              v7 = v36;
            }

            v15 = v29;
            v20 = v28;
            v19 = v38;
          }
          v15 &= v26;

          v14 = v27;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v19);
  }

  return v15 & 1;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_96 != -1)
    dispatch_once(&_MergedGlobals_96, &__block_literal_global_56);
  return (NSString *)(id)qword_1ECEAD0B8;
}

void __34__AMSDevice_Offers__bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD0B8;
  qword_1ECEAD0B8 = (uint64_t)CFSTR("AMSDeviceOffers");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD0C0 != -1)
    dispatch_once(&qword_1ECEAD0C0, &__block_literal_global_59);
  return (NSString *)(id)qword_1ECEAD0C8;
}

void __41__AMSDevice_Offers__bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD0C8;
  qword_1ECEAD0C8 = (uint64_t)CFSTR("1");

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

+ (id)cachedRegistrationGroups
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "cachedRegistrationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)registrationDenyList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "deviceRegistrationDenyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_followUpItemWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6
{
  id v9;
  AMSFollowUpItem *v10;
  AMSMetricsEvent *v11;
  AMSMetricsEvent *v12;
  AMSMetricsEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSFollowUpAction *v20;
  void *v21;
  AMSFollowUpAction *v22;
  void *v23;
  void *v24;
  AMSFollowUpAction *v25;
  AMSFollowUpItem *v26;
  AMSMetricsEvent *v27;
  AMSMetricsEvent *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  AMSFollowUpAction *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AMSFollowUpAction *v41;
  void *v42;
  void *v43;
  void *v44;
  AMSFollowUpAction *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  AMSMetricsEvent *v53;
  AMSMetricsEvent *v54;
  _QWORD v55[2];
  AMSFollowUpAction *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a6;
  v9 = a4;
  v10 = -[AMSFollowUpItem initWithIdentifier:account:priority:]([AMSFollowUpItem alloc], "initWithIdentifier:account:priority:", v51, v9, a5);
  -[AMSFollowUpItem setShouldPostNotification:](v10, "setShouldPostNotification:", 0);
  v11 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", CFSTR("xp_amp_retail_sub"));
  -[AMSMetricsEvent setEventType:](v11, "setEventType:", CFSTR("page"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", CFSTR("AccountFollowUp"), CFSTR("pageId"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", CFSTR("Picker"), CFSTR("pageType"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v11, "setProperty:forBodyKey:", CFSTR("Settings"), CFSTR("pageContext"));
  v53 = v11;
  -[AMSFollowUpItem setMetricsEvent:](v10, "setMetricsEvent:", v11);
  v12 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", CFSTR("xp_amp_retail_sub"));
  -[AMSMetricsEvent setEventType:](v12, "setEventType:", CFSTR("click"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", CFSTR("AccountFollowUp"), CFSTR("pageId"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", CFSTR("open"), CFSTR("actionType"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", CFSTR("button"), CFSTR("targetType"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v12, "setProperty:forBodyKey:", CFSTR("SetUpAppleMusic"), CFSTR("targetId"));
  v13 = -[AMSMetricsEvent initWithTopic:]([AMSMetricsEvent alloc], "initWithTopic:", CFSTR("xp_amp_retail_sub"));
  -[AMSMetricsEvent setEventType:](v13, "setEventType:", CFSTR("click"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v13, "setProperty:forBodyKey:", CFSTR("AccountFollowUp"), CFSTR("pageId"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v13, "setProperty:forBodyKey:", CFSTR("open"), CFSTR("actionType"));
  -[AMSMetricsEvent setProperty:forBodyKey:](v13, "setProperty:forBodyKey:", CFSTR("button"), CFSTR("targetType"));
  v54 = v13;
  -[AMSMetricsEvent setProperty:forBodyKey:](v13, "setProperty:forBodyKey:", CFSTR("SetUpIcloud"), CFSTR("targetId"));
  objc_msgSend(v9, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v51, "isEqualToString:", AMSDeviceOfferFollowUpIdentifierAppleMusic))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = v52;
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_DESC_APPLE_ACCOUNT"), v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setInformativeText:](v10, "setInformativeText:", v18);

    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_TITLE"), v52);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setTitle:](v10, "setTitle:", v19);

    v20 = [AMSFollowUpAction alloc];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_CONTINUE_LABEL"), v52);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v20, "initWithLabel:parentIdentifier:", v21, v51);

    -[AMSFollowUpAction setPreferredClient:](v22, "setPreferredClient:", CFSTR("com.apple.Music"));
    objc_msgSend(v52, "URLForKey:", 0x1E254C840);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueWithError:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpAction setUrl:](v22, "setUrl:", v24);

    -[AMSFollowUpAction setMetricsEvent:](v22, "setMetricsEvent:", v12);
    v57[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v25 = (AMSFollowUpAction *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setActions:](v10, "setActions:", v25);
    v26 = v10;
    v27 = v12;
    v28 = v54;
LABEL_8:

    goto LABEL_9;
  }
  v16 = v52;
  if (objc_msgSend(v51, "isEqualToString:", AMSDeviceOfferFollowUpIdentifieriCloud))
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_DESC_APPLE_ACCOUNT"), v52);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    -[AMSFollowUpItem setInformativeText:](v10, "setInformativeText:", v31);

    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_TITLE"), v52);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setTitle:](v10, "setTitle:", v32);

    v33 = [AMSFollowUpAction alloc];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_CONTINUE_LABEL"), v52);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v33, "initWithLabel:parentIdentifier:", v34, v51);

    objc_msgSend(v52, "URLForKey:", 0x1E254C860);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "valueWithError:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpAction setUrl:](v22, "setUrl:", v36);

    v28 = v13;
    -[AMSFollowUpAction setMetricsEvent:](v22, "setMetricsEvent:", v13);
    v56 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v25 = (AMSFollowUpAction *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setActions:](v26, "setActions:", v25);
LABEL_7:
    v27 = v12;
    goto LABEL_8;
  }
  v26 = v10;
  v27 = v12;
  v28 = v13;
  if (objc_msgSend(v51, "isEqualToString:", AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud))
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_UNIFIED_DESC_APPLE_ACCOUNT"), v52);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), 0, v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setInformativeText:](v26, "setInformativeText:", v39);

    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_UNIFIED_TITLE"), v52);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setTitle:](v26, "setTitle:", v40);

    v41 = [AMSFollowUpAction alloc];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_LABEL"), v52);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v41, "initWithLabel:parentIdentifier:", v42, v51);

    -[AMSFollowUpAction setPreferredClient:](v22, "setPreferredClient:", CFSTR("com.apple.Music"));
    objc_msgSend(v52, "URLForKey:", 0x1E254C840);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "valueWithError:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpAction setUrl:](v22, "setUrl:", v44);

    -[AMSFollowUpAction setMetricsEvent:](v22, "setMetricsEvent:", v12);
    v28 = v13;
    v45 = [AMSFollowUpAction alloc];
    AMSLocalizedString(CFSTR("DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_LABEL"), v52);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](v45, "initWithLabel:parentIdentifier:", v46, v51);

    objc_msgSend(v52, "URLForKey:", 0x1E254C860);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "valueWithError:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpAction setUrl:](v25, "setUrl:", v48);

    -[AMSFollowUpAction setMetricsEvent:](v25, "setMetricsEvent:", v54);
    -[AMSFollowUpAction setShouldClear:](v25, "setShouldClear:", 1);
    v55[0] = v22;
    v55[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSFollowUpItem setActions:](v26, "setActions:", v49);

    goto LABEL_7;
  }
LABEL_9:

  return v26;
}

+ (id)_notificationIdFromFollowUpId:(id)a3 account:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a4, a3);
}

+ (void)_performAuth
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  AMSAuthenticateOptions *v6;
  AMSAuthenticateTask *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Attempting to perform silent auth.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_activeiTunesAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(AMSAuthenticateOptions);
    -[AMSAuthenticateOptions setDebugReason:](v6, "setDebugReason:", CFSTR("device offers"));
    -[AMSAuthenticateOptions setAuthenticationType:](v6, "setAuthenticationType:", 1);
    -[AMSAuthenticateOptions setCanMakeAccountActive:](v6, "setCanMakeAccountActive:", 0);
    v7 = -[AMSAuthenticateTask initWithAccount:options:]([AMSAuthenticateTask alloc], "initWithAccount:options:", v5, v6);
    -[AMSAuthenticateTask performAuthentication](v7, "performAuthentication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSuccessBlock:", &__block_literal_global_126);
    objc_msgSend(v8, "addErrorBlock:", &__block_literal_global_129);

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (AMSAuthenticateOptions *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (AMSAuthenticateOptions *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSAuthenticateOptions OSLogObject](v6, "OSLogObject");
    v7 = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18C849000, &v7->super.super, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Silent auth attempt failed for no account", v9, 2u);
    }
  }

}

void __33__AMSDevice_Offers___performAuth__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Register Serial: Silent auth did succeed with result: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void __33__AMSDevice_Offers___performAuth__block_invoke_127(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Register Serial: Silent auth failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)_removeDeviceOfferRegistrationItem:(id)a3 fromDeviceOfferStore:(id)a4
{
  objc_msgSend(a4, "removeCachedRegistrationItem:", a3);
}

+ (void)_setDeviceEligibilityKeepingExistingDeviceOffers:(id)a3 offersStore:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithDictionary:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOffers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("deviceOffers"));

  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v6, "setDeviceOfferEligibility:", v8);

}

+ (BOOL)_setRawDeviceOffers:(id)a3 offersStore:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "deviceOffers");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = objc_msgSend(a1, "_shouldPostOffersUpdatedNotification:oldOffers:", v7, v11);
  objc_msgSend(v6, "setDeviceOffers:", v7);

  return v12;
}

+ (BOOL)_shouldPostOffersUpdatedNotification:(id)a3 oldOffers:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke((uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToDictionary:", v7) ^ 1;
  return (char)v5;
}

id __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  +[AMSDeviceOffer offersSetFromArray:](AMSDeviceOffer, "offersSetFromArray:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_dictionaryUsingTransform:", &__block_literal_global_133);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *__68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "offerIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E2548760;
  v4 = v2;

  return v4;
}

+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSContractBagShim *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = AMSSetLogKey(v10);
  v14 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v11);

  LOBYTE(v11) = objc_msgSend(a1, "postAllDeviceOfferFollowUpsForAccount:priority:bag:logKey:", v12, a4, v14, v10);
  return (char)v11;
}

+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AMSContractBagShim *v17;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = AMSSetLogKey(v12);
  v17 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v13);

  LOBYTE(v13) = objc_msgSend(a1, "postDeviceOfferFollowUpWithIdentifier:account:priority:bag:logKey:", v15, v14, a5, v17, v12);
  return (char)v13;
}

+ (void)registerCompanionWithSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[AMSDeviceOfferRegistrationTask bagSubProfile](AMSDeviceOfferRegistrationTask, "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDeviceOfferRegistrationTask bagSubProfileVersion](AMSDeviceOfferRegistrationTask, "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "registerCompanionWithSerialNumber:bag:", v4, v7);
}

+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bagContract:(id)a5 logKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  AMSContractBagShim *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = AMSSetLogKey(v10);
  v15 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v11);

  objc_msgSend(a1, "removeDeviceOfferWithIdentifier:account:bag:logKey:", v13, v12, v15, v10);
}

+ (int64_t)biometricState
{
  return +[AMSDefaults deviceBiometricsState](AMSDefaults, "deviceBiometricsState");
}

+ (void)setBiometricState:(int64_t)a3
{
  +[AMSDefaults setDeviceBiometricsState:](AMSDefaults, "setDeviceBiometricsState:", a3);
}

+ (NSArray)carrierNames
{
  void *v2;
  void *v3;

  +[AMSTelephonyDataCache sharedCache](AMSTelephonyDataCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)carrierNamesPromise
{
  void *v2;
  void *v3;

  +[AMSTelephonyDataCache sharedCache](AMSTelephonyDataCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierNamesPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSString)compatibleProductType
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFString *Value;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFDictionary *)MGCopyAnswerWithError();
  if (v2)
  {
    v3 = v2;
    Value = (const __CFString *)CFDictionaryGetValue(v2, CFSTR("CompatibleDeviceFallback"));
    v5 = (__CFString *)Value;
    if (Value)
    {
      if (CFStringCompare(Value, CFSTR("0"), 0))
        v5 = (__CFString *)-[__CFString copy](v5, "copy");
      else
        v5 = 0;
    }
    CFRelease(v3);
    return (NSString *)v5;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 1026;
      v16 = 0;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain artwork traits: %{public}d", buf, 0x1Cu);

    }
    return (NSString *)0;
  }
}

+ (NSString)deviceName
{
  __CFString *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain user assigned device name: %{public}d", buf, 0x1Cu);

    }
    v2 = CFSTR("Unknown");
  }
  return (NSString *)v2;
}

+ (BOOL)isSecureElementAvailable
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (v2)
  {
    v3 = v2;
    v4 = CFBooleanGetValue(v2) != 0;
    CFRelease(v3);
  }
  else
  {
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
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSSetLogKeyIfNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 1026;
      v16 = 0;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%@] Failed to determine Secure Element availability: %{public}d", buf, 0x1Cu);

    }
    return 0;
  }
  return v4;
}

+ (NSString)macAddress
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v7[16];

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain MAC address for unsupported platform.", v7, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v5;
}

+ (NSData)macAddressData
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain MAC address data for unsupported platform.", v5, 2u);
  }

  return (NSData *)objc_alloc_init(MEMORY[0x1E0C99D50]);
}

+ (NSString)MLBSerialNumber
{
  return 0;
}

+ (NSString)modelPartNumber
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_regionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_modelNumber");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

+ (NSString)name
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad")
    || +[AMSDevice deviceIsiPadSimulator](AMSDevice, "deviceIsiPadSimulator"))
  {
    return (NSString *)CFSTR("iPad");
  }
  if (!+[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone")
    && !+[AMSDevice deviceIsiPhoneSimulator](AMSDevice, "deviceIsiPhoneSimulator"))
  {
    if (+[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod")
      || +[AMSDevice deviceIsiPodSimulator](AMSDevice, "deviceIsiPodSimulator"))
    {
      return (NSString *)CFSTR("iPod");
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = a1;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%@] unable to determine iOS device family", (uint8_t *)&v7, 0x16u);

    }
  }
  return (NSString *)CFSTR("iPhone");
}

+ (NSString)phoneNumber
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    *(_DWORD *)buf = 138543618;
    v29 = v5;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching the device's phone number.", buf, 0x16u);

  }
  objc_msgSend(a1, "_voicePreferredPhoneNumberContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
      v16 = v15;
      if (v13)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, a1);
      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = (uint64_t)v17;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched the device's phone number. phoneNumber = %{public}@", buf, 0x16u);
      if (v13)
      {

        v17 = a1;
      }

    }
    v25 = v8;
  }
  else
  {
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      v22 = v21;
      if (v19)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] "), v22, a1);
      }
      else
      {
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: "), v21);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = (uint64_t)v23;
      v30 = 2112;
      v31 = v26;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the device's phone number. phoneNumberInfo = %@", buf, 0x16u);
      if (v19)
      {

        v23 = a1;
      }

    }
    v25 = 0;
  }

  return (NSString *)v25;
}

+ (NSString)regionCode
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain regionCode: %{public}d", buf, 0x1Cu);

    }
  }
  return (NSString *)v2;
}

+ (NSString)ROMAddress
{
  return 0;
}

+ (NSNumber)screenScale
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  MGGetFloat32Answer();
  return (NSNumber *)objc_msgSend(v2, "numberWithFloat:");
}

+ (NSNumber)screenHeight
{
  void *v2;

  v2 = (void *)MGGetSInt64Answer();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v2;
}

+ (NSNumber)screenWidth
{
  void *v2;

  v2 = (void *)MGGetSInt64Answer();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v2;
}

+ (NSString)secureElementID
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getNFSecureElementClass_softClass;
  v17 = getNFSecureElementClass_softClass;
  if (!getNFSecureElementClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = __getNFSecureElementClass_block_invoke;
    v20 = &unk_1E253DDB8;
    v21 = &v14;
    __getNFSecureElementClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  if (v3 && getNFHardwareManagerClass())
  {
    v4 = (void *)xpc_copy_entitlement_for_self();
    v5 = v4;
    if (v4 && xpc_BOOL_get_value(v4))
    {
      objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secureElements");
      v7 = objc_claimAutoreleasedReturnValue();

      -[NSObject objectAtIndex:](v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serialNumber");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v9;
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v14);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v9, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: The current process is missing the entitlement com.apple.nfcd.hwmanager", (uint8_t *)&buf, 0xCu);
      }
      v10 = 0;
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: NearField classes unavailable", (uint8_t *)&buf, 0xCu);
    }
    v10 = 0;
  }

  return (NSString *)v10;
}

+ (NSString)serialNumber
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 1026;
      v13 = 0;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain serial number: %{public}d", buf, 0x1Cu);

    }
  }
  return (NSString *)v2;
}

+ (NSString)thinnedAppVariantId
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "productType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(a1, "compatibleProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NSString)uniqueDeviceId
{
  void *v2;
  void *v3;
  CFTypeID v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 1026;
      v18 = 0;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain unique device identifier: %{public}d", buf, 0x1Cu);

    }
    goto LABEL_12;
  }
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 != CFStringGetTypeID())
  {
    CFRelease(v3);
LABEL_12:
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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain UUID.", buf, 2u);
    }

    v5 = objc_alloc_init(MEMORY[0x1E0CB3940]);
    return (NSString *)v5;
  }
  if (!+[AMSDevice deviceIsAppleTV](AMSDevice, "deviceIsAppleTV"))
  {
    v5 = v3;
    CFRelease(v5);
    return (NSString *)v5;
  }
  objc_msgSend(v3, "uppercaseString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CFRelease(v3);
  if (!v5)
    goto LABEL_12;
  return (NSString *)v5;
}

+ (id)voicePreferredPACToken
{
  void *v2;
  AMSPACTokenTask *v3;
  void *v4;
  AMSPACTokenTask *v5;
  void *v6;

  objc_msgSend(a1, "voicePreferredPhoneNumberContextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [AMSPACTokenTask alloc];
  objc_msgSend(v2, "simLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSPACTokenTask initWithSimLabelID:](v3, "initWithSimLabelID:", v4);
  -[AMSPACTokenTask perform](v5, "perform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)deviceIsAppleTVSimulator
{
  return 0;
}

+ (BOOL)deviceIsAppleWatchSimulator
{
  return 0;
}

+ (BOOL)deviceIsChinaSKU
{
  if (qword_1ECEAD0E8 != -1)
    dispatch_once(&qword_1ECEAD0E8, &__block_literal_global_84);
  return _MergedGlobals_97;
}

uint64_t __29__AMSDevice_deviceIsChinaSKU__block_invoke()
{
  uint64_t result;

  result = os_eligibility_get_domain_answer();
  _MergedGlobals_97 = 0;
  return result;
}

+ (BOOL)deviceIsiPhoneSimulator
{
  return 0;
}

+ (BOOL)deviceIsiPod
{
  return MGGetSInt32Answer() == 2;
}

+ (BOOL)deviceIsiPodSimulator
{
  return 0;
}

+ (BOOL)deviceIsMac
{
  return 0;
}

+ (BOOL)deviceIsRealityDevice
{
  return 0;
}

+ (BOOL)deviceIsRealityDeviceSimulator
{
  return 0;
}

+ (BOOL)deviceIsBundle
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  AMSStorageDatabase *v16;
  char v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  MEMORY[0x18D78951C](&v19, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
  {
    if (!v7)
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
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v4;
      v12 = "%{public}@: [%{public}@] Failed to retrieve activation record with error: %{public}@";
      v13 = v9;
      v14 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_18C849000, v13, v14, v12, buf, 0x20u);

    }
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v3;
      v12 = "%{public}@: [%{public}@] Fetched activation record: %{public}@";
      v13 = v9;
      v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  v16 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
  v17 = objc_msgSend(a1, "_deviceIsBundleWithMobileActivationFlag:storage:canHonorLasset:defaultsFlag:", (v6 >> 6) & 1, v16, +[AMSAcknowledgePrivacyTask hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements](AMSAcknowledgePrivacyTask, "hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements"), +[AMSDefaults deviceIsBundleOverride](AMSDefaults, "deviceIsBundleOverride"));

  return v17;
}

+ (BOOL)deviceIsPasscodeProtected
{
  return MGGetBoolAnswer();
}

+ (BOOL)isWalletBiometricsEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47020]) == 1;

  return v3;
}

+ (id)_voicePreferredPhoneNumberContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  AMSPhoneNumberContextInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  AMSPhoneNumberContextInfo *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[AMSTelephonyDataCache sharedCache](AMSTelephonyDataCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "voicePreferred");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "findForUuid:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [AMSPhoneNumberContextInfo alloc];
      objc_msgSend(v5, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "labelID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AMSPhoneNumberContextInfo initWithPhoneNumber:simLabel:uuid:isVoicePreferred:](v6, "initWithPhoneNumber:simLabel:uuid:isVoicePreferred:", v7, v8, v9, 1);

      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched the device's phone number context. info = %{public}@", (uint8_t *)&v21, 0x20u);

      }
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v18;
        v23 = 2114;
        v24 = v19;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the device's phone number. Unable to get the preferred context.", (uint8_t *)&v21, 0x16u);

      }
      v10 = 0;
    }

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch the device's phone number. Unable to get the preferred context's identifier.", (uint8_t *)&v21, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_deviceIsBundleWithMobileActivationFlag:(BOOL)a3 storage:(id)a4 canHonorLasset:(BOOL)a5 defaultsFlag:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _QWORD v31[3];

  v6 = a6;
  v7 = a5;
  v31[2] = *MEMORY[0x1E0C80C00];
  v25 = 0;
  objc_msgSend(a4, "isLassetAndReturnError:", &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  v11 = objc_msgSend(v9, "BOOLValue");

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    if (!v12)
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
      *(_DWORD *)buf = 138543874;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31[0] = v10;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve lasset storage property: %{public}@", buf, 0x20u);

    }
    if (!v6)
      goto LABEL_18;
LABEL_13:
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2114;
      v29 = v23;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using defaults is bundle override@", buf, 0x16u);

    }
    a3 = 1;
    goto LABEL_18;
  }
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v18;
    v28 = 2114;
    v29 = v19;
    v30 = 1024;
    LODWORD(v31[0]) = v11;
    WORD2(v31[0]) = 1024;
    *(_DWORD *)((char *)v31 + 6) = v7;
    _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Considering lasset storage property: %d, canHonor: %d@", buf, 0x22u);

  }
  a3 = (a3 || v7) & v11;
  if (v6)
    goto LABEL_13;
LABEL_18:

  return a3;
}

+ (id)_dataForNVRAMKey:(id)a3
{
  return 0;
}

+ (id)_mgStringForCFKey:(__CFString *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MGCopyAnswerWithError();
  if (!v4)
  {
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
      *(_DWORD *)buf = 138544130;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = a3;
      v16 = 1026;
      v17 = 0;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain answer for key %{public}@: %{public}d", buf, 0x26u);

    }
  }
  return v4;
}

+ (id)_modelNumber
{
  return (id)objc_msgSend(a1, "_mgStringForCFKey:", CFSTR("ModelNumber"));
}

+ (id)_regionInfo
{
  return (id)objc_msgSend(a1, "_mgStringForCFKey:", CFSTR("RegionInfo"));
}

+ (BOOL)deviceIsInternalBuild
{
  return os_variant_has_internal_content();
}

+ (BOOL)deviceIsSeedBuild
{
  return 0;
}

@end
