@implementation HMDHAPMetadata

- (BOOL)requiresDeviceUnlock:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata hmRequiresDeviceUnlockTuples](self, "hmRequiresDeviceUnlockTuples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDHAPMetadata checkTupleExistsInSet:forChrType:svcType:](self, "checkTupleExistsInSet:forChrType:svcType:", v8, v7, v6);

  return (char)self;
}

- (BOOL)shouldAutoEnableNotificationForCharacteristic:(id)a3 ofService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (shouldAutoEnableNotificationForCharacteristic_ofService__onceToken != -1)
    dispatch_once(&shouldAutoEnableNotificationForCharacteristic_ofService__onceToken, &__block_literal_global_187);
  -[HMDHAPMetadata hmNotificationAutoEnabledTuples](self, "hmNotificationAutoEnabledTuples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDHAPMetadata checkTupleExistsInSet:forChrType:svcType:](self, "checkTupleExistsInSet:forChrType:svcType:", v8, v6, v7))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend((id)shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications, "hmf_arrayForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "containsObject:", v6);

  }
  return v9;
}

- (BOOL)checkTupleExistsInSet:(id)a3 forChrType:(id)a4 svcType:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0D16530];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithCharacteristicType:serviceType:", v9, v8);

  LOBYTE(v9) = objc_msgSend(v10, "containsObject:", v11);
  return (char)v9;
}

- (NSSet)hmNotificationAutoEnabledTuples
{
  return self->_hmNotificationAutoEnabledTuples;
}

- (NSSet)hmRequiresDeviceUnlockTuples
{
  return self->_hmRequiresDeviceUnlockTuples;
}

- (BOOL)shouldFilterServiceOfType:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (shouldFilterServiceOfType__pred != -1)
    dispatch_once(&shouldFilterServiceOfType__pred, &__block_literal_global_182);
  if ((objc_msgSend((id)shouldFilterServiceOfType___allowedServices, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HMDHAPMetadata hmBlacklistedServices](self, "hmBlacklistedServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)shouldRefreshValueForCharacteristicWithType:(id)a3 serviceType:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = shouldRefreshValueForCharacteristicWithType_serviceType__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&shouldRefreshValueForCharacteristicWithType_serviceType__onceToken, &__block_literal_global_192);
  objc_msgSend((id)shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping, "hmf_arrayForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "containsObject:", v7);
  return v9;
}

- (BOOL)shouldEnableHomeNotificationForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (shouldEnableHomeNotificationForCharacteristicType_serviceType__onceToken != -1)
    dispatch_once(&shouldEnableHomeNotificationForCharacteristicType_serviceType__onceToken, &__block_literal_global_188);
  objc_msgSend((id)shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications, "hmf_arrayForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isStandardHAPService:", v7))
    {
      -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isStandardHAPCharacteristic:", v6)
        || (objc_msgSend((id)shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications, "containsObject:", v7) & 1) != 0|| (objc_msgSend((id)shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications, "containsObject:", v6) & 1) != 0|| -[HMDHAPMetadata shouldFilterServiceOfTypeFromApp:](self, "shouldFilterServiceOfTypeFromApp:", v7))
      {
        LOBYTE(v10) = 0;
      }
      else
      {
        v10 = !-[HMDHAPMetadata shouldFilterCharacteristicOfTypeFromApp:](self, "shouldFilterCharacteristicOfTypeFromApp:", v6);
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

id __33__HMDHAPMetadata_prepareMetadata__block_invoke()
{
  void *v0;
  void *v1;

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hapMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (HAPMetadata)hapMetadata
{
  return self->_hapMetadata;
}

+ (id)getSharedInstance
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  char v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "metadataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("current"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = v5;
  }
  else
  {
    v7 = (id)configPlainMetadataPath;
    if (v7)
    {
      v22 = 0;
      +[HMDHAPMetadata metadataWithPath:error:](HMDHAPMetadata, "metadataWithPath:error:", v7, &v22);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v22;
      if (v8)
        v9 = 1;
      else
        v9 = v5 == 0;
      v10 = !v9;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      if ((v10 & 1) != 0)
      {
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "version");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "schemaVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Current HMDHAPMetadata version %@ schemaVersion %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("current"));
        v6 = v5;
      }
      else
      {
        HMFGetOSLogHandle();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v20;
          v25 = 2112;
          v26 = v8;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate the current metadata %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        v6 = 0;
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get plain metadata path", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v5 = 0;
      v6 = 0;
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v6;
}

+ (id)metadataCache
{
  if (metadataCache_onceToken != -1)
    dispatch_once(&metadataCache_onceToken, &__block_literal_global_18870);
  return (id)metadataCache_cache;
}

- (BOOL)shouldFilterCharacteristicOfType:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (shouldFilterCharacteristicOfType__pred != -1)
    dispatch_once(&shouldFilterCharacteristicOfType__pred, &__block_literal_global_183);
  if ((objc_msgSend((id)shouldFilterCharacteristicOfType___allowedCharacteristics, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HMDHAPMetadata hmBlacklistedCharacteristics](self, "hmBlacklistedCharacteristics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)shouldFilterChangeNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (shouldFilterChangeNotificationsForCharacteristicType_serviceType__onceToken != -1)
    dispatch_once(&shouldFilterChangeNotificationsForCharacteristicType_serviceType__onceToken, &__block_literal_global_190);
  if ((objc_msgSend((id)shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[HMDHAPMetadata hmBlacklistedServices](self, "hmBlacklistedServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[HMDHAPMetadata hmBlacklistedCharacteristics](self, "hmBlacklistedCharacteristics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v6) & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend((id)shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications, "containsObject:", v6);

    }
  }

  return v8;
}

- (BOOL)shouldFilterEnableNotificationsForCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (shouldFilterEnableNotificationsForCharacteristicType_serviceType__onceToken != -1)
    dispatch_once(&shouldFilterEnableNotificationsForCharacteristicType_serviceType__onceToken, &__block_literal_global_191);
  if ((objc_msgSend((id)shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[HMDHAPMetadata hmBlacklistedServices](self, "hmBlacklistedServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[HMDHAPMetadata hmBlacklistedCharacteristics](self, "hmBlacklistedCharacteristics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v6) & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend((id)shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications, "containsObject:", v6);

    }
  }

  return v8;
}

- (NSSet)hmBlacklistedCharacteristics
{
  return self->_hmBlacklistedCharacteristics;
}

- (NSSet)hmBlacklistedServices
{
  return self->_hmBlacklistedServices;
}

- (BOOL)shouldFilterServiceOfTypeFromApp:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDHAPMetadata hmBlacklistedServicesFromApp](self, "hmBlacklistedServicesFromApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)hmBlacklistedServicesFromApp
{
  return self->_hmBlacklistedServicesFromApp;
}

- (BOOL)shouldFilterCharacteristicOfTypeFromApp:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDHAPMetadata hmBlacklistedCharacteristicsFromApp](self, "hmBlacklistedCharacteristicsFromApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)hmBlacklistedCharacteristicsFromApp
{
  return self->_hmBlacklistedCharacteristicsFromApp;
}

- (BOOL)shouldNotCacheCharacteristicOfType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = shouldNotCacheCharacteristicOfType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldNotCacheCharacteristicOfType__onceToken, &__block_literal_global_184);
  v5 = objc_msgSend((id)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes, "containsObject:", v4);

  return v5;
}

- (NSNumber)version
{
  return self->_version;
}

- (id)xpcData:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    -[HMDHAPMetadata hmAccessoryCategories](self, "hmAccessoryCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x1E0CBA518];
  -[HMDHAPMetadata version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hapCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hapServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeProtobufWithVersion:characteristics:services:categories:", v7, v9, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)hmAccessoryCategories
{
  return self->_hmAccessoryCategories;
}

- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HMDHAPMetadata *v10;
  HMDHAPMetadata *v11;
  uint64_t v12;
  NSNumber *version;
  uint64_t v14;
  NSNumber *schemaVersion;
  uint64_t v16;
  NSDictionary *rawPlist;
  NSDictionary *v18;
  id v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDHAPMetadata;
  v10 = -[HMDHAPMetadata init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_hapMetadata, a4);
    objc_msgSend(v9, "version");
    v12 = objc_claimAutoreleasedReturnValue();
    version = v11->_version;
    v11->_version = (NSNumber *)v12;

    objc_msgSend(v9, "schemaVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    schemaVersion = v11->_schemaVersion;
    v11->_schemaVersion = (NSNumber *)v14;

    v16 = objc_msgSend(v8, "copy");
    rawPlist = v11->_rawPlist;
    v11->_rawPlist = (NSDictionary *)v16;

    v18 = v11->_rawPlist;
    if (a5)
    {
      -[HMDHAPMetadata parseAndSetRawPlist:](v11, "parseAndSetRawPlist:", v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = -[HMDHAPMetadata parseAndSetRawPlist:](v11, "parseAndSetRawPlist:", v18);
    }
  }

  return v11;
}

- (HMDHAPMetadata)initWithDictionary:(id)a3 hapMetadata:(id)a4 error:(id *)a5
{
  HMDHAPMetadata *v6;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMDHAPMetadata *v13;

  v6 = 0;
  if (a3 && a4)
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    v10 = a4;
    objc_msgSend(v9, "dictionaryWithDictionary:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rawPlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D16678]);

    v13 = -[HMDHAPMetadata initWithFullPlist:hapMetadata:error:](self, "initWithFullPlist:hapMetadata:error:", v11, v10, a5);
    self = v13;

    v6 = self;
  }

  return v6;
}

- (HMDHAPMetadata)initWithFullPlist:(id)a3 hapMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHAPMetadata *v9;
  HMDHAPMetadata *v11;
  SEL v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = -[HMDHAPMetadata initWithFullPlist:hapMetadata:error:](self, "initWithFullPlist:hapMetadata:error:", v6, v7, 0);

      return v9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v11 = (HMDHAPMetadata *)_HMFPreconditionFailure();
  return (HMDHAPMetadata *)-[HMDHAPMetadata characteristicNameFromType:](v11, v12, v13);
}

- (id)characteristicNameFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicUTIFromType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)characteristicTypeFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicTypeFromUTI:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceNameFromType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceUTIFromType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceTypeFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceTypeFromUTI:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isStandardCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStandardHAPCharacteristic:", v4);

  return v6;
}

- (BOOL)isStandardServiceType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStandardHAPService:", v4);

  return v6;
}

- (BOOL)supportsAuthorizationData:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsAdditionalAuthorizationData:forService:", v7, v6);

  return v9;
}

- (id)validateAssociatedServiceType:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  uint32_t v21;
  id v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isStandardHAPService:", v7) & 1) != 0)
    {
      -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isStandardHAPService:", v6);

      if ((v10 & 1) != 0)
      {
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "allowAssociatedService:", v7);

        if ((v12 & 1) == 0)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v17;
          v39 = 2112;
          v40 = v7;
          v18 = "%{public}@Service %@ does not other services to be associated";
          goto LABEL_17;
        }
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "allowAssociatedService:", v6);

        if (v14)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543618;
            v38 = v17;
            v39 = 2112;
            v40 = v6;
            v18 = "%{public}@Service being associated %@ itself allows other services to be associated";
LABEL_17:
            v20 = v16;
            v21 = 22;
            goto LABEL_12;
          }
