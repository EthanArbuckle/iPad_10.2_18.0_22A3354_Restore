@implementation CKBehaviorOptions

- (id)customCloudDBBaseURL
{
  void *v3;

  sub_18A5C7D1C(self, CFSTR("DatabaseServiceBaseURL"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    sub_18A5C7D1C(self, CFSTR("CloudDBBaseURL"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)sharedOptions
{
  if (qword_1ECD96C68 != -1)
    dispatch_once(&qword_1ECD96C68, &unk_1E1F586B8);
  return (id)qword_1ECD96C60;
}

- (BOOL)shouldStreamTrafficLogs
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("ShouldStreamTrafficLogs"), 0);
}

- (BOOL)logTraffic
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("LogTraffic"), 1);
}

- (id)customMetricsServiceBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("MetricsServiceBaseURL"), 0);
}

- (BOOL)useEncryption
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("UseEncryption"), 1);
}

- (BOOL)compressRequests
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("CompressRequests"), 1);
}

- (BOOL)usePreauth
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("UsePreauth"), 1);
}

- (id)testRunIDHeader
{
  return sub_18A5C7DE4(self, CFSTR("TestRunIDHeader"), 0);
}

- (BOOL)sendDebugHeader
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("SendDebugHeader"), 0);
}

- (id)productVersion
{
  void *v3;
  void *v4;
  uint64_t v5;

  CKProductVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_18A5C7B80(self))
  {
    CKProductVersion();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A5C7DE4(self, CFSTR("ProductVersion"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)productName
{
  void *v3;
  void *v4;
  uint64_t v5;

  CKProductName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_18A5C7B80(self))
  {
    CKProductName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A5C7DE4(self, CFSTR("ProductName"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (unint64_t)maxBatchSize
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MaxBatchSize"), 100);
}

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (id)initInternal
{
  CKBehaviorOptions *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBehaviorOptions;
  v2 = -[CKBehaviorOptions init](&v4, sel_init);
  if (v2)
    v2->_isAppleInternalInstall = os_variant_has_internal_content();
  return v2;
}

- (BOOL)fakeWalrusOverride
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("FakeWalrusOverride"), 0);
}

- (BOOL)cacheChildAccounts
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("CacheChildAccounts"), 0);
}

- (id)buildVersion
{
  void *v3;
  void *v4;
  uint64_t v5;

  CKBuildVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_18A5C7B80(self))
  {
    CKBuildVersion();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A5C7DE4(self, CFSTR("BuildVersion"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)allowExpiredDNSBehavior
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("AllowExpiredDNSBehavior"), 0);
}

- (id)_getDictionaryOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  id v18;

  v6 = a4;
  sub_18A765758((uint64_t)self, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v12, v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
      if (!v15)
        goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_7:
      v17 = v6;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v17 = v11;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_7;
LABEL_8:
  v18 = v17;

  return v18;
}

- (void)_setPref:(id)a3 forKey:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  CKException *v9;
  const char *v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (byte_1EDF75458)
  {
    objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], v6, (uint64_t)CFSTR("com.apple.cloudkit.CloudKitIntegrationTests"), v7);
    if (objc_claimAutoreleasedReturnValue())
    {
      v9 = [CKException alloc];
      v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must not set CKBehaviorOptions from CloudKitIntegrationTests, since they run in parallel, one test's set value may unexpectedly break another test.  Move this test to CloudKitSerialIntegrationTests"));
      objc_exception_throw(v11);
    }
  }
  objc_msgSend__reallySetPref_forKey_(self, v6, (uint64_t)v12, (uint64_t)v8);

}

