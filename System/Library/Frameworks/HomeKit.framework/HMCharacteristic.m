@implementation HMCharacteristic

- (HMCharacteristicMetadata)metadata
{
  return self->_metadata;
}

- (NSArray)properties
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_properties;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMService)service
{
  return (HMService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setNotificationEnabledTime:(id)a3
{
  NSDate *v4;
  NSDate *notificationEnabledTime;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  notificationEnabledTime = self->_notificationEnabledTime;
  self->_notificationEnabledTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCharacteristic uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMCharacteristic *v4;
  HMCharacteristic *v5;
  HMCharacteristic *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMCharacteristic *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMCharacteristic uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristic uniqueIdentifier](v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUUID **p_uniqueIdentifier;
  NSUUID *v11;
  NSUUID *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v5 = (void *)MEMORY[0x1E0CB3A28];
    -[HMCharacteristic serviceUniqueIdentifier](self, "serviceUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_instanceID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:withSalts:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = self->_uniqueIdentifier;
    p_uniqueIdentifier = &self->_uniqueIdentifier;
    *p_uniqueIdentifier = (NSUUID *)v9;

    uniqueIdentifier = *p_uniqueIdentifier;
  }
  v12 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void)_updateValue:(id)a3 valueUpdatedDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCharacteristic *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic value](v9, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic value from %@ -> %@ with value updated date: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMCharacteristic setValue:](v9, "setValue:", v6);
  if (v7)
  {
    -[HMCharacteristic setValueUpdatedTime:](v9, "setValueUpdatedTime:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic setValueUpdatedTime:](v9, "setValueUpdatedTime:", v13);

  }
}

- (id)value
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setValueUpdatedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setValue:(id)a3
{
  void *v4;
  id value;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (void *)objc_msgSend(v6, "copy");
  value = self->_value;
  self->_value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)valueUpdatedTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1)
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_987);
  return (id)logCategory__hmf_once_v22;
}

+ (id)localizedDescriptionForCharacteristicType:(id)a3
{
  return +[HMCharacteristic __localizedDescriptionForCharacteristicType:](HMCharacteristic, "__localizedDescriptionForCharacteristicType:", a3);
}

- (BOOL)requiresDeviceUnlock
{
  HMCharacteristic *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_requiresDeviceUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMCharacteristic)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  HMCharacteristic *v14;
  void *v15;
  HMCharacteristic *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("characteristicType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from instanceID: %@, characteristicType: %@, service: %@", (uint8_t *)&v23, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMCharacteristic initWithInstanceID:characteristicType:service:metadata:](self, "initWithInstanceID:characteristicType:service:metadata:", v5, v6, v8, v15);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("characteristicValue")))
    {
      allowedCharValueTypes();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("characteristicValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristic setValue:](v16, "setValue:", v18);

    }
    -[HMCharacteristic propertiesFromHAPProperties:](v16, "propertiesFromHAPProperties:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("characteristicProperties")));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic setProperties:](v16, "setProperties:", v19);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("characteristicValueUpdateTime")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicValueUpdateTime"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristic setValueUpdatedTime:](v16, "setValueUpdatedTime:", v20);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("characteristicNotificationEnableTime")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristicNotificationEnableTime"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristic setNotificationEnabledTime:](v16, "setNotificationEnabledTime:", v21);

    }
    -[HMCharacteristic setNotificationEnabled:](v16, "setNotificationEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("characteristicNotificationEnabled")));
    -[HMCharacteristic setHasAuthorizationData:](v16, "setHasAuthorizationData:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.characteristicAuthDataPresent")));
    -[HMCharacteristic setRequiresDeviceUnlock:](v16, "setRequiresDeviceUnlock:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.requiresDeviceUnlock")));
    self = v16;

    v14 = self;
  }

  return v14;
}

- (void)setRequiresDeviceUnlock:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_requiresDeviceUnlock = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setProperties:(id)a3
{
  NSArray *v4;
  NSArray *properties;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  properties = self->_properties;
  self->_properties = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHasAuthorizationData:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAuthorizationData = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)propertiesFromHAPProperties:(int64_t)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 4) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("HMCharacteristicPropertyWritable"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("HMCharacteristicPropertyReadable"));
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v5, "addObject:", CFSTR("HMCharacteristicPropertyHidden"));
    if ((v3 & 0x10) == 0)
      return v5;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v5, "addObject:", CFSTR("HMCharacteristicPropertySupportsEventNotification"));
  if ((v3 & 0x40) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v3 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v5, "addObject:", CFSTR("HMCharacteristicPropertyRequiresAuthorizationData"));
  return v5;
}