LABEL_13:

          objc_autoreleasePoolPop(v15);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        v23 = (id)*MEMORY[0x1E0D15FB0];
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isMandatoryCharacteristic:forService:", v23, v7) & 1) != 0)
        {
          -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isMandatoryCharacteristic:forService:", v23, v6);

          if ((v26 & 1) != 0)
          {
            v19 = 0;
LABEL_32:

            goto LABEL_14;
          }
        }
        else
        {

        }
        v27 = (id)*MEMORY[0x1E0D15EF0];
        v28 = (id)*MEMORY[0x1E0D15F00];
        v29 = (id)*MEMORY[0x1E0D15F28];
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isMandatoryCharacteristic:forService:", v27, v7) & 1) != 0)
        {
          -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "isMandatoryCharacteristic:forService:", v28, v6))
          {

LABEL_30:
            v19 = 0;
LABEL_31:

            goto LABEL_32;
          }
          -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isMandatoryCharacteristic:forService:", v29, v6);

          if ((v36 & 1) != 0)
            goto LABEL_30;
        }
        else
        {

        }
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543874;
          v38 = v34;
          v39 = 2112;
          v40 = v7;
          v41 = 2112;
          v42 = v6;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Service %@ or service being associated %@ are not compatible", (uint8_t *)&v37, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 62);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    else
    {

    }
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v17;
      v39 = 2112;
      v40 = v7;
      v41 = 2112;
      v42 = v6;
      v18 = "%{public}@Unknown service types %@ %@";
      v20 = v16;
      v21 = 32;
LABEL_12:
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v37, v21);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)descriptionForServiceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionFromServiceType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionFromCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)allowsSecuringWriteFor:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata hmAllowableSecuringWrites](self, "hmAllowableSecuringWrites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "containsObject:", v6);
  else
    v10 = 0;

  return v10;
}

- (BOOL)shouldAllowToWakeSuspendedAccessoryForOperation:(int64_t)a3 service:(id)a4 characteristicType:(id)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDHAPMetadata *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  BOOL v25;
  __CFString *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  HMDHAPMetadata *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  HMDHAPMetadata *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  HMDHAPMetadata *v46;
  NSObject *v47;
  void *v48;
  __CFString *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 0xA)
      v17 = CFSTR("Undefined");
    else
      v17 = off_1E89ABEC8[a3];
    v18 = v17;
    *(_DWORD *)buf = 138544386;
    v61 = v16;
    v62 = 2112;
    v63 = v18;
    v64 = 2112;
    v65 = v10;
    v66 = 2112;
    v67 = v11;
    v68 = 2112;
    v69 = v12;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Checking if operation: '%@' is allowed to wake accessory for service: '%@' characteristic: '%@' with value '%@'", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDHAPMetadata hmWakeOnOperationsFilter](v14, "hmWakeOnOperationsFilter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmf_dictionaryForKey:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "hmf_dictionaryForKey:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "hmf_arrayForKey:", *MEMORY[0x1E0D16770]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a3 > 0xA)
        v24 = CFSTR("Undefined");
      else
        v24 = off_1E89ABEC8[a3];
      v26 = v24;
      v27 = objc_msgSend(v23, "containsObject:", v26);

      if (v27)
      {
        if (a3 == 3)
        {
          objc_msgSend(v22, "hmf_arrayForKey:", *MEMORY[0x1E0D16758]);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            v52 = v23;
            v54 = v28;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v30 = v28;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v56;
              while (2)
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v56 != v33)
                    objc_enumerationMutation(v30);
                  if (v12 && objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "isEqual:", v12))
                  {
                    v45 = (void *)MEMORY[0x1D17BA0A0]();
                    v46 = v14;
                    HMFGetOSLogHandle();
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v51 = v45;
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = CFSTR("Write");
                      *(_DWORD *)buf = 138544386;
                      v61 = v48;
                      v62 = 2112;
                      v63 = CFSTR("Write");
                      v64 = 2112;
                      v65 = v10;
                      v66 = 2112;
                      v67 = v11;
                      v68 = 2112;
                      v69 = v12;
                      _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' with value '%@' is allowed to wake accessory", buf, 0x34u);

                      v45 = v51;
                    }

                    objc_autoreleasePoolPop(v45);
                    v25 = 1;
                    goto LABEL_36;
                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
                if (v32)
                  continue;
                break;
              }
            }

            v35 = (void *)MEMORY[0x1D17BA0A0]();
            v36 = v14;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = CFSTR("Write");
              *(_DWORD *)buf = 138544130;
              v61 = v38;
              v62 = 2112;
              v63 = CFSTR("Write");
              v64 = 2112;
              v65 = v10;
              v66 = 2112;
              v67 = v11;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' is not allowed to wake accessory", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v35);
            v25 = 0;
LABEL_36:
            v23 = v52;
            v29 = v54;
          }
          else
          {
            v40 = (void *)MEMORY[0x1D17BA0A0]();
            v41 = v14;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v53 = v40;
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = CFSTR("Write");
              *(_DWORD *)buf = 138544130;
              v61 = v43;
              v62 = 2112;
              v63 = CFSTR("Write");
              v64 = 2112;
              v65 = v10;
              v66 = 2112;
              v67 = v11;
              _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Operation: %@ on service '%@' and characteristic '%@' is allowed to wake accessory", buf, 0x2Au);

              v40 = v53;
            }

            objc_autoreleasePoolPop(v40);
            v25 = 1;
          }

        }
        else
        {
          v25 = 1;
        }
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)requiresTimedWrite:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (requiresTimedWrite_forService__onceToken != -1)
    dispatch_once(&requiresTimedWrite_forService__onceToken, &__block_literal_global_153);
  v8 = -[HMDHAPMetadata requiresDeviceUnlock:forService:](self, "requiresDeviceUnlock:forService:", v6, v7)
    || v6
    && (objc_msgSend((id)requiresTimedWrite_forService__timedWriteRequiringCharacteristic, "containsObject:", v6) & 1) != 0;

  return v8;
}

- (BOOL)isTargetCharacteristic:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isTargetCharacteristic__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isTargetCharacteristic__onceToken, &__block_literal_global_155);
  v5 = objc_msgSend((id)isTargetCharacteristic__targetCharacteristic, "containsObject:", v4);

  return v5;
}

- (BOOL)shouldCoalesceCharacteristicNotifications:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata hmCoalesceNotificationsTuples](self, "hmCoalesceNotificationsTuples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDHAPMetadata checkTupleExistsInSet:forChrType:svcType:](self, "checkTupleExistsInSet:forChrType:svcType:", v8, v7, v6);

  return (char)self;
}

- (BOOL)generateNotificationOnConfigurationForCharacteristicType:(id)a3 serviceType:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = generateNotificationOnConfigurationForCharacteristicType_serviceType__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&generateNotificationOnConfigurationForCharacteristicType_serviceType__onceToken, &__block_literal_global_185);
  objc_msgSend((id)generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping, "hmf_arrayForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "containsObject:", v6);
  return v9;
}

- (BOOL)isSecondsDownCounterCharacteristicType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isSecondsDownCounterCharacteristicType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isSecondsDownCounterCharacteristicType__onceToken, &__block_literal_global_186);
  v5 = objc_msgSend((id)isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes, "containsObject:", v4);

  return v5;
}

- (BOOL)shouldHomeAppShowTileForServiceType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = shouldHomeAppShowTileForServiceType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldHomeAppShowTileForServiceType__onceToken, &__block_literal_global_189);
  v5 = objc_msgSend((id)shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp, "containsObject:", v4);

  return v5;
}

- (id)categoryForOther
{
  void *v2;
  void *v3;

  -[HMDHAPMetadata hmAccessoryCategories](self, "hmAccessoryCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E8B329E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)audioAccessoryCategory
{
  HMDHAPMetadataCategory *v2;

  v2 = [HMDHAPMetadataCategory alloc];
  return -[HMDHAPMetadataCategory initWithIdentifier:uuid:name:description:](v2, "initWithIdentifier:uuid:name:description:", &unk_1E8B32A00, *MEMORY[0x1E0CB7A58], CFSTR("homepod"), CFSTR("HomePod"));
}

- (id)categoryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HMDHAPMetadata hmAccessoryCategories](self, "hmAccessoryCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  -[HMDHAPMetadata audioAccessoryCategory](self, "audioAccessoryCategory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {

LABEL_4:
    v7 = v6;
  }

  return v7;
}

- (id)categoryForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  -[HMDHAPMetadata hmAccessoryCategories](self, "hmAccessoryCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v4, CFSTR("uuidStr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  -[HMDHAPMetadata audioAccessoryCategory](self, "audioAccessoryCategory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuidStr");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {

LABEL_4:
    v8 = v7;
  }

  return v8;
}

- (id)categoryTypeFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDHAPMetadata hmAccessoryCategories](self, "hmAccessoryCategories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "uuidStr");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)serviceSubtypeForValue:(id)a3 forServiceType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id *v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (serviceSubtypeForValue_forServiceType__onceToken != -1)
      dispatch_once(&serviceSubtypeForValue_forServiceType__onceToken, &__block_literal_global_203);
    objc_msgSend((id)serviceSubtypeForValue_forServiceType__subServiceTypeMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D16298]);
      v10 = (id *)MEMORY[0x1E0CB9970];
      if (!v9)
        v10 = (id *)MEMORY[0x1E0CB9988];
      v8 = *v10;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsLocalization:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "supportsLocalization");
  return (char)v5;
}

