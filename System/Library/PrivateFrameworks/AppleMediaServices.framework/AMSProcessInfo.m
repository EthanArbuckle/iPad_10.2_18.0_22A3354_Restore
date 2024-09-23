@implementation AMSProcessInfo

uint64_t __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__AMSProcessInfo__cachedProcessInfoForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)_cachedProcessInfoForIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
  v6 = 0;
  if (v4 && !v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__57;
    v15 = __Block_byref_object_dispose__57;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__AMSProcessInfo__cachedProcessInfoForIdentifier___block_invoke;
    v8[3] = &unk_1E2544A20;
    v10 = &v11;
    v9 = v4;
    objc_msgSend(a1, "_accessProcessInfoCache:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

+ (NSString)defaultMediaTypeForCurrentProcess
{
  AMSProcessInfo *v3;
  void *v4;
  AMSProcessInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_MergedGlobals_137);
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    v3 = [AMSProcessInfo alloc];
    objc_msgSend(a1, "_currentProcessBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AMSProcessInfo initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", v4);

    -[AMSProcessInfo accountMediaType](v5, "accountMediaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_137);
    v7 = (void *)qword_1ECEAD7C8;
    if (!qword_1ECEAD7C8)
    {
      +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountMediaType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      v11 = (void *)qword_1ECEAD7C8;
      qword_1ECEAD7C8 = v10;

      v7 = (void *)qword_1ECEAD7C8;
    }
    v6 = (void *)objc_msgSend(v7, "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_137);
  }
  return (NSString *)v6;
}

+ (void)_accessProcessInfoCache:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a3;
  if (qword_1ECEAD7D0 != -1)
    dispatch_once(&qword_1ECEAD7D0, &__block_literal_global_104);
  v4 = (id)qword_1ECEAD7D8;
  if (qword_1ECEAD7E0 != -1)
    dispatch_once(&qword_1ECEAD7E0, &__block_literal_global_64_1);
  v5 = (void *)qword_1ECEAD7E8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_3;
  block[3] = &unk_1E253E978;
  v10 = v4;
  v11 = v3;
  v6 = v4;
  v8 = v3;
  v7 = v5;
  dispatch_sync(v7, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedBundleInfo, 0);
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong((id *)&self->_treatmentNamespace, 0);
  objc_storeStrong((id *)&self->_proxyAppBundleID, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_accountMediaType, 0);
  objc_storeStrong((id *)&self->_partnerHeader, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSProcessInfo *v4;

  v4 = objc_alloc_init(AMSProcessInfo);
  +[AMSProcessInfo copyPropertiesFrom:to:](AMSProcessInfo, "copyPropertiesFrom:to:", self, v4);
  return v4;
}

+ (AMSProcessInfo)currentProcess
{
  void *v2;
  AMSProcessInfo *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  +[AMSProcessInfo _currentProcessBundleIdentifier](AMSProcessInfo, "_currentProcessBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AMSProcessInfo initWithBundleIdentifier:]([AMSProcessInfo alloc], "initWithBundleIdentifier:", v2);
  -[AMSProcessInfo executableName](v3, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSProcessInfo setExecutableName:](v3, "setExecutableName:", v7);

  }
  return v3;
}

- (NSString)executableName
{
  return self->_executableName;
}

- (AMSProcessInfo)initWithBundleIdentifier:(id)a3
{
  id v5;
  AMSProcessInfo *v6;
  AMSProcessInfo *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(void *, _QWORD, uint64_t);
  void *v16;
  void *v17;
  NSURL *v18;
  void *bundleURL;
  uint64_t v20;
  NSURL *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  uint64_t v27;
  NSString *executableName;
  void *v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  NSString *localizedName;
  uint64_t v34;
  void *v35;
  void *v36;
  NSString *v37;
  uint64_t v38;
  NSString *clientVersion;
  uint64_t v40;
  AMSMappedBundleInfo *mappedBundleInfo;
  uint64_t v42;
  NSString *accountMediaType;
  void *v44;
  void *context;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;

  v5 = a3;
  v6 = -[AMSProcessInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    +[AMSProcessInfo _cachedProcessInfoForIdentifier:](AMSProcessInfo, "_cachedProcessInfoForIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[AMSProcessInfo copyPropertiesFrom:to:](AMSProcessInfo, "copyPropertiesFrom:to:", v8, v7);
    }
    else
    {
      context = (void *)MEMORY[0x18D78A1C4]();
      +[AMSProcessInfo _bundleRecordForIdentifier:](AMSProcessInfo, "_bundleRecordForIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x3032000000;
      v54[3] = __Block_byref_object_copy__57;
      v54[4] = __Block_byref_object_dispose__57;
      v10 = MEMORY[0x1E0C809B0];
      v55 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__AMSProcessInfo_initWithBundleIdentifier___block_invoke;
      aBlock[3] = &unk_1E25449A8;
      v53 = v54;
      v51 = v5;
      v11 = v9;
      v52 = v11;
      v12 = _Block_copy(aBlock);
      v47[0] = v10;
      v47[1] = 3221225472;
      v47[2] = __43__AMSProcessInfo_initWithBundleIdentifier___block_invoke_2;
      v47[3] = &unk_1E25449D0;
      v13 = v11;
      v48 = v13;
      v14 = v12;
      v49 = v14;
      v15 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(v47);
      objc_msgSend(v13, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
        bundleURL = v7->_bundleURL;
        v7->_bundleURL = v18;
      }
      else
      {
        v14[2](v14);
        bundleURL = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(bundleURL, "bundleURL");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v7->_bundleURL;
        v7->_bundleURL = (NSURL *)v20;

      }
      objc_msgSend(v13, "executableURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByDeletingPathExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        v26 = v24;
      }
      else
      {
        v27 = objc_opt_class();
        v15[2](v15, *MEMORY[0x1E0C9AE70], v27);
        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      executableName = v7->_executableName;
      v7->_executableName = v26;

      objc_msgSend(v13, "localizedName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
      }
      else
      {
        v32 = objc_opt_class();
        v15[2](v15, *MEMORY[0x1E0C9AAC8], v32);
        v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      localizedName = v7->_localizedName;
      v7->_localizedName = v31;

      v34 = objc_opt_class();
      v15[2](v15, *MEMORY[0x1E0C9AAF0], v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        v37 = v35;
      }
      else
      {
        v38 = objc_opt_class();
        v15[2](v15, *MEMORY[0x1E0C9AE90], v38);
        v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      clientVersion = v7->_clientVersion;
      v7->_clientVersion = v37;

      _Block_object_dispose(v54, 8);
      objc_autoreleasePoolPop(context);
      +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v7);
      v40 = objc_claimAutoreleasedReturnValue();
      mappedBundleInfo = v7->_mappedBundleInfo;
      v7->_mappedBundleInfo = (AMSMappedBundleInfo *)v40;

      -[AMSMappedBundleInfo accountMediaType](v7->_mappedBundleInfo, "accountMediaType");
      v42 = objc_claimAutoreleasedReturnValue();
      accountMediaType = v7->_accountMediaType;
      v7->_accountMediaType = (NSString *)v42;

      v44 = (void *)-[AMSProcessInfo copy](v7, "copy");
      +[AMSProcessInfo _cacheProcessInfo:](AMSProcessInfo, "_cacheProcessInfo:", v44);

    }
  }

  return v7;
}

- (AMSProcessInfo)init
{
  AMSProcessInfo *v2;
  AMSProcessInfo *v3;
  NSString *clientVersion;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSProcessInfo;
  v2 = -[AMSProcessInfo init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    clientVersion = v2->_clientVersion;
    v2->_clientVersion = (NSString *)CFSTR("0.0");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.AppleMediaServices.AMSClientInfo", v5);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

+ (void)copyPropertiesFrom:(id)a3 to:(id)a4
{
  void *v5;
  _QWORD *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;

  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = a4;
  v7 = (id *)a3;
  v8 = objc_msgSend(v5, "copy");
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = objc_msgSend(v7[4], "copy");
  v11 = (void *)v6[4];
  v6[4] = v10;

  v12 = objc_msgSend(v7[5], "copy");
  v13 = (void *)v6[5];
  v6[5] = v12;

  v14 = objc_msgSend(v7[6], "copy");
  v15 = (void *)v6[6];
  v6[6] = v14;

  v16 = objc_msgSend(v7[7], "copy");
  v17 = (void *)v6[7];
  v6[7] = v16;

  v18 = objc_msgSend(v7[8], "copy");
  v19 = (void *)v6[8];
  v6[8] = v18;

  v20 = objc_msgSend(v7[9], "copy");
  v21 = (void *)v6[9];
  v6[9] = v20;

  v22 = objc_msgSend(v7[2], "copy");
  v23 = (void *)v6[2];
  v6[2] = v22;

  v24 = objc_msgSend(v7[10], "copy");
  v25 = (void *)v6[10];
  v6[10] = v24;

  v26 = objc_msgSend(v7[11], "copy");
  v27 = (void *)v6[11];
  v6[11] = v26;

  v28 = v7[12];
  v29 = objc_msgSend(v28, "copy");
  v30 = (id)v6[12];
  v6[12] = v29;

}

+ (id)_currentProcessBundleIdentifier
{
  if (qword_1ECEAD7F8 != -1)
    dispatch_once(&qword_1ECEAD7F8, &__block_literal_global_66_0);
  return (id)qword_1ECEAD7F0;
}

- (void)setExecutableName:(id)a3
{
  objc_storeStrong((id *)&self->_executableName, a3);
}

+ (void)_cacheProcessInfo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__AMSProcessInfo__cacheProcessInfo___block_invoke;
    v6[3] = &unk_1E25449F8;
    v7 = v4;
    objc_msgSend(a1, "_accessProcessInfoCache:", v6);

  }
}

- (NSString)accountMediaType
{
  return self->_accountMediaType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  -[AMSProcessInfo accountMediaType](self, "accountMediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mediaType"));

  -[AMSProcessInfo auditTokenData](self, "auditTokenData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("auditTokenData"));

  -[AMSProcessInfo bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundleID"));

  -[AMSProcessInfo bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundleURL"));

  -[AMSProcessInfo clientVersion](self, "clientVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("clientVersion"));

  -[AMSProcessInfo executableName](self, "executableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("executableName"));

  -[AMSProcessInfo localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("localizedName"));

  -[AMSProcessInfo partnerHeader](self, "partnerHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("partnerHeader"));

  -[AMSProcessInfo proxyAppBundleID](self, "proxyAppBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("proxyAppBundleID"));

  -[AMSProcessInfo treatmentNamespace](self, "treatmentNamespace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("treatmentNamespace"));

  -[AMSProcessInfo userAgentSuffix](self, "userAgentSuffix");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("userAgentSuffix"));

}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (NSString)treatmentNamespace
{
  return self->_treatmentNamespace;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (NSString)proxyAppBundleID
{
  return self->_proxyAppBundleID;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)partnerHeader
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__57;
  v10 = __Block_byref_object_dispose__57;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AMSProcessInfo_partnerHeader__block_invoke;
  v5[3] = &unk_1E253E378;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersion, a3);
}

+ (BOOL)BOOLForEntitlement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "valueForEntitlement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;

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
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = objc_opt_class();
        if (v18)
        {
          AMSLogKey();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          a2 = (SEL)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, a2);
        }
        else
        {
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v25;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@Entitlement fetch failed. Value is not a BOOLean. entitlementName = %{public}@", buf, 0x16u);
        if (v18)
        {

          v22 = (void *)a2;
        }

      }
      v9 = 0;
    }
    v24 = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      if (v11)
      {
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        a2 = (SEL)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v13, v14, a2);
      }
      else
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@ "), v13, v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Did not find entitlement named %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = (void *)a2;
      }

    }
    v24 = 0;
  }

  return v24;
}

+ (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CFErrorRef error;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (v4 && (v5 = SecTaskCreateFromSelf(0)) != 0)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, v4, &error);
    if (error)
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
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        AMSLogableError(error);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = a1;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Entitlement fetch failed with error: %{public}@", buf, 0x16u);

      }
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)hasAMSEntitlement
{
  return objc_msgSend(a1, "BOOLForEntitlement:", CFSTR("com.apple.private.applemediaservices"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTreatmentNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (AMSProcessInfo)initWithCoder:(id)a3
{
  id v4;
  AMSProcessInfo *v5;
  uint64_t v6;
  NSString *accountMediaType;
  uint64_t v8;
  NSData *auditTokenData;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSURL *bundleURL;
  uint64_t v14;
  NSString *clientVersion;
  uint64_t v16;
  NSString *executableName;
  uint64_t v18;
  NSString *localizedName;
  uint64_t v20;
  NSString *partnerHeader;
  uint64_t v22;
  NSString *proxyAppBundleID;
  uint64_t v24;
  NSString *treatmentNamespace;
  uint64_t v26;
  NSString *userAgentSuffix;

  v4 = a3;
  v5 = -[AMSProcessInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountMediaType = v5->_accountMediaType;
    v5->_accountMediaType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditTokenData"));
    v8 = objc_claimAutoreleasedReturnValue();
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executableName"));
    v16 = objc_claimAutoreleasedReturnValue();
    executableName = v5->_executableName;
    v5->_executableName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v18 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerHeader"));
    v20 = objc_claimAutoreleasedReturnValue();
    partnerHeader = v5->_partnerHeader;
    v5->_partnerHeader = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxyAppBundleID"));
    v22 = objc_claimAutoreleasedReturnValue();
    proxyAppBundleID = v5->_proxyAppBundleID;
    v5->_proxyAppBundleID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentNamespace"));
    v24 = objc_claimAutoreleasedReturnValue();
    treatmentNamespace = v5->_treatmentNamespace;
    v5->_treatmentNamespace = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userAgentSuffix"));
    v26 = objc_claimAutoreleasedReturnValue();
    userAgentSuffix = v5->_userAgentSuffix;
    v5->_userAgentSuffix = (NSString *)v26;

  }
  return v5;
}

void __31__AMSProcessInfo_partnerHeader__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__AMSProcessInfo__accessProcessInfoCache___block_invoke()
{
  AMSLRUCache *v0;
  void *v1;

  v0 = -[AMSLRUCache initWithMaxSize:]([AMSLRUCache alloc], "initWithMaxSize:", 20);
  v1 = (void *)qword_1ECEAD7D8;
  qword_1ECEAD7D8 = (uint64_t)v0;

}

id __43__AMSProcessInfo_initWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:ofClass:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_bundleURL, a3);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)setAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_auditTokenData, a3);
}