- (void)__configureWithContext:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCharacteristic *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@, service: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMCharacteristic setContext:](v9, "setContext:", v6);
  -[HMCharacteristic setService:](v9, "setService:", v7);

}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setNotificationEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_notificationEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)characteristicType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_characteristicType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMCharacteristic uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)__localizedDescriptionForCharacteristicType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  localizationKeyForCharacteristicType(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedOrCustomString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isNotificationEnabled
{
  HMCharacteristic *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_notificationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __31__HMCharacteristic_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22;
  logCategory__hmf_once_v22 = v0;

}

- (HMCharacteristic)init
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMService *v6;
  HMCharacteristic *v7;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2080;
    v12 = "-[HMCharacteristic init]";
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@%s is unsupported and will be removed in a future release", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v6 = objc_alloc_init(HMService);
  v7 = -[HMCharacteristic initWithInstanceID:characteristicType:service:metadata:](self, "initWithInstanceID:characteristicType:service:metadata:", &unk_1E3B2E0E0, CFSTR("000000B0-0000-1000-8000-0026BB765291"), v6, 0);

  return v7;
}

- (HMCharacteristic)initWithInstanceID:(id)a3 characteristicType:(id)a4 service:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMCharacteristic *v14;
  uint64_t v15;
  NSNumber *instanceID;
  uint64_t v17;
  NSString *characteristicType;
  uint64_t v19;
  NSUUID *serviceUniqueIdentifier;
  uint64_t v21;
  HMCharacteristicMetadata *metadata;
  uint64_t v23;
  NSDate *valueUpdatedTime;
  uint64_t v25;
  NSDate *notificationEnabledTime;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMCharacteristic;
  v14 = -[HMCharacteristic init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    instanceID = v14->_instanceID;
    v14->_instanceID = (NSNumber *)v15;

    v17 = objc_msgSend(v11, "copy");
    characteristicType = v14->_characteristicType;
    v14->_characteristicType = (NSString *)v17;

    objc_storeWeak((id *)&v14->_service, v12);
    objc_msgSend(v12, "uniqueIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    serviceUniqueIdentifier = v14->_serviceUniqueIdentifier;
    v14->_serviceUniqueIdentifier = (NSUUID *)v19;

    v21 = objc_msgSend(v13, "copy");
    metadata = v14->_metadata;
    v14->_metadata = (HMCharacteristicMetadata *)v21;

    v14->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v23 = objc_claimAutoreleasedReturnValue();
    valueUpdatedTime = v14->_valueUpdatedTime;
    v14->_valueUpdatedTime = (NSDate *)v23;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v25 = objc_claimAutoreleasedReturnValue();
    notificationEnabledTime = v14->_notificationEnabledTime;
    v14->_notificationEnabledTime = (NSDate *)v25;

  }
  return v14;
}