- (id)mapToAssistantServiceName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HMDHAPMetadata aliasedHAPServiceTypes](self, "aliasedHAPServiceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  -[HMDHAPMetadata assistantServiceHAPTypeNameMap](self, "assistantServiceHAPTypeNameMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)mapFromAssistantServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata assistantServiceNameHAPTypeMap](self, "assistantServiceNameHAPTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapToAssistantServiceSubtypeName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = mapToAssistantServiceSubtypeName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&mapToAssistantServiceSubtypeName__onceToken, &__block_literal_global_208);
  objc_msgSend((id)mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mapToAssistantServiceSubtypeName:(id)a3 accessoryCategory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (mapToAssistantServiceSubtypeName_accessoryCategory__onceToken == -1)
  {
    if (v6)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  dispatch_once(&mapToAssistantServiceSubtypeName_accessoryCategory__onceToken, &__block_literal_global_209);
  if (!v7)
    goto LABEL_8;
LABEL_3:
  objc_msgSend((id)mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v5 && v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v10;
}

- (id)mapToAssistantCharacteristicName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[HMDHAPMetadata aliasedHAPCharacteristicTypes](self, "aliasedHAPCharacteristicTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D15FC0]) & 1) == 0
      && (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D15FB8]) & 1) == 0)
    {
      objc_msgSend(v6, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "objectForKey:", v5);
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
      }
    }
    -[HMDHAPMetadata assistantChrHAPTypeNameMap](self, "assistantChrHAPTypeNameMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)mapReadCharacteristicFromAssistantName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readHAPCharacteristicName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristicTypeFromUTI:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mapWriteCharacteristicFromAssistantName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeHAPCharacteristicName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristicTypeFromUTI:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getAliasedServiceType:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHAPMetadata aliasedHAPServiceTypes](self, "aliasedHAPServiceTypes");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getServiceTypeAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata aliasedHAPServiceTypes](self, "aliasedHAPServiceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getAliasedCharacteristicTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHAPMetadata aliasedHAPCharacteristicTypes](self, "aliasedHAPCharacteristicTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)getCharacteristicTypeAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata aliasedHAPCharacteristicTypes](self, "aliasedHAPCharacteristicTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getStatusCharacteristicTypes:(id)a3 forServiceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata statusHAPCharacteristicTypesForServiceType](self, "statusHAPCharacteristicTypesForServiceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)characteristicValueUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicValueUnitOfType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapCharacteristicValueType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)mapToAssistantUnitName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata assistantUnits](self, "assistantUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapFromAssistantUnitName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDHAPMetadata assistantUnits](self, "assistantUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapFromAssistantCharacteristicValue:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_4;
  objc_msgSend(v9, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "values");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
LABEL_4:
    v14 = v6;

  return v14;
}

- (id)mapToAssistantCharacteristicValue:(id)a3 name:(id)a4 getActionType:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  int v23;
  uint64_t v24;
  double v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[HMDHAPMetadata assistantCharacteristics](self, "assistantCharacteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_18;
  objc_msgSend(v11, "outValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "outValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "values");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
LABEL_18:
      v16 = v8;
      goto LABEL_19;
    }
    objc_msgSend(v11, "values");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeysForObject:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "count"))
    {
      v16 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0.0;
    v23 = 0;
    if (objc_msgSend(v20, "scanDouble:", &v25))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v20, "scanLongLong:", &v24))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v20, "scanInt:", &v23))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 != 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v15;
    }
    v16 = v21;

  }
LABEL_17:

  if (!v16)
    goto LABEL_18;
LABEL_19:

  return v16;
}

- (BOOL)disallowsAssistantServiceType:(id)a3 characteristicType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HMDHAPMetadata disallowedAssistantCharacteristicTypesByServiceType](self, "disallowedAssistantCharacteristicTypesByServiceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "containsObject:", v6);
  return (char)v7;
}

- (id)stagingPolicyConfigurationForService:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[HMDHAPMetadata firmwareUpdateStagingPolicies](self, "firmwareUpdateStagingPolicies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v10 = v6;
    else
      v10 = (id)*MEMORY[0x1E0D16110];
    objc_msgSend(v9, "valueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)autoApplyPolicyConfigurationForService:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[HMDHAPMetadata firmwareUpdateAutoApplyPolicies](self, "firmwareUpdateAutoApplyPolicies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v10 = v6;
    else
      v10 = (id)*MEMORY[0x1E0D16110];
    objc_msgSend(v9, "valueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)parseAndSetRawPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16688]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDHAPMetadata parseAndSetHMMetadataWithHMPlist:](self, "parseAndSetHMMetadataWithHMPlist:", v6))
    {
      objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16698]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDHAPMetadata parseAndSetAssistantMetadataWithAssistantPlist:](self, "parseAndSetAssistantMetadataWithAssistantPlist:", v7))
      {
        v8 = 0;
      }
      else
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v17;
          v21 = 2112;
          v22 = v7;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse assistant metadata from plist %@", (uint8_t *)&v19, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1001);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v14;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HM metadata from plist %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1001);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set HMDMetadata because rawPlist is nil.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)parseAndSetHMMetadataWithHMPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v42;

  v4 = a3;
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16728]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadata parseMetadataTupleSetFromPlist:](self, "parseMetadataTupleSetFromPlist:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadata setHmRequiresDeviceUnlockTuples:](self, "setHmRequiresDeviceUnlockTuples:", v6);

  -[HMDHAPMetadata hmRequiresDeviceUnlockTuples](self, "hmRequiresDeviceUnlockTuples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16690]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseAndSetAllowableSecuringWrites:](self, "parseAndSetAllowableSecuringWrites:", v8);

    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16768]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseAndSetWakeOnOperationsFilter:](self, "parseAndSetWakeOnOperationsFilter:", v9);

    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseAndSetHMCategories:](self, "parseAndSetHMCategories:", v10);

    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D16738];
    objc_msgSend(v11, "hmf_arrayForKey:", *MEMORY[0x1E0D16738]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseServiceArray:](self, "parseServiceArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmBlacklistedServices:](self, "setHmBlacklistedServices:", v14);

    v15 = *MEMORY[0x1E0D166B0];
    objc_msgSend(v11, "hmf_arrayForKey:", *MEMORY[0x1E0D166B0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseCharacteristicArray:](self, "parseCharacteristicArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmBlacklistedCharacteristics:](self, "setHmBlacklistedCharacteristics:", v17);

    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "hmf_arrayForKey:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseServiceArray:](self, "parseServiceArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmBlacklistedServicesFromApp:](self, "setHmBlacklistedServicesFromApp:", v20);

    objc_msgSend(v18, "hmf_arrayForKey:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseCharacteristicArray:](self, "parseCharacteristicArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmBlacklistedCharacteristicsFromApp:](self, "setHmBlacklistedCharacteristicsFromApp:", v22);

    -[HMDHAPMetadata hmBlacklistedServices](self, "hmBlacklistedServices");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_11;
    v24 = (void *)v23;
    -[HMDHAPMetadata hmBlacklistedCharacteristics](self, "hmBlacklistedCharacteristics");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v40 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v26 = (void *)v25;
    -[HMDHAPMetadata hmBlacklistedServicesFromApp](self, "hmBlacklistedServicesFromApp");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v40 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v28 = (void *)v27;
    -[HMDHAPMetadata hmBlacklistedCharacteristicsFromApp](self, "hmBlacklistedCharacteristicsFromApp");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
LABEL_11:
      v40 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16700]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166F8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166A0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166B8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseMetadataTupleSetFromPlist:](self, "parseMetadataTupleSetFromPlist:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmNotificationAutoEnabledTuples:](self, "setHmNotificationAutoEnabledTuples:", v32);

    -[HMDHAPMetadata parseMetadataTupleSetFromPlist:](self, "parseMetadataTupleSetFromPlist:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmBulletinBoardEnabledTuples:](self, "setHmBulletinBoardEnabledTuples:", v33);

    -[HMDHAPMetadata parseMetadataTupleSetFromPlist:](self, "parseMetadataTupleSetFromPlist:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setHmCoalesceNotificationsTuples:](self, "setHmCoalesceNotificationsTuples:", v34);

    -[HMDHAPMetadata hmNotificationAutoEnabledTuples](self, "hmNotificationAutoEnabledTuples");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      -[HMDHAPMetadata hmBulletinBoardEnabledTuples](self, "hmBulletinBoardEnabledTuples");
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = (void *)v37;
        v42 = v30;
        -[HMDHAPMetadata hmCoalesceNotificationsTuples](self, "hmCoalesceNotificationsTuples");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v40 = 0;
          v30 = v42;
          goto LABEL_18;
        }
        objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D160E0]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPMetadata parseAndSetHMAccessoryFirmwareUpdatePolicies:](self, "parseAndSetHMAccessoryFirmwareUpdatePolicies:", v36);
        v40 = 1;
        v30 = v42;
      }
      else
      {
        v40 = 0;
      }

    }
    else
    {
      v40 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  v40 = 0;
LABEL_22:

  return v40;
}

- (BOOL)parseAndSetAssistantMetadataWithAssistantPlist:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16738]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDHAPMetadata parseAndSetAssistantServices:](self, "parseAndSetAssistantServices:", v5);

  if (!v6)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    v15 = "%{public}@Failed to parse assistant services metadata";
LABEL_11:
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);

    goto LABEL_12;
  }
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D166B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDHAPMetadata parseAndSetAssistantCharacteristics:](self, "parseAndSetAssistantCharacteristics:", v7);

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    v15 = "%{public}@Failed to parse assistant characteristics metadata";
    goto LABEL_11;
  }
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16750]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHAPMetadata parseAndSetAssistantUnits:](self, "parseAndSetAssistantUnits:", v9);

  if (!v10)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      v15 = "%{public}@Failed to parse assistant units metadata";
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    v11 = 0;
    goto LABEL_13;
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (id)parseMetadataTupleSetFromPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parseCharacteristicServiceTuples:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic/service tuples: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6;
}

- (void)parseAndSetAllowableSecuringWrites:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  HMDHAPMetadata *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 138543618;
    v28 = v8;
    do
    {
      v11 = 0;
      v29 = v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata", v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "characteristicTypeFromUTI:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v6, "hmf_arrayForKey:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v16, v14);

          }
        }
        else
        {
          v17 = v10;
          v18 = v6;
          v19 = self;
          v20 = v5;
          v21 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v35 = v23;
            v36 = 2112;
            v37 = v12;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v21);
          v5 = v20;
          self = v19;
          v6 = v18;
          v10 = v17;
          v9 = v29;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v5, "count"))
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@There are no allowable securing writes in the metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }
  v27 = (void *)objc_msgSend(v5, "copy");
  -[HMDHAPMetadata setHmAllowableSecuringWrites:](self, "setHmAllowableSecuringWrites:", v27);

}

- (void)parseAndSetWakeOnOperationsFilter:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v4;
    obj = v4;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(obj, "hmf_dictionaryForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v24 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v8, "hmf_dictionaryForKey:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDHAPMetadata serviceTypeFromName:](self, "serviceTypeFromName:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKey:", v14, v15);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v10);
          }
          -[HMDHAPMetadata characteristicTypeFromName:](self, "characteristicTypeFromName:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v7, v16);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

    v17 = (void *)objc_msgSend(v20, "copy");
    -[HMDHAPMetadata setHmWakeOnOperationsFilter:](self, "setHmWakeOnOperationsFilter:", v17);

    v4 = v18;
  }

}