- (void)_reallySetPref:(id)a3 forKey:(id)a4
{
  id v6;
  CKBehaviorOptions *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v32 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_CKUserDefaults(CKUserDefaults, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v11, v12, (uint64_t)CFSTR("BehaviorOptions"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v18 = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);
  else
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = v18;
  if (objc_msgSend_conformsToProtocol_(v32, v19, (uint64_t)&unk_1EDFA0B08, v20))
  {
    objc_msgSend_CKDeepCopy(v32, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = v25;
  }
  else
  {
    v26 = (uint64_t)v32;
  }
  v33 = (id)v26;
  if (v26)
    objc_msgSend_setObject_forKeyedSubscript_(v21, v22, v26, (uint64_t)v6);
  else
    objc_msgSend_removeObjectForKey_(v21, v22, (uint64_t)v6, v24);
  objc_msgSend_CKUserDefaults(CKUserDefaults, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v30, v31, (uint64_t)v21, (uint64_t)CFSTR("BehaviorOptions"));

  objc_sync_exit(v7);
}

- (void)_setArrayPref:(id)a3 forKey:(id)a4
{
  id v6;
  CKBehaviorOptions *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = v8;
  if (v21)
    objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)v21, v10);
  else
    objc_msgSend_removeAllObjects(v8, v9, 0, v10);
  objc_msgSend_CKUserDefaults(CKUserDefaults, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v11, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v20, (uint64_t)v19, (uint64_t)v6);

  objc_sync_exit(v7);
}

- (int)cachedRecordExpiryTime
{
  return sub_18A606250((uint64_t)self, CFSTR("RecordExpiryTime"), 86400);
}

- (void)setCachedRecordExpiryTime:(int)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("RecordExpiryTime"));

}

- (unint64_t)recordCacheSizeLimit
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("RecordCacheSizeLimit"), 0x4000000);
}

- (unint64_t)recordCacheEntryCountLimit
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("RecordCacheEntryLimit"), 10000);
}

- (double)recordCacheExpireDelay
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("RecordCacheExpireDelay"), 60.0);
}

- (void)setOperationTimeout:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  id v7;

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v3, v4, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v6, (uint64_t)v7, (uint64_t)CFSTR("OperationTimeout"));

}

- (void)setTrafficLogMaximumDataSize:(int)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("TrafficLogMaximumDataSize"));

}

- (void)setShouldStreamTrafficLogs:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("ShouldStreamTrafficLogs"));

}

- (const)CKCtlPrompt
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  sub_18A5C7DE4(self, CFSTR("CKCtlPrompt"), CFSTR("ckctl> "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)objc_msgSend_UTF8String(v2, v3, v4, v5);

  return v6;
}

- (void)setCKCtlPrompt:(char *)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  if (a3)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)a3, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CKCtlPrompt"));

  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("CKCtlPrompt"));
  }
}

- (BOOL)CFNetworkLogging
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("CFNetworkLogging"), 0);
}

- (void)setCFNetworkLogging:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CFNetworkLogging"));

}

- (BOOL)disableCaching
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("DisableCaching"), 0);
}

- (void)setDisableCaching:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("DisableCaching"));

}

- (BOOL)shouldProfileSQL
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("SQLProfile"), 0);
}

- (void)setShouldProfileSQL:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("SQLProfile"));

}

- (void)setCompressRequests:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CompressRequests"));

}

- (BOOL)useModTimeInAssetCacheEviction
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("UseModTimeInAssetCacheEviction"), 0);
}

- (void)setModTimeInAssetCacheEviction:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("UseModTimeInAssetCacheEviction"));

}

- (void)setLogTraffic:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("LogTraffic"));

}

- (void)setSendDebugHeader:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("SendDebugHeader"));

}

- (int)clientThrottleQueueWidth
{
  return sub_18A606250((uint64_t)self, CFSTR("ClientThrottleQueueWidth"), 8);
}

- (id)configBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("ConfigBaseURL"), CFSTR("https://gateway.icloud.com/configuration"));
}

- (void)setConfigBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("ConfigBaseURL"));

}

- (id)setupBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("SetupBaseURL"), CFSTR("https://gateway.icloud.com/setup"));
}

- (void)setSetupBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("SetupBaseURL"));

}

- (void)setCustomCloudDBBaseURL:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v4 = a3;
  objc_msgSend__setPref_forKey_(self, v5, 0, (uint64_t)CFSTR("CloudDBBaseURL"));
  objc_msgSend_absoluteString(v4, v6, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__setPref_forKey_(self, v9, (uint64_t)v10, (uint64_t)CFSTR("DatabaseServiceBaseURL"));
}

