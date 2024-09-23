@implementation HMService

- (NSString)serviceSubtype
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_serviceSubtype;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)associatedServiceType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_associatedServiceType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMApplicationData)applicationData
{
  os_unfair_lock_s *p_lock;
  HMApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMService uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMService serviceType](self, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMService _serviceTypeAsString:](HMService, "_serviceTypeAsString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMService serviceType](self, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HMService %@: %@(%@)"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)serviceType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_serviceType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)_serviceTypeAsString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceTypeDescription:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)linkedServices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *linkedServiceInstanceIDs;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMService accessory](self, "accessory", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        linkedServiceInstanceIDs = self->_linkedServiceInstanceIDs;
        objc_msgSend(v10, "instanceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(linkedServiceInstanceIDs) = -[NSArray containsObject:](linkedServiceInstanceIDs, "containsObject:", v12);

        if ((_DWORD)linkedServiceInstanceIDs)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v13 = v3;
  else
    v13 = 0;

  return (NSArray *)v13;
}

- (HMAccessory)accessory
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);
  return (HMAccessory *)WeakRetained;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSArray)characteristics
{
  void *v2;
  void *v3;

  -[HMService currentCharacteristics](self, "currentCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMMutableArray)currentCharacteristics
{
  return self->_currentCharacteristics;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMService uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMService *v4;
  HMService *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMService *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMService uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMService uniqueIdentifier](v5, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
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
    -[HMService accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
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

- (BOOL)isPrimaryService
{
  return self->_primaryService;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMService setContext:](self, "setContext:", v6);
  -[HMService setAccessory:](self, "setAccessory:", v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMService characteristics](self, "characteristics", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "__configureWithContext:service:", v6, self);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[HMService bulletinBoardNotificationInternal](self, "bulletinBoardNotificationInternal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "__configureWithContext:", v6);

}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setAccessory:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMBulletinBoardNotification)bulletinBoardNotificationInternal
{
  os_unfair_lock_s *p_lock;
  HMBulletinBoardNotification *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_bulletinBoardNotificationInternal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMService)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMService *v8;
  uint64_t v9;
  NSUUID *targetAccessoryUUID;
  uint64_t v11;
  NSString *associatedServiceType;
  NSString *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *configuredName;
  uint64_t v18;
  NSNumber *matterEndpointID;
  uint64_t v20;
  NSString *defaultName;
  uint64_t v22;
  NSString *serviceType;
  uint64_t v24;
  NSString *serviceSubtype;
  uint64_t v26;
  NSNumber *instanceID;
  uint64_t v28;
  NSNumber *lastKnownOperatingStateValue;
  uint64_t v30;
  NSNumber *lastKnownOperatingStateAbnormalReasonsValue;
  uint64_t v32;
  NSNumber *mediaSourceIdentifier;
  uint64_t v34;
  NSArray *mediaSourceDisplayOrder;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  HMService *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  int v51;
  HMApplicationData *v52;
  HMApplicationData *applicationData;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *linkedServiceInstanceIDs;
  uint64_t v59;
  HMBulletinBoardNotification *bulletinBoardNotificationInternal;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _BYTE v68[128];
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", CFSTR("serviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = -[HMService initWithUUID:accessory:](self, "initWithUUID:accessory:", v5, v6);
    if (v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMServiceTargetAccessoryUUID"));
      v9 = objc_claimAutoreleasedReturnValue();
      targetAccessoryUUID = v8->_targetAccessoryUUID;
      v8->_targetAccessoryUUID = (NSUUID *)v9;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("associatedServiceType"));
      v11 = objc_claimAutoreleasedReturnValue();
      associatedServiceType = v8->_associatedServiceType;
      v8->_associatedServiceType = (NSString *)v11;

      if (!-[NSString length](v8->_associatedServiceType, "length"))
      {
        v13 = v8->_associatedServiceType;
        v8->_associatedServiceType = 0;

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
      v14 = objc_claimAutoreleasedReturnValue();
      name = v8->_name;
      v8->_name = (NSString *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceConfiguredName"));
      v16 = objc_claimAutoreleasedReturnValue();
      configuredName = v8->_configuredName;
      v8->_configuredName = (NSString *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceMatterEndpointID"));
      v18 = objc_claimAutoreleasedReturnValue();
      matterEndpointID = v8->_matterEndpointID;
      v8->_matterEndpointID = (NSNumber *)v18;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("serviceDefaultName"));
      v20 = objc_claimAutoreleasedReturnValue();
      defaultName = v8->_defaultName;
      v8->_defaultName = (NSString *)v20;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("serviceType"));
      v22 = objc_claimAutoreleasedReturnValue();
      serviceType = v8->_serviceType;
      v8->_serviceType = (NSString *)v22;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("serviceSubtype"));
      v24 = objc_claimAutoreleasedReturnValue();
      serviceSubtype = v8->_serviceSubtype;
      v8->_serviceSubtype = (NSString *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceInstanceID"));
      v26 = objc_claimAutoreleasedReturnValue();
      instanceID = v8->_instanceID;
      v8->_instanceID = (NSNumber *)v26;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastKnownOperatingStateCodingKey"));
      v28 = objc_claimAutoreleasedReturnValue();
      lastKnownOperatingStateValue = v8->_lastKnownOperatingStateValue;
      v8->_lastKnownOperatingStateValue = (NSNumber *)v28;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMServiceLastKnownOperatingStateAbnormalReasonsCodingKey"));
      v30 = objc_claimAutoreleasedReturnValue();
      lastKnownOperatingStateAbnormalReasonsValue = v8->_lastKnownOperatingStateAbnormalReasonsValue;
      v8->_lastKnownOperatingStateAbnormalReasonsValue = (NSNumber *)v30;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaSourceIdentifierCodingKey"));
      v32 = objc_claimAutoreleasedReturnValue();
      mediaSourceIdentifier = v8->_mediaSourceIdentifier;
      v8->_mediaSourceIdentifier = (NSNumber *)v32;

      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("mediaSourceDisplayOrderCodingKey"));
      v34 = objc_claimAutoreleasedReturnValue();
      mediaSourceDisplayOrder = v8->_mediaSourceDisplayOrder;
      v8->_mediaSourceDisplayOrder = (NSArray *)v34;

      v8->_mediaSourceDisplayOrderModifiable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mediaSourceDisplayOrderModifiableCodingKey"));
      v8->_nameModifiable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nameModifiableCodingKey"));
      v36 = (void *)MEMORY[0x1E0C99E60];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setWithArray:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("characteristics"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMMutableArray setArray:](v8->_currentCharacteristics, "setArray:", v39);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceConfigurationState"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v8->_configurationState = +[HMService _mapToServiceConfigurationStateFromIsConfiguredValue:](HMService, "_mapToServiceConfigurationStateFromIsConfiguredValue:", v40);
      }
      else
      {
        v62 = v39;
        v8->_configurationState = 0;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        -[HMService characteristics](v8, "characteristics");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v64;
          while (2)
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v64 != v48)
                objc_enumerationMutation(v45);
              objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "characteristicType");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("000000D6-0000-1000-8000-0026BB765291"));

              if (v51)
              {
                v8->_configurationState = 1;
                goto LABEL_21;
              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
            if (v47)
              continue;
            break;
          }
        }