void __42__AMSProcessInfo__accessProcessInfoCache___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AMSProcessInfo", v2);
  v1 = (void *)qword_1ECEAD7E8;
  qword_1ECEAD7E8 = (uint64_t)v0;

}

void __36__AMSProcessInfo__cacheProcessInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

}

- (BOOL)isAccountsDaemon
{
  void *v2;
  char v3;

  -[AMSProcessInfo bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.accountsd"));

  return v3;
}

void __49__AMSProcessInfo__currentProcessBundleIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __CFBundle *MainBundle;
  const __CFDictionary *InfoDictionary;
  void *v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECEAD7F0;
  qword_1ECEAD7F0 = v1;

  if (!qword_1ECEAD7F0)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
      if (InfoDictionary)
      {
        CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E0C9AE78]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;

        v19 = (void *)qword_1ECEAD7F0;
        qword_1ECEAD7F0 = (uint64_t)v18;

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("amsaccountsd"));

  if (v5)
  {
    v6 = (void *)qword_1ECEAD7F0;
    qword_1ECEAD7F0 = (uint64_t)CFSTR("com.apple.amsaccountsd");

  }
  if (!qword_1ECEAD7F0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("amstool"));

    if (v9)
    {
      v10 = (void *)qword_1ECEAD7F0;
      qword_1ECEAD7F0 = (uint64_t)CFSTR("amstool");

    }
    if (!qword_1ECEAD7F0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("amstoold"));

      if (v13)
      {
        v14 = (void *)qword_1ECEAD7F0;
        qword_1ECEAD7F0 = (uint64_t)CFSTR("amstoold");

      }
    }
  }
}

