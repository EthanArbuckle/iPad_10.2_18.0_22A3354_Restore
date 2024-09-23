@implementation HMDService

- (NSString)contextID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService instanceID](self, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSUUID)contextSPIUniqueIdentifier
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
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1880];
  -[HMDService accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextSPIUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v6, v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v11;
}

- (HMDService)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDService)initWithTransaction:(id)a3 accessory:(id)a4 owner:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDService *v16;
  void *v17;
  uint64_t v18;
  NSString *configuredName;
  void *v20;
  uint64_t v21;
  NSString *providedName;
  uint64_t v23;
  NSString *serviceType;
  uint64_t v25;
  NSString *associatedServiceType;
  uint64_t v27;
  NSString *serviceSubtype;
  uint64_t v29;
  NSNumber *labelIndex;
  uint64_t v31;
  NSNumber *labelNamespace;
  uint64_t v33;
  NSNumber *configurationState;
  uint64_t v35;
  NSArray *linkedServices;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *expectedConfiguredName;
  void *v41;
  uint64_t v42;
  NSString *lastSeenConfiguredName;
  uint64_t v44;
  NSNumber *lastKnownOperatingState;
  uint64_t v46;
  NSNumber *lastKnownOperatingStateAbnormalReasons;
  uint64_t v48;
  NSNumber *mediaSourceIdentifier;
  uint64_t v50;
  NSArray *mediaSourceDisplayOrder;
  uint64_t v52;
  NSNumber *matterEndpointID;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  HMDCharacteristic *v63;
  void *v64;
  HMDCharacteristic *v65;
  uint64_t v66;
  NSArray *characteristics;
  HMDService *v68;
  HMDService *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "instanceID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_msgSend(v8, "uuid"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend(v8, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDService initWithAccessory:owner:instance:uuid:](self, "initWithAccessory:owner:instance:uuid:", v9, v10, v14, v15);

    if (v16)
    {
      v74 = v9;
      objc_msgSend(v8, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hm_truncatedNameString");
      v18 = objc_claimAutoreleasedReturnValue();
      configuredName = v16->_configuredName;
      v16->_configuredName = (NSString *)v18;

      objc_msgSend(v8, "providedName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hm_truncatedNameString");
      v21 = objc_claimAutoreleasedReturnValue();
      providedName = v16->_providedName;
      v16->_providedName = (NSString *)v21;

      objc_msgSend(v8, "serviceType");
      v23 = objc_claimAutoreleasedReturnValue();
      serviceType = v16->_serviceType;
      v16->_serviceType = (NSString *)v23;

      objc_msgSend(v8, "associatedServiceType");
      v25 = objc_claimAutoreleasedReturnValue();
      associatedServiceType = v16->_associatedServiceType;
      v16->_associatedServiceType = (NSString *)v25;

      objc_msgSend(v8, "serviceSubtype");
      v27 = objc_claimAutoreleasedReturnValue();
      serviceSubtype = v16->_serviceSubtype;
      v16->_serviceSubtype = (NSString *)v27;

      objc_msgSend(v8, "labelIndex");
      v29 = objc_claimAutoreleasedReturnValue();
      labelIndex = v16->_labelIndex;
      v16->_labelIndex = (NSNumber *)v29;

      objc_msgSend(v8, "labelNamespace");
      v31 = objc_claimAutoreleasedReturnValue();
      labelNamespace = v16->_labelNamespace;
      v16->_labelNamespace = (NSNumber *)v31;

      objc_msgSend(v8, "configurationState");
      v33 = objc_claimAutoreleasedReturnValue();
      configurationState = v16->_configurationState;
      v16->_configurationState = (NSNumber *)v33;

      objc_msgSend(v8, "linkedServices");
      v35 = objc_claimAutoreleasedReturnValue();
      linkedServices = v16->_linkedServices;
      v16->_linkedServices = (NSArray *)v35;

      objc_msgSend(v8, "serviceProperties");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_serviceProperties = objc_msgSend(v37, "unsignedIntegerValue");

      objc_msgSend(v8, "expectedConfiguredName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "hm_truncatedNameString");
      v39 = objc_claimAutoreleasedReturnValue();
      expectedConfiguredName = v16->_expectedConfiguredName;
      v16->_expectedConfiguredName = (NSString *)v39;

      objc_msgSend(v8, "lastSeenConfiguredNameLocal");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "hm_truncatedNameString");
      v42 = objc_claimAutoreleasedReturnValue();
      lastSeenConfiguredName = v16->_lastSeenConfiguredName;
      v16->_lastSeenConfiguredName = (NSString *)v42;

      objc_msgSend(v8, "lastKnownOperatingState");
      v44 = objc_claimAutoreleasedReturnValue();
      lastKnownOperatingState = v16->_lastKnownOperatingState;
      v16->_lastKnownOperatingState = (NSNumber *)v44;

      objc_msgSend(v8, "lastKnownOperatingStateAbnormalReasons");
      v46 = objc_claimAutoreleasedReturnValue();
      lastKnownOperatingStateAbnormalReasons = v16->_lastKnownOperatingStateAbnormalReasons;
      v16->_lastKnownOperatingStateAbnormalReasons = (NSNumber *)v46;

      objc_msgSend(v8, "mediaSourceIdentifier");
      v48 = objc_claimAutoreleasedReturnValue();
      mediaSourceIdentifier = v16->_mediaSourceIdentifier;
      v16->_mediaSourceIdentifier = (NSNumber *)v48;

      objc_msgSend(v8, "mediaSourceDisplayOrder");
      v50 = objc_claimAutoreleasedReturnValue();
      mediaSourceDisplayOrder = v16->_mediaSourceDisplayOrder;
      v16->_mediaSourceDisplayOrder = (NSArray *)v50;

      objc_msgSend(v8, "matterEndpointID");
      v52 = objc_claimAutoreleasedReturnValue();
      matterEndpointID = v16->_matterEndpointID;
      v16->_matterEndpointID = (NSNumber *)v52;

      v54 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v8, "characteristics");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "arrayWithCapacity:", objc_msgSend(v55, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v75 = v8;
      objc_msgSend(v8, "characteristics");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v59; ++i)
          {
            if (*(_QWORD *)v77 != v60)
              objc_enumerationMutation(v57);
            v62 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
            v63 = [HMDCharacteristic alloc];
            -[HMDService accessory](v16, "accessory");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = -[HMDCharacteristic initWithCharacteristic:service:accessory:](v63, "initWithCharacteristic:service:accessory:", v62, v16, v64);

            objc_msgSend(v56, "addObject:", v65);
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        }
        while (v59);
      }

      v66 = objc_msgSend(v56, "copy");
      characteristics = v16->_characteristics;
      v16->_characteristics = (NSArray *)v66;

      -[HMDService _updateDefaultName](v16, "_updateDefaultName");
      -[HMDService _createNotification](v16, "_createNotification");

      v9 = v74;
      v8 = v75;
    }
    v68 = v16;
    v69 = v68;
  }
  else
  {
    v70 = (void *)MEMORY[0x227676638]();
    v68 = self;
    HMFGetOSLogHandle();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v72;
      v83 = 2112;
      v84 = v8;
      _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@unable to init service with a transaction (null instance ID?): %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v70);
    v69 = 0;
  }

  return v69;
}

- (HMDService)initWithAccessory:(id)a3 owner:(id)a4 instance:(id)a5 uuid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDService *v14;
  HMDService *v15;
  NSNumber **p_instanceID;
  void *v17;
  HMDService *v18;
  NSObject *v19;
  void *v20;
  NSNumber *v21;
  void *v22;
  void *v23;
  id *p_uuid;
  void *v25;
  HMDService *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDService *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSUUID *cachedAccessoryUUID;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)HMDService;
  v14 = -[HMDService init](&v41, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_owner, v11);
    p_instanceID = &v15->_instanceID;
    objc_storeStrong((id *)&v15->_instanceID, a5);
    if (!v15->_instanceID)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v15;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v20;
        v44 = 2112;
        v45 = v10;
        v46 = 2112;
        v47 = &unk_24E96B3A8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@*** DEBUG THIS : FATAL ERROR : File a Radar : HomeKit | New Bugs *** :Service ID cannot be null for accessory : %@Assigning a default instance ID : %@", buf, 0x20u);

        v17 = v39;
      }

      objc_autoreleasePoolPop(v17);
      v21 = *p_instanceID;
      *p_instanceID = (NSNumber *)&unk_24E96B3A8;

    }
    objc_msgSend(v10, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v22, *p_instanceID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    p_uuid = (id *)&v15->_uuid;
    if (v13)
    {
      objc_storeStrong(p_uuid, a6);
      if ((objc_msgSend(v13, "isEqual:", v23) & 1) != 0)
      {
LABEL_13:
        objc_msgSend(v10, "uuid");
        v35 = objc_claimAutoreleasedReturnValue();
        cachedAccessoryUUID = v15->_cachedAccessoryUUID;
        v15->_cachedAccessoryUUID = (NSUUID *)v35;

        goto LABEL_14;
      }
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v15;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v40 = v12;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v43 = v28;
        v44 = 2112;
        v45 = v29;
        v46 = 2112;
        v47 = v30;
        v48 = 2112;
        v49 = v31;
        v50 = 2112;
        v51 = v40;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@HMDService initWithAccessory Service UUID %@ but has a calculated UUID of %@ (%@/%@)", buf, 0x34u);

        v12 = v40;
        v25 = v38;
      }
    }
    else
    {
      objc_storeStrong(p_uuid, v23);
      v25 = (void *)MEMORY[0x227676638]();
      v32 = v15;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2112;
        v45 = v34;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@HMDService initWithAccessory, calculated UUID of %@ (using calc'd value)", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v25);
    goto LABEL_13;
  }
LABEL_14:

  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDService messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDService home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDService;
  -[HMDService dealloc](&v6, sel_dealloc);
}

- (void)_recalculateUUID
{
  NSUUID *v3;
  void *v4;
  NSUUID *v5;
  NSUUID *cachedAccessoryUUID;
  id WeakRetained;
  void *v8;
  NSUUID *v9;
  NSUUID *uuid;
  void *v11;
  HMDService *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSNumber *instanceID;
  void *v21;
  NSUUID *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSNumber *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = self->_uuid;
  -[HMDService accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  cachedAccessoryUUID = self->_cachedAccessoryUUID;
  self->_cachedAccessoryUUID = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_msgSend(WeakRetained, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v8, self->_instanceID);
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v9;

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v21 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v3, "UUIDString");
    v22 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_uuid, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)&self->_accessory);
    objc_msgSend(v17, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    instanceID = self->_instanceID;
    *(_DWORD *)buf = 138544386;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = instanceID;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@recalculated UUID of service %@ -> %@ (%@/%@)", buf, 0x34u);

    v3 = v22;
    v11 = v21;
  }

  objc_autoreleasePoolPop(v11);
}

- (NSUUID)uuid
{
  id WeakRetained;
  void *v4;
  char v5;
  int *v6;
  void *v7;
  HMDService *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_msgSend(WeakRetained, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->_cachedAccessoryUUID);

  v6 = &OBJC_IVAR___HMDThreadMonitor_ttrEnabled;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v7;
      HMFGetLogIdentifier();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[NSUUID UUIDString](v8->_uuid, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_accessory);
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUUID UUIDString](self->_cachedAccessoryUUID, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v17;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HMDService %@ Accessory UUID is stale (%@!=%@).", buf, 0x2Au);

      v7 = v18;
    }

    objc_autoreleasePoolPop(v7);
    v6 = &OBJC_IVAR___HMDThreadMonitor_ttrEnabled;
    -[HMDService _recalculateUUID](v8, "_recalculateUUID");
  }
  v15 = *(id *)((char *)&self->super.super.isa + v6[846]);
  os_unfair_recursive_lock_unlock();
  return (NSUUID *)v15;
}

- (NSUUID)spiClientIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spiClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_instanceID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  spiClientIdentifierForUUIDAndSalts(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v7;
}

- (NSArray)characteristics
{
  NSArray *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_characteristics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setCharacteristics:(id)a3
{
  NSArray *v4;
  NSArray *characteristics;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  characteristics = self->_characteristics;
  self->_characteristics = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService instanceID](self, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@/%@/%@/%@"), v5, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)dumpState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  __CFString *v91;
  __CFString *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __CFString *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  -[HMDService associatedServiceType](self, "associatedServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService associatedServiceType](self, "associatedServiceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptionForServiceType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR(", associatedServiceType: %@"), v8);
    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v103 = &stru_24E79DB48;
  }
  -[HMDService serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x24BE1B908];
  if (objc_msgSend(v9, "hasSuffix:", *MEMORY[0x24BE1B908]))
  {
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - objc_msgSend(v10, "length"));
    v11 = objc_claimAutoreleasedReturnValue();

    v102 = (void *)v11;
  }
  else
  {
    v102 = v9;
  }
  v83 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[HMDService linkedServices](self, "linkedServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v109 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
        if (objc_msgSend(v12, "length"))
        {
          objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(", "));
          v19 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v19;
        }
        v20 = v12;
        objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@"), v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    }
    while (v15);
  }

  v95 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService instanceID](self, "instanceID");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService name](self, "name");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[HMDService serviceProperties](self, "serviceProperties");
  -[HMDService isPrimary](self, "isPrimary");
  HMFBooleanToString();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService isCustom](self, "isCustom");
  HMFBooleanToString();
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService isHidden](self, "isHidden");
  HMFBooleanToString();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDService isHidden](self, "isHidden");
  if (v21)
  {
    v84 = &stru_24E79DB48;
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService urlString](self, "urlString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR(", assistantIdentifier: %@"), v61);
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v82 = objc_msgSend(v12, "length");
  if (v82)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", Links: %@"), v12);
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = &stru_24E79DB48;
  }
  -[HMDService serviceSubtype](self, "serviceSubtype");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService serviceSubtype](self, "serviceSubtype");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR(", subType: %@"), v73);
    v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v92 = &stru_24E79DB48;
  }
  -[HMDService labelIndex](self, "labelIndex");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService labelIndex](self, "labelIndex");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR(", labelIndex: %@"), v72);
    v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v91 = &stru_24E79DB48;
  }
  -[HMDService labelNamespace](self, "labelNamespace");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService labelNamespace](self, "labelNamespace");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR(", labelNamespace: %@"), v71);
    v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v90 = &stru_24E79DB48;
  }
  -[HMDService configurationState](self, "configurationState");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService configurationState](self, "configurationState");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR(", configurationState: %@"), v70);
    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89 = &stru_24E79DB48;
  }
  -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR(", expectedConfiguredName: %@"), v69);
    v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v88 = &stru_24E79DB48;
  }
  -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR(", lastSeenConfiguredName: %@"), v68);
    v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v87 = &stru_24E79DB48;
  }
  -[HMDService lastKnownDiscoveryMode](self, "lastKnownDiscoveryMode");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v33 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService lastKnownDiscoveryMode](self, "lastKnownDiscoveryMode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR(", lastKnownDiscoveryMode: %@"), v67);
    v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = &stru_24E79DB48;
  }
  -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v24;
  if (v74)
  {
    v34 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "integerValue");
    HAPOperatingStateAsString();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR(", lastKnownOperatingState: %@"), v65);
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v85 = &stru_24E79DB48;
  }
  -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)v26;
  if (v35)
  {
    v36 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "unsignedIntegerValue");
    HAPOperatingStateAbnormalReasonsAsString();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR(", lastKnownOperatingStateAbnormalReasons: %@"), v63);
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = &stru_24E79DB48;
  }
  v77 = (void *)v28;
  -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v30;
  if (v38)
  {
    v39 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR(", mediaSourceIdentifier: %@"), v62);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = &stru_24E79DB48;
  }
  -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
    v43 = v21;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR(", mediaSourceDisplayOrder: %@"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "stringWithFormat:", CFSTR("instanceID: %@, type: %@, name: %@, properties: 0x%lx, primary: %@, custom: %@, hidden: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), v101, v102, v100, v78, v99, v98, v97, v84, v103, v93, v92, v91, v90, v89, v88, v87,
      v86,
      v85,
      v37,
      v40,
      v45);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v43;
  }
  else
  {
    objc_msgSend(v95, "stringWithFormat:", CFSTR("instanceID: %@, type: %@, name: %@, properties: 0x%lx, primary: %@, custom: %@, hidden: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), v101, v102, v100, v78, v99, v98, v97, v84, v103, v93, v92, v91, v90, v89, v88, v87,
      v86,
      v85,
      v37,
      v40,
      &stru_24E79DB48);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v38)
  {

  }
  if (v35)
  {

  }
  if (v74)
  {

  }
  if (v94)
  {

  }
  if (v75)
  {

  }
  if (v76)
  {

  }
  if (v77)
  {

  }
  if (v79)
  {

  }
  if (v80)
  {

  }
  if (v81)
  {

  }
  if (v82)

  if (!v21)
  {

  }
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v96, *MEMORY[0x24BE3EB68]);
  -[HMDService appData](self, "appData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dumpState");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v47, *MEMORY[0x24BE3EA58]);

  -[HMDService characteristics](self, "characteristics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v48, "count"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v50 = v48;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v105 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "dumpState");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
      }
      while (v52);
    }

    objc_msgSend(v83, "setObject:forKeyedSubscript:", v49, *MEMORY[0x24BE3EA90]);
  }
  -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dumpState");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v58, *MEMORY[0x24BE3EA88]);

  }
  v59 = v83;

  return v59;
}