LABEL_21:

        v39 = v62;
        v40 = 0;
      }
      v8->_userInteractive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.hidden")) ^ 1;
      v52 = -[HMApplicationData initWithDictionaryFromCoder:key:]([HMApplicationData alloc], "initWithDictionaryFromCoder:key:", v4, CFSTR("HM.appData"));
      applicationData = v8->_applicationData;
      v8->_applicationData = v52;

      v8->_primaryService = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.primary"));
      v54 = (void *)MEMORY[0x1E0C99E60];
      v67[0] = objc_opt_class();
      v67[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setWithArray:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("HM.linkedServices"));
      v57 = objc_claimAutoreleasedReturnValue();
      linkedServiceInstanceIDs = v8->_linkedServiceInstanceIDs;
      v8->_linkedServiceInstanceIDs = (NSArray *)v57;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.BulletinBoardNotification"));
      v59 = objc_claimAutoreleasedReturnValue();
      bulletinBoardNotificationInternal = v8->_bulletinBoardNotificationInternal;
      v8->_bulletinBoardNotificationInternal = (HMBulletinBoardNotification *)v59;

    }
    self = v8;
    v44 = self;
  }
  else
  {
    v41 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v43;
      v72 = 2112;
      v73 = v5;
      v74 = 2112;
      v75 = v7;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from uuid: %@, accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    v44 = 0;
  }

  return v44;
}

- (HMService)init
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  void *v8;
  HMAccessory *v9;
  HMService *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v5;
    v14 = 2080;
    v15 = "-[HMService init]";
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@%s is unsupported and will be removed in a future release", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HMAccessory alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMAccessory initWithUUID:](v7, "initWithUUID:", v8);
  v10 = -[HMService initWithUUID:accessory:](self, "initWithUUID:accessory:", v6, v9);

  return v10;
}

- (NSNumber)mediaSourceIdentifier
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaSourceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)matterEndpointID
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_matterEndpointID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)localizedDescriptionForServiceType:(id)a3
{
  return +[HMService __localizedDescriptionForServiceType:](HMService, "__localizedDescriptionForServiceType:", a3);
}

- (NSUUID)accessoryUUID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMService targetAccessoryUUID](self, "targetAccessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HMService accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSUUID *)v5;
}

- (NSUUID)targetAccessoryUUID
{
  return self->_targetAccessoryUUID;
}

+ (id)__localizedDescriptionForServiceType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  localizationKeyForServiceType(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedOrCustomString:", v3);
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
  +[HMPBServiceReference serviceReferenceWithService:](HMPBServiceReference, "serviceReferenceWithService:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("HMShortcutsSerializedDictionaryVersion");
  v6[1] = CFSTR("HMShortcutsSerializedDictionaryProtocol");
  v7[0] = CFSTR("1.0");
  v7[1] = CFSTR("ProtoBuf");
  v6[2] = CFSTR("HMServiceSerializedDataKey");
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (HMService)serviceWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "hmf_dataForKey:", CFSTR("HMServiceSerializedDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBServiceReference serviceReferenceWithData:](HMPBServiceReference, "serviceReferenceWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceWithServiceReference:home:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMService *)v9;
}

+ (HMService)serviceWithServiceReference:(id)a3 home:(id)a4
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
      v20 = "%{public}@ServiceReference uniqueIdentifier not set";
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v26, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v16);
    v14 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "hasAccessoryReference") & 1) == 0)
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
      v20 = "%{public}@AccessoryReference not set in serviceReference";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "accessoryReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessory accessoryWithAccessoryReference:home:](HMAccessory, "accessoryWithAccessoryReference:home:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_findServiceWithUniqueIdentifier:", v12);
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
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't find service %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    v14 = 0;
  }