+ (id)_bundleRecordForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSProcessInfo _currentProcessBundleIdentifier](AMSProcessInfo, "_currentProcessBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
LABEL_8:
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v17;
      if (v7)
        goto LABEL_21;
      goto LABEL_11;
    }
LABEL_5:
    if (objc_msgSend(v4, "isEqualToString:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      if (v7)
        goto LABEL_21;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v4 = v5;
  if (v4)
    goto LABEL_5;
  v8 = 0;
LABEL_11:
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
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, a1);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch bundle record, error: %{public}@", buf, 0x16u);
    if (v11)
    {

      v15 = a1;
    }

  }
  v7 = 0;
LABEL_21:

  return v7;
}

- (AMSMappedBundleInfo)mappedBundleInfo
{
  return self->_mappedBundleInfo;
}

id __43__AMSProcessInfo_initWithBundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v4;
  }
  else
  {
    +[AMSProcessInfo _bundleForIdentifier:record:](AMSProcessInfo, "_bundleForIdentifier:record:", a1[4], a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

+ (BOOL)isBuddyRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

- (void)setPartnerHeader:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AMSProcessInfo_setPartnerHeader___block_invoke;
  block[3] = &unk_1E25436C8;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  dispatch_sync(internalQueue, block);
  if (*((_BYTE *)v15 + 24))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, CFSTR("ISClientValueParameter"), 0);
    if (!v6)

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ISClientPartnerHeaderChangedNotification"), self, v9);

  }
  _Block_object_dispose(&v14, 8);

}