- (void)_unconfigureContext
{
  void *v3;
  _HMContext *context;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  void *v3;
  HMCharacteristic *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_context)
  {
    -[HMCharacteristic setService:](self, "setService:", 0);
    -[HMCharacteristic _unconfigureContext](self, "_unconfigureContext");
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)setCharacteristicType:(id)a3
{
  NSString *v4;
  NSString *characteristicType;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  characteristicType = self->_characteristicType;
  self->_characteristicType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setValueUpdateTime:(id)a3
{
  NSDate *v4;
  NSDate *valueUpdatedTime;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)notificationEnabledTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationEnabledTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasAuthorizationData
{
  HMCharacteristic *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAuthorizationData;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  _QWORD block[5];
  id v47;
  id v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_28;
  }
  v5 = v4;
  -[HMCharacteristic metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mergeFromNewObject:", v7);

  objc_msgSend(v5, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristic setProperties:](self, "setProperties:", v9);

  objc_msgSend(v5, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristic setCharacteristicType:](self, "setCharacteristicType:", v10);

  objc_msgSend(v5, "setNotificationEnabledByThisClient:", -[HMCharacteristic notificationEnabledByThisClient](self, "notificationEnabledByThisClient"));
  -[HMCharacteristic setRequiresDeviceUnlock:](self, "setRequiresDeviceUnlock:", objc_msgSend(v5, "requiresDeviceUnlock"));
  LODWORD(v10) = -[HMCharacteristic hasAuthorizationData](self, "hasAuthorizationData");
  if ((_DWORD)v10 != objc_msgSend(v5, "hasAuthorizationData"))
  {
    -[HMCharacteristic setHasAuthorizationData:](self, "setHasAuthorizationData:", objc_msgSend(v5, "hasAuthorizationData"));
    -[HMCharacteristic service](self, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE45A8F8))
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMCharacteristic context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E3AB5CD0;
      block[4] = self;
      v47 = v15;
      v48 = v12;
      dispatch_async(v17, block);

    }
  }
  -[HMCharacteristic value](self, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v5, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic setValue:](self, "setValue:", v21);

  }
  v22 = v20 ^ 1;
  -[HMCharacteristic valueUpdatedTime](self, "valueUpdatedTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueUpdatedTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (HMFEqualObjects())
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v5, "valueUpdatedTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristic valueUpdatedTime](self, "valueUpdatedTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "compare:", v26);

  if (v27 == 1)
  {
    objc_msgSend(v5, "valueUpdatedTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic setValueUpdatedTime:](self, "setValueUpdatedTime:", v23);
    v22 = 1;
    goto LABEL_17;
  }
LABEL_18:
  v28 = -[HMCharacteristic isNotificationEnabled](self, "isNotificationEnabled");
  if (v28 != objc_msgSend(v5, "isNotificationEnabled"))
  {
    -[HMCharacteristic setNotificationEnabled:](self, "setNotificationEnabled:", objc_msgSend(v5, "isNotificationEnabled"));
    v22 = 1;
  }
  -[HMCharacteristic notificationEnabledTime](self, "notificationEnabledTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationEnabledTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = HMFEqualObjects();

  if ((v31 & 1) == 0)
  {
    objc_msgSend(v5, "notificationEnabledTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCharacteristic setNotificationEnabledTime:](self, "setNotificationEnabledTime:", v32);

    v22 = 1;
  }
  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[HMCharacteristic characteristicType](self, "characteristicType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "shouldNotCacheCharacteristicOfType:", v34);

    if ((v35 & 1) == 0)
    {
      -[HMCharacteristic service](self, "service");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "accessory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMCharacteristic context](self, "context");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "queue");
        v40 = objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_3;
        v42[3] = &unk_1E3AB59E8;
        v42[4] = self;
        v43 = v38;
        v44 = v37;
        v45 = v36;
        dispatch_async(v40, v42);

      }
    }
  }

LABEL_28:
  return v8;
}

- (void)writeValue:(id)value completionHandler:(void *)completion
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  HMCharacteristic *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMCharacteristic *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  HMCharacteristic *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = value;
  v7 = completion;
  -[HMCharacteristic context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristic writeValue:completionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("CharacteristicWrite"));
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HMCharacteristic_writeValue_completionHandler___block_invoke;
    block[3] = &unk_1E3AB4D20;
    v24 = v10;
    v25 = self;
    v26 = v6;
    v27 = v7;
    v12 = v10;
    dispatch_async(v11, block);

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2080;
      v31 = "-[HMCharacteristic writeValue:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }

}

- (void)_writeValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMCharacteristic *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMCharacteristic *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMCharacteristic *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  HMCharacteristic *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMCharacteristic service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "accessory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[HMCharacteristic properties](self, "properties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", CFSTR("HMCharacteristicPropertyWritable"));

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "_writeValue:forCharacteristic:service:completionHandler:", v6, self, v9, v7);
        }
        else
        {
          -[HMCharacteristic properties](self, "properties");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "containsObject:", CFSTR("HMCharacteristicPropertyReadable"));

          v34 = (void *)MEMORY[0x1A1AC1AAC]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
          if (v33)
          {
            if (v37)
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 138543362;
              v45 = v38;
              _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: characteristic is readonly", (uint8_t *)&v44, 0xCu);

            }
            v39 = 5;
          }
          else
          {
            if (v37)
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 138543362;
              v45 = v40;
              _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: characteristic is not writeable", (uint8_t *)&v44, 0xCu);

            }
            v39 = 48;
          }

          objc_autoreleasePoolPop(v34);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMCharacteristic context](v35, "context");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "delegateCaller");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "callCompletion:error:", v7, v41);

        }
      }
      else
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543362;
          v45 = v28;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: service's accessory is nil", (uint8_t *)&v44, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        -[HMCharacteristic context](v26, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "delegateCaller");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "callCompletion:error:", v7, v31);

        v11 = 0;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543362;
        v45 = v22;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: service is nil", (uint8_t *)&v44, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      -[HMCharacteristic context](v20, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "callCompletion:error:", v7, v24);

      v9 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: value is nil", (uint8_t *)&v44, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMCharacteristic context](v15, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v18);

  }
}

- (void)readValueWithCompletionHandler:(void *)completion
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  HMCharacteristic *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMCharacteristic *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD block[4];
  id v21;
  HMCharacteristic *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  -[HMCharacteristic context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristic readValueWithCompletionHandler:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = (const char *)v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("CharacteristicRead"));
    objc_msgSend(v6, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMCharacteristic_readValueWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    v21 = v7;
    v22 = self;
    v23 = v4;
    v9 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2080;
      v27 = "-[HMCharacteristic readValueWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id))v4 + 2))(v4, v9);
  }

}

- (void)_readValueWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[HMCharacteristic service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    -[HMCharacteristic properties](self, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("HMCharacteristicPropertyReadable"));

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "_readValueForCharacteristic:completionHandler:", self, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 48, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristic context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegateCaller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "callCompletion:error:", v15, v12);

    }
  }
  else
  {
    -[HMCharacteristic context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v15, v11);

  }
}