LABEL_18:
  return (HMService *)v14;
}

- (HMService)initWithUUID:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  HMService *v9;
  HMService *v10;
  uint64_t v11;
  NSUUID *accessoryUniqueIdentifier;
  uint64_t v13;
  HMMutableArray *currentCharacteristics;
  HMApplicationData *v15;
  HMApplicationData *applicationData;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMService;
  v9 = -[HMService init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_accessory, v8);
    objc_msgSend(v8, "uniqueIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIdentifier = v10->_accessoryUniqueIdentifier;
    v10->_accessoryUniqueIdentifier = (NSUUID *)v11;

    +[HMMutableArray array](HMMutableArray, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    currentCharacteristics = v10->_currentCharacteristics;
    v10->_currentCharacteristics = (HMMutableArray *)v13;

    v15 = objc_alloc_init(HMApplicationData);
    applicationData = v10->_applicationData;
    v10->_applicationData = v15;

  }
  return v10;
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
  _HMContext *context;
  void *v4;
  HMService *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring service", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMService setAccessory:](v5, "setAccessory:", 0);
    -[HMService _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)setServiceType:(id)a3
{
  NSString *v4;
  NSString *serviceType;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceType = self->_serviceType;
  self->_serviceType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMatterEndpointID:(id)a3
{
  NSNumber *v4;
  NSNumber *matterEndpointID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  matterEndpointID = self->_matterEndpointID;
  self->_matterEndpointID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)defaultName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_defaultName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDefaultName:(id)a3
{
  NSString *v4;
  NSString *defaultName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  defaultName = self->_defaultName;
  self->_defaultName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAssociatedServiceType:(id)a3
{
  NSString *v4;
  NSString *associatedServiceType;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  associatedServiceType = self->_associatedServiceType;
  self->_associatedServiceType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServiceSubtype:(id)a3
{
  NSString *v4;
  NSString *serviceSubtype;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceSubtype = self->_serviceSubtype;
  self->_serviceSubtype = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)configurationState
{
  os_unfair_lock_s *p_lock;
  int64_t configurationState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configurationState = self->_configurationState;
  os_unfair_lock_unlock(p_lock);
  return configurationState;
}

- (void)setConfigurationState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configurationState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)defaultCharacteristic
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMService currentCharacteristics](self, "currentCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[HMService _serviceTypeDescription](self, "_serviceTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMService defaultCharacteristicByServiceDictionary](HMService, "defaultCharacteristicByServiceDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[HMService characteristicsSupportedForShortcutConditions](self, "characteristicsSupportedForShortcutConditions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_msgSend(v13, "_characteristicTypeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v17 = v13;

      if (v17)
        goto LABEL_15;
    }
    else
    {
LABEL_11:

    }
  }
  -[HMService currentCharacteristics](self, "currentCharacteristics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v17;
}

- (id)characteristicsSupportedForShortcutConditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMService currentCharacteristics](self, "currentCharacteristics", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        +[HMService characteristicBlacklistForShortcutConditions](HMService, "characteristicBlacklistForShortcutConditions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "characteristicType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if ((v13 & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)hasSleepDiscoveryMode
{
  return 0;
}

- (int64_t)lastKnownSleepDiscoveryMode
{
  return 1;
}

- (BOOL)hasOperatingState
{
  void *v2;
  BOOL v3;

  -[HMService lastKnownOperatingStateValue](self, "lastKnownOperatingStateValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasOperatingStateAbnormalReasons
{
  void *v2;
  BOOL v3;

  -[HMService lastKnownOperatingStateAbnormalReasonsValue](self, "lastKnownOperatingStateAbnormalReasonsValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)lastKnownOperatingState
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSNumber integerValue](self->_lastKnownOperatingStateValue, "integerValue");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)lastKnownOperatingStateAbnormalReasons
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSNumber unsignedIntegerValue](self->_lastKnownOperatingStateAbnormalReasonsValue, "unsignedIntegerValue");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaSourceIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *mediaSourceIdentifier;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  mediaSourceIdentifier = self->_mediaSourceIdentifier;
  self->_mediaSourceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isNameModifiable
{
  HMService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_nameModifiable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setApplicationData:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *applicationData;

  v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSURL)homeObjectURLInternal
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSURL *homeObjectURLInternal;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;

  -[HMService uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  homeObjectURLInternal = self->_homeObjectURLInternal;
  if (!homeObjectURLInternal)
  {
    objc_msgSend(v3, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBulletinObjectTuple tupleWithQueryType:uuidString:](HMBulletinObjectTuple, "tupleWithQueryType:uuidString:", 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    generateURLForHomeKitObject(v7, 0);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v9 = self->_homeObjectURLInternal;
    self->_homeObjectURLInternal = v8;

    homeObjectURLInternal = self->_homeObjectURLInternal;
  }
  v10 = homeObjectURLInternal;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)_recomputeAssistantIdentifier
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *assistantIdentifier;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_msgSend(WeakRetained, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_instanceID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifierWithSalts(CFSTR("SV"), (uint64_t)v4, (uint64_t)v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v7;

}

- (NSString)assistantIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *assistantIdentifier;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    -[HMService _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)recomputeAssistantIdentifier
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMService _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMService *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMService *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  HMService *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD block[5];
  NSString *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = completion;
  -[HMService context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMService updateName:completionHandler:]", CFSTR("completion"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2112;
      v35 = (const char *)v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if (v6)
    {
      v10 = -[NSString length](v6, "length");
      if (HMMaxLengthForNaming__hmf_once_t5 != -1)
        dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
      if (v10 <= HMMaxLengthForNaming__hmf_once_v6)
      {
        objc_msgSend(v9, "queue");
        v22 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__HMService_updateName_completionHandler___block_invoke;
        block[3] = &unk_1E3AB5C58;
        block[4] = self;
        v30 = v6;
        v31 = v7;
        dispatch_async(v22, block);

        goto LABEL_16;
      }
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v7, v16);
    }
    else
    {
      -[HMService context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, v21);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2080;
      v35 = "-[HMService updateName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }

LABEL_16:
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HMService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[HMService context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    objc_msgSend(v9, "callCompletion:error:", v6, v10);

    goto LABEL_7;
  }
  if (!-[HMService isNameModifiable](self, "isNameModifiable"))
  {
    -[HMService context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v7, "_updateName:forService:completionHandler:", v12, self, v6);
LABEL_7:

}

- (void)updateAssociatedServiceType:(NSString *)serviceType completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMService *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMService *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = serviceType;
  v7 = completion;
  -[HMService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMService updateAssociatedServiceType:completionHandler:]", CFSTR("completion"));
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
    block[2] = __59__HMService_updateAssociatedServiceType_completionHandler___block_invoke;
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
      v28 = "-[HMService updateAssociatedServiceType:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateAssociatedServiceType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;

  v6 = a3;
  v7 = a4;
  v8 = (__CFString *)v6;
  v18 = v8;
  if (v8)
    v9 = v8;
  else
    v9 = &stru_1E3AB7688;
  -[HMService associatedServiceType](self, "associatedServiceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[__CFString isEqual:](v9, "isEqual:", v10);

  if (v11)
  {
    -[HMService context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:error:", v7, 0);

  }
  else
  {
    -[HMService accessory](self, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v12 = v14;
      objc_msgSend(v14, "_updateAssociatedServiceType:forService:completionHandler:", v9, self, v7);
    }
    else
    {
      -[HMService context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 21, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, v17);

      v12 = 0;
    }
  }

}

- (void)updateConfigurationState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMService *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMService *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMService context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMService updateConfigurationState:completionHandler:]", CFSTR("completion"));
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
    block[2] = __56__HMService_updateConfigurationState_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5668;
    block[4] = self;
    v23 = a3;
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
      v27 = "-[HMService updateConfigurationState:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (void)_updateConfigurationState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMService *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMService *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMService *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  HMService *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMService *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMService *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[HMService configurationState](self, "configurationState"))
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: configuration states not applicable to service", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMService context](v17, "context");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 48;
    goto LABEL_29;
  }
  if ((unint64_t)a3 <= 1)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMServiceConfigurationStateAsString(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v10;
      v62 = 2112;
      v63 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: new configuration state is invalid: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMService context](v8, "context");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 3;
    goto LABEL_29;
  }
  if (-[HMService configurationState](self, "configurationState") != a3)
  {
    v54 = v6;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[HMService characteristics](self, "characteristics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v56;
LABEL_15:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v29);
        objc_msgSend(v30, "characteristicType");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("000000D6-0000-1000-8000-0026BB765291"));

        if ((v32 & 1) != 0)
          break;
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v27)
            goto LABEL_15;
          goto LABEL_21;
        }
      }
      v12 = v30;

      if (!v12)
        goto LABEL_26;
      +[HMService _mapToIsConfiguredValueFromServiceConfigurationState:](HMService, "_mapToIsConfiguredValueFromServiceConfigurationState:", a3);
      v33 = objc_claimAutoreleasedReturnValue();
      v6 = v54;
      if (v33)
      {
        v13 = (void *)v33;
        -[HMService accessory](self, "accessory");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = v34;
          objc_msgSend(v34, "_writeValue:forCharacteristic:service:completionHandler:", v13, v12, self, v54);
        }
        else
        {
          v47 = (void *)MEMORY[0x1A1AC1AAC]();
          v48 = self;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v50;
            _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: accessory is nil", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v47);
          -[HMService context](v48, "context");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "delegateCaller");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "callCompletion:error:", v54, v53);

          v35 = 0;
        }
      }
      else
      {
        v40 = (void *)MEMORY[0x1A1AC1AAC]();
        v41 = self;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          HMServiceConfigurationStateAsString(a3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v43;
          v62 = 2112;
          v63 = v44;
          _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: mapped value is nil for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        -[HMService context](v41, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "delegateCaller");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "callCompletion:error:", v54, v46);

        v13 = 0;
      }
      goto LABEL_30;
    }