- (void)parseAndSetHMCategories:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  HMDHAPMetadataCategory *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDHAPMetadata *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v24 = self;
  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v28 = *(_QWORD *)v30;
    v27 = *MEMORY[0x1E0D166E0];
    v7 = *MEMORY[0x1E0D16748];
    v8 = *MEMORY[0x1E0D166C0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = v4;
        objc_msgSend(v4, "hmf_dictionaryForKey:", v10, v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_numberForKey:", v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_stringForKey:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_stringForKey:", v8);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v13)
          v17 = v14 == 0;
        else
          v17 = 1;
        if (!v17 && v15 != 0)
        {
          v19 = -[HMDHAPMetadataCategory initWithIdentifier:uuid:name:description:]([HMDHAPMetadataCategory alloc], "initWithIdentifier:uuid:name:description:", v13, v14, v10, v15);
          if (v19)
            objc_msgSend(v26, "setObject:forKey:", v19, v13);

        }
        v4 = v11;
      }
      v6 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v26, "count"))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@There are no accessory categories in the metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
  v23 = (void *)objc_msgSend(v26, "copy", v24);
  objc_msgSend(v25, "setHmAccessoryCategories:", v23);

}

- (void)parseAndSetHMAccessoryFirmwareUpdatePolicies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHAPMetadata *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16140]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseHMAccessoryFirmwareUpdatePolicyServices:](self, "parseHMAccessoryFirmwareUpdatePolicyServices:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setFirmwareUpdateStagingPolicies:](self, "setFirmwareUpdateStagingPolicies:", v7);

    objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x1E0D160D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata parseHMAccessoryFirmwareUpdatePolicyServices:](self, "parseHMAccessoryFirmwareUpdatePolicyServices:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMetadata setFirmwareUpdateAutoApplyPolicies:](self, "setFirmwareUpdateAutoApplyPolicies:", v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory firmware update policies not defined!", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (BOOL)policyConfigurationAvailableForAllHAPServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDHAPMetadata *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18777;
  v17 = __Block_byref_object_dispose__18778;
  v18 = 0;
  -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapServiceNameTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HMDHAPMetadata_policyConfigurationAvailableForAllHAPServices__block_invoke;
  v12[3] = &unk_1E89A6900;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);

  v5 = v14[5];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14[5];
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Firmware update policy configuration missing for service:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  _Block_object_dispose(&v13, 8);

  return v5 == 0;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessoryFirmwareUpdatePolicyServiceConfiguration *v24;
  int v25;
  void *v26;
  HMDHAPMetadata *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDHAPMetadata *v31;
  NSObject *v32;
  void *v33;
  HMDAccessoryFirmwareUpdatePolicyCriteria *v34;
  HMDAccessoryFirmwareUpdatePolicyServiceConfiguration *v35;
  HMDAccessoryFirmwareUpdatePolicyServiceConfiguration *v36;
  id v37;
  void *v38;
  HMDHAPMetadata *v39;
  NSObject *v40;
  void *v41;
  void *v43;
  HMDHAPMetadata *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDHAPMetadata *v48;
  NSObject *v49;
  void *v50;
  HMDHAPMetadata *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  HMDHAPMetadata *v64;
  uint64_t v65;
  uint64_t v66;
  void *context;
  void *contexta;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16120]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v9 = v6;
    v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v75;
      context = (void *)*MEMORY[0x1E0D16110];
      v64 = self;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v75 != v59)
          objc_enumerationMutation(v9);
        v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v10);
        -[HMDHAPMetadata serviceTypeFromName:](self, "serviceTypeFromName:", v11);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v69)
          break;
        objc_msgSend(v9, "hmf_dictionaryForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v47 = (void *)MEMORY[0x1D17BA0A0]();
          v48 = self;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v80 = v50;
            v81 = 2112;
            v82 = v69;
            _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed while parsing policy configuration for service:%@.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v47);
          v37 = v61;
          goto LABEL_45;
        }
        v13 = v12;
        v60 = v10;
        objc_msgSend(*(id *)(v7 + 3592), "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v15 = v13;
          v66 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
          if (v66)
          {
            v54 = v13;
            v55 = v9;
            v56 = v8;
            v57 = v5;
            v65 = *(_QWORD *)v71;
            v16 = v61;
            v62 = v14;
            v17 = context;
            while (2)
            {
              for (i = 0; i != v66; ++i)
              {
                if (*(_QWORD *)v71 != v65)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
                if (objc_msgSend(v19, "isEqualToString:", v17))
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v17);
                else
                  -[HMDHAPMetadata categoryTypeFromName:](self, "categoryTypeFromName:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v20)
                {
                  v38 = (void *)MEMORY[0x1D17BA0A0]();
                  v39 = self;
                  HMFGetOSLogHandle();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v80 = v41;
                    v81 = 2112;
                    v82 = v69;
                    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Category type not found for service:%@.", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v38);
                  v37 = v16;
                  v13 = v15;
                  v8 = v56;
                  v5 = v57;
                  v9 = v55;
                  goto LABEL_44;
                }
                v21 = v15;
                objc_msgSend(v15, "hmf_dictionaryForKey:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDHAPMetadata parseHMAccessoryFirmwareUpdatePolicyCriteria:](self, "parseHMAccessoryFirmwareUpdatePolicyCriteria:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = -[HMDAccessoryFirmwareUpdatePolicyServiceConfiguration initWithType:category:criteria:]([HMDAccessoryFirmwareUpdatePolicyServiceConfiguration alloc], "initWithType:category:criteria:", v69, v20, v23);
                  if (v24)
                  {
                    objc_msgSend(v14, "setValue:forKey:", v24, v20);
                    v25 = 0;
                  }
                  else
                  {
                    v30 = (void *)MEMORY[0x1D17BA0A0]();
                    v31 = self;
                    HMFGetOSLogHandle();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v80 = v33;
                      v81 = 2112;
                      v82 = v20;
                      v83 = 2112;
                      v84 = v69;
                      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service configuration failed for category %@ in service:%@.", buf, 0x20u);

                      v16 = v61;
                    }

                    objc_autoreleasePoolPop(v30);
                    v63 = v16;
                    v25 = 1;
                    self = v64;
                    v14 = v62;
                  }

                }
                else
                {
                  v26 = (void *)MEMORY[0x1D17BA0A0]();
                  v27 = self;
                  HMFGetOSLogHandle();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v80 = v29;
                    v81 = 2112;
                    v82 = v20;
                    v83 = 2112;
                    v84 = v69;
                    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Criteria configuration failed for category %@ in service:%@.", buf, 0x20u);

                    v14 = v62;
                  }

                  objc_autoreleasePoolPop(v26);
                  v63 = v16;
                  v25 = 1;
                  self = v64;
                }

                v15 = v21;
                if (v25)
                {
                  v13 = v21;
                  v8 = v56;
                  v5 = v57;
                  v9 = v55;
                  v37 = v63;
                  goto LABEL_44;
                }
                v17 = context;
              }
              v66 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
              if (v66)
                continue;
              break;
            }
            v8 = v56;
            v5 = v57;
            v13 = v54;
            v9 = v55;
          }
          v7 = 0x1E0C99000;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", context);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v34 = objc_alloc_init(HMDAccessoryFirmwareUpdatePolicyCriteria);
          v35 = -[HMDAccessoryFirmwareUpdatePolicyServiceConfiguration initWithType:category:criteria:]([HMDAccessoryFirmwareUpdatePolicyServiceConfiguration alloc], "initWithType:category:criteria:", v69, v15, v34);
          if (!v35)
          {
            contexta = (void *)MEMORY[0x1D17BA0A0]();
            v51 = self;
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v53;
              v81 = 2112;
              v82 = v15;
              v83 = 2112;
              v84 = v69;
              _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Service configuration failed for category %@ in service:%@.", buf, 0x20u);

            }
            objc_autoreleasePoolPop(contexta);
            v37 = v61;

LABEL_44:
LABEL_45:

LABEL_46:
            goto LABEL_47;
          }
          v36 = v35;
          objc_msgSend(v14, "setValue:forKey:", v35, v15);

        }
        objc_msgSend(v8, "setValue:forKey:", v14, v69);

        v10 = v60 + 1;
        if (v60 + 1 == v58)
        {
          v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
          if (v58)
            goto LABEL_4;
          goto LABEL_38;
        }
      }
      v43 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v46;
        v81 = 2112;
        v82 = v11;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Service type not found for service:%@.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      v37 = v61;
      goto LABEL_46;
    }
LABEL_38:

    v37 = (id)objc_msgSend(v8, "copy");
LABEL_47:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyCriteria:(id)a3
{
  id v4;
  HMDAccessoryFirmwareUpdatePolicyCriteria *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDAccessoryFirmwareUpdateTimeWindow *v14;
  HMDAccessoryFirmwareUpdateTimeWindow *v15;
  HMDAccessoryFirmwareUpdatePolicyCriteria *v16;
  void *v17;
  HMDHAPMetadata *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  HMDHAPMetadata *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HMDAccessoryFirmwareUpdatePolicyCriteria);
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setAnyUserAtHome:](v5, "setAnyUserAtHome:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x1E0D160E8]));
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setNoUserAtHome:](v5, "setNoUserAtHome:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x1E0D16118]));
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setCheckForScheduledAutomation:](v5, "setCheckForScheduledAutomation:", objc_msgSend(v4, "hmf_BOOLForKey:", *MEMORY[0x1E0D16108]));
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16100]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadata parseHMAccessoryFirmwareUpdatePolicyCharacteristics:](self, "parseHMAccessoryFirmwareUpdatePolicyCharacteristics:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdatePolicyCriteria setCharacteristicConfigurations:](v5, "setCharacteristicConfigurations:", v7);

  if (v6)
  {
    -[HMDAccessoryFirmwareUpdatePolicyCriteria characteristicConfigurations](v5, "characteristicConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristics", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      goto LABEL_18;
    }
  }
  objc_msgSend(v4, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16130]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x1E0D16138]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x1E0D16128]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      v14 = -[HMDAccessoryFirmwareUpdateTimeWindow initWithStartTime:endTime:]([HMDAccessoryFirmwareUpdateTimeWindow alloc], "initWithStartTime:endTime:", v11, v12);
      if (v14)
      {
        v15 = v14;
        -[HMDAccessoryFirmwareUpdatePolicyCriteria setUpdateTimeWindow:](v5, "setUpdateTimeWindow:", v14);

        goto LABEL_8;
      }
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v20;
      v21 = "%{public}@Failed to initialize time window";
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        objc_autoreleasePoolPop(v17);
LABEL_18:
        v16 = 0;
        goto LABEL_19;
      }
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v20;
      v21 = "%{public}@Failed to parse time window";
    }
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 0xCu);

    goto LABEL_17;
  }
LABEL_8:

  v16 = v5;
LABEL_19:

  return v16;
}