- (void)enableNotification:(BOOL)enable completionHandler:(void *)completion
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMCharacteristic *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMCharacteristic *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = completion;
  -[HMCharacteristic context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristic enableNotification:completionHandler:]", CFSTR("completion"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMCharacteristic_enableNotification_completionHandler___block_invoke;
    block[3] = &unk_1E3AB15D0;
    block[4] = self;
    v23 = enable;
    v22 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2080;
      v27 = "-[HMCharacteristic enableNotification:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);

  }
}

- (void)_enableNotification:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v4 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMCharacteristic service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[HMCharacteristic context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 21;
LABEL_6:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v6, v17);

    goto LABEL_7;
  }
  -[HMCharacteristic properties](self, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("HMCharacteristicPropertySupportsEventNotification"));

  if ((v11 & 1) == 0)
  {
    -[HMCharacteristic context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 7;
    goto LABEL_6;
  }
  v18[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enableNotification:forCharacteristics:completionHandler:", v4, v12, v6);

LABEL_7:
}

- (void)updateAuthorizationData:(NSData *)data completionHandler:(void *)completion
{
  NSData *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCharacteristic *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCharacteristic *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSData *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = data;
  v7 = completion;
  -[HMCharacteristic context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristic updateAuthorizationData:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HMCharacteristic_updateAuthorizationData_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMCharacteristic updateAuthorizationData:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateAuthorizationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[HMCharacteristic service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v8, "_updateAuthorizationData:forService:characteristic:completionHandler:", v13, v7, self, v6);
  }
  else
  {
    -[HMCharacteristic context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v6, v12);

  }
}

- (id)_characteristicTypeDescription
{
  void *v2;
  void *v3;

  -[HMCharacteristic characteristicType](self, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCharacteristic _characteristicTypeAsString:](HMCharacteristic, "_characteristicTypeAsString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMCharacteristic characteristicType](self, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__localizedDescriptionForCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (_HMContext)context
{
  return self->_context;
}

- (NSUUID)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (BOOL)notificationEnabledByThisClient
{
  return self->_notificationEnabledByThisClient;
}

- (void)setNotificationEnabledByThisClient:(BOOL)a3
{
  self->_notificationEnabledByThisClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_notificationEnabledTime, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

uint64_t __62__HMCharacteristic_updateAuthorizationData_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAuthorizationData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__HMCharacteristic_enableNotification_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableNotification:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __51__HMCharacteristic_readValueWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "_readValueWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

uint64_t __49__HMCharacteristic_writeValue_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "_writeValue:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void __39__HMCharacteristic_mergeFromNewObject___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __39__HMCharacteristic_mergeFromNewObject___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Calling didUpdateValueForCharacteristic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(a1[4], "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegateCaller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_142;
  v11[3] = &unk_1E3AB59E8;
  v12 = a1[5];
  v13 = a1[6];
  v9 = a1[7];
  v10 = a1[4];
  v14 = v9;
  v15 = v10;
  objc_msgSend(v8, "invokeBlock:", v11);

}

uint64_t __39__HMCharacteristic_mergeFromNewObject___block_invoke_142(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:service:didUpdateValueForCharacteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __39__HMCharacteristic_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateHasAuthorizationDataForCharacteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)_characteristicTypeAsString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicTypeDescription:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)serializedDictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[HMPBCharacteristicReference characteristicReferenceWithCharacteristic:](HMPBCharacteristicReference, "characteristicReferenceWithCharacteristic:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("HMShortcutsSerializedDictionaryVersion");
  v6[1] = CFSTR("HMShortcutsSerializedDictionaryProtocol");
  v7[0] = CFSTR("1.0");
  v7[1] = CFSTR("ProtoBuf");
  v6[2] = CFSTR("HMCharacteristicSerializedDataKey");
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (HMCharacteristic)characteristicWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "hmf_dataForKey:", CFSTR("HMCharacteristicSerializedDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBCharacteristicReference characteristicReferenceWithData:](HMPBCharacteristicReference, "characteristicReferenceWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristicWithCharacteristicReference:home:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v9;
}

+ (HMCharacteristic)characteristicWithCharacteristicReference:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasUniqueIdentifier") & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v19;
      v20 = "%{public}@CharacteristicReference uniqueIdentifier not set";
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v26, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v16);
    v14 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "hasServiceReference") & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v19;
      v20 = "%{public}@ServiceReference not set in characteristicReference";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "serviceReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMService serviceWithServiceReference:home:](HMService, "serviceWithServiceReference:home:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_findCharacteristicWithUniqueIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v24;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't find characteristic %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    v14 = 0;
  }

LABEL_18:
  return (HMCharacteristic *)v14;
}

@end