LABEL_21:

LABEL_26:
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    v6 = v54;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v39;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot update configuration state: cannot find IsConfigured characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    -[HMService context](v37, "context");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 2;
LABEL_29:
    objc_msgSend(v14, "hmErrorWithCode:", v15);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:error:", v6, v35);
LABEL_30:

    goto LABEL_31;
  }
  v20 = (void *)MEMORY[0x1A1AC1AAC]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMServiceConfigurationStateAsString(a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v23;
    v62 = 2112;
    v63 = v24;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Not updating configuration state because it is already %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMService context](v21, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "callCompletion:error:", v6, 0);
LABEL_31:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMService uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_findCharacteristic:(id)a3
{
  id v4;
  void *v5;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMService characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v9, "instanceID");
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

- (id)_findCharacteristicWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMService characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v9, "uniqueIdentifier");
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

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  HMObjectMergeCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMObjectMergeCollection *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMService *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  HMService *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  HMService *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  HMService *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  HMService *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  HMService *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  HMService *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  HMService *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  HMService *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  int64_t v105;
  void *v106;
  HMService *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  char v119;
  void *v120;
  HMService *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  HMService *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  HMService *v144;
  NSObject *v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  HMService *v151;
  NSObject *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  char v157;
  void *v159;
  _QWORD v160[4];
  id v161;
  id v162;
  HMService *v163;
  _QWORD v164[4];
  id v165;
  id v166;
  HMService *v167;
  _QWORD v168[4];
  id v169;
  id v170;
  HMService *v171;
  _QWORD v172[4];
  id v173;
  id v174;
  HMService *v175;
  _QWORD v176[4];
  id v177;
  id v178;
  HMService *v179;
  _QWORD v180[4];
  id v181;
  id v182;
  HMService *v183;
  _QWORD v184[5];
  _QWORD v185[5];
  uint8_t buf[4];
  void *v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMService accessory](self, "accessory");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HMObjectMergeCollection alloc];
  -[HMService currentCharacteristics](self, "currentCharacteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v6, "initWithCurrentObjects:newObjects:", v8, v10);

  -[HMObjectMergeCollection removedObjects](v11, "removedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v185[0] = MEMORY[0x1E0C809B0];
  v185[1] = 3221225472;
  v185[2] = __32__HMService_mergeFromNewObject___block_invoke;
  v185[3] = &unk_1E3AB56B8;
  v185[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v185);

  -[HMObjectMergeCollection addedObjects](v11, "addedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = v13;
  v184[1] = 3221225472;
  v184[2] = __32__HMService_mergeFromNewObject___block_invoke_123;
  v184[3] = &unk_1E3AB56B8;
  v184[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v184);

  -[HMObjectMergeCollection mergeCommonObjects](v11, "mergeCommonObjects");
  if (-[HMObjectMergeCollection isModified](v11, "isModified"))
  {
    -[HMObjectMergeCollection finalObjects](v11, "finalObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService currentCharacteristics](self, "currentCharacteristics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  -[HMService name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v24;
      v188 = 2112;
      v189 = v25;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating name via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v4, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setName:](v22, "setName:", v26);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMService context](v22, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "delegateCaller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v180[0] = MEMORY[0x1E0C809B0];
      v180[1] = 3221225472;
      v180[2] = __32__HMService_mergeFromNewObject___block_invoke_126;
      v180[3] = &unk_1E3AB5CD0;
      v181 = v5;
      v182 = v159;
      v183 = v22;
      objc_msgSend(v28, "invokeBlock:", v180);

    }
    v17 = 1;
  }
  -[HMService configuredName](self, "configuredName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuredName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = HMFEqualObjects();

  if ((v31 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuredName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v35;
      v188 = 2112;
      v189 = v36;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_INFO, "%{public}@Updating configured name via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v4, "configuredName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setConfiguredName:](v33, "setConfiguredName:", v37);

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
    {
      v38 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMService context](v33, "context");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "delegateCaller");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v176[0] = MEMORY[0x1E0C809B0];
        v176[1] = 3221225472;
        v176[2] = __32__HMService_mergeFromNewObject___block_invoke_252;
        v176[3] = &unk_1E3AB5CD0;
        v177 = v38;
        v178 = v159;
        v179 = v33;
        objc_msgSend(v40, "invokeBlock:", v176);

      }
    }
    v17 = 1;
  }
  -[HMService matterEndpointID](self, "matterEndpointID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matterEndpointID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = HMFEqualObjects();

  if ((v43 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1A1AC1AAC]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "matterEndpointID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v47;
      v188 = 2112;
      v189 = v48;
      _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Updating matter endpoint ID via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    objc_msgSend(v4, "matterEndpointID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setMatterEndpointID:](v45, "setMatterEndpointID:", v49);

    v17 = 1;
  }
  -[HMService defaultName](self, "defaultName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = HMFEqualObjects();

  if ((v52 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x1A1AC1AAC]();
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v56;
      v188 = 2112;
      v189 = v57;
      _os_log_impl(&dword_19B1B0000, v55, OS_LOG_TYPE_INFO, "%{public}@Updating default name via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v53);
    objc_msgSend(v4, "defaultName");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setDefaultName:](v54, "setDefaultName:", v58);

    v17 = 1;
  }
  -[HMService applicationData](self, "applicationData");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationData");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = HMFEqualObjects();

  if ((v61 & 1) == 0)
  {
    v62 = (void *)MEMORY[0x1A1AC1AAC]();
    v63 = self;
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v187 = v65;
      _os_log_impl(&dword_19B1B0000, v64, OS_LOG_TYPE_INFO, "%{public}@Updating application data via merge", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v62);
    objc_msgSend(v4, "applicationData");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setApplicationData:](v63, "setApplicationData:", v66);

    objc_msgSend(v159, "notifyDelegateOfAppDataUpdateForService:", v63);
    v17 = 1;
  }
  -[HMService serviceType](self, "serviceType");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v67, "isEqualToString:", v68);

  if ((v69 & 1) == 0)
  {
    v70 = (void *)MEMORY[0x1A1AC1AAC]();
    v71 = self;
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceType");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v73;
      v188 = 2112;
      v189 = v74;
      _os_log_impl(&dword_19B1B0000, v72, OS_LOG_TYPE_INFO, "%{public}@Updating service type via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v70);
    objc_msgSend(v4, "serviceType");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setServiceType:](v71, "setServiceType:", v75);

    v17 = 1;
  }
  v76 = -[HMService isUserInteractive](self, "isUserInteractive");
  if (v76 != objc_msgSend(v4, "isUserInteractive"))
  {
    v77 = (void *)MEMORY[0x1A1AC1AAC]();
    v78 = self;
    HMFGetOSLogHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isUserInteractive");
      HMFBooleanToString();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v80;
      v188 = 2112;
      v189 = v81;
      _os_log_impl(&dword_19B1B0000, v79, OS_LOG_TYPE_INFO, "%{public}@Updating is user interactive via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v77);
    -[HMService setUserInteractive:](v78, "setUserInteractive:", objc_msgSend(v4, "isUserInteractive"));
    v17 = 1;
  }
  -[HMService associatedServiceType](self, "associatedServiceType");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedServiceType");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = HMFEqualObjects();

  if ((v84 & 1) == 0)
  {
    v85 = (void *)MEMORY[0x1A1AC1AAC]();
    v86 = self;
    HMFGetOSLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "associatedServiceType");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v88;
      v188 = 2112;
      v189 = v89;
      _os_log_impl(&dword_19B1B0000, v87, OS_LOG_TYPE_INFO, "%{public}@Updating associated service type via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v85);
    objc_msgSend(v4, "associatedServiceType");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setAssociatedServiceType:](v86, "setAssociatedServiceType:", v90);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMService context](v86, "context");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "delegateCaller");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v172[0] = MEMORY[0x1E0C809B0];
      v172[1] = 3221225472;
      v172[2] = __32__HMService_mergeFromNewObject___block_invoke_254;
      v172[3] = &unk_1E3AB5CD0;
      v173 = v5;
      v174 = v159;
      v175 = v86;
      objc_msgSend(v92, "invokeBlock:", v172);

    }
    v17 = 1;
  }
  -[HMService serviceSubtype](self, "serviceSubtype");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceSubtype");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = HMFEqualObjects();

  if ((v95 & 1) == 0)
  {
    v96 = (void *)MEMORY[0x1A1AC1AAC]();
    v97 = self;
    HMFGetOSLogHandle();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceSubtype");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v99;
      v188 = 2112;
      v189 = v100;
      _os_log_impl(&dword_19B1B0000, v98, OS_LOG_TYPE_INFO, "%{public}@Updating service subtype via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v96);
    objc_msgSend(v4, "serviceSubtype");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setServiceSubtype:](v97, "setServiceSubtype:", v101);

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
    {
      v102 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMService context](v97, "context");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "delegateCaller");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v168[0] = MEMORY[0x1E0C809B0];
        v168[1] = 3221225472;
        v168[2] = __32__HMService_mergeFromNewObject___block_invoke_256;
        v168[3] = &unk_1E3AB5CD0;
        v169 = v102;
        v170 = v159;
        v171 = v97;
        objc_msgSend(v104, "invokeBlock:", v168);

      }
    }
    v17 = 1;
  }
  v105 = -[HMService configurationState](self, "configurationState");
  if (v105 != objc_msgSend(v4, "configurationState"))
  {
    v106 = (void *)MEMORY[0x1A1AC1AAC]();
    v107 = self;
    HMFGetOSLogHandle();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      HMServiceConfigurationStateAsString(objc_msgSend(v4, "configurationState"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v109;
      v188 = 2112;
      v189 = v110;
      _os_log_impl(&dword_19B1B0000, v108, OS_LOG_TYPE_INFO, "%{public}@Updating configuration state via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v106);
    -[HMService setConfigurationState:](v107, "setConfigurationState:", objc_msgSend(v4, "configurationState"));
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
    {
      v111 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMService context](v107, "context");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "delegateCaller");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v164[0] = MEMORY[0x1E0C809B0];
        v164[1] = 3221225472;
        v164[2] = __32__HMService_mergeFromNewObject___block_invoke_258;
        v164[3] = &unk_1E3AB5CD0;
        v165 = v111;
        v166 = v159;
        v167 = v107;
        objc_msgSend(v113, "invokeBlock:", v164);

      }
    }
    v17 = 1;
  }
  -[HMService lastKnownOperatingStateValue](self, "lastKnownOperatingStateValue");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastKnownOperatingStateValue");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = HMFEqualObjects();

  if (!v116
    || (-[HMService lastKnownOperatingStateAbnormalReasonsValue](self, "lastKnownOperatingStateAbnormalReasonsValue"),
        v117 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "lastKnownOperatingStateAbnormalReasonsValue"),
        v118 = (void *)objc_claimAutoreleasedReturnValue(),
        v119 = HMFEqualObjects(),
        v118,
        v117,
        (v119 & 1) == 0))
  {
    v120 = (void *)MEMORY[0x1A1AC1AAC]();
    v121 = self;
    HMFGetOSLogHandle();
    v122 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastKnownOperatingStateValue");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastKnownOperatingStateAbnormalReasonsValue");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v187 = v123;
      v188 = 2112;
      v189 = v124;
      v190 = 2112;
      v191 = v125;
      _os_log_impl(&dword_19B1B0000, v122, OS_LOG_TYPE_INFO, "%{public}@Updating last known operating state value and abnormal reasons value via merge to %@ and %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v120);
    objc_msgSend(v4, "lastKnownOperatingStateValue");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setLastKnownOperatingStateValue:](v121, "setLastKnownOperatingStateValue:", v126);

    objc_msgSend(v4, "lastKnownOperatingStateAbnormalReasonsValue");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setLastKnownOperatingStateAbnormalReasonsValue:](v121, "setLastKnownOperatingStateAbnormalReasonsValue:", v127);

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
    {
      v128 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMService context](v121, "context");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "delegateCaller");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = MEMORY[0x1E0C809B0];
        v160[1] = 3221225472;
        v160[2] = __32__HMService_mergeFromNewObject___block_invoke_260;
        v160[3] = &unk_1E3AB5CD0;
        v161 = v128;
        v162 = v159;
        v163 = v121;
        objc_msgSend(v130, "invokeBlock:", v160);

      }
    }
    v17 = 1;
  }
  -[HMService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSourceDisplayOrder");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = HMFEqualObjects();

  if ((v133 & 1) == 0)
  {
    v134 = (void *)MEMORY[0x1A1AC1AAC]();
    v135 = self;
    HMFGetOSLogHandle();
    v136 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaSourceDisplayOrder");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v137;
      v188 = 2112;
      v189 = v138;
      _os_log_impl(&dword_19B1B0000, v136, OS_LOG_TYPE_INFO, "%{public}@Updating media display order via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v134);
    objc_msgSend(v4, "mediaSourceDisplayOrder");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setMediaSourceDisplayOrder:](v135, "setMediaSourceDisplayOrder:", v139);

    v17 = 1;
  }
  -[HMService mediaSourceIdentifier](self, "mediaSourceIdentifier");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSourceIdentifier");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = HMFEqualObjects();

  if ((v142 & 1) == 0)
  {
    v143 = (void *)MEMORY[0x1A1AC1AAC]();
    v144 = self;
    HMFGetOSLogHandle();
    v145 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaSourceIdentifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v146;
      v188 = 2112;
      v189 = v147;
      _os_log_impl(&dword_19B1B0000, v145, OS_LOG_TYPE_INFO, "%{public}@Updating media source identifier via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v143);
    objc_msgSend(v4, "mediaSourceIdentifier");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMService setMediaSourceIdentifier:](v144, "setMediaSourceIdentifier:", v148);

    v17 = 1;
  }
  v149 = -[HMService mediaSourceDisplayOrderModifiable](self, "mediaSourceDisplayOrderModifiable");
  if (v149 != objc_msgSend(v4, "mediaSourceDisplayOrderModifiable"))
  {
    v150 = (void *)MEMORY[0x1A1AC1AAC]();
    v151 = self;
    HMFGetOSLogHandle();
    v152 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaSourceDisplayOrderModifiable");
      HMFBooleanToString();
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v153;
      v188 = 2112;
      v189 = v154;
      _os_log_impl(&dword_19B1B0000, v152, OS_LOG_TYPE_INFO, "%{public}@Updating media source display order modifiable via merge to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v150);
    -[HMService setMediaSourceDisplayOrderModifiable:](v151, "setMediaSourceDisplayOrderModifiable:", objc_msgSend(v4, "mediaSourceDisplayOrderModifiable"));
    v17 = 1;
  }
  -[HMService bulletinBoardNotification](self, "bulletinBoardNotification");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinBoardNotification");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v155, "mergeFromNewObject:", v156);

  return v17 | v157;
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[HMService accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateApplicationData:forService:completionHandler:", v14, self, v7);
  }
  else
  {
    -[HMService context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v12);

  }
}

- (void)_handleUpdateServicePrimary:(id)a3
{
  self->_primaryService = objc_msgSend(a3, "isPrimaryService");
}

- (void)_handleMarkServiceInteractive:(id)a3
{
  self->_userInteractive = objc_msgSend(a3, "isUserInteractive");
}

- (void)_handleUpdateAssociatedServiceType:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
    v4 = v5;
  else
    v4 = 0;
  -[HMService setAssociatedServiceType:](self, "setAssociatedServiceType:", v4);

}