- (NSString)type
{
  void *v2;
  void *v3;

  -[HMDService serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSNumber)instanceID
{
  return (NSNumber *)(id)-[NSNumber copy](self->_instanceID, "copy");
}

- (NSString)serviceIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService instanceID](self, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)home
{
  void *v2;
  void *v3;

  -[HMDService accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCustom
{
  void *v2;
  void *v3;

  -[HMDService serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("-0000-1000-8000-0026BB765291")) ^ 1;
  return (char)v2;
}

- (NSString)providedName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_providedName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setProvidedName:(id)a3
{
  NSString *v4;
  NSString *providedName;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  providedName = self->_providedName;
  self->_providedName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)configuredName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_configuredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)expectedConfiguredName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_expectedConfiguredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setExpectedConfiguredName:(id)a3
{
  NSString *v4;
  NSString *expectedConfiguredName;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  expectedConfiguredName = self->_expectedConfiguredName;
  self->_expectedConfiguredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)lastSeenConfiguredName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lastSeenConfiguredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setLastSeenConfiguredName:(id)a3
{
  NSString *v4;
  NSString *lastSeenConfiguredName;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastSeenConfiguredName = self->_lastSeenConfiguredName;
  self->_lastSeenConfiguredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDApplicationData)appData
{
  HMDApplicationData *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_appData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setAppData:(id)a3
{
  HMDApplicationData *v4;
  HMDApplicationData *appData;

  v4 = (HMDApplicationData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  appData = self->_appData;
  self->_appData = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)_handleSetAppData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __CFString *v10;
  void *v11;
  void *v12;
  HMDService *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDApplicationData *v17;
  HMDApplicationData *v18;
  HMDApplicationData *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDService *v32;
  NSObject *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDService accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v4, "messagePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("com.apple.homekit-entitledclient.identifer");
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("kAppDataInformationKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v15;
      v42 = 2112;
      v43 = CFSTR("com.apple.homekit-entitledclient.identifer");
      v44 = 2112;
      v45 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating application data for: %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDService appData](v13, "appData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (HMDApplicationData *)objc_msgSend(v16, "copy");
    v18 = v17;
    if (v11)
    {
      if (!v17)
      {
        v19 = [HMDApplicationData alloc];
        -[HMDService uuid](v13, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[HMDApplicationData initWithParentUUID:](v19, "initWithParentUUID:", v20);

      }
      -[HMDApplicationData setApplicationData:forIdentifier:](v18, "setApplicationData:forIdentifier:", v11, CFSTR("com.apple.homekit-entitledclient.identifer"));
      -[HMDApplicationData modelObjectWithChangeType:](v18, "modelObjectWithChangeType:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v16)
        objc_msgSend(v21, "setObjectChangeType:", 1);
      v39 = v16;
      objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("kAppDataInformationKey"));
      if (v22)
        goto LABEL_10;
    }
    else
    {
      -[HMDApplicationData removeApplicationDataForIdentifier:](v17, "removeApplicationDataForIdentifier:", CFSTR("com.apple.homekit-entitledclient.identifer"));
      if (!v18)
      {
LABEL_17:
        objc_msgSend(v4, "respondWithPayload:", 0);
        goto LABEL_18;
      }
      v39 = v16;
      -[HMDApplicationData modelObjectWithChangeType:](v18, "modelObjectWithChangeType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
LABEL_10:
        objc_msgSend(v6, "backingStore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v24 = v11;
        v25 = v4;
        v26 = v6;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "transaction:options:", v27, v28);
        v38 = v9;
        v29 = v5;
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v26;
        v4 = v25;
        v11 = v24;

        objc_msgSend(v30, "add:withMessage:", v22, v4);
        objc_msgSend(v30, "run");

        v5 = v29;
        v9 = v38;

        v16 = v39;
LABEL_18:

        v37 = CFSTR("com.apple.homekit-entitledclient.identifer");
        goto LABEL_19;
      }
    }
    v16 = v39;
    goto LABEL_17;
  }
  v31 = (void *)MEMORY[0x227676638]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HMDService name](v32, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v34;
    v42 = 2112;
    v43 = v35;
    v44 = 2112;
    v45 = v36;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to set appData on an accessory %@ service '%@' that is no longer part of a home", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(v4, "responseHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 12);
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, __CFString *, _QWORD))v9)[2](v9, v37, 0);
LABEL_19:

}

- (id)configureWithService:(id)a3 accessory:(id)a4
{
  return -[HMDService configureWithService:accessory:shouldRead:added:](self, "configureWithService:accessory:shouldRead:added:", a3, a4, 1, 0);
}

- (id)_sanitizeNameToWriteToAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDService *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  HMDService *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hm_truncatedNameString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    -[HMDService defaultName](self, "defaultName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = (uint64_t)v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Name to write to accessory is nil, writing defaultName %@ to the accessory", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDService findCharacteristicWithType:](v8, "findCharacteristicWithType:", *MEMORY[0x24BDD57F8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maxLength");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (objc_msgSend(v6, "length") > v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v8;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v6, "length");
        v22 = 138543874;
        v23 = v18;
        v24 = 2048;
        v25 = v19;
        v26 = 2048;
        v27 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@DefaultName length %lu larger than accessory supported length %lu - truncating", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v6, "substringToIndex:", v14);
      v20 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v20;
    }

    v5 = v6;
  }

  return v5;
}

- (id)configureWithService:(id)a3 accessory:(id)a4 shouldRead:(BOOL)a5 added:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  BOOL v47;
  __CFString *v48;
  __CFString *v49;
  _BOOL8 v50;
  void *v51;
  HMDService *v52;
  NSObject *v53;
  void *v54;
  const __CFString *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDService *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __CFString *v94;
  void *v95;
  HMDService *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  int v102;
  void *v103;
  __CFString *v104;
  void *v105;
  HMDService *v106;
  NSObject *v107;
  void *v108;
  __CFString *v109;
  __CFString *v110;
  void *v111;
  int v112;
  void *v113;
  HMDService *v114;
  NSObject *v115;
  void *v116;
  _BOOL4 v118;
  id v119;
  void *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  const __CFString *v124;
  const __CFString *v125;
  void *v126;
  __CFString *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  id v133;
  id obj;
  HMDService *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  const __CFString *v151;
  __int16 v152;
  const __CFString *v153;
  __int16 v154;
  const __CFString *v155;
  __int16 v156;
  void *v157;
  __int16 v158;
  void *v159;
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v118 = a5;
  v164 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v119 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService characteristics](self, "characteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v132 = v8;
  objc_msgSend(v8, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = self;
  -[HMDService accessory](self, "accessory");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "home");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "notificationRegistrations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v13, "count");

  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  obj = v9;
  v136 = v12;
  v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v163, 16);
  if (v139)
  {
    v14 = CFSTR("H");
    v137 = *(_QWORD *)v145;
    if (!v131)
      v14 = &stru_24E79DB48;
    v122 = v14;
    v130 = *MEMORY[0x24BE1B780];
    do
    {
      for (i = 0; i != v139; ++i)
      {
        if (*(_QWORD *)v145 != v137)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v17 = v138;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v140, v162, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v141;
LABEL_10:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v141 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v21);
            objc_msgSend(v16, "characteristicType");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqual:", v24);

            if ((v25 & 1) != 0)
              break;
            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v140, v162, 16);
              if (v19)
                goto LABEL_10;
              v26 = v17;
              v12 = v136;
              goto LABEL_61;
            }
          }
          v26 = v22;

          v12 = v136;
          if (!v26)
            continue;
          objc_msgSend(v16, "lastKnownValueUpdateTime");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
          v29 = v28;

          objc_msgSend(v16, "configureWithCharacteristic:", v26);
          objc_msgSend(v26, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "type");
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setProhibitCaching:", objc_msgSend(v136, "requiresDeviceUnlock:forService:", v30, v31));

          objc_msgSend(v16, "type");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v31) = objc_msgSend(v32, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));

          if ((v31 & 1) == 0)
          {
            -[HMDService type](v135, "type");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = v29;
            if (objc_msgSend(v33, "isEqualToString:", v130))
            {
              objc_msgSend(v16, "type");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("000000A6-0000-1000-8000-0026BB765291"));

            }
            else
            {
              v35 = 0;
            }

            objc_msgSend(v16, "service");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "type");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDService type](v135, "type");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v136, "shouldAutoEnableNotificationForCharacteristic:ofService:", v37, v38);

            if (v131)
            {
              objc_msgSend(v16, "type");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "type");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v136, "shouldEnableHomeNotificationForCharacteristicType:serviceType:", v40, v41);

            }
            else
            {
              v42 = 0;
            }
            objc_msgSend(v16, "type");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDService type](v135, "type");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v136, "shouldFilterEnableNotificationsForCharacteristicType:serviceType:", v43, v44);

            if ((objc_msgSend(v16, "properties") & 1) != 0)
            {
              v46 = v42 & ~v45;
              if (v39 | v35 | v46)
              {
                v47 = v46 == 0;
                v48 = CFSTR("com.apple.HomeKitDaemon");
                if (!v47)
                  v48 = CFSTR("com.apple.HomeKitDaemon.homeNotifications");
                if (v39)
                  v48 = CFSTR("com.apple.HomeKitDaemon.autoEnableNotification");
                v49 = v48;
                v50 = isWatch();
                v51 = (void *)MEMORY[0x227676638](v50);
                v52 = v135;
                HMFGetOSLogHandle();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v127 = v49;
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = &stru_24E79DB48;
                  if (v39)
                    v56 = CFSTR("A");
                  else
                    v56 = &stru_24E79DB48;
                  if (v35)
                    v55 = CFSTR("F");
                  v124 = v55;
                  v125 = v56;
                  -[HMDService accessory](v52, "accessory");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "name");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "instanceID");
                  v129 = v36;
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "type");
                  v128 = v51;
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  HAPShortUUIDType();
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544898;
                  v149 = v54;
                  v150 = 2112;
                  v151 = v125;
                  v152 = 2112;
                  v153 = v124;
                  v154 = 2112;
                  v155 = v122;
                  v156 = 2112;
                  v157 = v57;
                  v158 = 2112;
                  v159 = v58;
                  v160 = 2112;
                  v161 = v60;
                  _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Enabling notifications on behalf of homed(%@%@%@) for characteristic %@(%@/%@)", buf, 0x48u);

                  v51 = v128;
                  v36 = v129;

                  v49 = v127;
                }

                objc_autoreleasePoolPop(v51);
                objc_msgSend(v16, "setNotificationEnabled:forClientIdentifier:", 1, v49);

              }
            }
            v12 = v136;
            v29 = v133;
            if (objc_msgSend(v16, "isNotificationEnabled"))
            {
              v61 = (void *)MEMORY[0x227676638]();
              v62 = v135;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "shortDescription");
                v65 = v36;
                v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "notificationRegistrations");
                v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v149 = v64;
                v150 = 2112;
                v151 = v66;
                v152 = 2112;
                v153 = v67;
                _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Notifications are enabled for characteristic %@ on behalf of %@", buf, 0x20u);

                v36 = v65;
                v29 = v133;
                v12 = v136;
              }

              objc_autoreleasePoolPop(v61);
            }

          }
          objc_msgSend(v26, "valueUpdatedTime");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "compare:", v68) == -1)
          {
            objc_msgSend(v26, "valueUpdatedTime");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v69, "isEqualToDate:", v70);

            if ((v71 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "value");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
                objc_msgSend(v26, "value");
              else
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v73, CFSTR("kCharacteristicValue"));

              objc_msgSend(v26, "valueUpdatedTime");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, CFSTR("kCharacteristicValueUpdateTime"));

              objc_msgSend(v26, "stateNumber");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
                objc_msgSend(v26, "stateNumber");
              else
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v76, CFSTR("kCharacteristicValueUpdateStateNumberKey"));

              objc_msgSend(v16, "notificationEnabledTime");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v77, CFSTR("kCharacteristicNotificationEnableTime"));

              objc_msgSend(v26, "notificationContext");
              v78 = (void *)objc_claimAutoreleasedReturnValue();

              if (v78)
              {
                objc_msgSend(v26, "notificationContext");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "setObject:forKeyedSubscript:", v79, CFSTR("kCharacteristicNotificationContextKey"));

              }
              objc_msgSend(v26, "instanceID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "setObject:forKey:", v68, v80);

              goto LABEL_59;
            }
          }
          else
          {
LABEL_59:

          }
          goto LABEL_61;
        }
        v26 = v17;