- (id)customShareServiceBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("ShareServiceBaseURL"), 0);
}

- (void)setCustomShareServiceBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("ShareServiceBaseURL"));

}

- (id)customDeviceServiceBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("DeviceServiceBaseURL"), 0);
}

- (void)setCustomDeviceServiceBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("DeviceServiceBaseURL"));

}

- (id)customCodeServiceBaseURL
{
  return sub_18A5C7D1C(self, CFSTR("CodeServiceBaseURL"), 0);
}

- (void)setCustomCodeServiceBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CodeServiceBaseURL"));

}

- (void)setCustomMetricsServiceBaseURL:(id)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("MetricsServiceBaseURL"));

}

- (void)setTestRunIDHeader:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("TestRunIDHeader"));
}

- (BOOL)evictRecentAssets
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("EvictRecentAssets"), 1);
}

- (unint64_t)assetEvictionGracePeriodWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("AssetEvictionGracePeriod"), a3);
}

- (unint64_t)assetEvictionGracePeriodOnHighWatermarkWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("AssetEvictionGracePeriodOnHighWatermark"), a3);
}

- (unint64_t)maxPackageDownloadsPerBatchWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MaxPackageDownloadsPerBatch"), a3);
}

- (unint64_t)maxPackageUploadsPerBatchWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MaxPackageUploadsPerBatch"), a3);
}

- (double)packageGCPeriod
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("PackageGCPeriodSeconds"), 3600.0);
}

- (int64_t)releaseType
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isAppleInternalInstall(self, a2, v2, v3);
}

- (BOOL)sandboxCloudD
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("SandboxCloudD"), 1);
}

- (unint64_t)PCSCacheSize
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("PCSCacheSize"), 64);
}

- (double)PCSCacheMinTime
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("PCSCacheMinTime"), 60.0);
}

- (int)PCSRetryCount
{
  return sub_18A606250((uint64_t)self, CFSTR("PCSRetryCount"), 2);
}

- (int)longlivedOperationMaxRetryCount
{
  return sub_18A606250((uint64_t)self, CFSTR("LongLivedOpMaxRetryCount"), 5);
}

- (void)setOptimisticPCS:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("OptimisticPCS"));

}

- (void)setUseEncryption:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("UseEncryption"));

}

- (void)setUseStingray:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("UseStingray"));

}

- (void)setUsePreauth:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("UsePreauth"));

}

- (BOOL)rollRecordPCSMasterKeys
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("RollRecordPCSMasterKeys"), 1);
}

- (void)setRollRecordPCSMasterKeys:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("RollRecordPCSMasterKeys"));

}

- (BOOL)rollRecordMasterKeysOnUnshare
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("RollRecordMasterKeysOnUnshare"), 0);
}

- (void)setRollRecordMasterKeysOnUnshare:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("RollRecordMasterKeysOnUnshare"));

}

- (BOOL)rollZonePCSIdentities
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("RollZonePCSIdentities"), 1);
}

- (void)setRollZonePCSIdentities:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("RollZonePCSIdentities"));

}

- (BOOL)rollZoneSharingKeys
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("RollZoneSharingKeys"), 1);
}

- (void)setRollZoneSharingKeys:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("RollZoneSharingKeys"));

}

- (BOOL)allowZoneKeyRollingInPerRecordPCSZonesForAllContainers
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("AllowZoneKeyRollingInPerRecordPCSZonesForAllContainers"), 1);
}

- (void)setAllowZoneKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("AllowZoneKeyRollingInPerRecordPCSZonesForAllContainers"));

}

- (BOOL)allowRecordKeyRollingInPerRecordPCSZonesForAllContainers
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("AllowRecordKeyRollingInPerRecordPCSZonesForAllContainers"), 1);
}

- (void)setAllowRecordKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("AllowRecordKeyRollingInPerRecordPCSZonesForAllContainers"));

}

- (BOOL)allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("AllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers"), 1);
}

- (void)setAllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("AllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers"));

}

