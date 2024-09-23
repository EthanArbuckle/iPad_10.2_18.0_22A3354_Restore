@implementation AMSUserAgent

+ (id)cachedUserAgentForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_sharedCache
{
  if (qword_1ECEAD9C8 != -1)
    dispatch_once(&qword_1ECEAD9C8, &__block_literal_global_137);
  return (id)qword_1ECEAD9D0;
}

+ (id)userAgentForProcessInfo:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  AMSUserAgent *v18;
  __CFString *v19;
  __CFString *v20;
  char v22;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "accountMediaType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

  }
  objc_msgSend(v5, "userAgentSuffix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "userAgentSuffix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v10, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(a1, "cachedUserAgentForBundleIdentifier:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__CFString *)objc_msgSend(v15, "mutableCopy");

  if (-[__CFString length](v16, "length"))
  {
    v17 = v16;
  }
  else
  {
    v22 = 0;
    v18 = -[AMSUserAgent initWithProcessInfo:]([AMSUserAgent alloc], "initWithProcessInfo:", v5);
    -[AMSUserAgent _compileAndShouldCache:](v18, "_compileAndShouldCache:", &v22);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(a1, "cacheUserAgent:forBundleIdentifier:", v17, v10);

  }
  if (v17)
    v19 = v17;
  else
    v19 = &stru_1E2548760;
  v20 = v19;

  return v20;
}

- (AMSUserAgent)initWithProcessInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSUserAgent *v7;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)objc_opt_new();
  v7 = -[AMSUserAgent _initWithProcessInfo:deviceInfoProvider:](self, "_initWithProcessInfo:deviceInfoProvider:", v5, v6);

  if (!v4)
  return v7;
}

- (id)_initWithProcessInfo:(id)a3 deviceInfoProvider:(id)a4
{
  id v7;
  id v8;
  AMSUserAgent *v9;
  uint64_t v10;
  AMSMappedBundleInfo *bundleInfo;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUserAgent;
  v9 = -[AMSUserAgent init](&v13, sel_init);
  if (v9)
  {
    +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    bundleInfo = v9->_bundleInfo;
    v9->_bundleInfo = (AMSMappedBundleInfo *)v10;

    objc_storeStrong((id *)&v9->_processInfo, a3);
    objc_storeStrong((id *)&v9->_deviceInfoProvider, a4);
  }

  return v9;
}

+ (void)cacheUserAgent:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(a1, "_sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

- (id)_iOSComponentBuildVersion
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("build/%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2548760;
  }

  return v4;
}

void __28__AMSUserAgent__sharedCache__block_invoke()
{
  AMSLRUCache *v0;
  void *v1;

  v0 = -[AMSLRUCache initWithMaxSize:]([AMSLRUCache alloc], "initWithMaxSize:", 20);
  v1 = (void *)qword_1ECEAD9D0;
  qword_1ECEAD9D0 = (uint64_t)v0;

}

- (id)_compileAndShouldCache:(BOOL *)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[AMSUserAgent _compiledAMSUserAgentShouldCache:](self, "_compiledAMSUserAgentShouldCache:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_os_feature_enabled_impl())
    return v5;
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    if (v8)
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v11;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_INFO, "%{public}@Using AMSCore to generate user agent", buf, 0xCu);
    if (v8)
    {

      v11 = (void *)v3;
    }

  }
  -[AMSUserAgent _compiledAMSCoreUserAgent](self, "_compiledAMSCoreUserAgent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v13) & 1) == 0)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        if (v16)
        {
          v18 = objc_opt_class();
          AMSLogKey();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v20;
        }
        AMSHashIfNeeded(v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v20;
        v34 = 2114;
        v35 = v28;
        v36 = 2114;
        v37 = v29;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@AMSCore-produced user agent string differs from AMS-produced user agent string:\n amsCoreUserAgent='%{public}@'\namsUserAgent='%{public}@'", buf, 0x20u);
        if (v16)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v22, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3940];
        if (v23)
        {
          v25 = objc_opt_class();
          AMSLogKey();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v27;
        }
        AMSHashIfNeeded(v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v27;
        v34 = 2114;
        v35 = v30;
        v36 = 2114;
        v37 = v31;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_FAULT, "%{public}@AMSCore-produced user agent string differs from AMS-produced user agent string:\n amsCoreUserAgent='%{public}@'\namsUserAgent='%{public}@'", buf, 0x20u);
        if (v23)

      }
    }

  }
  return v13;
}