LABEL_61:

      }
      v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v163, 16);
    }
    while (v139);
  }

  v81 = v132;
  if (v118)
  {
    objc_msgSend(v132, "type");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "isEqualToString:", *MEMORY[0x24BDD6B38]))
    {

    }
    else
    {
      objc_msgSend(v132, "type");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "isEqualToString:", *MEMORY[0x24BE1B788]);

      if (!(_DWORD)v84)
      {
LABEL_71:
        -[HMDService _readRequiredCharacteristicValuesForceReadFWVersion:](v135, "_readRequiredCharacteristicValuesForceReadFWVersion:", v84);
        goto LABEL_72;
      }
    }
    objc_msgSend(v132, "accessory");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "server");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "configNumber");
    v88 = objc_msgSend(v121, "configNumber");
    v47 = v87 == v88;
    v84 = v87 != v88;
    if (!v47)
      objc_msgSend(v121, "setConfigNumber:", objc_msgSend(v86, "configNumber"));

    goto LABEL_71;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v123, "count"))
    objc_msgSend(v89, "setObject:forKey:", v123, CFSTR("kModifiedCharacteristicsForAccessoryKey"));
  -[HMDService _updateDefaultName](v135, "_updateDefaultName");
  -[HMDService findCharacteristicWithType:](v135, "findCharacteristicWithType:", *MEMORY[0x24BDD57F8]);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    objc_msgSend(v90, "value");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v93 = v92;
    else
      v93 = 0;
    v94 = v93;

    if (!-[__CFString length](v94, "length"))
    {

      v94 = 0;
    }
    if (-[HMDService shouldUpdateLastSeenConfiguredName:](v135, "shouldUpdateLastSeenConfiguredName:", v94))
    {
      v95 = (void *)MEMORY[0x227676638]();
      v96 = v135;
      HMFGetOSLogHandle();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v149 = v98;
        v150 = 2112;
        v151 = v94;
        _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_DEFAULT, "%{public}@Creating a transaction to save accessory reported name (%@) as expected and configured name", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v95);
      -[HMDService _saveCurrentNameAsExpectedAndLastSeen:](v96, "_saveCurrentNameAsExpectedAndLastSeen:", v94);
    }
    else if (objc_msgSend(v120, "isOwnerUser"))
    {
      if (objc_msgSend(v91, "supportsWrite"))
      {
        -[HMDService expectedConfiguredName](v135, "expectedConfiguredName");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = HMFEqualObjects();

        if ((v100 & 1) == 0)
        {
          -[HMDService lastSeenConfiguredName](v135, "lastSeenConfiguredName");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = HMFEqualObjects();

          if (v102)
          {
            -[HMDService expectedConfiguredName](v135, "expectedConfiguredName");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDService _sanitizeNameToWriteToAccessory:](v135, "_sanitizeNameToWriteToAccessory:", v103);
            v104 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v105 = (void *)MEMORY[0x227676638]();
            v106 = v135;
            HMFGetOSLogHandle();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDService name](v106, "name");
              v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
              -[HMDService lastSeenConfiguredName](v106, "lastSeenConfiguredName");
              v110 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v149 = v108;
              v150 = 2112;
              v151 = v104;
              v152 = 2112;
              v153 = v109;
              v154 = 2112;
              v155 = v110;
              _os_log_impl(&dword_2218F0000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@Overwriting configured name since expected name does not match expected: %@, name: %@, lastSeen: %@", buf, 0x2Au);

              v12 = v136;
              v81 = v132;

            }
            objc_autoreleasePoolPop(v105);
            -[HMDService _writeConfiguredNameToAccessory:](v106, "_writeConfiguredNameToAccessory:", v104);

          }
        }
      }
    }

  }
  objc_msgSend(v81, "type");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "isEqualToString:", *MEMORY[0x24BDD6B70]);

  if (v112)
  {
    v113 = (void *)MEMORY[0x227676638]();
    v114 = v135;
    HMFGetOSLogHandle();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v149 = v116;
      _os_log_impl(&dword_2218F0000, v115, OS_LOG_TYPE_DEBUG, "%{public}@Service is camera recording management, sending kick notification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v113);
    logAndPostNotification(CFSTR("HMDRecordingManagementServiceDidUpdateNotification"), v121, 0);
  }

  return v89;
}

- (void)_createNotification
{
  void *v3;
  void *v4;
  HMDBulletinBoardNotification *v5;
  HMDBulletinBoardNotification *bulletinBoardNotification;
  id v7;

  if (-[HMDService _supportsBulletinNotification](self, "_supportsBulletinNotification"))
  {
    -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[HMDService home](self, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryBulletinNotificationManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "bulletinBoardNotificationForService:", self);
      v5 = (HMDBulletinBoardNotification *)objc_claimAutoreleasedReturnValue();
      bulletinBoardNotification = self->_bulletinBoardNotification;
      self->_bulletinBoardNotification = v5;

    }
  }
}

- (BOOL)_supportsBulletinNotification
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!+[HMDDeviceCapabilities supportsBulletinBoard](HMDDeviceCapabilities, "supportsBulletinBoard"))
    return 0;
  -[HMDService serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HMDBulletinBoard isBulletinSupportedForCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForCharacteristicType:serviceType:", 0, v3))
  {
    v4 = 1;
  }
  else
  {
    -[HMDService serviceType](self, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:](HMDBulletinBoardNotification, "supportsBulletinNotificationGroup:", v5);

  }
  return v4;
}

- (void)_shouldServiceBeHidden
{
  HMDService *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  HMDService *v18;
  uint64_t v19;
  void *v20;
  HMDService *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = self;
  v27 = *MEMORY[0x24BDAC8D0];
  if ((-[HMDService serviceProperties](self, "serviceProperties") & 2) != 0
    || (-[HMDService type](v2, "type"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6B38]),
        v3,
        v4))
  {
    -[HMDService setHidden:](v2, "setHidden:", 1);
  }
  else
  {
    -[HMDService characteristics](v2, "characteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v8 = v7;
        v20 = v5;
        v21 = v2;
        v9 = *(_QWORD *)v23;
        v10 = *MEMORY[0x24BDD5928];
        v11 = *MEMORY[0x24BDD57F8];
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v13, "type", v20, v21, (_QWORD)v22);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqualToString:", v10))
            {

            }
            else
            {
              objc_msgSend(v13, "type");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v11);

              if ((v16 & 1) == 0 && (objc_msgSend(v13, "properties") & 0x40) == 0)
              {
                v17 = 0;
                goto LABEL_19;
              }
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v8)
            continue;
          break;
        }
        v17 = 1;
LABEL_19:
        v5 = v20;
        v2 = v21;
      }
      else
      {
        v17 = 1;
      }

      v18 = v2;
      v19 = v17;
    }
    else
    {
      v18 = v2;
      v19 = 0;
    }
    -[HMDService setHidden:](v18, "setHidden:", v19);

  }
}

- (id)_updateProvidedName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDService *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSString *providedName;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDService name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[HMDService validateProvidedName:](HMDService, "validateProvidedName:", v4))
  {
    providedName = self->_providedName;
    self->_providedName = 0;

LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Filling provided name with %@ from name characteristic", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDService setProvidedName:](v7, "setProvidedName:", v4);
  -[HMDService name](v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
    goto LABEL_7;
  -[HMDService nameChangedMessage](v7, "nameChangedMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v12;
}

- (BOOL)isReadingRequiredForBTLEServiceCharacteristic:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  BOOL v25;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD5928]);

  if (v6)
  {
    -[HMDService providedName](self, "providedName");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v16 = (void *)v7;
    goto LABEL_22;
  }
  objc_msgSend(v4, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD57F8]);

  if (v9)
  {
    -[HMDService getLastSeenConfiguredName](self, "getLastSeenConfiguredName");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[HMDService serviceType](self, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD6BE0]) & 1) != 0)
  {
    objc_msgSend(v4, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD58E0]);

    if (v12)
    {
      -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  else
  {

  }
  -[HMDService serviceType](self, "serviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD6C70]) & 1) == 0)
  {

LABEL_13:
    objc_msgSend(v4, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("000000CB-0000-1000-8000-0026BB765291"));

    if (v18)
    {
      -[HMDService labelIndex](self, "labelIndex");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("000000CD-0000-1000-8000-0026BB765291"));

      if (v20)
      {
        -[HMDService labelNamespace](self, "labelNamespace");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("000000D5-0000-1000-8000-0026BB765291"));

        if (v22)
        {
          -[HMDService serviceSubtype](self, "serviceSubtype");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("000000D6-0000-1000-8000-0026BB765291"));

          if (!v24)
          {
            v25 = 0;
            goto LABEL_23;
          }
          -[HMDService configurationState](self, "configurationState");
          v7 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("00000136-0000-1000-8000-0026BB765291"));

  if (!v15)
    goto LABEL_13;
  -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v16, "count");
LABEL_22:
  v25 = v7 == 0;

LABEL_23:
  return v25;
}

- (id)gatherRequiredReadRequestsForceReadFWVersion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDService characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isReadingRequiredForBTLEAccessoryCharacteristic:forceReadFWVersion:", v13, v3, (_QWORD)v16) & 1) != 0|| -[HMDService isReadingRequiredForBTLEServiceCharacteristic:](self, "isReadingRequiredForBTLEServiceCharacteristic:", v13))
        {
          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v6, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v6;
}

- (void)_readRequiredCharacteristicValuesForceReadFWVersion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id inited;
  void *v8;
  HMDService *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDService *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id from;
  id location;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService gatherRequiredReadRequestsForceReadFWVersion:](self, "gatherRequiredReadRequestsForceReadFWVersion:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    inited = objc_initWeak(&from, v5);
    v8 = (void *)MEMORY[0x227676638](inited);
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "count");
      -[HMDService serviceType](v9, "serviceType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      v26 = 2048;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reading %lu required characteristics for service %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDService workQueue](v9, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke;
    v19[3] = &unk_24E783590;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    objc_msgSend(v5, "readCharacteristicValues:source:queue:completionHandler:", v6, 7, v14, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@No required characteristics to read", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (id)findCharacteristic:(id)a3
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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDService characteristics](self, "characteristics", 0);
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

- (id)findCharacteristicWithType:(id)a3
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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDService characteristics](self, "characteristics", 0);
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
        objc_msgSend(v9, "type");
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

- (NSString)name
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id WeakRetained;

  v3 = 96;
  if (!-[NSString length](self->_expectedConfiguredName, "length"))
  {
    v3 = 88;
    if (!-[NSString length](self->_configuredName, "length"))
    {
      -[HMDService defaultName](self, "defaultName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        -[HMDService defaultName](self, "defaultName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDService providedName](self, "providedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) == 0)
        {
          -[HMDService defaultName](self, "defaultName");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
      }
      else
      {

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
      objc_msgSend(WeakRetained, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
  v4 = *(id *)((char *)&self->super.super.isa + v3);
LABEL_4:
  v5 = v4;
LABEL_5:
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v6;
}

- (id)_deriveDefaultName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  -[HMDService serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6C88]);

  if (v4)
  {
    -[HMDService labelIndex](self, "labelIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v12 = 0;
      return v12;
    }
    -[HMDService serviceSubtype](self, "serviceSubtype");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD6B10]);

    if (v7)
      v8 = CFSTR("DEFAULT_SPRINKLER_VALVE");
    else
      v8 = CFSTR("DEFAULT_FAUCET_VALVE");
    HMDLocalizedStringForKey(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[HMDService labelIndex](self, "labelIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDService serviceType](self, "serviceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD6C70]))
    {

    }
    else
    {
      -[HMDService serviceType](self, "serviceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291"));

      if (!v15)
      {
        -[HMDService providedName](self, "providedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        return v12;
      }
    }
    -[HMDService accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)_updateDefaultName
{
  id v3;

  -[HMDService _deriveDefaultName](self, "_deriveDefaultName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDService setDefaultName:](self, "setDefaultName:", v3);

}

- (id)_checkIfDefaultNameChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDServiceTransaction *v13;
  void *v14;
  void *v15;
  HMDServiceTransaction *v16;
  void *v17;
  HMDService *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService defaultName](self, "defaultName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService _updateDefaultName](self, "_updateDefaultName");
  -[HMDService defaultName](self, "defaultName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (HMFEqualObjects() & 1) == 0)
  {
    -[HMDService findCharacteristicWithType:](self, "findCharacteristicWithType:", *MEMORY[0x24BDD57F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "supportsWrite") && (!v3 || HMFEqualObjects()))
    {
      v29 = v9;
      objc_msgSend(v7, "backingStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BDD7D58];
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transaction:options:", v11, v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = [HMDServiceTransaction alloc];
      -[HMDService uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v13, "initWithObjectChangeType:uuid:parentUUID:", 2, v14, v15);

      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Creating run transaction for update of expected configured name '%@' due to defaultName change", buf, 0x16u);

        v17 = v27;
      }

      objc_autoreleasePoolPop(v17);
      -[HMDServiceTransaction setExpectedConfiguredName:](v16, "setExpectedConfiguredName:", v5);
      objc_msgSend(v28, "add:withMessage:", v16, 0);
      objc_msgSend(v28, "run");

      v9 = v29;
    }
    v30[0] = CFSTR("kServiceInstanceID");
    -[HMDService instanceID](self, "instanceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("kServiceName");
    v31[0] = v21;
    v31[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc(MEMORY[0x24BE3F1B8]);
    objc_msgSend(v6, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithTarget:", v24);

    objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:destination:payload:", *MEMORY[0x24BDD7D98], v25, v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nameChangedMessage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v17[0] = CFSTR("kServiceInstanceID");
    -[HMDService instanceID](self, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = v6;
    v17[1] = CFSTR("kServiceName");
    v17[2] = CFSTR("kHomeUUID");
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE3F1B0], "nonSPIEntitledMessageWithName:messagePayload:", CFSTR("kServiceRenamedNotificationKey"), v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x24BE3F1B8]);
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

      objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:destination:payload:", CFSTR("kServiceRenamedNotificationKey"), v15, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)messagesForUpdatedRoom:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HMDService serviceType](self, "serviceType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD6C70]);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService _checkIfDefaultNameChanged](self, "_checkIfDefaultNameChanged");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "addObject:", v9);
    -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) != 0)
    {
      -[HMDService name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((HMFEqualObjects() & 1) == 0)
      {
        -[HMDService nameChangedMessage](self, "nameChangedMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
    }
    else
    {
      -[HMDService _messagesForConfiguredNameChange](self, "_messagesForConfiguredNameChange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v11);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v13;
}

- (BOOL)updateAssociatedServiceType:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validateAssociatedServiceType:forService:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    objc_storeStrong((id *)&self->_associatedServiceType, a3);
  }

  return v10 == 0;
}

- (id)getConfiguredName
{
  return (id)-[NSString copy](self->_configuredName, "copy");
}

- (id)getConfiguredNameForXPCClients
{
  NSString *v3;
  void *v4;

  -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = self->_configuredName;
    if (!v3)
      v3 = self->_defaultName;
  }
  v4 = (void *)-[NSString copy](v3, "copy");

  return v4;
}

- (id)getLastSeenConfiguredName
{
  return (id)-[NSString copy](self->_lastSeenConfiguredName, "copy");
}

- (void)updateLastKnownValues
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDService characteristics](self, "characteristics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateLastKnownValue");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDService *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  -[HMDService setWorkQueue:](self, "setWorkQueue:", v6);
  objc_storeStrong((id *)&self->_messageDispatcher, a4);
  -[HMDService _registerForMessages](self, "_registerForMessages");
  -[HMDService _shouldServiceBeHidden](self, "_shouldServiceBeHidden");
  -[HMDService _createNotification](self, "_createNotification");
  -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithWorkQueue:messageDispatcher:", v6, v8);

  if (self->_instanceID == (NSNumber *)&unk_24E96B3A8)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService dumpState](v11, "dumpState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@*** DEBUG THIS : File a Radar : HomeKit | New Bugs ***: Service dump : [%@]", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)configureBulletinNotification
{
  id v2;

  -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureBulletinNotification");

}