void __35__AMSProcessInfo_setPartnerHeader___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (id)arrayForEntitlement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "valueForEntitlement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    if (v12)
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    v26 = 2114;
    v27 = v19;
    v20 = "%{public}@Did not find entitlement named %{public}@";
    v21 = v11;
    v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    if (v12)
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v18, v15, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %@ "), v18, v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    v26 = 2114;
    v27 = v19;
    v20 = "%{public}@Entitlement fetch failed. Value is not an array. entitlementName = %{public}@";
    v21 = v11;
    v22 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_18C849000, v21, v22, v20, buf, 0x16u);
    if (v12)
    {

      v16 = (void *)a2;
    }

LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v9 = v8;

LABEL_22:
  return v9;
}

+ (BOOL)BOOLForMachLookupAccess:(id)a3
{
  id v3;
  id v4;

  if (!a3)
    return 0;
  v3 = a3;
  getpid();
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "UTF8String");

  return sandbox_check() == 0;
}

+ (BOOL)hasValue:(id)a3 inArrayForEntitlement:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "arrayForEntitlement:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "containsObject:", v6);

  return (char)a1;
}

+ (void)setDefaultMediaTypeForCurrentProcess:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_MergedGlobals_137);
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = a1;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting the default media type for the process. defaultMediaType = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_lock_lock_with_options();
  v7 = objc_msgSend(v4, "copy");
  v8 = (void *)qword_1ECEAD7C8;
  qword_1ECEAD7C8 = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_137);
}