- (BOOL)_hasCharacteristic:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  HMService *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMService characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v10 == v4)
        {
LABEL_13:
          v15 = 1;
          goto LABEL_14;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "service");
        v11 = (HMService *)objc_claimAutoreleasedReturnValue();
        if (v11 == self)
        {
          objc_msgSend(v10, "instanceID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "instanceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)_removeCharacteristic:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HMService _hasCharacteristic:](self, "_hasCharacteristic:"))
  {
    -[HMService currentCharacteristics](self, "currentCharacteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

  }
}

- (void)_addCharacteristic:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HMService _hasCharacteristic:](self, "_hasCharacteristic:"))
  {
    -[HMService currentCharacteristics](self, "currentCharacteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)_serviceTypeDescription
{
  void *v2;
  void *v3;

  -[HMService serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMService _serviceTypeAsString:](HMService, "_serviceTypeAsString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMService serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__localizedDescriptionForServiceType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)_hasCharacteristicOfType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMService characteristics](self, "characteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "characteristicType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)nameModifiable
{
  return self->_nameModifiable;
}

- (void)setNameModifiable:(BOOL)a3
{
  self->_nameModifiable = a3;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isUserInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (NSUUID)accessoryUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setCurrentCharacteristics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)lastKnownDiscoveryMode
{
  return self->_lastKnownDiscoveryMode;
}

- (void)setLastKnownDiscoveryMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)lastKnownOperatingStateValue
{
  return self->_lastKnownOperatingStateValue;
}

- (void)setLastKnownOperatingStateValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)lastKnownOperatingStateAbnormalReasonsValue
{
  return self->_lastKnownOperatingStateAbnormalReasonsValue;
}

- (void)setLastKnownOperatingStateAbnormalReasonsValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setTargetAccessoryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)linkedServiceInstanceIDs
{
  return self->_linkedServiceInstanceIDs;
}

- (NSArray)mediaSourceDisplayOrder
{
  return self->_mediaSourceDisplayOrder;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, a3);
}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  return self->_mediaSourceDisplayOrderModifiable;
}