- (BOOL)shouldEnableDaemonRelaunch
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDService characteristics](self, "characteristics", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "service");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[HMDBulletinBoard isBulletinSupportedForCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForCharacteristicType:serviceType:", v9, v11);

        if (v12)
        {
          -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEnabled");

          if ((v14 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)shouldIncludePresenceForDeviceWithDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  HMDService *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDService deviceLastRequestPresenceDateMap](self, "deviceLastRequestPresenceDateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v6);
      v9 = v8;

      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDService uuid](v11, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138544130;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v4;
        v23 = 2048;
        v24 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Check if we need to include presence in notification for %@. Interval since last update %lf.", (uint8_t *)&v17, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      v15 = v9 <= 86400.0;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updatePresenceRequestTimeForDeviceWithDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDService *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDService deviceLastRequestPresenceDateMap](self, "deviceLastRequestPresenceDateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setDeviceLastRequestPresenceDateMap:](self, "setDeviceLastRequestPresenceDateMap:", v6);

    }
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService uuid](v8, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] Update presence request time for %@.", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService deviceLastRequestPresenceDateMap](v8, "deviceLastRequestPresenceDateMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v4);

  }
}

- (HMDService)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDService *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDService *)-[HMDService _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDService *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDService *v14;
  void *v15;
  uint64_t v16;
  NSString *serviceType;
  void *v18;
  uint64_t v19;
  NSString *associatedServiceType;
  void *v21;
  uint64_t v22;
  NSString *serviceSubtype;
  void *v24;
  uint64_t v25;
  NSString *providedName;
  void *v27;
  uint64_t v28;
  NSString *configuredName;
  void *v30;
  uint64_t v31;
  NSString *expectedConfiguredName;
  void *v33;
  uint64_t v34;
  NSString *lastSeenConfiguredName;
  uint64_t v36;
  NSNumber *lastKnownOperatingState;
  uint64_t v38;
  NSNumber *lastKnownOperatingStateAbnormalReasons;
  uint64_t v40;
  NSNumber *mediaSourceIdentifier;
  uint64_t v42;
  NSArray *mediaSourceDisplayOrder;
  uint64_t v44;
  NSNumber *labelIndex;
  uint64_t v46;
  NSNumber *labelNamespace;
  uint64_t v48;
  NSNumber *configurationState;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSArray *characteristics;
  uint64_t v55;
  NSNumber *matterEndpointID;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *linkedServices;
  uint64_t v62;
  HMDApplicationData *appData;
  HMDApplicationData *v64;
  void *v65;
  uint64_t v66;
  HMDBulletinBoardNotification *bulletinBoardNotification;
  _QWORD v69[2];
  _QWORD v70[2];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v12;
      v73 = 2112;
      v74 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@HMDService decoding with uuid %@", buf, 0x16u);

      v6 = v11;
    }

    objc_autoreleasePoolPop(v8);
  }
  v14 = -[HMDService initWithAccessory:owner:instance:uuid:](self, "initWithAccessory:owner:instance:uuid:", v5, v5, v6, v7);
  if (v14)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    serviceType = v14->_serviceType;
    v14->_serviceType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedServiceType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    associatedServiceType = v14->_associatedServiceType;
    v14->_associatedServiceType = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7DE8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    serviceSubtype = v14->_serviceSubtype;
    v14->_serviceSubtype = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProvidedName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hm_truncatedNameString");
    v25 = objc_claimAutoreleasedReturnValue();
    providedName = v14->_providedName;
    v14->_providedName = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hm_truncatedNameString");
    v28 = objc_claimAutoreleasedReturnValue();
    configuredName = v14->_configuredName;
    v14->_configuredName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDServiceExpectedConfiguredNameKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hm_truncatedNameString");
    v31 = objc_claimAutoreleasedReturnValue();
    expectedConfiguredName = v14->_expectedConfiguredName;
    v14->_expectedConfiguredName = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDLastSeenConfiguredNameKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hm_truncatedNameString");
    v34 = objc_claimAutoreleasedReturnValue();
    lastSeenConfiguredName = v14->_lastSeenConfiguredName;
    v14->_lastSeenConfiguredName = (NSString *)v34;

    -[HMDService _updateDefaultName](v14, "_updateDefaultName");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AD0]);
    v36 = objc_claimAutoreleasedReturnValue();
    lastKnownOperatingState = v14->_lastKnownOperatingState;
    v14->_lastKnownOperatingState = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AC8]);
    v38 = objc_claimAutoreleasedReturnValue();
    lastKnownOperatingStateAbnormalReasons = v14->_lastKnownOperatingStateAbnormalReasons;
    v14->_lastKnownOperatingStateAbnormalReasons = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AE8]);
    v40 = objc_claimAutoreleasedReturnValue();
    mediaSourceIdentifier = v14->_mediaSourceIdentifier;
    v14->_mediaSourceIdentifier = (NSNumber *)v40;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AD8]);
    v42 = objc_claimAutoreleasedReturnValue();
    mediaSourceDisplayOrder = v14->_mediaSourceDisplayOrder;
    v14->_mediaSourceDisplayOrder = (NSArray *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7DD8]);
    v44 = objc_claimAutoreleasedReturnValue();
    labelIndex = v14->_labelIndex;
    v14->_labelIndex = (NSNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7DE0]);
    v46 = objc_claimAutoreleasedReturnValue();
    labelNamespace = v14->_labelNamespace;
    v14->_labelNamespace = (NSNumber *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7D70]);
    v48 = objc_claimAutoreleasedReturnValue();
    configurationState = v14->_configurationState;
    v14->_configurationState = (NSNumber *)v48;

    v50 = (void *)MEMORY[0x24BDBCF20];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setWithArray:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("characteristics"));
    v53 = objc_claimAutoreleasedReturnValue();
    characteristics = v14->_characteristics;
    v14->_characteristics = (NSArray *)v53;

    v14->_serviceProperties = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("HM.serviceProperties"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceMatterEndpointID"));
    v55 = objc_claimAutoreleasedReturnValue();
    matterEndpointID = v14->_matterEndpointID;
    v14->_matterEndpointID = (NSNumber *)v55;

    v57 = (void *)MEMORY[0x24BDBCF20];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v59, CFSTR("HM.linkedServices"));
    v60 = objc_claimAutoreleasedReturnValue();
    linkedServices = v14->_linkedServices;
    v14->_linkedServices = (NSArray *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v62 = objc_claimAutoreleasedReturnValue();
    appData = v14->_appData;
    v14->_appData = (HMDApplicationData *)v62;

    v64 = v14->_appData;
    -[HMDService uuid](v14, "uuid");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDApplicationData updateParentUUIDIfNil:](v64, "updateParentUUIDIfNil:", v65);

    if (-[HMDService _supportsBulletinNotification](v14, "_supportsBulletinNotification"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.BulletinBoardNotification"));
      v66 = objc_claimAutoreleasedReturnValue();
      bulletinBoardNotification = v14->_bulletinBoardNotification;
      v14->_bulletinBoardNotification = (HMDBulletinBoardNotification *)v66;

    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDService _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  HMDService *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString **v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDService *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDService accessory](self, "accessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD6B30]);

    accessoryToEncodeForXPCTransportForAccessory(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("accessory"));
  -[HMDService uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("serviceUUID"));

  -[HMDService serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serviceType"));

  -[HMDService instanceID](self, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("serviceInstanceID"));

  -[HMDService associatedServiceType](self, "associatedServiceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("associatedServiceType"));

  -[HMDService matterEndpointID](self, "matterEndpointID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("serviceMatterEndpointID"));

  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) != 0)
  {
    v61 = v6;
    v63 = v5;
    v13 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDService characteristics](self, "characteristics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v62 = self;
    -[HMDService characteristics](self, "characteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v65 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v22, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v16, "shouldFilterCharacteristicOfTypeFromApp:", v23);

          if ((v24 & 1) == 0)
            objc_msgSend(v15, "addObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v19);
    }

    v25 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("characteristics"));

    v5 = v63;
    objc_msgSend(v63, "primaryService");
    v26 = (HMDService *)objc_claimAutoreleasedReturnValue();
    self = v62;
    v27 = v26 == v62;

    objc_msgSend(v4, "encodeBool:forKey:", v27, CFSTR("HM.primary"));
    v6 = v61;
  }
  else
  {
    -[HMDService characteristics](self, "characteristics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("characteristics"));

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDService isPrimary](self, "isPrimary"), CFSTR("HM.primary"));
    objc_msgSend(v4, "encodeInt:forKey:", -[HMDService serviceProperties](self, "serviceProperties"), CFSTR("HM.serviceProperties"));
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDService isHidden](self, "isHidden"), CFSTR("HM.hidden"));
  -[HMDService linkedServices](self, "linkedServices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("HM.linkedServices"));

  if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      -[HMDService name](self, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = &kServiceNameCodingKey;
    }
    else
    {
      objc_msgSend(v4, "encodeObject:forKey:", self->_configuredName, CFSTR("serviceName"));
      -[HMDService providedName](self, "providedName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("serviceProvidedName"));

      -[HMDService labelIndex](self, "labelIndex");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v33, *MEMORY[0x24BDD7DD8]);

      -[HMDService labelNamespace](self, "labelNamespace");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v34, *MEMORY[0x24BDD7DE0]);

      -[HMDService serviceSubtype](self, "serviceSubtype");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v35, *MEMORY[0x24BDD7DE8]);

      -[HMDService configurationState](self, "configurationState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (__CFString **)MEMORY[0x24BDD7D70];
    }
    objc_msgSend(v4, "encodeObject:forKey:", v30, *v31);

  }
  v36 = objc_msgSend(v4, "hmd_isForXPCTransport");
  -[HMDService appData](self, "appData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v36)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("HM.appDataRepository"));
    goto LABEL_24;
  }
  objc_msgSend(v37, "encodeForXPCTransportWithCoder:key:", v4, CFSTR("HM.appData"));

  if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v38, *MEMORY[0x24BDD7D88]);
    -[HMDService defaultName](self, "defaultName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v39, *MEMORY[0x24BDD7D90]);

    -[HMDService serviceSubtype](self, "serviceSubtype");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v40, *MEMORY[0x24BDD7DE8]);

    -[HMDService configurationState](self, "configurationState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v41, *MEMORY[0x24BDD7D70]);

LABEL_24:
  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0 || objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    -[HMDService bulletinBoardNotification](self, "bulletinBoardNotification");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("HM.BulletinBoardNotification"));

  }
  if (!objc_msgSend(v4, "hmd_isForXPCTransport")
    || objc_msgSend(v4, "hmd_isForXPCTransport")
    && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v44, *MEMORY[0x24BDD6AD0]);

    }
    -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v46, *MEMORY[0x24BDD6AC8]);

    }
  }
  -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v48, *MEMORY[0x24BDD6AE8]);

  }
  -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");

  if (v50)
  {
    -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v51, *MEMORY[0x24BDD6AD8]);

  }
  -[HMDService findCharacteristicWithType:](self, "findCharacteristicWithType:", CFSTR("00000136-0000-1000-8000-0026BB765291"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "supportsWrite");
  objc_msgSend(v4, "encodeBool:forKey:", v53, *MEMORY[0x24BDD6AE0]);
  -[HMDService findCharacteristicWithType:](self, "findCharacteristicWithType:", *MEMORY[0x24BDD57F8]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
    v56 = objc_msgSend(v54, "supportsWrite");
  else
    v56 = 1;
  objc_msgSend(v4, "encodeBool:forKey:", v56, *MEMORY[0x24BDD6B00]);
  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) == 0)
  {
    -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v58, CFSTR("HMDServiceExpectedConfiguredNameKey"));

    }
  }
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v60, CFSTR("HMDLastSeenConfiguredNameKey"));

    }
  }

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDService *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (v12)
  {
    -[HMDService _transactionServiceUpdated:newValues:message:](self, "_transactionServiceUpdated:newValues:message:", 0, v12, v10);
    v13 = v9;
LABEL_15:

    goto LABEL_16;
  }
  v13 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    -[HMDService appDataUpdated:message:](self, "appDataUpdated:message:", v15, v10);
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v19;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = (id)objc_opt_class();
    v20 = v28;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v10, "responseHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v10, "responseHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v22, 0);

    goto LABEL_15;
  }
LABEL_16:

}