- (id)parseHMAccessoryFirmwareUpdatePolicyCharacteristics:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration *v19;
  int v20;
  void *v21;
  HMDHAPMetadata *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDHAPMetadata *v26;
  NSObject *v27;
  void *v28;
  HMDHAPMetadata *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHAPMetadata *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDHAPMetadata *v38;
  NSObject *v39;
  void *v40;
  void *context;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = v3;
  v47 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v51;
    v46 = *MEMORY[0x1E0D160F8];
    v44 = *MEMORY[0x1E0D160F0];
    v43 = v4;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v48)
        objc_enumerationMutation(v5);
      v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v6);
      -[HMDHAPMetadata characteristicTypeFromName:](self, "characteristicTypeFromName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      objc_msgSend(v5, "hmf_dictionaryForKey:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = self;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v40;
          v56 = 2112;
          v57 = v9;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed while parsing characteristic %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);

LABEL_34:
        v32 = 0;
        v4 = v43;
        goto LABEL_35;
      }
      v11 = v10;
      v12 = v5;
      objc_msgSend(v10, "hmf_arrayForKey:", v46);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "count"))
      {
        objc_msgSend(v11, "hmf_numberForKey:", v44);
        v15 = objc_claimAutoreleasedReturnValue();
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hapCharacteristicFromType:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "format");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = (void *)v15;
        if (v18)
        {
          v19 = -[HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration initWithType:format:values:settlingTime:]([HMDAccessoryFirmwareUpdatePolicyCharacteristicConfiguration alloc], "initWithType:format:values:settlingTime:", v9, v18, v14, v15);
          if (v19)
          {
            objc_msgSend(v43, "addObject:", v19);
            v20 = 0;
          }
          else
          {
            context = (void *)MEMORY[0x1D17BA0A0]();
            v29 = self;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v31;
              v56 = 2112;
              v57 = v9;
              _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Characteristic configuration failed for characteristic %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            v20 = 1;
          }

        }
        else
        {
          v25 = (void *)MEMORY[0x1D17BA0A0]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v28;
            v56 = 2112;
            v57 = v9;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Format not found for characteristic %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          v20 = 1;
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v24;
          v56 = 2112;
          v57 = v9;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Values not available for characteristic %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v20 = 1;
      }

      v5 = v12;
      if (v20)
        goto LABEL_34;
      if (v47 == ++v6)
      {
        v4 = v43;
        v47 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v47)
          goto LABEL_3;
        goto LABEL_27;
      }
    }
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      v56 = 2112;
      v57 = v7;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Type not found for characteristic name %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    goto LABEL_34;
  }
LABEL_27:

  v32 = (void *)objc_msgSend(v4, "copy");
LABEL_35:

  return v32;
}

- (id)parseServiceArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serviceTypeFromUTI:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            v25 = 2112;
            v26 = v11;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@ServiceName %@ is not a standard HAP serviceName", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);

          v14 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v5, "copy");
LABEL_13:

  return v14;
}

- (id)parseCharacteristicArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "characteristicTypeFromUTI:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            v25 = 2112;
            v26 = v11;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@characteristicName %@ is not a standard HAP characteristicName", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);

          v14 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v5, "copy");
LABEL_13:

  return v14;
}

- (BOOL)parseAndSetAssistantServices:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        v11 = v4;
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "serviceTypeFromUTI:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v19 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          v4 = v11;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v29 = v21;
            v30 = 2112;
            v31 = v12;
            v32 = 2112;
            v33 = v13;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Assistant service %@ not mappable - no such HAP service %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v19);

          v18 = 0;
          v17 = v6;
          goto LABEL_13;
        }
        v4 = v11;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v12);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v8)
        continue;
      break;
    }
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  -[HMDHAPMetadata setAssistantServiceNameHAPTypeMap:](self, "setAssistantServiceNameHAPTypeMap:", v16);

  v17 = (void *)objc_msgSend(v5, "copy");
  -[HMDHAPMetadata setAssistantServiceHAPTypeNameMap:](self, "setAssistantServiceHAPTypeNameMap:", v17);
  v18 = 1;
LABEL_13:

  return v18;
}

- (BOOL)parseAndSetAssistantCharacteristics:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  char v24;
  void *v25;
  HMDHAPMetadataAssistantCharacteristic *v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v5 = v3;
  v56 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v56)
  {
    v54 = *(_QWORD *)v60;
    v53 = *MEMORY[0x1E0D16720];
    v51 = *MEMORY[0x1E0D16718];
    v50 = *MEMORY[0x1E0D16778];
    v52 = *MEMORY[0x1E0D166D8];
    v48 = *MEMORY[0x1E0D16740];
    v47 = *MEMORY[0x1E0D16758];
    v46 = *MEMORY[0x1E0D16708];
    *(_QWORD *)&v6 = 138543618;
    v45 = v6;
    v57 = v4;
    v55 = v5;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v54)
        objc_enumerationMutation(v5);
      v8 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v7);
      objc_msgSend(v5, "hmf_dictionaryForKey:", v8, v45);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmf_stringForKey:", v53);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
        v13 = v12;
      }
      else
      {
        objc_msgSend(v9, "hmf_stringForKey:", v51);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmf_stringForKey:", v50);
        v14 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v14;
        if (!v12)
        {
          v17 = 1;
          if (!v14)
            goto LABEL_16;
LABEL_15:
          -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isStandardHAPCharacteristicName:", v13);

          if ((v24 & 1) != 0)
          {
LABEL_16:
            objc_msgSend(v9, "hmf_stringForKey:", v52);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = -[HMDHAPMetadataAssistantCharacteristic initWithName:readHAPCharacteristic:writeHAPCharacteristic:format:]([HMDHAPMetadataAssistantCharacteristic alloc], "initWithName:readHAPCharacteristic:writeHAPCharacteristic:format:", v8, v12, v13, v25);
              buf[0] = 0;
              v27 = objc_msgSend(v9, "hmf_BOOLForKey:isPresent:", v48, buf);
              if (buf[0])
                v28 = v27;
              else
                v28 = 0;
              -[HMDHAPMetadataAssistantCharacteristic setSupportsLocalization:](v26, "setSupportsLocalization:", v28);
              objc_msgSend(v9, "hmf_dictionaryForKey:", v47);
              v29 = v17;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDHAPMetadataAssistantCharacteristic setValues:](v26, "setValues:", v30);

              objc_msgSend(v9, "hmf_dictionaryForKey:", v46);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDHAPMetadataAssistantCharacteristic setOutValues:](v26, "setOutValues:", v31);

              objc_msgSend(v49, "setObject:forKeyedSubscript:", v26, v8);
              if ((v29 & 1) == 0)
              {
                -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "characteristicTypeFromUTI:", v12);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setObject:forKey:", v8, v33);

              }
              if (v13)
              {
                -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "characteristicTypeFromUTI:", v13);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setObject:forKey:", v8, v35);

              }
              v36 = 0;
            }
            else
            {
              v37 = (void *)MEMORY[0x1D17BA0A0]();
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v45;
                v64 = v39;
                v65 = 2112;
                v66 = v8;
                _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Assistant characteristic %@ format not specified unknown", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v37);
              v36 = 1;
            }

            goto LABEL_33;
          }
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v64 = v20;
            v65 = 2112;
            v66 = v8;
            v67 = 2112;
            v68 = v13;
            v21 = v19;
            v22 = "%{public}@Assistant characteristic %@ writeHAP characteristic %@ unknown";
            goto LABEL_27;
          }
          goto LABEL_28;
        }
      }
      -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isStandardHAPCharacteristicName:", v12);

      if ((v16 & 1) != 0)
      {
        v17 = 0;
        if (!v13)
          goto LABEL_16;
        goto LABEL_15;
      }
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v64 = v20;
        v65 = 2112;
        v66 = v8;
        v67 = 2112;
        v68 = v12;
        v21 = v19;
        v22 = "%{public}@Assistant characteristic %@ readHAP characteristic %@ unknown";
LABEL_27:
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x20u);

      }
LABEL_28:

      objc_autoreleasePoolPop(v18);
      v36 = 1;
LABEL_33:
      v4 = v57;
      v5 = v55;

      if (v36)
      {
        v43 = 0;
        v42 = v55;
        v40 = v49;
        goto LABEL_38;
      }
      if (v56 == ++v7)
      {
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v56)
          goto LABEL_3;
        break;
      }
    }
  }

  v40 = v49;
  v41 = (void *)objc_msgSend(v49, "copy");
  -[HMDHAPMetadata setAssistantCharacteristics:](self, "setAssistantCharacteristics:", v41);

  v42 = (void *)objc_msgSend(v4, "copy");
  -[HMDHAPMetadata setAssistantChrHAPTypeNameMap:](self, "setAssistantChrHAPTypeNameMap:", v42);
  v43 = 1;
LABEL_38:

  return v43;
}

- (BOOL)parseAndSetAssistantUnits:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHAPMetadata hapMetadata](self, "hapMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isStandardHAPUnitName:", v12);

        if ((v14 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = v19;
            v27 = 2112;
            v28 = v11;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Assistant unit %@ unknown", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);

          v16 = 0;
          v15 = v6;
          goto LABEL_13;
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v8)
        continue;
      break;
    }
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  -[HMDHAPMetadata setAssistantUnits:](self, "setAssistantUnits:", v15);
  v16 = 1;
LABEL_13:

  return v16;
}

- (id)aliasedHAPCharacteristicTypes
{
  if (aliasedHAPCharacteristicTypes_onceToken != -1)
    dispatch_once(&aliasedHAPCharacteristicTypes_onceToken, &__block_literal_global_223);
  return (id)aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping;
}

- (id)aliasedHAPServiceTypes
{
  if (aliasedHAPServiceTypes_onceToken != -1)
    dispatch_once(&aliasedHAPServiceTypes_onceToken, &__block_literal_global_224);
  return (id)aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping;
}

- (id)disallowedAssistantCharacteristicTypesByServiceType
{
  if (disallowedAssistantCharacteristicTypesByServiceType_onceToken != -1)
    dispatch_once(&disallowedAssistantCharacteristicTypesByServiceType_onceToken, &__block_literal_global_225);
  return (id)disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType;
}

- (id)statusHAPCharacteristicTypesForServiceType
{
  if (statusHAPCharacteristicTypesForServiceType_onceToken != -1)
    dispatch_once(&statusHAPCharacteristicTypesForServiceType_onceToken, &__block_literal_global_226);
  return (id)statusHAPCharacteristicTypeMappingForServiceType;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
}

- (BOOL)incomplete
{
  return self->_incomplete;
}

- (void)setIncomplete:(BOOL)a3
{
  self->_incomplete = a3;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (void)setHapMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_hapMetadata, a3);
}

- (void)setHmRequiresDeviceUnlockTuples:(id)a3
{
  objc_storeStrong((id *)&self->_hmRequiresDeviceUnlockTuples, a3);
}