- (id)_compiledAMSUserAgentShouldCache:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  -[AMSUserAgent _sharedComponentFairPlayDeviceType](self, "_sharedComponentFairPlayDeviceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserAgent _iOSComponentClientInfo](self, "_iOSComponentClientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  -[AMSUserAgent _iOSComponentProductVersion](self, "_iOSComponentProductVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  -[AMSUserAgent _iOSComponentDeviceModel](self, "_iOSComponentDeviceModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  -[AMSUserAgent _iOSComponentHardwarePlatform](self, "_iOSComponentHardwarePlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  -[AMSUserAgent _iOSComponentBuildVersion](self, "_iOSComponentBuildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  -[AMSUserAgent _sharedComponentParentheticalWithFairPlayDeviceType:](self, "_sharedComponentParentheticalWithFairPlayDeviceType:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  -[AMSUserAgent _sharedComponentFrameworkVersion](self, "_sharedComponentFrameworkVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v11;
  -[AMSUserAgent _userAgentSuffix](self, "_userAgentSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = v16 != 0;
  objc_msgSend(v13, "ams_nonEmptyComponentsJoinedByString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_userAgentSuffix
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[AMSUserAgent processInfo](self, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userAgentSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AMSUserAgent processInfo](self, "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userAgentSuffix");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E2548760;
  }

  return v6;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (id)_sharedComponentFrameworkVersion
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "ams_AppleMediaServicesBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleVersion"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("1");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AMS/%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sharedComponentFairPlayDeviceType
{
  void *v2;

  if (qword_1ECEAD9D8 != -1)
    dispatch_once(&qword_1ECEAD9D8, &__block_literal_global_39_3);
  if (_MergedGlobals_155)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dt:%lu"), dword_1ECEAD9C4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_iOSComponentHardwarePlatform
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwarePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hwp/%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2548760;
  }

  return v4;
}

- (id)_iOSComponentDeviceModel
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model/%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E2548760;
  v6 = v5;

  return v6;
}

- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUserAgent _sharedComponentParentheticalWithFairPlayDeviceType:productType:](self, "_sharedComponentParentheticalWithFairPlayDeviceType:productType:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3 productType:(id)a4
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v8 = CFSTR("5");
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
         || (objc_msgSend(v6, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
  {
    v8 = CFSTR("6");
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("RealityDevice")) & 1) != 0)
  {
    v8 = CFSTR("7");
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
  {
    v8 = CFSTR("4");
  }
  else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0
         || objc_msgSend(v6, "hasPrefix:", CFSTR("iProd")))
  {
    v8 = CFSTR("3");
  }
  else
  {
    v8 = &stru_1E2548760;
  }
  if (-[__CFString length](v8, "length"))
    objc_msgSend(v7, "addObject:", v8);
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "addObject:", v5);
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("; "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (v11)
    v12 = v11;
  else
    v12 = &stru_1E2548760;
  v13 = v12;

  return v13;
}

- (id)_iOSComponentProductVersion
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;

  v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceIsAppleWatch");

    v8 = v7 ? CFSTR("watchOS/%@") : CFSTR("iOS/%@");
    -[__CFString appendFormat:](v3, "appendFormat:", v8, v5);
    -[AMSUserAgent deviceInfoProvider](self, "deviceInfoProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "deviceIsAppleTV");

    if (v10)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" AppleTV/%@"), v5);
  }
  if (v3)
    v11 = v3;
  else
    v11 = &stru_1E2548760;
  v12 = v11;

  return v12;
}

- (AMSDeviceInfo)deviceInfoProvider
{
  return self->_deviceInfoProvider;
}

- (id)_iOSComponentClientInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AMSMappedBundleInfo)bundleInfo
{
  return self->_bundleInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfoProvider, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

BOOL __50__AMSUserAgent__sharedComponentFairPlayDeviceType__block_invoke()
{
  _BOOL8 result;

  _MergedGlobals_155 = 0;
  dword_1ECEAD9C4 = 0;
  result = AMSFairPlayGetDeviceType(&dword_1ECEAD9C4);
  _MergedGlobals_155 = result;
  return result;
}

- (NSString)clientName
{
  void *v2;
  void *v3;

  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)clientVersion
{
  void *v2;
  void *v3;

  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setClientName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientName:", v5);

}

- (void)setClientVersion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AMSUserAgent bundleInfo](self, "bundleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientVersion:", v5);

}

- (id)compile
{
  return -[AMSUserAgent _compileAndShouldCache:](self, "_compileAndShouldCache:", 0);
}

- (id)_compiledAMSCoreUserAgent
{
  AMSMappedBundleInfo *bundleInfo;
  AMSProcessInfo *v4;
  id v5;
  std::string *p_p;
  void *v7;
  void (**v9)(AMS::BundleInfo *__hidden);
  AMSProcessInfo *v10;
  AMSMappedBundleInfo *v11;
  std::string __p;

  if (AMS::initAMSCoreOnce(void)::onceToken != -1)
    dispatch_once(&AMS::initAMSCoreOnce(void)::onceToken, &__block_literal_global_34);
  bundleInfo = self->_bundleInfo;
  v4 = self->_processInfo;
  v9 = &off_1E2520450;
  v10 = v4;
  v11 = bundleInfo;
  AMSCore::UserAgent::create((AMSCore::UserAgent *)&v9, &__p);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v7 = (void *)objc_msgSend(v5, "initWithCString:encoding:", p_p, 4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v7;
}

@end