- (void)setMediaSourceDisplayOrderModifiable:(BOOL)a3
{
  self->_mediaSourceDisplayOrderModifiable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
  objc_storeStrong((id *)&self->_linkedServiceInstanceIDs, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_targetAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateAbnormalReasonsValue, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateValue, 0);
  objc_storeStrong((id *)&self->_lastKnownDiscoveryMode, 0);
  objc_storeStrong((id *)&self->_currentCharacteristics, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeObjectURLInternal, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationInternal, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_matterEndpointID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __32__HMService_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __32__HMService_mergeFromNewObject___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added characteristic via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__configureWithContext:service:", v8, *(_QWORD *)(a1 + 32));

}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_126(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateNameForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_252(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateConfiguredNameForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_254(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateAssociatedServiceTypeForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_256(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateServiceSubtypeForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_258(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateConfigurationStateForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMService_mergeFromNewObject___block_invoke_260(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateLastKnownOperatingStateResponseForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __56__HMService_updateConfigurationState_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationState:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __59__HMService_updateAssociatedServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssociatedServiceType:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __42__HMService_updateName_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)initializeCharacteristicDictionaries
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMService_initializeCharacteristicDictionaries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeCharacteristicDictionaries_onceToken != -1)
    dispatch_once(&initializeCharacteristicDictionaries_onceToken, block);
}

+ (NSDictionary)defaultCharacteristicByServiceDictionary
{
  objc_msgSend(a1, "initializeCharacteristicDictionaries");
  return (NSDictionary *)(id)_defaultCharacteristicByServiceDictionary;
}

+ (NSSet)characteristicBlacklistForShortcutConditions
{
  objc_msgSend(a1, "initializeCharacteristicDictionaries");
  return (NSSet *)(id)_characteristicBlacklistForShortcutConditions;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49 != -1)
    dispatch_once(&logCategory__hmf_once_t49, &__block_literal_global_52316);
  return (id)logCategory__hmf_once_v50;
}

+ (int64_t)_mapToServiceConfigurationStateFromIsConfiguredValue:(id)a3
{
  uint64_t v3;
  int64_t v4;

  if (!a3)
    return 1;
  v3 = objc_msgSend(a3, "integerValue");
  v4 = 3;
  if (v3 != 1)
    v4 = 1;
  if (v3)
    return v4;
  else
    return 2;
}

+ (id)_mapToIsConfiguredValueFromServiceConfigurationState:(int64_t)a3
{
  void *v3;

  v3 = &unk_1E3B2E830;
  if (a3 != 3)
    v3 = 0;
  if (a3 == 2)
    return &unk_1E3B2E818;
  else
    return v3;
}

void __24__HMService_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v50;
  logCategory__hmf_once_v50 = v0;

}

void __49__HMService_initializeCharacteristicDictionaries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("DefaultCharacteristics.plist"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v25;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v10;
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot load default characteristic map from %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("defaultCharacteristicByService"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_defaultCharacteristicByServiceDictionary;
  _defaultCharacteristicByServiceDictionary = v11;

  if (!_defaultCharacteristicByServiceDictionary)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v16;
      v28 = 2112;
      v29 = CFSTR("defaultCharacteristicByService");
      v30 = 2112;
      v31 = v4;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot load %@ map from %@: plist %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
  }
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("characteristicBlacklistForShortcutConditions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_characteristicBlacklistForShortcutConditions;
  _characteristicBlacklistForShortcutConditions = v19;

  if (!_characteristicBlacklistForShortcutConditions)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v24;
      v28 = 2112;
      v29 = CFSTR("characteristicBlacklistForShortcutConditions");
      v30 = 2112;
      v31 = v4;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot load %@ map from %@: plist %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v21);
  }

}

@end