- (NSDictionary)hmAllowableSecuringWrites
{
  return self->_hmAllowableSecuringWrites;
}

- (void)setHmAllowableSecuringWrites:(id)a3
{
  objc_storeStrong((id *)&self->_hmAllowableSecuringWrites, a3);
}

- (NSDictionary)hmWakeOnOperationsFilter
{
  return self->_hmWakeOnOperationsFilter;
}

- (void)setHmWakeOnOperationsFilter:(id)a3
{
  objc_storeStrong((id *)&self->_hmWakeOnOperationsFilter, a3);
}

- (void)setHmAccessoryCategories:(id)a3
{
  objc_storeStrong((id *)&self->_hmAccessoryCategories, a3);
}

- (void)setHmBlacklistedServices:(id)a3
{
  objc_storeStrong((id *)&self->_hmBlacklistedServices, a3);
}

- (void)setHmBlacklistedCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristics, a3);
}

- (void)setHmBlacklistedServicesFromApp:(id)a3
{
  objc_storeStrong((id *)&self->_hmBlacklistedServicesFromApp, a3);
}

- (void)setHmBlacklistedCharacteristicsFromApp:(id)a3
{
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristicsFromApp, a3);
}

- (void)setHmNotificationAutoEnabledTuples:(id)a3
{
  objc_storeStrong((id *)&self->_hmNotificationAutoEnabledTuples, a3);
}

- (NSSet)hmBulletinBoardEnabledTuples
{
  return self->_hmBulletinBoardEnabledTuples;
}

- (void)setHmBulletinBoardEnabledTuples:(id)a3
{
  objc_storeStrong((id *)&self->_hmBulletinBoardEnabledTuples, a3);
}

- (NSSet)hmCoalesceNotificationsTuples
{
  return self->_hmCoalesceNotificationsTuples;
}

- (void)setHmCoalesceNotificationsTuples:(id)a3
{
  objc_storeStrong((id *)&self->_hmCoalesceNotificationsTuples, a3);
}

- (NSDictionary)assistantServiceNameHAPTypeMap
{
  return self->_assistantServiceNameHAPTypeMap;
}

- (void)setAssistantServiceNameHAPTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_assistantServiceNameHAPTypeMap, a3);
}

- (NSDictionary)assistantServiceHAPTypeNameMap
{
  return self->_assistantServiceHAPTypeNameMap;
}

- (void)setAssistantServiceHAPTypeNameMap:(id)a3
{
  objc_storeStrong((id *)&self->_assistantServiceHAPTypeNameMap, a3);
}

- (NSDictionary)assistantCharacteristics
{
  return self->_assistantCharacteristics;
}

- (void)setAssistantCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_assistantCharacteristics, a3);
}

- (NSDictionary)assistantChrHAPTypeNameMap
{
  return self->_assistantChrHAPTypeNameMap;
}

- (void)setAssistantChrHAPTypeNameMap:(id)a3
{
  objc_storeStrong((id *)&self->_assistantChrHAPTypeNameMap, a3);
}

- (NSDictionary)assistantUnits
{
  return self->_assistantUnits;
}

- (void)setAssistantUnits:(id)a3
{
  objc_storeStrong((id *)&self->_assistantUnits, a3);
}

- (NSDictionary)firmwareUpdateStagingPolicies
{
  return self->_firmwareUpdateStagingPolicies;
}

- (void)setFirmwareUpdateStagingPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateStagingPolicies, a3);
}

- (NSDictionary)firmwareUpdateAutoApplyPolicies
{
  return self->_firmwareUpdateAutoApplyPolicies;
}

- (void)setFirmwareUpdateAutoApplyPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateAutoApplyPolicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateAutoApplyPolicies, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateStagingPolicies, 0);
  objc_storeStrong((id *)&self->_assistantUnits, 0);
  objc_storeStrong((id *)&self->_assistantChrHAPTypeNameMap, 0);
  objc_storeStrong((id *)&self->_assistantCharacteristics, 0);
  objc_storeStrong((id *)&self->_assistantServiceHAPTypeNameMap, 0);
  objc_storeStrong((id *)&self->_assistantServiceNameHAPTypeMap, 0);
  objc_storeStrong((id *)&self->_hmCoalesceNotificationsTuples, 0);
  objc_storeStrong((id *)&self->_hmBulletinBoardEnabledTuples, 0);
  objc_storeStrong((id *)&self->_hmNotificationAutoEnabledTuples, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristicsFromApp, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedServicesFromApp, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedCharacteristics, 0);
  objc_storeStrong((id *)&self->_hmBlacklistedServices, 0);
  objc_storeStrong((id *)&self->_hmAccessoryCategories, 0);
  objc_storeStrong((id *)&self->_hmWakeOnOperationsFilter, 0);
  objc_storeStrong((id *)&self->_hmAllowableSecuringWrites, 0);
  objc_storeStrong((id *)&self->_hmRequiresDeviceUnlockTuples, 0);
  objc_storeStrong((id *)&self->_hapMetadata, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __60__HMDHAPMetadata_statusHAPCharacteristicTypesForServiceType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  uint64_t v25;
  void *v26;
  _QWORD v27[3];
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[5];
  _QWORD v39[7];

  v39[5] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0D16228];
  v36[0] = *MEMORY[0x1E0D15ED0];
  v35 = *MEMORY[0x1E0D15ED8];
  v0 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v36[1] = *MEMORY[0x1E0D15FB8];
  v34 = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v19;
  v36[2] = *MEMORY[0x1E0D15FC0];
  v33 = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v17;
  v38[1] = *MEMORY[0x1E0D161E8];
  v31 = *MEMORY[0x1E0D15F40];
  v1 = v31;
  v3 = *MEMORY[0x1E0D15F60];
  v30[0] = *MEMORY[0x1E0D15EF8];
  v2 = v30[0];
  v30[1] = v3;
  v4 = *MEMORY[0x1E0D15EC8];
  v30[2] = *MEMORY[0x1E0D15F08];
  v30[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v5;
  v38[2] = *MEMORY[0x1E0D16288];
  v28 = v1;
  v27[0] = v2;
  v27[1] = v3;
  v27[2] = *MEMORY[0x1E0D15F10];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v7;
  v38[3] = *MEMORY[0x1E0D16298];
  v25 = *MEMORY[0x1E0D15F70];
  v8 = v25;
  v9 = *MEMORY[0x1E0D15FE0];
  v24[0] = v4;
  v24[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v11;
  v38[4] = *MEMORY[0x1E0D161F8];
  v22 = v8;
  v21[0] = v4;
  v21[1] = v9;
  v21[2] = *MEMORY[0x1E0D15FD8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)statusHAPCharacteristicTypeMappingForServiceType;
  statusHAPCharacteristicTypeMappingForServiceType = v14;

}

void __69__HMDHAPMetadata_disallowedAssistantCharacteristicTypesByServiceType__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CB99D8];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8790];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType;
  disallowedAssistantCharacteristicTypesByServiceType_disallowedAssistantCharacteristicTypesByServiceType = v3;

}

void __40__HMDHAPMetadata_aliasedHAPServiceTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D162A0];
  v3[0] = *MEMORY[0x1E0D161D0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping;
  aliasedHAPServiceTypes__aliasedHAPServiceTypeMapping = v0;

}

void __47__HMDHAPMetadata_aliasedHAPCharacteristicTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D15FB0];
  v1 = *MEMORY[0x1E0D15F18];
  v9[0] = *MEMORY[0x1E0D15EC8];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0D15F48];
  v10[0] = v0;
  v10[1] = v2;
  v3 = *MEMORY[0x1E0D16078];
  v9[2] = *MEMORY[0x1E0D15F50];
  v9[3] = v3;
  v4 = *MEMORY[0x1E0D16070];
  v10[2] = v2;
  v10[3] = v4;
  v5 = *MEMORY[0x1E0D15FC0];
  v9[4] = *MEMORY[0x1E0D16040];
  v9[5] = v5;
  v6 = *MEMORY[0x1E0D15ED0];
  v10[4] = v4;
  v10[5] = v6;
  v9[6] = *MEMORY[0x1E0D15FB8];
  v10[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping;
  aliasedHAPCharacteristicTypes__aliasedHAPCharacteristicTypeMapping = v7;

}

void __63__HMDHAPMetadata_policyConfigurationAvailableForAllHAPServices__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "firmwareUpdateStagingPolicies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    goto LABEL_6;
  }
  v11 = (void *)v10;
  objc_msgSend(*(id *)(a1 + 32), "firmwareUpdateAutoApplyPolicies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_5;
LABEL_6:

}

void __69__HMDHAPMetadata_mapToAssistantServiceSubtypeName_accessoryCategory___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[8];
  _QWORD v34[10];

  v34[8] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0CB7A10];
  v31 = *MEMORY[0x1E0CB9A10];
  v0 = v31;
  v32 = *MEMORY[0x1E0D88B50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v1;
  v33[1] = *MEMORY[0x1E0CB79E8];
  v2 = *MEMORY[0x1E0D88B48];
  v3 = *MEMORY[0x1E0CB9B00];
  v28[0] = v0;
  v28[1] = v3;
  v4 = *MEMORY[0x1E0D88B60];
  v30[0] = v2;
  v30[1] = v4;
  v29 = *MEMORY[0x1E0CB9A30];
  v5 = v29;
  v30[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v28, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v6;
  v33[2] = *MEMORY[0x1E0CB7A00];
  v26 = v0;
  v27 = *MEMORY[0x1E0D88B90];
  v7 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v8;
  v33[3] = *MEMORY[0x1E0CB79F0];
  v24 = v0;
  v25 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v9;
  v33[4] = *MEMORY[0x1E0CB7A40];
  v22 = v0;
  v23 = *MEMORY[0x1E0D88B58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v10;
  v33[5] = *MEMORY[0x1E0CB7AE8];
  v20[0] = v3;
  v20[1] = v5;
  v21[0] = v4;
  v21[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v11;
  v33[6] = *MEMORY[0x1E0CB79F8];
  v18[0] = v3;
  v18[1] = v5;
  v19[0] = v4;
  v19[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v12;
  v33[7] = *MEMORY[0x1E0CB7A48];
  v16 = v5;
  v17 = *MEMORY[0x1E0D88BC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap;
  mapToAssistantServiceSubtypeName_accessoryCategory__accessoryCategoryMap = v14;

}

void __51__HMDHAPMetadata_mapToAssistantServiceSubtypeName___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[10];
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D88B78];
  v1 = *MEMORY[0x1E0CB9978];
  v16[0] = *MEMORY[0x1E0CB9970];
  v16[1] = v1;
  v2 = *MEMORY[0x1E0D88B98];
  v17[0] = v0;
  v17[1] = v2;
  v3 = *MEMORY[0x1E0D88BA8];
  v4 = *MEMORY[0x1E0CB9990];
  v16[2] = *MEMORY[0x1E0CB9980];
  v16[3] = v4;
  v5 = *MEMORY[0x1E0D88BB8];
  v17[2] = v3;
  v17[3] = v5;
  v6 = *MEMORY[0x1E0D88BB0];
  v7 = *MEMORY[0x1E0D16200];
  v16[4] = *MEMORY[0x1E0D161D0];
  v16[5] = v7;
  v8 = *MEMORY[0x1E0D88BA0];
  v17[4] = v6;
  v17[5] = v8;
  v9 = *MEMORY[0x1E0D88B68];
  v10 = *MEMORY[0x1E0CB9A28];
  v16[6] = *MEMORY[0x1E0CB9A00];
  v16[7] = v10;
  v11 = *MEMORY[0x1E0D88B70];
  v17[6] = v9;
  v17[7] = v11;
  v12 = *MEMORY[0x1E0CB9B30];
  v16[8] = *MEMORY[0x1E0CB9B28];
  v16[9] = v12;
  v13 = *MEMORY[0x1E0D88BD0];
  v17[8] = *MEMORY[0x1E0D88BC8];
  v17[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 10);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap;
  mapToAssistantServiceSubtypeName__assistantServiceSubtypeNameMap = v14;

}

void __56__HMDHAPMetadata_serviceSubtypeForValue_forServiceType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[4];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D16298];
  v0 = *MEMORY[0x1E0CB9970];
  v6[0] = &unk_1E8B32A18;
  v6[1] = &unk_1E8B32A30;
  v1 = *MEMORY[0x1E0CB9978];
  v7[0] = v0;
  v7[1] = v1;
  v6[2] = &unk_1E8B32A48;
  v6[3] = &unk_1E8B32A60;
  v2 = *MEMORY[0x1E0CB9990];
  v7[2] = *MEMORY[0x1E0CB9980];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)serviceSubtypeForValue_forServiceType__subServiceTypeMap;
  serviceSubtypeForValue_forServiceType__subServiceTypeMap = v4;

}