+ (id)stringForEntitlement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "valueForEntitlement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    if (v12)
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v14, v15, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@ "), v14, v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    v26 = 2114;
    v27 = v19;
    v20 = "%{public}@Did not find entitlement named %{public}@";
    v21 = v11;
    v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    if (v12)
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v18, v15, a2);
    }
    else
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %@ "), v18, v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v16;
    v26 = 2114;
    v27 = v19;
    v20 = "%{public}@Entitlement fetch failed. Value is not a string. entitlementName = %{public}@";
    v21 = v11;
    v22 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_18C849000, v21, v22, v20, buf, 0x16u);
    if (v12)
    {

      v16 = (void *)a2;
    }

LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  v9 = v8;

LABEL_22:
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSProcessInfo executableName](self, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo clientVersion](self, "clientVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo accountMediaType](self, "accountMediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo proxyAppBundleID](self, "proxyAppBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo treatmentNamespace](self, "treatmentNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSProcessInfo userAgentSuffix](self, "userAgentSuffix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AMSProcessInfo: %p name = %@ | bundleIdentifier = %@ | clientVersion = %@ | mediaType = %@ | proxyAppBundleID = %@ | treatmentNamespace = %@ | userAgentSuffix = %@>"), self, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
    goto LABEL_9;
  }
  v6 = v5;

  if (v6)
  {
    -[AMSProcessInfo accountMediaType](self, "accountMediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "accountMediaType"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo accountMediaType](self, "accountMediaType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountMediaType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_9;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo auditTokenData](self, "auditTokenData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v6, "auditTokenData"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo auditTokenData](self, "auditTokenData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "auditTokenData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v13)
      {

        if (!v16)
          goto LABEL_9;
      }
      else
      {

        if ((v16 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo bundleIdentifier](self, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend(v6, "bundleIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo bundleIdentifier](self, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (v17)
      {

        if (!v20)
          goto LABEL_9;
      }
      else
      {

        if ((v20 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v6, "bundleURL"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo bundleURL](self, "bundleURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (v21)
      {

        if (!v24)
          goto LABEL_9;
      }
      else
      {

        if ((v24 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo clientVersion](self, "clientVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 || (objc_msgSend(v6, "clientVersion"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo clientVersion](self, "clientVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (v25)
      {

        if (!v28)
          goto LABEL_9;
      }
      else
      {

        if ((v28 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo executableName](self, "executableName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v6, "executableName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo executableName](self, "executableName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "executableName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (v29)
      {

        if (!v32)
          goto LABEL_9;
      }
      else
      {

        if ((v32 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo localizedName](self, "localizedName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 || (objc_msgSend(v6, "localizedName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo localizedName](self, "localizedName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (v33)
      {

        if (!v36)
          goto LABEL_9;
      }
      else
      {

        if ((v36 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo partnerHeader](self, "partnerHeader");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 || (objc_msgSend(v6, "partnerHeader"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo partnerHeader](self, "partnerHeader");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "partnerHeader");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if (v37)
      {

        if (!v40)
          goto LABEL_9;
      }
      else
      {

        if ((v40 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo proxyAppBundleID](self, "proxyAppBundleID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41 || (objc_msgSend(v6, "proxyAppBundleID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo proxyAppBundleID](self, "proxyAppBundleID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "proxyAppBundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (v41)
      {

        if (!v44)
          goto LABEL_9;
      }
      else
      {

        if ((v44 & 1) == 0)
          goto LABEL_9;
      }
    }
    -[AMSProcessInfo treatmentNamespace](self, "treatmentNamespace");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 || (objc_msgSend(v6, "treatmentNamespace"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo treatmentNamespace](self, "treatmentNamespace");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "treatmentNamespace");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (v45)
      {

        if (v48)
          goto LABEL_66;
        goto LABEL_9;
      }

      if ((v48 & 1) == 0)
        goto LABEL_9;
    }
LABEL_66:
    -[AMSProcessInfo userAgentSuffix](self, "userAgentSuffix");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49 || (objc_msgSend(v6, "userAgentSuffix"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSProcessInfo userAgentSuffix](self, "userAgentSuffix");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userAgentSuffix");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v50, "isEqual:", v51) ^ 1;

      if (v49)
      {
LABEL_72:

        v11 = v52 ^ 1;
        goto LABEL_10;
      }
    }
    else
    {
      LOBYTE(v52) = 0;
    }

    goto LABEL_72;
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)_bundleForIdentifier:(id)a3 record:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __CFBundle *MainBundle;
  CFURLRef v12;
  CFURLRef v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    objc_msgSend(a1, "_currentProcessBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_14:
      a3 = v10;

      goto LABEL_15;
    }
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle && (v12 = CFBundleCopyBundleURL(MainBundle)) != 0)
    {
      v13 = v12;
      v14 = (void *)MEMORY[0x1E0CB34D0];
      -[__CFURL path](v12, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleWithPath:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v13);
    }
    else
    {
LABEL_7:
      v10 = 0;
    }
    if (v6 && !v10)
    {
      objc_msgSend(v6, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    goto LABEL_14;
  }
LABEL_15:

  return a3;
}

- (id)generateConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0C92CA0], "ams_configurationWithProcessInfo:bag:", self, 0);
}

- (id)generateConfigurationFromBag:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C92CA0], "ams_configurationWithProcessInfo:bag:", self, a3);
}

- (id)generateConfigurationFromBagContract:(id)a3
{
  void *v4;
  id v5;
  AMSContractBagShim *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C92CA0];
  v5 = a3;
  v6 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v5);

  objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAccountMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_accountMediaType, a3);
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setProxyAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAppBundleID, a3);
}

- (void)setUserAgentSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentSuffix, a3);
}

@end