- (id)_messagesForConfiguredNameChange
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDService nameChangedMessage](self, "nameChangedMessage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (void)_saveForExpectedConfiguredNameUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDServiceTransaction *v9;
  void *v10;
  void *v11;
  HMDServiceTransaction *v12;
  void *v13;
  HMDService *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDD7D58];
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transaction:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMDServiceTransaction alloc];
  -[HMDService uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", 2, v10, v11);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService getConfiguredName](v14, "getConfiguredName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService expectedConfiguredName](v14, "expectedConfiguredName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating save transaction for update of configured '%@; and expected configured name '%@'",
      (uint8_t *)&v21,
      0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDService getConfiguredName](v14, "getConfiguredName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceTransaction setName:](v12, "setName:", v19);

  -[HMDService expectedConfiguredName](v14, "expectedConfiguredName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceTransaction setExpectedConfiguredName:](v12, "setExpectedConfiguredName:", v20);

  objc_msgSend(v8, "add:withMessage:", v12, 0);
  objc_msgSend(v8, "run");

}

- (void)_saveForLastSeenConfiguredNameUpdate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDServiceTransaction *v9;
  void *v10;
  void *v11;
  HMDServiceTransaction *v12;
  void *v13;
  HMDService *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  HMDServiceTransaction *v22;
  _QWORD v23[4];
  id v24;
  HMDServiceTransaction *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)*MEMORY[0x24BDD7D58];
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transaction:options:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMDServiceTransaction alloc];
  -[HMDService uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", 2, v10, v11);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService getConfiguredName](v14, "getConfiguredName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService lastSeenConfiguredName](v14, "lastSeenConfiguredName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating save transaction for update of configured '%@; and lastSeen configured name '%@'",
      buf,
      0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDService getConfiguredName](v14, "getConfiguredName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceTransaction setName:](v12, "setName:", v19);

  -[HMDService lastSeenConfiguredName](v14, "lastSeenConfiguredName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceTransaction setLastSeenConfiguredNameLocal:](v12, "setLastSeenConfiguredNameLocal:", v20);

  objc_msgSend(v8, "add:withMessage:", v12, 0);
  objc_initWeak((id *)buf, v14);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __50__HMDService__saveForLastSeenConfiguredNameUpdate__block_invoke;
  v23[3] = &unk_24E796418;
  objc_copyWeak(&v26, (id *)buf);
  v21 = v4;
  v24 = v21;
  v22 = v12;
  v25 = v22;
  objc_msgSend(v8, "save:", v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (void)_saveLastSeenAndExpectedConfiguredName:(id)a3
{
  id v4;
  void *v5;
  HMDService *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638](-[HMDService setLastSeenConfiguredName:](self, "setLastSeenConfiguredName:", v4));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService lastSeenConfiguredName](v6, "lastSeenConfiguredName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating last seen configured (and configured/expected configured name to %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDService setExpectedConfiguredName:](v6, "setExpectedConfiguredName:", v4);
  -[HMDService setConfiguredName:](v6, "setConfiguredName:", v4);

}

- (void)_processTransactionForNameComponents:(id)a3 messagesToSendToAccessory:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  HMDService *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  int v60;
  void *context;
  int contexta;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDService name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastSeenConfiguredNameLocal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastSeenConfiguredNameLocal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v8, "setProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", CFSTR("expectedConfiguredName"));

      if (v18)
      {
        objc_msgSend(v8, "expectedConfiguredName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDService setExpectedConfiguredName:](self, "setExpectedConfiguredName:", v19);

      }
      v20 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v8, "lastSeenConfiguredNameLocal");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "hm_truncatedNameString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService _saveLastSeenAndExpectedConfiguredName:](self, "_saveLastSeenAndExpectedConfiguredName:", v36);

    -[HMDService _saveForExpectedConfiguredNameUpdate](self, "_saveForExpectedConfiguredNameUpdate");
LABEL_14:
    v20 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v8, "setProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", CFSTR("expectedConfiguredName"));

  v64 = v9;
  if (!v22)
  {
    objc_msgSend(v8, "setProperties");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "containsObject:", CFSTR("name"));

    if (v40
      && (-[HMDService getConfiguredName](self, "getConfiguredName"),
          v41 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "name"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = HMFEqualObjects(),
          v42,
          v41,
          (v43 & 1) == 0))
    {
      objc_msgSend(v8, "name");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setConfiguredName:](self, "setConfiguredName:", v49);

      v20 = 1;
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v8, "providedName");
    v50 = objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      v9 = v64;
      goto LABEL_15;
    }
    v51 = (void *)v50;
    -[HMDService providedName](self, "providedName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providedName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    v9 = v64;
    if ((v54 & 1) == 0)
    {
      -[HMDService providedName](self, "providedName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providedName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "hm_truncatedNameString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService _updateProvidedName:](self, "_updateProvidedName:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v64;
      if (v58)
        objc_msgSend(v64, "addObject:", v58);
      if (v55)
      {
        -[HMDService _checkIfDefaultNameChanged](self, "_checkIfDefaultNameChanged");
        v59 = objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          objc_msgSend(v64, "addObject:", v59);
          v58 = (void *)v59;
        }
        else
        {
          v58 = 0;
        }
      }

      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expectedConfiguredName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HMFEqualObjects();

  if ((v25 & 1) == 0)
  {
    objc_msgSend(v8, "expectedConfiguredName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hm_truncatedNameString");
    v27 = objc_claimAutoreleasedReturnValue();

    context = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v27;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v30;
      v67 = 2112;
      v68 = v63;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Updating expected configured name to %@", buf, 0x16u);

      v27 = (uint64_t)v63;
    }

    objc_autoreleasePoolPop(context);
    -[HMDService setExpectedConfiguredName:](v28, "setExpectedConfiguredName:", v27);
    -[HMDService accessory](v28, "accessory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isOwnerUser"))
    {
      -[HMDService getConfiguredName](v28, "getConfiguredName");
      contexta = v25;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService lastSeenConfiguredName](v28, "lastSeenConfiguredName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = HMFEqualObjects();

      v9 = v64;
      v25 = contexta;

      if (!v60)
      {
LABEL_24:

        goto LABEL_25;
      }
      -[HMDService _sanitizeNameToWriteToAccessory:](v28, "_sanitizeNameToWriteToAccessory:", v63);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService _writeConfiguredNameToAccessory:](v28, "_writeConfiguredNameToAccessory:", v31);
    }
    else
    {

    }
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v8, "setProperties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v25 ^ 1;
  if (!objc_msgSend(v44, "containsObject:", CFSTR("name")))
  {

    goto LABEL_15;
  }
  -[HMDService getConfiguredName](self, "getConfiguredName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = HMFEqualObjects();

  v9 = v64;
  if ((v47 & 1) == 0)
  {
    objc_msgSend(v8, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService setConfiguredName:](self, "setConfiguredName:", v48);

    v9 = v64;
    goto LABEL_14;
  }
LABEL_15:
  -[HMDService name](self, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService getConfiguredNameForXPCClients](self, "getConfiguredNameForXPCClients");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!HMFEqualObjects() || (HMFEqualObjects() ^ 1 | v20) == 1)
  {
    objc_msgSend(v10, "markChanged");
    objc_msgSend(v10, "markSaveToAssistant");
  }

}

- (void)_transactionServiceUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSString *v31;
  NSString *associatedServiceType;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  unint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  char v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t i;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  id obj;
  void *v135;
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  NSObject *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[4];

  v153[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v136 = a5;
  objc_msgSend(v136, "transactionResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCEB8];
  +[HMDHAPAccessoryTransaction properties](HMDHAPAccessoryTransaction, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = v8;
  objc_msgSend(v8, "configurationTracker");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    dispatch_group_enter(v14);
  -[HMDService _processTransactionForNameComponents:messagesToSendToAccessory:result:](self, "_processTransactionForNameComponents:messagesToSendToAccessory:result:", v9, v13, v10);
  objc_msgSend(v9, "serviceType");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HMDService serviceType](self, "serviceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
      objc_msgSend(v9, "serviceType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setServiceType:](self, "setServiceType:", v21);

    }
  }
  objc_msgSend(v9, "matterEndpointID");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[HMDService matterEndpointID](self, "matterEndpointID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matterEndpointID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v9, "matterEndpointID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setMatterEndpointID:](self, "setMatterEndpointID:", v27);

      objc_msgSend(v10, "markChanged");
    }
  }
  if (objc_msgSend(v9, "propertyWasSet:", CFSTR("associatedServiceType")))
  {
    objc_msgSend(v9, "associatedServiceType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService associatedServiceType](self, "associatedServiceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = HMFEqualObjects();

    if ((v30 & 1) == 0)
    {
      objc_msgSend(v9, "associatedServiceType");
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      associatedServiceType = self->_associatedServiceType;
      self->_associatedServiceType = v31;

      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
    }
  }
  objc_msgSend(v9, "serviceSubtype");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[HMDService serviceSubtype](self, "serviceSubtype");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceSubtype");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) == 0)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
      objc_msgSend(v9, "serviceSubtype");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setServiceSubtype:](self, "setServiceSubtype:", v38);

      v152[0] = CFSTR("kServiceInstanceID");
      -[HMDService instanceID](self, "instanceID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v153[0] = v39;
      v152[1] = *MEMORY[0x24BDD7DF0];
      objc_msgSend(v9, "serviceSubtype");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v153[1] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x24BE3F1B0];
      v43 = *MEMORY[0x24BDD7DF8];
      objc_msgSend(v136, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "entitledMessageWithName:identifier:messagePayload:", v43, v44, v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v45);
    }
  }
  objc_msgSend(v9, "labelIndex");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[HMDService labelIndex](self, "labelIndex");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelIndex");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if ((v50 & 1) == 0)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
      objc_msgSend(v9, "labelIndex");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setLabelIndex:](self, "setLabelIndex:", v51);

      -[HMDService _checkIfDefaultNameChanged](self, "_checkIfDefaultNameChanged");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
        objc_msgSend(v13, "addObject:", v52);

    }
  }
  objc_msgSend(v9, "labelNamespace");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[HMDService labelNamespace](self, "labelNamespace");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelNamespace");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) == 0)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
      objc_msgSend(v9, "labelNamespace");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setLabelNamespace:](self, "setLabelNamespace:", v58);

    }
  }
  objc_msgSend(v9, "configurationState");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[HMDService configurationState](self, "configurationState");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationState");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if ((v63 & 1) == 0)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
      objc_msgSend(v9, "configurationState");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setConfigurationState:](self, "setConfigurationState:", v64);

      v150[0] = CFSTR("kServiceInstanceID");
      -[HMDService instanceID](self, "instanceID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v151[0] = v65;
      v150[1] = *MEMORY[0x24BDD7D78];
      objc_msgSend(v9, "configurationState");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v151[1] = v66;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (void *)MEMORY[0x24BE3F1B0];
      v69 = *MEMORY[0x24BDD7D80];
      objc_msgSend(v136, "identifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "entitledMessageWithName:identifier:messagePayload:", v69, v70, v67);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v71);
    }
  }
  objc_msgSend(v9, "linkedServices");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[HMDService linkedServices](self, "linkedServices");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "linkedServices");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqualToArray:", v75);

    if ((v76 & 1) == 0)
    {
      objc_msgSend(v9, "linkedServices");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setLinkedServices:](self, "setLinkedServices:", v77);

      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
    }
  }
  -[HMDService accessory](self, "accessory");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceProperties");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    v81 = -[HMDService serviceProperties](self, "serviceProperties");
    objc_msgSend(v9, "serviceProperties");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "unsignedIntegerValue");

    if (v81 != v83)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v9, "serviceProperties");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setServiceProperties:](self, "setServiceProperties:", objc_msgSend(v84, "unsignedIntegerValue"));

      LODWORD(v84) = -[HMDService isPrimary](self, "isPrimary");
      -[HMDService setPrimary:](self, "setPrimary:", -[HMDService serviceProperties](self, "serviceProperties") & 1);
      if ((_DWORD)v84 != -[HMDService isPrimary](self, "isPrimary"))
        objc_msgSend(v78, "updatePrimaryServiceIfNeeded");
      -[HMDService _shouldServiceBeHidden](self, "_shouldServiceBeHidden");
    }
  }
  v130 = objc_msgSend(v78, "supportsTargetController");
  if (objc_msgSend(v9, "propertyWasSet:", CFSTR("lastKnownOperatingState")))
  {
    objc_msgSend(v9, "lastKnownOperatingState");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = HMFEqualObjects();

    if ((v87 & 1) == 0)
    {
      objc_msgSend(v9, "lastKnownOperatingState");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setLastKnownOperatingState:](self, "setLastKnownOperatingState:", v88);

      objc_msgSend(v10, "markChanged");
    }
  }
  if (objc_msgSend(v9, "propertyWasSet:", CFSTR("lastKnownOperatingStateAbnormalReasons")))
  {
    objc_msgSend(v9, "lastKnownOperatingStateAbnormalReasons");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = HMFEqualObjects();

    if ((v91 & 1) == 0)
    {
      objc_msgSend(v9, "lastKnownOperatingStateAbnormalReasons");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setLastKnownOperatingStateAbnormalReasons:](self, "setLastKnownOperatingStateAbnormalReasons:", v92);

      objc_msgSend(v10, "markChanged");
    }
  }
  v135 = v78;
  objc_msgSend(v9, "mediaSourceIdentifier");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    objc_msgSend(v9, "mediaSourceIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if ((v97 & 1) == 0)
    {
      objc_msgSend(v9, "mediaSourceIdentifier");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService setMediaSourceIdentifier:](self, "setMediaSourceIdentifier:", v98);

      v148[0] = CFSTR("kServiceInstanceID");
      -[HMDService instanceID](self, "instanceID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v149[0] = v99;
      v148[1] = *MEMORY[0x24BDD6AF0];
      objc_msgSend(v9, "mediaSourceIdentifier");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v149[1] = v100;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", *MEMORY[0x24BDD6AF8], v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v102);

      objc_msgSend(v10, "markChanged");
    }
  }
  v103 = v13;
  v104 = v136;
  objc_msgSend(v136, "name");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "isEqualToString:", *MEMORY[0x24BDD6F98]);

  objc_msgSend(v9, "mediaSourceDisplayOrder");
  v107 = objc_claimAutoreleasedReturnValue();
  if (!v107)
    goto LABEL_45;
  v108 = (void *)v107;
  objc_msgSend(v9, "mediaSourceDisplayOrder");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v109, "isEqualToArray:", v110);

  v104 = v136;
  if ((v111 & 1) == 0)
  {
    objc_msgSend(v9, "mediaSourceDisplayOrder");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService setMediaSourceDisplayOrder:](self, "setMediaSourceDisplayOrder:", v112);

    objc_msgSend(v10, "markChanged");
  }
  else
  {
LABEL_45:
    if (!v106)
      goto LABEL_49;
  }
  v146[0] = CFSTR("kServiceInstanceID");
  -[HMDService instanceID](self, "instanceID");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v113;
  v146[1] = *MEMORY[0x24BDD6F90];
  objc_msgSend(v9, "mediaSourceDisplayOrder");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v114;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", *MEMORY[0x24BDD6FA0], v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "addObject:", v116);