void __74__HMDHAPMetadata_shouldRefreshValueForCharacteristicWithType_serviceType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("00000228-0000-1000-8000-0026BB765291");
  v0 = *MEMORY[0x1E0CB8B38];
  v11[0] = *MEMORY[0x1E0CB8870];
  v11[1] = v0;
  v1 = *MEMORY[0x1E0CB8818];
  v11[2] = *MEMORY[0x1E0CB8960];
  v11[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("00000253-0000-1000-8000-0026BB765291");
  v3 = *MEMORY[0x1E0CB8798];
  v10[0] = CFSTR("00000254-0000-1000-8000-0026BB765291");
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("0000026A-0000-1000-8000-0026BB765291");
  v5 = *MEMORY[0x1E0CB8968];
  v9[0] = *MEMORY[0x1E0CB88F8];
  v9[1] = v5;
  v9[2] = *MEMORY[0x1E0CB8790];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping;
  shouldRefreshValueForCharacteristicWithType_serviceType__refreshCharacteristicMapping = v7;

}

void __83__HMDHAPMetadata_shouldFilterEnableNotificationsForCharacteristicType_serviceType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9AE8];
  v10[0] = *MEMORY[0x1E0CB9AE0];
  v10[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications;
  shouldFilterEnableNotificationsForCharacteristicType_serviceType__servicesToFilterEnableNotifications = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v9 = *MEMORY[0x1E0CB87C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications;
  shouldFilterEnableNotificationsForCharacteristicType_serviceType__characteristicsToFilterEnableNotifications = v7;

}

void __83__HMDHAPMetadata_shouldFilterChangeNotificationsForCharacteristicType_serviceType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9AE8];
  v10[0] = *MEMORY[0x1E0CB9AE0];
  v10[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications;
  shouldFilterChangeNotificationsForCharacteristicType_serviceType__servicesToFilterChangeNotifications = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v9 = *MEMORY[0x1E0CB87C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications;
  shouldFilterChangeNotificationsForCharacteristicType_serviceType__characteristicsToFilterChangeNotifications = v7;

}

void __54__HMDHAPMetadata_shouldHomeAppShowTileForServiceType___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[30];

  v18[29] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D16280];
  v18[0] = *MEMORY[0x1E0D16200];
  v18[1] = v1;
  v2 = *MEMORY[0x1E0D161E0];
  v18[2] = *MEMORY[0x1E0D16288];
  v18[3] = v2;
  v3 = *MEMORY[0x1E0D162A0];
  v18[4] = *MEMORY[0x1E0D161D0];
  v18[5] = v3;
  v4 = *MEMORY[0x1E0D16208];
  v18[6] = *MEMORY[0x1E0D16210];
  v18[7] = v4;
  v5 = *MEMORY[0x1E0D162A8];
  v18[8] = *MEMORY[0x1E0D161C0];
  v18[9] = v5;
  v6 = *MEMORY[0x1E0D16220];
  v18[10] = *MEMORY[0x1E0D162B0];
  v18[11] = v6;
  v7 = *MEMORY[0x1E0D16270];
  v18[12] = *MEMORY[0x1E0D16228];
  v18[13] = v7;
  v8 = *MEMORY[0x1E0D16238];
  v18[14] = *MEMORY[0x1E0D16230];
  v18[15] = v8;
  v9 = *MEMORY[0x1E0D16250];
  v18[16] = *MEMORY[0x1E0D16240];
  v18[17] = v9;
  v10 = *MEMORY[0x1E0D16268];
  v18[18] = *MEMORY[0x1E0D16260];
  v18[19] = v10;
  v11 = *MEMORY[0x1E0D16258];
  v18[20] = *MEMORY[0x1E0D16248];
  v18[21] = v11;
  v12 = *MEMORY[0x1E0D161B0];
  v18[22] = *MEMORY[0x1E0D16278];
  v18[23] = v12;
  v13 = *MEMORY[0x1E0D161F0];
  v18[24] = *MEMORY[0x1E0D161E8];
  v18[25] = v13;
  v14 = *MEMORY[0x1E0D16298];
  v18[26] = *MEMORY[0x1E0D161F8];
  v18[27] = v14;
  v18[28] = *MEMORY[0x1E0D161D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp;
  shouldHomeAppShowTileForServiceType__servicesShowTilesInHomeApp = v16;

}

void __80__HMDHAPMetadata_shouldEnableHomeNotificationForCharacteristicType_serviceType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("00000228-0000-1000-8000-0026BB765291");
  v0 = *MEMORY[0x1E0CB8B38];
  v16[0] = *MEMORY[0x1E0CB8870];
  v16[1] = v0;
  v16[2] = *MEMORY[0x1E0CB8960];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v1;
  v17[1] = CFSTR("00000253-0000-1000-8000-0026BB765291");
  v2 = *MEMORY[0x1E0CB8798];
  v15[0] = CFSTR("00000254-0000-1000-8000-0026BB765291");
  v15[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  v17[2] = CFSTR("0000026A-0000-1000-8000-0026BB765291");
  v4 = *MEMORY[0x1E0CB8790];
  v14[0] = *MEMORY[0x1E0CB8968];
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__homedInternalHomeNotifications = v6;

  v13 = *MEMORY[0x1E0D16198];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__serviceTypesNotAllowingHomeNotifications = v8;

  v12 = *MEMORY[0x1E0D15F98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications;
  shouldEnableHomeNotificationForCharacteristicType_serviceType__characteristicTypesNotAllowingHomeNotifications = v10;

}

void __74__HMDHAPMetadata_shouldAutoEnableNotificationForCharacteristic_ofService___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB99B8];
  v3 = *MEMORY[0x1E0CB8A60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications;
  shouldAutoEnableNotificationForCharacteristic_ofService__autoEnableNotifications = v1;

}

void __57__HMDHAPMetadata_isSecondsDownCounterCharacteristicType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0D15FE0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes;
  isSecondsDownCounterCharacteristicType__secondsDownCounterCharacteristicTypes = v2;

}

void __87__HMDHAPMetadata_generateNotificationOnConfigurationForCharacteristicType_serviceType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB8790];
  v3 = *MEMORY[0x1E0CB9AF0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping;
  generateNotificationOnConfigurationForCharacteristicType_serviceType__generateNotificationMapping = v1;

}

void __53__HMDHAPMetadata_shouldNotCacheCharacteristicOfType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0D15F78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes;
  shouldNotCacheCharacteristicOfType__noCacheCharacteristicTypes = v2;

}

void __51__HMDHAPMetadata_shouldFilterCharacteristicOfType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0D16080];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldFilterCharacteristicOfType___allowedCharacteristics;
  shouldFilterCharacteristicOfType___allowedCharacteristics = v2;

}

void __44__HMDHAPMetadata_shouldFilterServiceOfType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0D16290];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldFilterServiceOfType___allowedServices;
  shouldFilterServiceOfType___allowedServices = v2;

}

void __41__HMDHAPMetadata_isTargetCharacteristic___block_invoke()
{
  void *v0;

  v0 = (void *)isTargetCharacteristic__targetCharacteristic;
  isTargetCharacteristic__targetCharacteristic = (uint64_t)&unk_1E8B31CE0;

}

void __48__HMDHAPMetadata_requiresTimedWrite_forService___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D16038];
  v4[0] = *MEMORY[0x1E0D16068];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D15EF8];
  v4[2] = *MEMORY[0x1E0D16030];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E0D15F60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)requiresTimedWrite_forService__timedWriteRequiringCharacteristic;
  requiresTimedWrite_forService__timedWriteRequiringCharacteristic = v2;

}

+ (HMDHAPMetadata)metadataWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = *MEMORY[0x1E0D16710];
    objc_msgSend(v8, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16710]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[HMDHAPMetadata metadataWithDictionary:error:](HMDHAPMetadata, "metadataWithDictionary:error:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find metadata for key: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return (HMDHAPMetadata *)v12;
}