- (BOOL)useEnhancedPCSEncryptionContext
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("UseEnhancedPCSEncryptionContext"), 1);
}

- (void)setUseEnhancedPCSEncryptionContext:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("UseEnhancedPCSEncryptionContext"));

}

- (id)containerIdentifierToForceFatalManateeZoneDecryptionFailure
{
  return sub_18A5C7DE4(self, CFSTR("ContainerIDToForceFatalManateeZoneDecryptionFailure"), 0);
}

- (void)setContainerIdentifierToForceFatalManateeZoneDecryptionFailure:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ContainerIDToForceFatalManateeZoneDecryptionFailure"));
}

- (int64_t)maxRecordPCSMasterKeyRolls
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MaxRecordPCSMasterKeyRolls"), 10000);
}

- (int64_t)maxPCSSizeForKeyRolls
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MaxPCSSizeForKeyRolls"), 0x80000);
}

- (void)setMaxPCSSizeForKeyRolls:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  if (a3 < 0)
    a3 = 0x80000;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("MaxPCSSizeForKeyRolls"));

}

- (void)setProductName:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ProductName"));
}

- (void)setProductVersion:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ProductVersion"));
}

- (void)setBuildVersion:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("BuildVersion"));
}

- (BOOL)shouldDecryptRecordsBeforeSave
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("DecryptRecordsBeforeSave"), 0);
}

- (int)defaultRetryAfter
{
  int v2;

  v2 = sub_18A606250((uint64_t)self, CFSTR("RetryAfter"), 3);
  return v2 & ~(v2 >> 31);
}

- (double)maximumThrottleSeconds
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("MaximumThrottleSeconds"), 1800.0);
}

- (double)maximumQueuedFetchWaitTime
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("MaximumQueuedFetchWaitTime"), 30.0);
}

- (double)publicIdentitiesExpirationTimeout
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("PublicIdentitiesExpirationTimeout"), 300.0);
}

- (id)vettedEmailsTestFormat
{
  return sub_18A5C7DE4(self, CFSTR("VettedEmailsTestFormat"), 0);
}

- (int)backgroundSessionConnectionPoolLimitWithDefaultValue:(int)a3
{
  int v3;

  v3 = sub_18A606250((uint64_t)self, CFSTR("BackgroundSessionConnectionPoolLimit"), *(uint64_t *)&a3);
  return v3 & ~(v3 >> 31);
}

- (BOOL)enableMMCSMetricsWithDefaultValue:(BOOL)a3
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("EnableMMCSMetrics"), a3);
}

- (int64_t)sqlBatchCount
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("SQLBatchCount"), 5000);
}

- (void)setSqlBatchCount:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("SQLBatchCount"));

}

- (double)sqlBatchTime
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("SQLBatchTime"), 0.5);
}

- (void)setSqlBatchTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  id v7;

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v3, v4, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v6, (uint64_t)v7, (uint64_t)CFSTR("SQLBatchTime"));

}

- (unint64_t)savedErrorCount
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("SavedErrorCount"), 3);
}

- (double)shareAcceptorRetrievingDialogDelay
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("ShareAcceptorRetrievingDialogDelay"), 0.5);
}

- (double)shareAcceptorRetrievingDialogMinPeriod
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("ShareAcceptorRetrievingDialogMinPeriod"), 1.0);
}

- (void)setPCSCacheValidTime:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("PCSCacheValidTime"));

}

- (double)PCSCacheValidTime
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("PCSCacheValidTime"), 14400.0);
}

- (double)minTTRPromptInterval
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("TTRPromptInterval"), 86400.0);
}

- (id)recordNamesForFakingDecryptionFailure
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  id v13;

  if (!self)
  {
    v13 = 0;
    return v13;
  }
  sub_18A765758((uint64_t)self, CFSTR("RecordNamesForFakeDecryptionFailure"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = (void *)v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
      if (!v10)
        goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_8;
LABEL_9:
  v13 = v12;

  return v13;
}

- (void)setRecordNamesForFakingDecryptionFailure:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__setArrayPref_forKey_, a3, CFSTR("RecordNamesForFakeDecryptionFailure"));
}