LABEL_49:
  objc_msgSend(v9, "characteristics");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    objc_msgSend(v9, "characteristics");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[HMDService updateCharacteristics:](self, "updateCharacteristics:", v118);

    if (v119)
    {
      objc_msgSend(v10, "markChanged");
      objc_msgSend(v10, "markSaveToAssistant");
    }
  }
  v131 = v10;
  v132 = v9;
  v120 = dispatch_group_create();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  obj = v103;
  v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v145, 16);
  v122 = MEMORY[0x24BDAC760];
  if (v121)
  {
    v123 = v121;
    v124 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v123; ++i)
      {
        if (*(_QWORD *)v142 != v124)
          objc_enumerationMutation(obj);
        v126 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        dispatch_group_enter(v120);
        if (v104)
        {
          objc_msgSend(v104, "identifier");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "setIdentifier:", v127);

        }
        objc_msgSend(v135, "msgDispatcher");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "uuid");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = v122;
        v139[1] = 3221225472;
        v139[2] = __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke;
        v139[3] = &unk_24E79C240;
        v140 = v120;
        objc_msgSend(v128, "sendMessage:target:andInvokeCompletionHandler:", v126, v129, v139);

        v104 = v136;
      }
      v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v145, 16);
    }
    while (v123);
  }

  dispatch_group_wait(v120, 0);
  objc_msgSend(v104, "respondWithPayload:", 0);
  if (v15)
    dispatch_group_leave(v15);
  if (v130 != objc_msgSend(v135, "supportsTargetController"))
  {
    v137[0] = v122;
    v137[1] = 3221225472;
    v137[2] = __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke_2;
    v137[3] = &unk_24E79BD80;
    v138 = v135;
    objc_msgSend(v138, "configureTargetControllerWithCompletion:", v137);

  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDService *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDService appDataRemoved:message:](self, "appDataRemoved:message:", v10, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = (id)objc_opt_class();
      v15 = v24;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v7, "responseHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v17)[2](v17, v18, 0);

    }
  }

}

- (void)appDataUpdated:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDApplicationData *v10;
  void *v11;
  void *v12;
  HMDApplicationData *v13;
  void *v14;
  HMDService *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDService appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDService appData](self, "appData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithModel:", v6);

  }
  else
  {
    v10 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDService uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithDictionary:parentUUID:](v10, "initWithDictionary:parentUUID:", v11, v12);
    -[HMDService setAppData:](self, "setAppData:", v13);

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appDataDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  objc_msgSend(v7, "transactionResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (void)appDataRemoved:(id)a3 message:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDService setAppData:](self, "setAppData:", 0);
  objc_msgSend(v5, "transactionResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markChanged");
  objc_msgSend(v5, "respondWithPayload:", 0);

}

- (BOOL)updateCharacteristics:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  HMDCharacteristic *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDService *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v37;
  id obj;
  HMDService *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD block[4];
  id v48;
  HMDService *v49;
  id v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self;
  -[HMDService accessory](self, "accessory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v4;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v46)
  {
    v42 = 0;
    v43 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v61 != v43)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("characteristicType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v9 = v44;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v57;
LABEL_8:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v57 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
            objc_msgSend(v14, "characteristicType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v8);

            if ((v16 & 1) != 0)
              break;
            if (v11 == ++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
              if (v11)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v17 = v14;

          if (!v17)
            goto LABEL_17;
          v42 |= -[HMDCharacteristic updateWithDictionary:](v17, "updateWithDictionary:", v7);
          objc_msgSend(v9, "removeObject:", v17);
        }
        else
        {
LABEL_14:

LABEL_17:
          v17 = -[HMDCharacteristic initWithCharacteristic:service:accessory:]([HMDCharacteristic alloc], "initWithCharacteristic:service:accessory:", v7, v39, v40);
          encodeRootObjectForIncomingXPCMessage(v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCharacteristic instanceID](v17, "instanceID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v18, v19);

        }
        objc_msgSend(v45, "addObject:", v17);

      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v46);
  }
  else
  {
    LOBYTE(v42) = 0;
  }

  v20 = (void *)MEMORY[0x227676638](-[HMDService setCharacteristics:](v39, "setCharacteristics:", v45));
  v21 = v39;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v66 = v23;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification registrations because characteristics changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDService bulletinBoardNotification](v21, "bulletinBoardNotification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateRegistrations");

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v25 = v44;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  v27 = v42;
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "instanceID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v31);

      }
      v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count"))
  {
    objc_msgSend(v32, "setObject:forKey:", v37, CFSTR("kRemovedCharacteristicIDsForAccessoryKey"));
    v27 = 1;
  }
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v32, "setObject:forKey:", v41, CFSTR("kAddedCharacteristicsForAccessoryKey"));
    v27 = 1;
  }
  -[HMDService workQueue](v21, "workQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDService_updateCharacteristics___block_invoke;
  block[3] = &unk_24E796150;
  v48 = v40;
  v49 = v21;
  v50 = v32;
  v51 = v27 & 1;
  v34 = v32;
  v35 = v40;
  dispatch_async(v33, block);

  return v27 & 1;
}

- (BOOL)isEmptyConfiguredNameAllowed
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  BOOL v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDService characteristics](self, "characteristics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    v7 = *MEMORY[0x24BDD57F8];
    v8 = *MEMORY[0x24BE1B578];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v6)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_msgSend(v10, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v7);

      if ((v12 & 1) != 0)
      {
        v4 = 1;
        if ((v5 & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        objc_msgSend(v10, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v8);

        v5 |= v14;
        if ((v5 & 1) != 0)
        {
LABEL_10:
          if ((v4 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_15;
          }
        }
      }
      if (v3 == ++v9)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (void)persistMediaSourceDisplayOrder:(id)a3 requestMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDService owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createUpdateServiceTransactionWithServiceUUID:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setMediaSourceDisplayOrder:", v7);
  -[HMDService _createAndRunTransactionWithName:transaction:message:](self, "_createAndRunTransactionWithName:transaction:message:", CFSTR("PersistMediaSourceDisplayOrder"), v10, v6);

}

- (void)_createAndRunTransactionWithName:(id)a3 transaction:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDService owner](self, "owner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStoreTransactionWithName:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "add:withMessage:", v9, v8);
  objc_msgSend(v12, "run");

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[HMDService home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kSetAppDataRequestKey"), self, v7, sel__handleSetAppData_);

}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDServiceTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDServiceTransaction *v9;

  v5 = [HMDServiceTransaction alloc];
  -[HMDService uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  void *v4;

  -[HMDService transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService populateModelObjectWithChangeType:version:](self, "populateModelObjectWithChangeType:version:", v4, 4);
  return v4;
}

- (void)populateModelObjectWithChangeType:(id)a3 version:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v26;

  v26 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v26;
  else
    v6 = 0;
  v7 = v6;
  -[HMDService name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v8);

  -[HMDService instanceID](self, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInstanceID:", v9);

  -[HMDService providedName](self, "providedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProvidedName:", v10);

  -[HMDService serviceType](self, "serviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServiceType:", v11);

  -[HMDService associatedServiceType](self, "associatedServiceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssociatedServiceType:", v12);

  -[HMDService serviceSubtype](self, "serviceSubtype");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServiceSubtype:", v13);

  -[HMDService labelIndex](self, "labelIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabelIndex:", v14);

  -[HMDService labelNamespace](self, "labelNamespace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabelNamespace:", v15);

  -[HMDService linkedServices](self, "linkedServices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v7, "setLinkedServices:", v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDService serviceProperties](self, "serviceProperties"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServiceProperties:", v18);

  -[HMDService matterEndpointID](self, "matterEndpointID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMatterEndpointID:", v19);

  if (a4 >= 4)
  {
    -[HMDService configurationState](self, "configurationState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfigurationState:", v20);

    -[HMDService expectedConfiguredName](self, "expectedConfiguredName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExpectedConfiguredName:", v21);

    -[HMDService lastKnownOperatingState](self, "lastKnownOperatingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastKnownOperatingState:", v22);

    -[HMDService lastKnownOperatingStateAbnormalReasons](self, "lastKnownOperatingStateAbnormalReasons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastKnownOperatingStateAbnormalReasons:", v23);

    -[HMDService mediaSourceIdentifier](self, "mediaSourceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMediaSourceIdentifier:", v24);

    -[HMDService mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMediaSourceDisplayOrder:", v25);

  }
  -[HMDService fillCharacteristicsInServiceBackingStoreObject:](self, "fillCharacteristicsInServiceBackingStoreObject:", v7);

}

- (void)fillCharacteristicsInServiceBackingStoreObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDService characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "getCharacteristicDictionary", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  +[HMDCharacteristic sortComparatorForCharacteristicDictionary](HMDCharacteristic, "sortComparatorForCharacteristicDictionary", (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingComparator:", v13);

  v14 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setCharacteristics:", v14);

}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDService modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[HMDService appData](self, "appData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 3 && v7)
  {
    -[HMDService appData](self, "appData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelObjectWithChangeType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (void)_saveCurrentNameAsExpectedAndLastSeen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDService owner](self, "owner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDService uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createUpdateServiceTransactionWithServiceUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLastSeenConfiguredNameLocal:", v4);
  objc_msgSend(v8, "backingStoreTransactionWithName:", CFSTR("NewNameOnPairVerify"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "add:withMessage:", v6, 0);
  objc_msgSend(v7, "run");

}

- (void)_writeConfiguredNameToAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDService owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDService__writeConfiguredNameToAccessory___block_invoke;
  v7[3] = &unk_24E798300;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "makeServiceNameConsistent:withName:completionHandler:", self, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (BOOL)shouldUpdateLastSeenConfiguredName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDService lastSeenConfiguredName](self, "lastSeenConfiguredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  return v6 ^ 1;
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)labelIndex
{
  return self->_labelIndex;
}

- (void)setLabelIndex:(id)a3
{
  objc_storeStrong((id *)&self->_labelIndex, a3);
}

- (NSNumber)labelNamespace
{
  return self->_labelNamespace;
}

- (void)setLabelNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_labelNamespace, a3);
}

- (NSString)serviceSubtype
{
  return self->_serviceSubtype;
}

- (void)setServiceSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSubtype, a3);
}

- (NSNumber)configurationState
{
  return self->_configurationState;
}

- (void)setConfigurationState:(id)a3
{
  objc_storeStrong((id *)&self->_configurationState, a3);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (void)setDefaultName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)matterEndpointID
{
  return self->_matterEndpointID;
}

- (void)setMatterEndpointID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (HMDBulletinBoardNotification)bulletinBoardNotification
{
  return self->_bulletinBoardNotification;
}

- (void)setBulletinBoardNotification:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinBoardNotification, a3);
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (NSNumber)mediaSourceIdentifier
{
  return self->_mediaSourceIdentifier;
}

- (void)setMediaSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSourceIdentifier, a3);
}

- (NSArray)mediaSourceDisplayOrder
{
  return self->_mediaSourceDisplayOrder;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (NSUUID)cachedAccessoryUUID
{
  return self->_cachedAccessoryUUID;
}

- (void)setCachedAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccessoryUUID, a3);
}

- (HMDServiceOwner)owner
{
  return (HMDServiceOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (NSNumber)lastKnownDiscoveryMode
{
  return self->_lastKnownDiscoveryMode;
}

- (void)setLastKnownDiscoveryMode:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownDiscoveryMode, a3);
}

- (NSNumber)lastKnownOperatingState
{
  return self->_lastKnownOperatingState;
}

- (void)setLastKnownOperatingState:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOperatingState, a3);
}

- (NSNumber)lastKnownOperatingStateAbnormalReasons
{
  return self->_lastKnownOperatingStateAbnormalReasons;
}

- (void)setLastKnownOperatingStateAbnormalReasons:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOperatingStateAbnormalReasons, a3);
}

- (NSMutableDictionary)deviceLastRequestPresenceDateMap
{
  return self->_deviceLastRequestPresenceDateMap;
}

- (void)setDeviceLastRequestPresenceDateMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLastRequestPresenceDateMap, a3);
}

- (NSString)logID
{
  return self->_logID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_deviceLastRequestPresenceDateMap, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingStateAbnormalReasons, 0);
  objc_storeStrong((id *)&self->_lastKnownOperatingState, 0);
  objc_storeStrong((id *)&self->_lastKnownDiscoveryMode, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_cachedAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
  objc_storeStrong((id *)&self->_mediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotification, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_matterEndpointID, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_providedName, 0);
  objc_storeStrong((id *)&self->_lastSeenConfiguredName, 0);
  objc_storeStrong((id *)&self->_expectedConfiguredName, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_configurationState, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_labelNamespace, 0);
  objc_storeStrong((id *)&self->_labelIndex, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
}

void __46__HMDService__writeConfiguredNameToAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update configured name to %@ - error %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully updated configured name and last seen configured name to %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setConfiguredName:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setLastSeenConfiguredName:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "_saveForLastSeenConfiguredNameUpdate");
  }

}

void __36__HMDService_updateCharacteristics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeManagerXPCMessageSendPolicy *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "configureService:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v2, CFSTR("kModifiedCharacteristicsForAccessoryKey"));
  if (*(_BYTE *)(a1 + 56) || objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_shouldServiceBeHidden");
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v16 = CFSTR("kCharacteristicAndValueKey");
      objc_msgSend(*(id *)(a1 + 40), "instanceID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v3;
      v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      v15 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_alloc(MEMORY[0x24BE3F1B8]);
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1D0]), "initWithName:destination:payload:", CFSTR("kCharacteristicsUpdatedNotificationKey"), v9, v6);
      v11 = -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:", 1, 1537);
      objc_msgSend(v10, "setSendPolicy:", v11);
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "msgDispatcher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendMessage:", v10);

    }
    logAndPostNotification(CFSTR("kHMDNotificationCharacteristicsUpdated"), *(void **)(a1 + 32), 0);
  }

}

void __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__HMDService__transactionServiceUpdated_newValues_message___block_invoke_2(uint64_t a1)
{
  logAndPostNotification(CFSTR("HMDHAPAccessoryUpdatedTargetControllerSupport"), *(void **)(a1 + 32), 0);
}

void __50__HMDService__saveForLastSeenConfiguredNameUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveWithReason:postSyncNotification:objectChange:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40) != 0);

}