+ (HMDHAPMetadata)metadataWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  HMDHAPMetadata *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16528]), "initWithDictionary:error:", v5, &v14);
  v7 = v14;
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  if (v6)
  {
    v9 = -[HMDHAPMetadata initWithDictionary:hapMetadata:error:]([HMDHAPMetadata alloc], "initWithDictionary:hapMetadata:error:", v5, v6, a4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse HAP metadata from %@ - error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

+ (id)getBuiltinInstance
{
  void *v3;
  void *v4;
  HMDHAPMetadata *v5;
  HMDHAPMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "metadataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("builtin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[HMDPersistentStore loadBuiltinPlainMetadataDictionary](HMDPersistentStore, "loadBuiltinPlainMetadataDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_dictionaryForKey:", *MEMORY[0x1E0D16710]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16528]), "initWithDictionary:error:", v8, &v29);
    v10 = v29;
    if (v10 || !v9)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate builtin HAP metadata %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v5 = 0;
    }
    else
    {
      v28 = 0;
      v5 = -[HMDHAPMetadata initWithDictionary:hapMetadata:error:]([HMDHAPMetadata alloc], "initWithDictionary:hapMetadata:error:", v8, v9, &v28);
      v10 = v28;
      if (!v10 && v5)
      {
        v11 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("builtin")));
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "version");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "schemaVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v13;
          v32 = 2112;
          v33 = v14;
          v34 = 2112;
          v35 = v15;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Builtin HAPMetadata version %@ schemaVersion %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          -[HMDHAPMetadata version](v5, "version");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHAPMetadata schemaVersion](v5, "schemaVersion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v18;
          v32 = 2112;
          v33 = v19;
          v34 = 2112;
          v35 = v20;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Builtin HMDHAPMetadata version %@ schemaVersion %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v5 = v5;
        v10 = 0;
        v6 = v5;
        goto LABEL_19;
      }
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate builtin metadata %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
    }
    v6 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v5 = v4;
  v6 = v5;
LABEL_20:

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  return v6;
}

+ (void)_logCurrentMetadata
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "schemaVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Switching to HMDHAPMetadata version %@ schemaVersion %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v3);

}

+ (void)updateLocalMetadataWithBuiltinMetadata
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  +[HMDPersistentStore loadBuiltinPlainMetadataDictionary](HMDPersistentStore, "loadBuiltinPlainMetadataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HMDPersistentStore archiveMetadata:](HMDPersistentStore, "archiveMetadata:", v3);

  if (v4)
  {
    os_unfair_lock_lock_with_options();
    objc_msgSend(a1, "metadataCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("builtin"));

    objc_msgSend(a1, "metadataCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("current"));

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
  objc_msgSend(a1, "_logCurrentMetadata");
}

+ (void)updateLocalMetadataWithMetadata:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[HMDPersistentStore archiveMetadata:](HMDPersistentStore, "archiveMetadata:"))
  {
    os_unfair_lock_lock_with_options();
    objc_msgSend(a1, "metadataCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("current"));

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }
  objc_msgSend(a1, "_logCurrentMetadata");

}

+ (BOOL)isServiceType:(id)a3 compatibleWithAccessoryCategoryType:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = isServiceType_compatibleWithAccessoryCategoryType__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&isServiceType_compatibleWithAccessoryCategoryType__onceToken, &__block_literal_global_139);
  objc_msgSend((id)isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "containsObject:", v7);
  return v9;
}

+ (id)legacyV3DataForIDS
{
  return +[HMDHAPMetadata dataFromMetadataDictionaryWithKey:](HMDHAPMetadata, "dataFromMetadataDictionaryWithKey:", *MEMORY[0x1E0D166F0]);
}

+ (id)legacyV3DataForCloud
{
  return +[HMDHAPMetadata dataFromMetadataDictionaryWithKey:](HMDHAPMetadata, "dataFromMetadataDictionaryWithKey:", *MEMORY[0x1E0D166E8]);
}

+ (id)dataFromMetadataDictionaryWithKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[HMDPersistentStore loadPlainMetadataDictionary](HMDPersistentStore, "loadPlainMetadataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dataForKey:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    +[HMDPersistentStore loadBuiltinPlainMetadataDictionary](HMDPersistentStore, "loadBuiltinPlainMetadataDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hmf_dataForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }

  return v6;
}

+ (BOOL)isOwnerPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = (objc_msgSend(v5, "isEqualToString:", CFSTR("00000264-0000-1000-8000-0026BB765291")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("00000262-0000-1000-8000-0026BB765291")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB99D8])
    && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB89D8]);

  return v7;
}

+ (BOOL)isAdminPrivilegeRequiredForWritingCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v4;
  char v5;

  v4 = a4;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB99C8]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB99D8]);

  return v5;
}

+ (void)prepareMetadata
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16528], "setCurrentMetadataHook:", &__block_literal_global_148);
  +[HMDHAPMetadata getBuiltinInstance](HMDHAPMetadata, "getBuiltinInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 - 881 <= 2)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v8;
      v51 = 2048;
      v52 = v5;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Invalid builtin metadata version %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  +[HMDPersistentStore loadPlainMetadataDictionary](HMDPersistentStore, "loadPlainMetadataDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D16760];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D16760]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_20;
  v14 = (void *)v13;
  v15 = *MEMORY[0x1E0D16730];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D16730]);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_19;
  v17 = (void *)v16;
  v47 = v12;
  v48 = a1;
  v18 = *MEMORY[0x1E0D16710];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D16710]);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_18:

    a1 = v48;
LABEL_19:

    goto LABEL_20;
  }
  v20 = (void *)v19;
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "unsignedIntegerValue") <= v5)
  {

    goto LABEL_18;
  }
  v46 = v18;
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  a1 = v48;
  if (v23 == 1)
  {
    v24 = v46;
    if (isInternalBuild() && v5 == 880 && (unint64_t)(v47 - 881) <= 1)
    {
      +[HMDPersistentStore loadBuiltinPlainMetadataDictionary](HMDPersistentStore, "loadBuiltinPlainMetadataDictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      _shouldUploadToCloudAfterHomedReady = 1;
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");
        objc_msgSend(v26, "objectForKeyedSubscript:", v46);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedIntegerValue");
        *(_DWORD *)buf = 138544130;
        v50 = v29;
        v51 = 2048;
        v52 = v31;
        v53 = 2048;
        v54 = v34;
        v55 = 2048;
        v56 = v47;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Metadata fix - Constructing version 883 metadata from current builtin version %lu, current builtin plist version %lu, archived version %lu", buf, 0x2Au);

        v24 = v46;
        a1 = v48;
      }

      objc_autoreleasePoolPop(v27);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1E8B329D0, v10);
      objc_msgSend(v26, "objectForKeyedSubscript:", v24);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E8B329D0, v10);

      objc_msgSend(a1, "updateLocalMetadataWithMetadata:", v26);
    }
    objc_msgSend(a1, "_logCurrentMetadata");
    goto LABEL_27;
  }
LABEL_20:
  v36 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v38;
    _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Cached metadata is not newer than the built-in one, prefer built-in metadata.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "unsignedIntegerValue");
  objc_msgSend(0, "version");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedIntegerValue");

  if (v40 < v42)
  {
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v45;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Built-in metadata is newer than the cached one, uploading to the cloud when homed is ready with at least one home or the first home being added.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    _shouldUploadToCloudAfterHomedReady = 1;
  }
  objc_msgSend(a1, "updateLocalMetadataWithBuiltinMetadata");
LABEL_27:

}

+ (BOOL)shouldUploadToCloudAfterHomedReady
{
  return _shouldUploadToCloudAfterHomedReady;
}

+ (void)resetShouldUploadToCloudAfterHomedReady
{
  _shouldUploadToCloudAfterHomedReady = 0;
}

+ (BOOL)isHomedVersionSupported:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v3 = (objc_class *)MEMORY[0x1E0D286E0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithVersionString:", v6);
  if (isHomedVersionSupported__onceToken != -1)
    dispatch_once(&isHomedVersionSupported__onceToken, &__block_literal_global_151);
  v8 = objc_msgSend(v7, "isAtLeastVersion:", isHomedVersionSupported__requiredVersion);

  return v8;
}

void __42__HMDHAPMetadata_isHomedVersionSupported___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("4.0"));
  v1 = (void *)isHomedVersionSupported__requiredVersion;
  isHomedVersionSupported__requiredVersion = v0;

}

void __68__HMDHAPMetadata_isServiceType_compatibleWithAccessoryCategoryType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[25];
  _QWORD v33[27];

  v33[25] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0CB7A90];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AA8], 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = *MEMORY[0x1E0CB7A30];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A00], 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v30;
  v32[2] = *MEMORY[0x1E0CB7A38];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A80], 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v29;
  v32[3] = *MEMORY[0x1E0CB7A40];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A10], *MEMORY[0x1E0CB9B10], 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v28;
  v32[4] = *MEMORY[0x1E0CB7A50];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A28], 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v27;
  v32[5] = *MEMORY[0x1E0CB7A60];
  v0 = *MEMORY[0x1E0CB99D0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB99D0], 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v26;
  v32[6] = *MEMORY[0x1E0CB7AF0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v25;
  v32[7] = *MEMORY[0x1E0CB7A68];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A70], 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v24;
  v32[8] = *MEMORY[0x1E0CB7A78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AA0], 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v23;
  v32[9] = *MEMORY[0x1E0CB7A80];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AD0], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v22;
  v32[10] = *MEMORY[0x1E0CB7A98];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AB8], *MEMORY[0x1E0CB9AF8], *MEMORY[0x1E0CB99B0], *MEMORY[0x1E0CB99E0], *MEMORY[0x1E0CB99E8], *MEMORY[0x1E0CB99F0], *MEMORY[0x1E0CB9A40], *MEMORY[0x1E0CB9A60], *MEMORY[0x1E0CB9A68], *MEMORY[0x1E0CB9A90], *MEMORY[0x1E0CB9A98], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v21;
  v32[11] = *MEMORY[0x1E0CB7AB8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AD8], 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v20;
  v32[12] = *MEMORY[0x1E0CB7AE8];
  v1 = *MEMORY[0x1E0CB9B00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9B00], 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v19;
  v32[13] = *MEMORY[0x1E0CB7B00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9B28], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[13] = v18;
  v32[14] = *MEMORY[0x1E0CB7B08];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9B30], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[14] = v17;
  v32[15] = *MEMORY[0x1E0CB7A10];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB99A8], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[15] = v16;
  v32[16] = *MEMORY[0x1E0CB79F8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v33[16] = v2;
  v32[17] = *MEMORY[0x1E0CB7A00];
  v3 = *MEMORY[0x1E0CB9A38];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A38], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[17] = v4;
  v32[18] = *MEMORY[0x1E0CB79F0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[18] = v5;
  v32[19] = *MEMORY[0x1E0CB7AB0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A50], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[19] = v6;
  v32[20] = *MEMORY[0x1E0CB7A48];
  v7 = *MEMORY[0x1E0CB9A18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A18], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[20] = v8;
  v32[21] = *MEMORY[0x1E0CB7AA0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[21] = v9;
  v32[22] = *MEMORY[0x1E0CB7AC8];
  v10 = *MEMORY[0x1E0CB9AF0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AF0], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[22] = v11;
  v32[23] = *MEMORY[0x1E0CB7AD8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[23] = v12;
  v32[24] = *MEMORY[0x1E0CB7AE0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[24] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 25);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap;
  isServiceType_compatibleWithAccessoryCategoryType__accessoryCategoryToServiceTypesMap = v14;

}

void __31__HMDHAPMetadata_metadataCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)metadataCache_cache;
  metadataCache_cache = v0;

}

@end