- (void)setForceUploadRequestActivitiesToRunImmediately:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("ForceUploadRequestActivitiesToRunImmediately"));

}

- (id)deviceCountOverride
{
  return sub_18A5C7F78((uint64_t)self, CFSTR("DeviceCount"));
}

- (void)setDeviceCountOverride:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("DeviceCount"));
}

- (id)transcoderServiceName
{
  return sub_18A5C7DE4(self, CFSTR("TranscoderServiceName"), 0);
}

- (void)setTranscoderServiceName:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("TranscoderServiceName"));
}

- (id)transcoderFunctionName
{
  return sub_18A5C7DE4(self, CFSTR("TranscoderFunctionName"), 0);
}

- (void)setTranscoderFunctionName:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("TranscoderFunctionName"));
}

- (id)transcoderPermittedRemoteMeasurement
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  id v13;

  if (!self)
  {
    v13 = 0;
    return v13;
  }
  sub_18A5C7F78((uint64_t)self, CFSTR("TranscoderPermittedRemoteMeasurement"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = (void *)v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
      if (!v10)
        goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_8;
LABEL_9:
  v13 = v12;

  return v13;
}

- (void)setTranscoderPermittedRemoteMeasurement:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("TranscoderPermittedRemoteMeasurement"));
}

- (id)shareURLToAccountIDSystemAcceptationOverrides
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__getDictionaryOptionForKey_defaultValue_, CFSTR("ShareURLToAccountIDSystemAcceptationOverrides"), 0);
}

- (void)setShareURLToAccountIDSystemAcceptationOverrides:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ShareURLToAccountIDSystemAcceptationOverrides"));
}

- (id)containerIdentifierToEmailOverrides
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__getDictionaryOptionForKey_defaultValue_, CFSTR("ContainerIdentifierToEmailOverrides"), 0);
}

- (void)setContainerIdentifierToEmailOverrides:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ContainerIdentifierToEmailOverrides"));
}

- (id)sharingOptionsSummaryString
{
  return sub_18A5C7DE4(self, CFSTR("SharingOptionsSummaryString"), CFSTR("Everyone can make changes"));
}

- (void)setSharingOptionsSummaryString:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("SharingOptionsSummaryString"));
}

- (BOOL)fakeWalrusEnabled
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("FakeWalrusEnabled"), 0);
}

- (void)setFakeWalrusOverride:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  const char *v6;
  id v7;

  if (a3)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, 1, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v7, (uint64_t)CFSTR("FakeWalrusOverride"));

  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("FakeWalrusOverride"));
    objc_msgSend__setPref_forKey_(self, v6, 0, (uint64_t)CFSTR("FakeWalrusEnabled"));
  }
}

- (void)setFakeWalrusEnabled:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("FakeWalrusEnabled"));

}

- (void)setCDPWalrusEnabled:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CDPWalrusEnabled"));

}

- (BOOL)CDPWalrusEnabled
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("CDPWalrusEnabled"), 0);
}

- (void)setCDPWalrusOverride:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CDPWalrusOverride"));

}

- (BOOL)CDPWalrusOverride
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("CDPWalrusOverride"), 0);
}

- (id)altDSIDsToWalrusAvailabilitiesOverrides
{
  return sub_18A5C7F78((uint64_t)self, CFSTR("AltDSIDsToWalrusAvailabilitiesOverrides"));
}

- (void)setAltDSIDsToWalrusAvailabilitiesOverrides:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("AltDSIDsToWalrusAvailabilitiesOverrides"));
}

- (BOOL)fakeManateeEnabled
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("FakeManateeEnabled"), 0);
}

- (BOOL)fakeManateeOverride
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("FakeManateeOverride"), 0);
}

- (void)setFakeManateeEnabled:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("FakeManateeEnabled"));

}

- (void)setFakeManateeOverride:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  const char *v6;
  id v7;

  if (a3)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, 1, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v7, (uint64_t)CFSTR("FakeManateeOverride"));

  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("FakeManateeOverride"));
    objc_msgSend__setPref_forKey_(self, v6, 0, (uint64_t)CFSTR("FakeManateeEnabled"));
  }
}