void __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  HMDServiceTransaction *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  void *v32;
  HMDServiceTransaction *v33;
  void *v34;
  void *v35;
  HMDServiceTransaction *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  uint64_t v51;
  void *v52;
  HMDServiceTransaction *v53;
  void *v54;
  uint64_t v55;
  _QWORD aBlock[4];
  HMDServiceTransaction *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  v54 = WeakRetained;
  if (WeakRetained && v5)
  {
    v7 = [HMDServiceTransaction alloc];
    objc_msgSend(WeakRetained, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 2, v8, v9);

    v62 = 0;
    v48 = v6;
    objc_msgSend(v6, "transactionWithObjectChangeType:", 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v49 = v3;
    obj = v3;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    v10 = 0;
    if (v55)
    {
      v51 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v59 != v51)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x227676638]();
          v14 = v54;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v16;
            v65 = 2112;
            v66 = v12;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Got response %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          objc_msgSend(v12, "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "characteristic");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueUpdatedTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stateNumber");
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notificationContext");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "updateValue:updatedTime:stateNumber:notificationContext:", v19, v20, v21, v22);

          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke_110;
          aBlock[3] = &unk_24E783568;
          v57 = v53;
          v23 = _Block_copy(aBlock);
          objc_msgSend(v18, "type");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serviceType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v21) = +[HMDService processUpdateForCharacteristicType:value:serviceType:service:serviceTransactionGetter:accessory:accessoryTransaction:accessoryTransactionChanged:](HMDService, "processUpdateForCharacteristicType:value:serviceType:service:serviceTransactionGetter:accessory:accessoryTransaction:accessoryTransactionChanged:", v24, v25, v26, v14, v23, v27, v52, &v62);

          v10 |= v21;
        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v55);
    }

    v6 = v48;
    objc_msgSend(v48, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceTransaction providedName](v53, "providedName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v28, "backingStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transaction:options:", CFSTR("ServiceUpdated"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = [HMDServiceTransaction alloc];
      objc_msgSend(v54, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v33, "initWithObjectChangeType:uuid:parentUUID:", 2, v34, v35);

      -[HMDServiceTransaction providedName](v53, "providedName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDServiceTransaction setProvidedName:](v36, "setProvidedName:", v37);

      -[HMDServiceTransaction setProvidedName:](v53, "setProvidedName:", 0);
      objc_msgSend(v32, "add:withMessage:", v36, 0);
      objc_msgSend(v32, "run");

    }
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v28, "backingStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "transaction:options:", CFSTR("ServiceUpdated"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "add:withMessage:", v53, 0);
      objc_msgSend(v40, "run");

    }
    if (v62)
    {
      objc_msgSend(v28, "backingStore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "transaction:options:", CFSTR("AccessoryUpdated"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "add:withMessage:", v52, 0);
      objc_msgSend(v43, "run");

    }
    v3 = v49;
  }
  else
  {
    v44 = (void *)MEMORY[0x227676638]();
    v45 = WeakRetained;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v47;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Service or accessory is no more valid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v44);
  }

}

id __66__HMDService__readRequiredCharacteristicValuesForceReadFWVersion___block_invoke_110(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)generateUUIDWithAccessoryUUID:(id)a3 serviceID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_103211 != -1)
    dispatch_once(&logCategory__hmf_once_t17_103211, &__block_literal_global_103212);
  return (id)logCategory__hmf_once_v18_103213;
}

+ (BOOL)validateProvidedName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 129);
    v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v13;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not contain allowed characters", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is not an NSString", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v9 = 0;
  }

  return v9;
}

+ (BOOL)processUpdateForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 service:(id)a6 serviceTransactionGetter:(id)a7 accessory:(id)a8 accessoryTransaction:(id)a9 accessoryTransactionChanged:(BOOL *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  char v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  char v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  char v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  char v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  char v74;
  int v75;
  id v76;
  id v77;
  void *v78;
  int v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  char v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  char v98;
  id v99;
  void *v100;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void (**v106)(_QWORD);
  id v107;
  _BYTE buf[12];
  __int16 v109;
  id v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v106 = (void (**)(_QWORD))a7;
  v20 = a8;
  v21 = a9;
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6B38]) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE1B788]) & 1) != 0
    || objc_msgSend(v18, "isEqualToString:", CFSTR("00000239-0000-1000-8000-0026BB765291")))
  {
    v22 = objc_msgSend(v20, "updateAccessoryInformationWithCharacteristicType:serviceType:value:accessoryTransaction:", v16, v18, v17, v21);
    if (a10)
    {
      if (v22)
        *a10 = 1;
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD5928]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (+[HMDService validateProvidedName:](HMDService, "validateProvidedName:", v17))
      {
        if (!v19)
          goto LABEL_64;
        objc_msgSend(v19, "providedName");
        v23 = a1;
        v24 = v21;
        v25 = v20;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = HMFEqualObjects();

        v20 = v25;
        v21 = v24;
        a1 = v23;
        if ((v27 & 1) == 0)
        {
LABEL_64:
          v76 = v21;
          v77 = v20;
          if (objc_msgSend(v20, "supportsCHIP")
            && (objc_msgSend(v20, "home"),
                v78 = (void *)objc_claimAutoreleasedReturnValue(),
                v79 = objc_msgSend(v78, "isCurrentDevicePrimaryResident"),
                v78,
                v79))
          {
            v80 = (void *)MEMORY[0x227676638]();
            v81 = a1;
            HMFGetOSLogHandle();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v83;
              _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@Ignoring service transaction name update for matter", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v80);
            v37 = 0;
            v29 = v106;
          }
          else
          {
            v29 = v106;
            v106[2](v106);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setProvidedName:", v17);

            v37 = 0;
          }
          v20 = v77;
          v21 = v76;
          goto LABEL_101;
        }
      }
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD57F8]))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v17;
      if (!objc_msgSend(v28, "length"))
      {

        v28 = 0;
      }
      v29 = v106;
      if (objc_msgSend(v19, "shouldUpdateLastSeenConfiguredName:", v28))
      {
        v102 = v21;
        v103 = v20;
        v30 = v19;
        v31 = (void *)MEMORY[0x227676638]();
        v32 = a1;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastSeenConfiguredName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v34;
          v109 = 2112;
          v110 = v28;
          v111 = 2112;
          v112 = v35;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@nameFromAccessory %@  lastSeenConfiguredName %@", buf, 0x20u);

          v29 = v106;
        }

        objc_autoreleasePoolPop(v31);
        v29[2](v29);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setLastSeenConfiguredNameLocal:", v28);

        v19 = v30;
        v21 = v102;
        v20 = v103;
      }

      v37 = 1;
      goto LABEL_101;
    }
  }
  if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD59C8]) & 1) != 0)
  {
    v37 = 0;
    v29 = v106;
    goto LABEL_101;
  }
  v29 = v106;
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("00000232-0000-1000-8000-0026BB765291")))
  {
    v107 = 0;
    *(_QWORD *)buf = 0;
    if (objc_msgSend(a1, "_parseOperatingStateResponseValue:intoState:abnormalReasons:", v17, buf, &v107))
    {
      v38 = v21;
      v39 = v20;
      if (!v19)
        goto LABEL_70;
      objc_msgSend(v19, "lastKnownOperatingState");
      v40 = v19;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = HMFEqualObjects();

      v19 = v40;
      if (!v42)
        goto LABEL_70;
      objc_msgSend(v40, "lastKnownOperatingStateAbnormalReasons");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = HMFEqualObjects();

      v19 = v40;
      if ((v44 & 1) != 0)
      {
        v37 = 0;
      }
      else
      {
LABEL_70:
        v106[2](v106);
        v84 = v19;
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setLastKnownOperatingState:", *(_QWORD *)buf);
        objc_msgSend(v85, "setLastKnownOperatingStateAbnormalReasons:", v107);

        v19 = v84;
        v37 = 1;
      }
      v20 = v39;
      v21 = v38;
    }
    else
    {
      v37 = 0;
    }

    goto LABEL_101;
  }
  v104 = v20;
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6BE0]))
  {
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD58E0]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v19)
          goto LABEL_92;
        objc_msgSend(v19, "mediaSourceIdentifier");
        v45 = a1;
        v46 = v21;
        v47 = v19;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = HMFEqualObjects();

        v19 = v47;
        v21 = v46;
        a1 = v45;
        if ((v49 & 1) == 0)
        {
LABEL_92:
          v106[2](v106);
          v99 = v19;
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setMediaSourceIdentifier:", v17);
          goto LABEL_94;
        }
      }
    }
  }
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6C70]))
  {
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("00000136-0000-1000-8000-0026BB765291")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        parseMediaSourceDisplayOrder(v17);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = v21;
          if (!v19
            || (objc_msgSend(v19, "mediaSourceDisplayOrder"),
                v52 = v19,
                v53 = (void *)objc_claimAutoreleasedReturnValue(),
                v54 = objc_msgSend(v50, "isEqualToArray:", v53),
                v53,
                v19 = v52,
                (v54 & 1) == 0))
          {
            v29 = v106;
            v106[2](v106);
            v55 = v19;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setMediaSourceDisplayOrder:", v50);
LABEL_97:

            v19 = v55;
            v37 = 1;
            goto LABEL_98;
          }
          goto LABEL_47;
        }
        goto LABEL_95;
      }
    }
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("000000D0-0000-1000-8000-0026BB765291")))
  {
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("000000D5-0000-1000-8000-0026BB765291")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v105, "serviceSubtypeForValue:forServiceType:", v17, CFSTR("000000D0-0000-1000-8000-0026BB765291"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = v21;
          if (!v19
            || (objc_msgSend(v19, "serviceSubtype"),
                v57 = v19,
                v58 = (void *)objc_claimAutoreleasedReturnValue(),
                v59 = objc_msgSend(v50, "isEqual:", v58),
                v58,
                v19 = v57,
                (v59 & 1) == 0))
          {
            v29 = v106;
            v106[2](v106);
            v55 = v19;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setServiceSubtype:", v50);
            goto LABEL_97;
          }
LABEL_47:
          v37 = 0;
          v29 = v106;
LABEL_98:
          v21 = v51;
          goto LABEL_99;
        }
LABEL_95:
        v37 = 0;
LABEL_99:

        goto LABEL_100;
      }
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("000000CB-0000-1000-8000-0026BB765291")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v19)
        goto LABEL_90;
      objc_msgSend(v19, "labelIndex");
      v60 = a1;
      v61 = v21;
      v62 = v19;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v17, "isEqual:", v63);

      v19 = v62;
      v21 = v61;
      a1 = v60;
      if ((v64 & 1) == 0)
      {
LABEL_90:
        v106[2](v106);
        v99 = v19;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setLabelIndex:", v17);
LABEL_94:

        v19 = v99;
        v37 = 1;
LABEL_100:
        v20 = v104;
        goto LABEL_101;
      }
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("000000CD-0000-1000-8000-0026BB765291")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v19)
        goto LABEL_91;
      objc_msgSend(v19, "labelNamespace");
      v65 = a1;
      v66 = v21;
      v67 = v19;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v17, "isEqual:", v68);

      v19 = v67;
      v21 = v66;
      a1 = v65;
      if ((v69 & 1) == 0)
      {
LABEL_91:
        v106[2](v106);
        v99 = v19;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setLabelNamespace:", v17);
        goto LABEL_94;
      }
    }
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("000000D6-0000-1000-8000-0026BB765291")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v19)
        goto LABEL_93;
      objc_msgSend(v19, "configurationState");
      v70 = a1;
      v71 = v21;
      v72 = v19;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v17, "isEqual:", v73);

      v19 = v72;
      v21 = v71;
      a1 = v70;
      if ((v74 & 1) == 0)
      {
LABEL_93:
        v106[2](v106);
        v99 = v19;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setConfigurationState:", v17);
        goto LABEL_94;
      }
    }
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("00000221-0000-1000-8000-0026BB765291")))
  {
    v20 = v104;
    v75 = objc_msgSend(a1, "_processUpdateOnPowerManagementServiceForCharacteristicType:value:serviceType:accessory:accessoryTransaction:", v16, v17, v18, v104, v21);
    v37 = 0;
    if (a10 && v75)
    {
      v37 = 0;
      *a10 = 1;
    }
  }
  else
  {
    v20 = v104;
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD5A88]))
    {
      if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6C98]))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", v17);
          if (v87)
          {
            if (!v19)
              goto LABEL_81;
            objc_msgSend(v104, "primaryProfileVersion");
            v88 = v21;
            v89 = v19;
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v87, "isEqualToVersion:", v90);

            v19 = v89;
            v21 = v88;
            if ((v91 & 1) == 0)
            {
LABEL_81:
              objc_msgSend(v87, "versionString");
              v92 = v21;
              v93 = v19;
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "setPrimaryProfileVersion:", v94);

              v19 = v93;
              v21 = v92;
              if (a10)
                *a10 = 1;
            }
          }

          v37 = 0;
          v29 = v106;
          goto LABEL_100;
        }
      }
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("0000022A-0000-1000-8000-0026BB765291"))
      && objc_msgSend(v16, "isEqualToString:", CFSTR("0000022C-0000-1000-8000-0026BB765291"))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v95 = v21;
      v96 = v19;
      objc_msgSend(v104, "wiFiTransportCapabilities");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "isEqualToNumber:", v17);

      if ((v98 & 1) != 0)
      {
        v37 = 0;
        v19 = v96;
      }
      else
      {
        objc_msgSend(v95, "setWiFiTransportCapabilities:", v17);
        v19 = v96;
        v37 = 0;
        if (a10)
          *a10 = 1;
      }
      v20 = v104;
      v21 = v95;
    }
    else
    {
      v37 = 0;
    }
  }
LABEL_101:

  return v37;
}

+ (BOOL)_processUpdateOnPowerManagementServiceForCharacteristicType:(id)a3 value:(id)a4 serviceType:(id)a5 accessory:(id)a6 accessoryTransaction:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("00000221-0000-1000-8000-0026BB765291")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid service type was passed."), 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v50);
  }
  objc_msgSend(v15, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(v16, "hapAccessoryLocal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("00000222-0000-1000-8000-0026BB765291")))
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("00000251-0000-1000-8000-0026BB765291")))
    {
      v40 = 0;
      v22 = 0;
      v41 = 0;
      goto LABEL_20;
    }
    v53 = v19;
    v54 = 0;
    +[HMDSupportedSleepConfigurationTLV parsedFromData:error:](HMDSupportedSleepConfigurationTLV, "parsedFromData:error:", v13, &v54);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v54;
    v32 = (void *)MEMORY[0x227676638]();
    v33 = a1;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v52 = v12;
      v35 = v15;
      v36 = v14;
      v37 = v13;
      v38 = v16;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v39;
      v58 = 2112;
      v59 = v31;
      v60 = 2112;
      v61 = v22;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Parsed supportedSleepConfiguration: %@ with error: %@", buf, 0x20u);

      v16 = v38;
      v13 = v37;
      v14 = v36;
      v15 = v35;
      v12 = v52;
    }

    objc_autoreleasePoolPop(v32);
    if (v22 || (objc_msgSend(v15, "isSuspendCapable") & 1) != 0)
    {

      goto LABEL_16;
    }
    objc_msgSend(v16, "setSuspendCapable:", MEMORY[0x24BDBD1C8]);

    v40 = 0;
LABEL_29:
    v22 = 0;
    v41 = 1;
    goto LABEL_18;
  }
  v53 = v19;
  v55 = 0;
  +[HMDWakeConfiguration parsedFromData:error:](HMDWakeConfiguration, "parsedFromData:error:", v13, &v55);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v55;
  v23 = (void *)MEMORY[0x227676638]();
  v24 = a1;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v51 = v12;
    v26 = v15;
    v27 = v14;
    v28 = v13;
    v29 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v30;
    v58 = 2112;
    v59 = v21;
    v60 = 2112;
    v61 = v22;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Parsed HMDWakeConfiguration: %@ with error: %@", buf, 0x20u);

    v16 = v29;
    v13 = v28;
    v14 = v27;
    v15 = v26;
    v12 = v51;
  }

  objc_autoreleasePoolPop(v23);
  if (!v22)
  {
    +[HMFConnectivityInfo connectivityInfoWithAccessoryIdentifier:wakeConfiguration:](HMFConnectivityInfo, "connectivityInfoWithAccessoryIdentifier:wakeConfiguration:", v53, v21);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      v22 = 0;
      goto LABEL_17;
    }
    v43 = v16;
    objc_msgSend(v15, "connectivityInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = HMFEqualObjects();

    if ((v45 & 1) != 0)
    {
      v22 = 0;
      v41 = 0;
      v16 = v43;
      goto LABEL_18;
    }
    v16 = v43;
    objc_msgSend(v43, "setConnectivityInfo:", v40);
    v46 = (void *)MEMORY[0x227676638](objc_msgSend(v43, "setSuspendCapable:", MEMORY[0x24BDBD1C8]));
    v47 = v24;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v49;
      v58 = 2112;
      v59 = v40;
      v60 = 2112;
      v61 = v43;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting connectivityInfo %@ to accessory transaction: %@", buf, 0x20u);

      v16 = v43;
    }

    objc_autoreleasePoolPop(v46);
    goto LABEL_29;
  }

LABEL_16:
  v40 = 0;
LABEL_17:
  v41 = 0;
LABEL_18:
  v19 = v53;
LABEL_20:

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_parseOperatingStateResponseValue:(id)a3 intoState:(id *)a4 abnormalReasons:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BE1BBA0], "parsedFromData:error:", v8, &v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    if (v11)
    {
      objc_msgSend(v11, "state");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = *a4;
      *a4 = v13;

      objc_msgSend(v11, "abnormalReasons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = *a5;
      *a5 = v16;

      v19 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = 0;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = a1;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v23;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse operating state response value %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  v19 = 0;
LABEL_15:

  return v19;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

void __25__HMDService_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_103213;
  logCategory__hmf_once_v18_103213 = v0;

}

- (id)_serviceSubtypeFromLinkedServicesForServiceType:(id)a3 accessoryCategory:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDD6BC8], a4))
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDService linkedServices](self, "linkedServices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x24BDD6C88];
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[HMDService accessory](self, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "findService:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "type");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v9);

          if (v15)
          {
            v16 = (id)*MEMORY[0x24BE82020];

            goto LABEL_14;
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (NSString)urlString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v3, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[HMDService instanceID](self, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifierWithSalts();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  return (NSString *)v13;
}

- (NSDictionary)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMDService *v10;
  HMDService *v11;
  void *v12;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDService *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *p_super;
  os_log_type_t v27;
  uint32_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  HMDService *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  HMDService *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  void *v108;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  HMDService *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  id v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id obj;
  char *obja;
  id objb;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _QWORD v147[8];
  _QWORD v148[8];
  uint8_t v149[128];
  uint8_t buf[4];
  NSObject *v151;
  __int16 v152;
  HMDService *v153;
  __int16 v154;
  NSObject *v155;
  __int16 v156;
  void *v157;
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  -[HMDService accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v118 = v3;
  if (v6)
    v7 = v6;
  else
    v7 = v3;
  v8 = v7;
  -[HMDService name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v10 = (HMDService *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    -[HMDService name](v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && v9 != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDService type](self, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v18;
      v20 = objc_msgSend(v18, "shouldFilterServiceOfTypeFromApp:", v19);

      if (v20)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
LABEL_20:

LABEL_21:
          objc_autoreleasePoolPop(v21);
          v29 = 0;
LABEL_106:

          goto LABEL_107;
        }
        HMFGetLogIdentifier();
        v24 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v151 = v24;
        v152 = 2112;
        v153 = v22;
        v25 = "%{public}@Service (%@) is hidden from apps not sending to siri";
        p_super = v23;
        v27 = OS_LOG_TYPE_DEBUG;
        v28 = 22;
LABEL_19:
        _os_log_impl(&dword_2218F0000, p_super, v27, v25, buf, v28);

        goto LABEL_20;
      }
      v113 = v8;
      v114 = v11;
      v111 = v9;
      v112 = v6;
      -[HMDService type](self, "type");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v30, "isEqualToString:", CFSTR("000000D0-0000-1000-8000-0026BB765291"));

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      -[HMDService characteristics](self, "characteristics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "copy");

      obj = v32;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v140, v149, 16);
      if (v33)
      {
        v34 = v33;
        v119 = 0;
        v35 = *(_QWORD *)v141;
        v36 = v117;
        do
        {
          v37 = 0;
          v123 = v34;
          do
          {
            if (*(_QWORD *)v141 != v35)
              objc_enumerationMutation(obj);
            v38 = *(HMDService **)(*((_QWORD *)&v140 + 1) + 8 * v37);
            -[HMDService type](v38, "type");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "mapToAssistantCharacteristicName:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDService type](v38, "type");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v36, "shouldFilterCharacteristicOfTypeFromApp:", v41);

            if (v42)
            {
              v43 = v35;
              v44 = (void *)MEMORY[0x227676638]();
              v45 = self;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v47 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v151 = v47;
                v152 = 2112;
                v153 = v38;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic (%@) is hidden from apps not sending to siri", buf, 0x16u);

                v36 = v117;
              }

              objc_autoreleasePoolPop(v44);
              v35 = v43;
              v34 = v123;
            }
            else
            {
              if (v40 && (objc_msgSend(v40, "isEqualToString:", CFSTR("IDENTIFY")) & 1) == 0)
                objc_msgSend(v115, "addObject:", v39);
              if (v121)
                v119 |= objc_msgSend(v39, "isEqualToString:", CFSTR("000000D6-0000-1000-8000-0026BB765291"));
            }

            ++v37;
          }
          while (v34 != v37);
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v149, 16);
        }
        while (v34);
      }
      else
      {
        v119 = 0;
      }

      if (objc_msgSend(v115, "count"))
      {
        v6 = v112;
        v8 = v113;
        v9 = v111;
        v11 = v114;
        if ((v121 & v119) == 1)
        {
          -[HMDService configurationState](self, "configurationState");
          v48 = objc_claimAutoreleasedReturnValue();
          if (!v48
            || (v49 = (void *)v48,
                -[HMDService configurationState](self, "configurationState"),
                v50 = (void *)objc_claimAutoreleasedReturnValue(),
                v51 = objc_msgSend(v50, "integerValue"),
                v50,
                v49,
                !v51))
          {
            v21 = (void *)MEMORY[0x227676638]();
            HMFGetOSLogHandle();
            v22 = (HMDService *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(&v22->super.super, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            HMFGetLogIdentifier();
            v23 = objc_claimAutoreleasedReturnValue();
            -[HMDService name](v114, "name");
            v24 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v151 = v23;
            v152 = 2112;
            v153 = v114;
            v154 = 2112;
            v155 = v24;
            v156 = 2112;
            v157 = v111;
            v25 = "%{public}@Skipping because service is not user configured: service.accessory.home %@  service.accessor"
                  "y.home.name %@  service.name %@";
            p_super = &v22->super.super;
            v27 = OS_LOG_TYPE_DEFAULT;
            v28 = 42;
            goto LABEL_19;
          }
        }
        v52 = objc_alloc(MEMORY[0x24BDBCED8]);
        v148[0] = *MEMORY[0x24BE81F50];
        v147[0] = CFSTR("objectType");
        v147[1] = CFSTR("objectIdentifier");
        -[HMDService urlString](self, "urlString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v148[1] = v53;
        v147[2] = CFSTR("objectServiceType");
        -[HMDService type](self, "type");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v148[2] = v54;
        v147[3] = CFSTR("objectHome");
        -[HMDService name](v114, "name");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v148[3] = v55;
        v147[4] = CFSTR("objectHomeIdentifier");
        -[HMDService urlString](v114, "urlString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v148[4] = v56;
        v148[5] = self;
        v147[5] = CFSTR("objectReference");
        v147[6] = CFSTR("objectName");
        v147[7] = CFSTR("objectCharacteristics");
        v148[6] = v111;
        v148[7] = v115;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v148, v147, 8);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v52, "initWithDictionary:", v57);

        if ((v121 & 1) != 0)
        {
          v59 = 0;
        }
        else
        {
          objc_msgSend(v113, "category");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "categoryType");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            -[HMDService serviceType](self, "serviceType");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "mapToAssistantServiceSubtypeName:accessoryCategory:", v62, v61);
            v59 = objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              -[HMDService serviceType](self, "serviceType");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "getServiceTypeAlias:", v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "mapToAssistantServiceSubtypeName:accessoryCategory:", v64, v61);
              v59 = objc_claimAutoreleasedReturnValue();

              if (!v59)
              {
                -[HMDService serviceType](self, "serviceType");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDService _serviceSubtypeFromLinkedServicesForServiceType:accessoryCategory:](self, "_serviceSubtypeFromLinkedServicesForServiceType:accessoryCategory:", v65, v61);
                v59 = objc_claimAutoreleasedReturnValue();

              }
            }
          }
          else
          {
            v59 = 0;
          }

        }
        -[HMDService associatedServiceType](self, "associatedServiceType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          -[HMDService associatedServiceType](self, "associatedServiceType");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v67, CFSTR("objectAssociatedServiceType"));

          if (!v59)
          {
            -[HMDService associatedServiceType](self, "associatedServiceType");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "mapToAssistantServiceSubtypeName:", v68);
            v59 = objc_claimAutoreleasedReturnValue();

          }
        }
        -[HMDService serviceSubtype](self, "serviceSubtype");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69 && !v59)
        {
          -[HMDService serviceSubtype](self, "serviceSubtype");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "mapToAssistantServiceSubtypeName:", v70);
          v59 = objc_claimAutoreleasedReturnValue();

        }
        if (v59)
          objc_msgSend(v58, "setObject:forKey:", v59, CFSTR("objectServiceSubType"));
        objc_msgSend(v113, "name", v59);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          objc_msgSend(v113, "name");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v72, CFSTR("objectAccessory"));

          objc_msgSend(v113, "urlString");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v73, CFSTR("objectAccessoryIdentifier"));

        }
        v116 = v58;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v139 = 0u;
        -[HMDService serviceGroups](v114, "serviceGroups");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v76, "copy");

        v120 = v77;
        v124 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
        if (v124)
        {
          v122 = *(_QWORD *)v137;
          do
          {
            v78 = 0;
            do
            {
              if (*(_QWORD *)v137 != v122)
                objc_enumerationMutation(v120);
              obja = v78;
              v79 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)v78);
              v132 = 0u;
              v133 = 0u;
              v134 = 0u;
              v135 = 0u;
              objc_msgSend(v79, "serviceUUIDs");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
              if (v81)
              {
                v82 = v81;
                v83 = *(_QWORD *)v133;
                do
                {
                  for (i = 0; i != v82; ++i)
                  {
                    if (*(_QWORD *)v133 != v83)
                      objc_enumerationMutation(v80);
                    v85 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i);
                    -[HMDService uuid](self, "uuid");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v85) = objc_msgSend(v86, "hmf_isEqualToUUIDString:", v85);

                    if ((_DWORD)v85)
                    {
                      objc_msgSend(v79, "name");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "addObject:", v87);

                      objc_msgSend(v79, "urlString");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "addObject:", v88);

                    }
                  }
                  v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
                }
                while (v82);
              }

              v78 = obja + 1;
            }
            while (obja + 1 != (char *)v124);
            v124 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
          }
          while (v124);
        }

        if (objc_msgSend(v74, "count"))
        {
          objc_msgSend(v116, "setObject:forKey:", v74, CFSTR("objectGroups"));
          objc_msgSend(v116, "setObject:forKey:", v75, CFSTR("objectGroupIdentifiers"));
        }
        v89 = (void *)MEMORY[0x24BDBCEB8];
        -[HMDService linkedServices](self, "linkedServices");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "arrayWithCapacity:", objc_msgSend(v90, "count"));
        objb = (id)objc_claimAutoreleasedReturnValue();

        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        -[HMDService linkedServices](self, "linkedServices");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
        if (v92)
        {
          v93 = v92;
          v94 = *(_QWORD *)v129;
          do
          {
            for (j = 0; j != v93; ++j)
            {
              if (*(_QWORD *)v129 != v94)
                objc_enumerationMutation(v91);
              objc_msgSend(v118, "findService:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j));
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v96;
              if (v96)
              {
                objc_msgSend(v96, "configurationState");
                v98 = objc_claimAutoreleasedReturnValue();
                if (!v98
                  || (v99 = (void *)v98,
                      objc_msgSend(v97, "configurationState"),
                      v100 = (void *)objc_claimAutoreleasedReturnValue(),
                      v101 = objc_msgSend(v100, "integerValue"),
                      v100,
                      v99,
                      v101))
                {
                  objc_msgSend(v97, "urlString");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(objb, "addObject:", v102);

                }
              }

            }
            v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
          }
          while (v93);
        }

        if ((objc_msgSend(objb, "hmf_isEmpty") & 1) == 0)
        {
          v103 = (void *)objc_msgSend(objb, "copy");
          objc_msgSend(v116, "setObject:forKey:", v103, CFSTR("objectRelatedIdentifiers"));

        }
        objc_msgSend(v113, "room");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "name");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (v105)
        {
          -[HMDService name](v114, "name");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v105, "isEqualToString:", v106);

          if ((v107 & 1) == 0)
          {
            objc_msgSend(v116, "setObject:forKey:", v105, CFSTR("objectRoom"));
            objc_msgSend(v104, "urlString");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "setObject:forKey:", v108, CFSTR("objectRoomIdentifier"));

          }
        }
        v29 = (void *)objc_msgSend(v116, "copy");

      }
      else
      {
        v29 = 0;
      }
      v6 = v112;
      v8 = v113;
      v9 = v111;
      v11 = v114;
      goto LABEL_106;
    }
  }
  v14 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HMDService name](v11, "name");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    *(_DWORD *)buf = 138544130;
    v151 = v16;
    v152 = 2112;
    v153 = v11;
    v154 = 2112;
    v155 = v17;
    v156 = 2112;
    v157 = v9;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
    if (v11)

  }
  objc_autoreleasePoolPop(v14);
  v29 = 0;
LABEL_107:

  return (NSDictionary *)v29;
}

@end