- (id)altDSIDsToManateeAvailabilitiesOverrides
{
  return sub_18A5C7F78((uint64_t)self, CFSTR("AltDSIDsToManateeAvailabilitiesOverrides"));
}

- (void)setAltDSIDsToManateeAvailabilitiesOverrides:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("AltDSIDsToManateeAvailabilitiesOverrides"));
}

- (double)containerProxyInactiveTimeoutWithDefaultValue:(double)a3
{
  return sub_18A5C7AC4((uint64_t)self, CFSTR("ContainerProxyInactiveTimeout"), a3);
}

- (void)setContainerProxyInactiveTimeout:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("ContainerProxyInactiveTimeout"));
}

- (void)setIsCurrentAppleAccountSuspended:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("FakeSuspendedAppleAccount"));

}

- (BOOL)isCurrentAppleAccountSuspended
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("FakeSuspendedAppleAccount"), 0);
}

- (BOOL)isDASRateLimitingDisabled
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return sub_18A5C7EC4((uint64_t)self, CFSTR("DisableDASRateLimiting"), 0);
}

- (void)setIsDASRateLimitingDisabled:(id)a3
{
  objc_msgSend__setPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("DisableDASRateLimiting"));
}

- (void)setCacheChildAccounts:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("CacheChildAccounts"));

}

- (BOOL)overrideSavePolicyForShareRecords
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("OverrideSavePolicyForShareRecords"), 0);
}

- (void)setOverrideSavePolicyForShareRecords:(BOOL)a3
{
  if (a3)
    objc_msgSend__setPref_forKey_(self, a2, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("OverrideSavePolicyForShareRecords"));
  else
    objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("OverrideSavePolicyForShareRecords"));
}

- (unint64_t)maximumMergeableDeltaRequestSize
{
  return (int)sub_18A606250((uint64_t)self, CFSTR("MergeableDeltaRequestSize"), 512000);
}

- (void)setMaximumMergeableDeltaRequestSize:(unint64_t)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("MergeableDeltaRequestSize"));

}

- (void)resetMaximumMergeableDeltaRequestSize
{
  objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("MergeableDeltaRequestSize"));
}

- (NSString)llvmProfileFile
{
  return (NSString *)sub_18A5C7DE4(self, CFSTR("LLVMProfileFile"), 0);
}

- (void)setLlvmProfileFile:(id)a3
{
  objc_msgSend__reallySetPref_forKey_(self, a2, (uint64_t)a3, (uint64_t)CFSTR("LLVMProfileFile"));
}

- (BOOL)stubDeviceCapabilityChecks
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("StubDeviceCapabilityChecks"), 0);
}

- (BOOL)isSupportedDeviceCapabilityCheckMockResult
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("IsSupportedDeviceCapabilityCheckMockResult"), 0);
}

- (void)mockDeviceCapabilityChecksWithIsSupported:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v6, (uint64_t)v5, (uint64_t)CFSTR("IsSupportedDeviceCapabilityCheckMockResult"));

  objc_msgSend__setPref_forKey_(self, v7, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("StubDeviceCapabilityChecks"));
}

- (void)stopMockingDeviceCapabilityChecks
{
  const char *v3;

  objc_msgSend__setPref_forKey_(self, a2, 0, (uint64_t)CFSTR("IsSupportedDeviceCapabilityCheckMockResult"));
  objc_msgSend__setPref_forKey_(self, v3, 0, (uint64_t)CFSTR("StubDeviceCapabilityChecks"));
}

- (BOOL)stubRequiredFeaturesUsingLastSavedPerZone
{
  return sub_18A5C7EC4((uint64_t)self, CFSTR("StubRequiredFeaturesUsingLastSavedPerZone"), 0);
}

- (void)setStubRequiredFeaturesUsingLastSavedPerZone:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  id v6;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, (uint64_t)CFSTR("StubRequiredFeaturesUsingLastSavedPerZone"));

}

@end
