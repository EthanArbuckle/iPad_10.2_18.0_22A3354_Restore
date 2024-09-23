@implementation HMDAccessory

+ (id)logCategory
{
  if (logCategory__hmf_once_t172 != -1)
    dispatch_once(&logCategory__hmf_once_t172, &__block_literal_global_341);
  return (id)logCategory__hmf_once_v173;
}

- (BOOL)isSuspendCapable
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_suspendCapable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (id)privateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  NSString *configuredName;

  configuredName = self->_configuredName;
  if (!configuredName)
    configuredName = self->_providedName;
  return (NSString *)(id)-[NSString copy](configuredName, "copy");
}

- (BOOL)isReachable
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_reachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (NSArray)accessoryProfiles
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_accessoryProfiles, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
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
  void *v19;
  id v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  char v71;
  int64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[HMDAccessory name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9);

  -[HMDAccessory configuredName](self, "configuredName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguredName:", v10);

  -[HMDAccessory providedName](self, "providedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProvidedName:", v11);

  -[HMDAccessory categoryIdentifier](self, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertyIfNotNil:named:", v12, CFSTR("accessoryCategory"));

  -[HMDAccessory identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v13);

  -[HMDAccessory room](self, "room");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[HMDAccessory room](self, "room");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuid");
    v72 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "roomForEntireHome");
    v20 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v18, "isEqual:", v22);

    v6 = v20;
    a4 = v72;

    if ((v71 & 1) != 0)
      goto LABEL_8;
    -[HMDAccessory room](self, "room");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRoomUUID:", v24);

  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suspendCapable);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuspendCapable:", v25);

  if (a4 >= 4)
  {
    -[HMDAccessory model](self, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v26, CFSTR("model"));

    -[HMDAccessory manufacturer](self, "manufacturer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v27, CFSTR("manufacturer"));

    -[HMDAccessory firmwareVersion](self, "firmwareVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rawVersionString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v29, CFSTR("firmwareVersion"));

    -[HMDAccessory displayableFirmwareVersion](self, "displayableFirmwareVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v30, CFSTR("displayableFirmwareVersion"));

    -[HMDAccessory serialNumber](self, "serialNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v31, CFSTR("serialNumber"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory currentNetworkProtectionMode](self, "currentNetworkProtectionMode"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCurrentNetworkProtectionMode:", v32);

    -[HMDAccessory networkAccessViolation](self, "networkAccessViolation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastViolationDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    EpochIntervalFromDate(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastNetworkAccessViolationOccurrenceSince1970:", v35);

    -[HMDAccessory networkAccessViolation](self, "networkAccessViolation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lastResetDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    EpochIntervalFromDate(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastNetworkAccessViolationResetSince1970:", v38);

    v39 = (void *)MEMORY[0x1E0C99DE8];
    -[HMDAccessory allowedHosts](self, "allowedHosts");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "arrayWithCapacity:", objc_msgSend(v40, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    -[HMDAccessory allowedHosts](self, "allowedHosts");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v74 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "jsonWANRule");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v44);
    }

    v48 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v8, "setAppliedFirewallWANRules:", v48);

    -[HMDAccessory productData](self, "productData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v49, CFSTR("productDataV2"));

    -[HMDAccessory configuredNetworkProtectionGroupUUID](self, "configuredNetworkProtectionGroupUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "UUIDString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConfiguredNetworkProtectionGroupUUIDString:", v51);

    -[HMDAccessory networkClientIdentifier](self, "networkClientIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNetworkClientIdentifier:", v52);

    -[HMDAccessory networkRouterUUID](self, "networkRouterUUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "UUIDString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNetworkRouterUUID:", v54);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory networkClientLAN](self, "networkClientLAN"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNetworkClientLAN:", v55);

    -[HMDAccessory networkClientProfileFingerprint](self, "networkClientProfileFingerprint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "UUIDString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNetworkClientProfileFingerprint:", v57);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory wiFiCredentialType](self, "wiFiCredentialType"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWiFiCredentialType:", v58);

    -[HMDAccessory wiFiUniquePreSharedKey](self, "wiFiUniquePreSharedKey");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWiFiUniquePreSharedKey:", v59);

    -[HMDAccessory pendingConfigurationIdentifier](self, "pendingConfigurationIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPendingConfigurationIdentifier:", v60);

    -[HMDAccessory primaryProfileVersion](self, "primaryProfileVersion");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "versionString");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v62, CFSTR("primaryProfileVersion"));

    -[HMDAccessory initialManufacturer](self, "initialManufacturer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v63, CFSTR("initialManufacturer"));

    -[HMDAccessory initialModel](self, "initialModel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v64, CFSTR("initialModel"));

    -[HMDAccessory initialCategoryIdentifier](self, "initialCategoryIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v65, CFSTR("initialCategoryIdentifier"));

    -[HMDAccessory hostAccessory](self, "hostAccessory");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "uuid");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "UUIDString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHostAccessoryUUID:", v68);

    -[HMDAccessory lastSeenDate](self, "lastSeenDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v69, CFSTR("lastSeenDate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessory isLowBattery](self, "isLowBattery"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPropertyIfNotNil:named:", v70, CFSTR("lowBattery"));

  }
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
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
  _QWORD v50[16];

  v50[14] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory name](self, "name");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Nm"), v49);
  v50[0] = v48;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory getConfiguredName](self, "getConfiguredName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("CN"), v47);
  v50[1] = v46;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory providedName](self, "providedName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("PN"), v45);
  v50[2] = v44;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory uuid](self, "uuid");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("UUID"), v43);
  v50[3] = v42;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory category](self, "category");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Cat"), v40);
  v50[4] = v39;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory home](self, "home");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("HM"), v37);
  v50[5] = v36;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory room](self, "room");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("RM"), v34);
  v50[6] = v33;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory manufacturer](self, "manufacturer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("MFG"), v32);
  v50[7] = v31;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory model](self, "model");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("MO"), v30);
  v50[8] = v29;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory serialNumber](self, "serialNumber");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("SN"), v28);
  v50[9] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory productData](self, "productData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("PD"), v15);
  v50[10] = v16;
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory firmwareVersion](self, "firmwareVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("FV"), v18);
  v50[11] = v19;
  v20 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory displayableFirmwareVersion](self, "displayableFirmwareVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("DFV"), v21);
  v50[12] = v22;
  v23 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessory softwareUpdate](self, "softwareUpdate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("SU"), v24);
  v50[13] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSString)providedName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_providedName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)manufacturer
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_manufacturer;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)model
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_model;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDAccessoryVersion)firmwareVersion
{
  HMDAccessoryVersion *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_firmwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDRoom)room
{
  HMDRoom *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_room;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)serialNumber
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_serialNumber;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)productData
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_productData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (NSString)displayableFirmwareVersion
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_displayableFirmwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDSoftwareUpdate)softwareUpdate
{
  HMDSoftwareUpdate *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_softwareUpdate;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)getConfiguredName
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_configuredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDAccessoryNetworkAccessViolation)networkAccessViolation
{
  return self->_networkAccessViolation;
}

- (NSArray)allowedHosts
{
  return self->_allowedHosts;
}

- (NSString)initialModel
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_initialModel;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)initialManufacturer
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_initialManufacturer;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSNumber)initialCategoryIdentifier
{
  NSNumber *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_initialCategoryIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSData)wiFiUniquePreSharedKey
{
  NSData *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_wiFiUniquePreSharedKey;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)wiFiCredentialType
{
  int64_t wiFiCredentialType;

  os_unfair_recursive_lock_lock_with_options();
  wiFiCredentialType = self->_wiFiCredentialType;
  os_unfair_recursive_lock_unlock();
  return wiFiCredentialType;
}

- (HMFVersion)primaryProfileVersion
{
  HMFVersion *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_primaryProfileVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)pendingConfigurationIdentifier
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pendingConfigurationIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)networkRouterUUID
{
  NSUUID *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_networkRouterUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)networkClientProfileFingerprint
{
  NSUUID *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_networkClientProfileFingerprint;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)networkClientLAN
{
  int64_t networkClientLAN;

  os_unfair_recursive_lock_lock_with_options();
  networkClientLAN = self->_networkClientLAN;
  os_unfair_recursive_lock_unlock();
  return networkClientLAN;
}

- (NSNumber)networkClientIdentifier
{
  NSNumber *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_networkClientIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSDate)lastSeenDate
{
  NSDate *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lastSeenDate;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isLowBattery
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_lowBattery;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (int64_t)currentNetworkProtectionMode
{
  int64_t currentNetworkProtectionMode;

  os_unfair_recursive_lock_lock_with_options();
  currentNetworkProtectionMode = self->_currentNetworkProtectionMode;
  os_unfair_recursive_lock_unlock();
  return currentNetworkProtectionMode;
}

- (NSUUID)configuredNetworkProtectionGroupUUID
{
  NSUUID *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_configuredNetworkProtectionGroupUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)configuredName
{
  return self->_configuredName;
}

- (NSNumber)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (HMDAccessory)hostAccessory
{
  id WeakRetained;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostAccessory);
  os_unfair_recursive_lock_unlock();
  return (HMDAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (int64_t)reachableTransports
{
  void *v3;
  int v4;
  _BOOL4 v5;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isResidentSupported");

  if (v4)
    v5 = -[HMDAccessory isRemotelyReachable](self, "isRemotelyReachable");
  else
    v5 = -[HMDAccessory isRemoteAccessEnabled](self, "isRemoteAccessEnabled");
  if (v5)
    return 8;
  else
    return 0;
}

- (BOOL)isRemoteAccessEnabled
{
  return self->_remoteAccessEnabled;
}

- (NSUUID)preferredMediaUserUUID
{
  return self->_preferredMediaUserUUID;
}

- (NSNumber)preferredMediaUserSelectionTypeNumber
{
  return self->_preferredMediaUserSelectionTypeNumber;
}

- (unint64_t)configNumber
{
  unint64_t configNumber;

  os_unfair_recursive_lock_lock_with_options();
  configNumber = self->_configNumber;
  os_unfair_recursive_lock_unlock();
  return configNumber;
}

- (id)metricLoggingVendorDetails
{
  return -[HMDAccessoryMetricVendorDetails initWithAccessory:]([HMDAccessoryMetricVendorDetails alloc], "initWithAccessory:", self);
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 remotelyReachable;
  uint64_t v6;
  void *v7;
  HMDAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_reachable = v3;
    remotelyReachable = self->_remotelyReachable;
    v6 = os_unfair_recursive_lock_unlock();
    v7 = (void *)MEMORY[0x1D17BA0A0](v6);
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isReachable to %{public}@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "reachabilityChangedForAccessory:reachable:", v8, v3);
      if (!remotelyReachable)
        -[HMDAccessory _notifyConnectivityChangedWithRemoteAccessChanged:](v8, "_notifyConnectivityChangedWithRemoteAccessChanged:", 0);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[HMDAccessory setTimeBecameReachable:](v8, "setTimeBecameReachable:", v14);

      -[HMDAccessory notificationCenter](v8, "notificationCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      logAndPostNotificationWithNotificationCenter(v15, CFSTR("HMDAccessoryIsReachableNotification"), v8, 0);

      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v8;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory reachabilityPingEnabled](v17, "reachabilityPingEnabled");
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@reachabilityPingEnabled: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (-[HMDAccessory reachabilityPingEnabled](v17, "reachabilityPingEnabled"))
        -[HMDAccessory startReachabilityCheck](v17, "startReachabilityCheck");
    }
    else
    {
      -[HMDAccessory setTimeBecameUnreachable:](v8, "setTimeBecameUnreachable:", v14);

      -[HMDAccessory _checkForLastSeenUpdateOnBecomingUnreachable](v8, "_checkForLastSeenUpdateOnBecomingUnreachable");
      -[HMDAccessory notificationCenter](v8, "notificationCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      logAndPostNotificationWithNotificationCenter(v21, CFSTR("HMDAccessoryIsNotReachableNotification"), v8, 0);

    }
  }
}

- (NSString)identifier
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_identifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (double)lastPairingFailureTime
{
  double lastPairingFailureTime;

  os_unfair_recursive_lock_lock_with_options();
  lastPairingFailureTime = self->_lastPairingFailureTime;
  os_unfair_recursive_lock_unlock();
  return lastPairingFailureTime;
}

- (unint64_t)consecutivePairingFailures
{
  return self->_consecutivePairingFailures;
}

- (BOOL)isRemotelyReachable
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_remotelyReachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)hasActiveSession
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_connected;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (NSUUID)spiClientIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  spiClientIdentifierForUUID(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)shouldEnableDaemonRelaunch
{
  return 0;
}

- (HMDVendorModelEntry)vendorInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessory *v8;
  HMDAccessory *v9;
  HMDAccessory *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  HMDAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory productData](self, "productData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v3, "vendorModelEntryForProductData:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HMDAccessory manufacturer](self, "manufacturer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10
      && (-[HMDAccessory bridge](v10, "bridge"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v12 = (void *)v11, v13 = -[HMDAccessory isPrimary](v8, "isPrimary"), v12, !v13))
    {
      -[HMDAccessory bridge](v10, "bridge");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "manufacturer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v8;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory uuid](v19, "uuid");
        v23 = v18;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v25 = v21;
        v26 = 2114;
        v27 = v22;
        v28 = 2114;
        v29 = v15;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Overriding vendor info for %{public}@ with Manufacturer: %{public}@ Model: %{public}@", buf, 0x2Au);

        v18 = v23;
      }

      objc_autoreleasePoolPop(v18);
    }
    else
    {
      v14 = v7;
      v15 = v6;
    }
    v5 = 0;
    if (v15 && v14)
    {
      objc_msgSend(v3, "vendorModelEntryForManufacturer:model:", v15, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (HMDVendorModelEntry *)v5;
}

- (void)setLastPairingFailureTime:(double)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lastPairingFailureTime = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setConsecutivePairingFailures:(unint64_t)a3
{
  self->_consecutivePairingFailures = a3;
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMDAccessory home](self, "home");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitLogEvent:error:", v7, v6);

}

- (id)runtimeState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("kAccessoryIsReachableKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessory isReachableForXPCClients](self, "isReachableForXPCClients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0CB7DC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory reachableTransports](self, "reachableTransports"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isReachableForXPCClients
{
  void *v3;
  BOOL v4;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isResidentSupported") & 1) != 0)
  {

  }
  else
  {
    v4 = -[HMDAccessory isRemoteAccessEnabled](self, "isRemoteAccessEnabled");

    if (v4)
      return 1;
  }
  if (-[HMDAccessory isReachable](self, "isReachable"))
    return 1;
  return -[HMDAccessory isRemotelyReachable](self, "isRemotelyReachable");
}

- (NSString)contextID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessory home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSUUID)contextSPIUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3A28];
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v6;
}

- (id)accessoryBulletinContext
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("accessory");
  -[HMDAccessory contextID](self, "contextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handlePreviewAllowedHosts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[HMDAccessory supportsNetworkProtection](self, "supportsNetworkProtection"))
  {
    -[HMDAccessory home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessoryAllowedHostsPreviewHelper helperForHome:](HMDAccessoryAllowedHostsPreviewHelper, "helperForHome:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__HMDAccessory_NetworkProtection2___handlePreviewAllowedHosts___block_invoke;
    v8[3] = &unk_1E89B5940;
    v9 = v4;
    objc_msgSend(v6, "fetchAllowedHostsForAccessory:completion:", self, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);

  }
}

void __63__HMDAccessory_NetworkProtection2___handlePreviewAllowedHosts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB9620];
    encodeRootObjectForSPIClients(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v9, v7);

}

- (HMDAccessory)init
{
  void *v3;
  HMDAccessory *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessory initWithNotificationCenter:](self, "initWithNotificationCenter:", v3);

  return v4;
}

- (HMDAccessory)initWithNotificationCenter:(id)a3
{
  id v5;
  HMDAccessory *v6;
  HMDAccessory *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  NSMutableSet *accessoryProfiles;
  uint64_t v18;
  HMDAccessoryNetworkAccessViolation *networkAccessViolation;
  uint64_t v20;
  NSDate *timeBecameUnreachable;
  NSDate *timeBecameReachable;
  HMDFeaturesDataSource *v23;
  HMDFeaturesDataSource *featuresDataSource;
  id hashedRouteFactory;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessory;
  v6 = -[HMDAccessory init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    HMDispatchQueueNameString();
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2(v9, v10, v11);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0D28570], "blessWithImplicitContext:", v7->_workQueue);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    accessoryProfiles = v7->_accessoryProfiles;
    v7->_accessoryProfiles = (NSMutableSet *)v16;

    v7->_currentNetworkProtectionMode = 4;
    v7->_wiFiCredentialType = 0;
    +[HMDAccessoryNetworkAccessViolation noViolation](HMDAccessoryNetworkAccessViolation, "noViolation");
    v18 = objc_claimAutoreleasedReturnValue();
    networkAccessViolation = v7->_networkAccessViolation;
    v7->_networkAccessViolation = (HMDAccessoryNetworkAccessViolation *)v18;

    v7->_reachabilityPingEnabled = 0;
    v7->_reachabilityPingNotificationEnabled = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    timeBecameUnreachable = v7->_timeBecameUnreachable;
    v7->_timeBecameUnreachable = (NSDate *)v20;

    timeBecameReachable = v7->_timeBecameReachable;
    v7->_timeBecameReachable = 0;

    v7->_shouldProcessTransactionRemoval = 1;
    v23 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v7->_featuresDataSource;
    v7->_featuresDataSource = v23;

    hashedRouteFactory = v7->_hashedRouteFactory;
    v7->_hashedRouteFactory = &__block_literal_global_44718;

  }
  return v7;
}

- (HMDAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDAccessory *v8;
  uint64_t v9;
  NSUUID *uuid;
  void *v11;
  uint64_t v12;
  NSString *configuredName;
  uint64_t v14;
  NSString *identifier;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HMDRoom *room;
  void *v22;
  HMDAccessory *v23;
  NSObject *v24;
  void *v25;
  HMDAccessory *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSString *providedName;
  uint64_t v31;
  NSString *model;
  uint64_t v33;
  NSString *manufacturer;
  void *v35;
  HMDAccessory *v36;
  HMDAccessory *v37;
  HMDAccessory *v38;
  HMDAccessoryVersion *v39;
  void *v40;
  uint64_t v41;
  HMDAccessoryVersion *v42;
  uint64_t v43;
  HMDAccessoryVersion *firmwareVersion;
  void *v45;
  uint64_t v46;
  NSString *displayableFirmwareVersion;
  uint64_t v48;
  NSString *serialNumber;
  uint64_t v50;
  NSString *initialModel;
  uint64_t v52;
  NSString *initialManufacturer;
  uint64_t v54;
  NSNumber *initialCategoryIdentifier;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSDate *lastSeenDate;
  void *v63;
  void *v64;
  uint64_t v65;
  HMFMessageDispatcher *msgDispatcher;
  void *v67;
  id v68;
  uint64_t v69;
  NSNumber *networkClientIdentifier;
  id v71;
  void *v72;
  uint64_t v73;
  NSUUID *networkRouterUUID;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  HMDAccessory *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSArray *allowedHosts;
  uint64_t v87;
  NSData *wiFiUniquePreSharedKey;
  HMDAccessoryNetworkAccessViolation *v89;
  void *v90;
  void *v91;
  HMDAccessoryNetworkAccessViolation *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  HMFVersion *primaryProfileVersion;
  uint64_t v98;
  HMDUserManagementOperationTimestamp *sharedAdminAddedTimestamp;
  uint64_t v100;
  HMDUserManagementOperationTimestamp *pairingsAuditedTimestamp;
  uint64_t v102;
  NSString *pendingConfigurationIdentifier;
  void *v104;
  void *v105;
  int v107;
  void *v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HMDAccessory init](self, "init");
  if (!v8)
  {
LABEL_44:
    v26 = v8;
    goto LABEL_45;
  }
  objc_msgSend(v6, "uuid");
  v9 = objc_claimAutoreleasedReturnValue();
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v9;

  objc_msgSend(v6, "configuredName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hm_truncatedNameString");
  v12 = objc_claimAutoreleasedReturnValue();
  configuredName = v8->_configuredName;
  v8->_configuredName = (NSString *)v12;

  objc_msgSend(v6, "identifier");
  v14 = objc_claimAutoreleasedReturnValue();
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v14;

  if (v8->_identifier)
  {
    objc_storeWeak((id *)&v8->_home, v7);
    objc_msgSend(v6, "roomUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "roomUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);
      objc_msgSend(v7, "roomWithUUID:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      room = v8->_room;
      v8->_room = (HMDRoom *)v20;

    }
    else
    {
      objc_msgSend(v7, "roomForEntireHome");
      v27 = objc_claimAutoreleasedReturnValue();
      v18 = v8->_room;
      v8->_room = (HMDRoom *)v27;
    }

    objc_msgSend(v6, "providedName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hm_truncatedNameString");
    v29 = objc_claimAutoreleasedReturnValue();
    providedName = v8->_providedName;
    v8->_providedName = (NSString *)v29;

    objc_msgSend(v6, "model");
    v31 = objc_claimAutoreleasedReturnValue();
    model = v8->_model;
    v8->_model = (NSString *)v31;

    objc_msgSend(v6, "manufacturer");
    v33 = objc_claimAutoreleasedReturnValue();
    manufacturer = v8->_manufacturer;
    v8->_manufacturer = (NSString *)v33;

    v8->_accessoryReprovisionState = 0;
    objc_msgSend(v6, "firmwareVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      if (v38 && -[HMDAccessory supportsCHIP](v38, "supportsCHIP"))
      {
        v39 = [HMDAccessoryVersion alloc];
        objc_msgSend(v6, "firmwareVersion");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[HMDAccessoryVersion initWithMatterVersionString:](v39, "initWithMatterVersionString:", v40);
      }
      else
      {
        v42 = [HMDAccessoryVersion alloc];
        objc_msgSend(v6, "firmwareVersion");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[HMDAccessoryVersion initWithVersionString:](v42, "initWithVersionString:", v40);
      }
      v43 = v41;

      firmwareVersion = v36->_firmwareVersion;
      v36->_firmwareVersion = (HMDAccessoryVersion *)v43;

    }
    objc_msgSend(v6, "displayableFirmwareVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v6, "displayableFirmwareVersion");
      v46 = objc_claimAutoreleasedReturnValue();
      displayableFirmwareVersion = v8->_displayableFirmwareVersion;
      v8->_displayableFirmwareVersion = (NSString *)v46;

    }
    objc_msgSend(v6, "serialNumber");
    v48 = objc_claimAutoreleasedReturnValue();
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v48;

    objc_msgSend(v6, "initialModel");
    v50 = objc_claimAutoreleasedReturnValue();
    initialModel = v8->_initialModel;
    v8->_initialModel = (NSString *)v50;

    objc_msgSend(v6, "initialManufacturer");
    v52 = objc_claimAutoreleasedReturnValue();
    initialManufacturer = v8->_initialManufacturer;
    v8->_initialManufacturer = (NSString *)v52;

    objc_msgSend(v6, "initialCategoryIdentifier");
    v54 = objc_claimAutoreleasedReturnValue();
    initialCategoryIdentifier = v8->_initialCategoryIdentifier;
    v8->_initialCategoryIdentifier = (NSNumber *)v54;

    objc_msgSend(v6, "productDataV2");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (!v56)
    {
      objc_msgSend(v6, "productData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_productData, v57);
    if (!v56)

    objc_msgSend(v6, "suspendCapable");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v6, "suspendCapable");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_suspendCapable = objc_msgSend(v59, "BOOLValue");

    }
    objc_msgSend(v6, "lastSeenDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v6, "lastSeenDate");
      v61 = objc_claimAutoreleasedReturnValue();
      lastSeenDate = v8->_lastSeenDate;
      v8->_lastSeenDate = (NSDate *)v61;

    }
    objc_msgSend(v6, "lowBattery");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v6, "lowBattery");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_lowBattery = objc_msgSend(v64, "BOOLValue");

    }
    objc_msgSend(v7, "msgDispatcher");
    v65 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v8->_msgDispatcher;
    v8->_msgDispatcher = (HMFMessageDispatcher *)v65;

    objc_msgSend(v6, "accessoryCategory");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[HMDAccessory _updateCategory:notifyClients:](v8, "_updateCategory:notifyClients:", v67, 0);

    objc_msgSend(v6, "networkClientIdentifier");
    v69 = objc_claimAutoreleasedReturnValue();
    networkClientIdentifier = v8->_networkClientIdentifier;
    v8->_networkClientIdentifier = (NSNumber *)v69;

    v71 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v6, "networkRouterUUID");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "initWithUUIDString:", v72);
    networkRouterUUID = v8->_networkRouterUUID;
    v8->_networkRouterUUID = (NSUUID *)v73;

    objc_msgSend(v6, "currentNetworkProtectionMode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend(v6, "currentNetworkProtectionMode");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_currentNetworkProtectionMode = objc_msgSend(v76, "integerValue");

    }
    objc_msgSend(v6, "wiFiCredentialType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      v78 = (void *)MEMORY[0x1D17BA0A0]();
      v79 = v8;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "wiFiCredentialType");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 138543618;
        v108 = v81;
        v109 = 2112;
        v110 = v82;
        _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_INFO, "%{public}@Setting accessory wiFiCredentialType to %@", (uint8_t *)&v107, 0x16u);

      }
      objc_autoreleasePoolPop(v78);
      objc_msgSend(v6, "wiFiCredentialType");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v79->_wiFiCredentialType = objc_msgSend(v83, "integerValue");

    }
    objc_msgSend(v6, "appliedFirewallWANRules");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessoryAllowedHost allowedHostsFromJSONFirewallWANRules:](HMDAccessoryAllowedHost, "allowedHostsFromJSONFirewallWANRules:", v84);
    v85 = objc_claimAutoreleasedReturnValue();
    allowedHosts = v8->_allowedHosts;
    v8->_allowedHosts = (NSArray *)v85;

    objc_msgSend(v6, "wiFiUniquePreSharedKey");
    v87 = objc_claimAutoreleasedReturnValue();
    wiFiUniquePreSharedKey = v8->_wiFiUniquePreSharedKey;
    v8->_wiFiUniquePreSharedKey = (NSData *)v87;

    v89 = [HMDAccessoryNetworkAccessViolation alloc];
    objc_msgSend(v6, "lastNetworkAccessViolationOccurrenceSince1970");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastNetworkAccessViolationResetSince1970");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = -[HMDAccessoryNetworkAccessViolation initWithLastViolationTimeInterval:lastViolationResetTimeInterval:](v89, "initWithLastViolationTimeInterval:lastViolationResetTimeInterval:", v90, v91);

    if ((HMFEqualObjects() & 1) == 0)
      objc_storeStrong((id *)&v8->_networkAccessViolation, v92);
    objc_msgSend(v6, "primaryProfileVersion");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      v94 = objc_alloc(MEMORY[0x1E0D286E0]);
      objc_msgSend(v6, "primaryProfileVersion");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v94, "initWithVersionString:", v95);
      primaryProfileVersion = v8->_primaryProfileVersion;
      v8->_primaryProfileVersion = (HMFVersion *)v96;

    }
    objc_msgSend(v6, "sharedAdminAddedTimestamp");
    v98 = objc_claimAutoreleasedReturnValue();
    sharedAdminAddedTimestamp = v8->_sharedAdminAddedTimestamp;
    v8->_sharedAdminAddedTimestamp = (HMDUserManagementOperationTimestamp *)v98;

    objc_msgSend(v6, "pairingsAuditedTimestamp");
    v100 = objc_claimAutoreleasedReturnValue();
    pairingsAuditedTimestamp = v8->_pairingsAuditedTimestamp;
    v8->_pairingsAuditedTimestamp = (HMDUserManagementOperationTimestamp *)v100;

    objc_msgSend(v6, "pendingConfigurationIdentifier");
    v102 = objc_claimAutoreleasedReturnValue();
    pendingConfigurationIdentifier = v8->_pendingConfigurationIdentifier;
    v8->_pendingConfigurationIdentifier = (NSString *)v102;

    objc_msgSend(v6, "hostAccessoryUUID");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
      v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v104);
    else
      v105 = 0;
    -[HMDAccessory _updateHost:](v8, "_updateHost:", v105);

    goto LABEL_44;
  }
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v8;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 138543618;
    v108 = v25;
    v109 = 2112;
    v110 = v6;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create accessory from transaction with nil identifier: %@", (uint8_t *)&v107, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v26 = 0;
LABEL_45:

  return v26;
}

- (void)runTransactionWithModel:(id)a3 label:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory runTransactionWithModels:label:completion:](self, "runTransactionWithModels:label:completion:", v12, v10, v9, v13, v14);
}

- (void)runTransactionWithModels:(id)a3 label:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessory home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transaction:options:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "add:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__HMDAccessory_runTransactionWithModels_label_completion___block_invoke;
  v21[3] = &unk_1E89C1A48;
  v22 = v10;
  v20 = v10;
  objc_msgSend(v14, "run:", v21);

}

- (void)transactionAccessoryUpdatedForPreferredMediaUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  HMDAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend(v6, "propertyWasSet:", CFSTR("preferredMediaUserUUID"))
    && (objc_msgSend(v6, "preferredMediaUserUUID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMDAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = HMFEqualObjects(),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredMediaUserUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferred media user UUID: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v6, "preferredMediaUserUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory setPreferredMediaUserUUID:](v13, "setPreferredMediaUserUUID:", v17);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v6, "propertyWasSet:", CFSTR("preferredUserSelectionType")))
  {
    objc_msgSend(v6, "preferredUserSelectionType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preferredUserSelectionType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v24;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferred media user selection type: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v6, "preferredUserSelectionType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory setPreferredMediaUserSelectionTypeNumber:](v22, "setPreferredMediaUserSelectionTypeNumber:", v26);

      v11 = 1;
    }
  }
  v7[2](v7, v11);

}

- (void)decodePreferredMediaUser:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7D88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory setPreferredMediaUserUUID:](self, "setPreferredMediaUserUUID:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7D98]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory setPreferredMediaUserSelectionTypeNumber:](self, "setPreferredMediaUserSelectionTypeNumber:", v6);
}

- (void)encodePreferredMediaUser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB7D88]);

  -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB7D98]);

  }
}

- (void)setPreferredMediaUser:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HMDAccessory_setPreferredMediaUser_selectionType_completion___block_invoke;
  v11[3] = &unk_1E89BE698;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v12 = v10;
  -[HMDAccessory runTransactionWithPreferredMediaUserUUID:selectionType:completion:](self, "runTransactionWithPreferredMediaUserUUID:selectionType:completion:", v8, a4, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)setDefaultPreferredMediaUserIfRemoved:(id)a3 defaultUser:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessory *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    _HMFPreconditionFailure();
  v11 = (void (**)(_QWORD, _QWORD))v10;
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hmf_isEqualToUUID:", v13);

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v18;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting preferred media user: %@ to default user: %@.", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (v9)
    {
      objc_msgSend(v9, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory setPreferredMediaUser:selectionType:completion:](v16, "setPreferredMediaUser:selectionType:completion:", v19, 0, v11);

    }
    else
    {
      -[HMDAccessory setPreferredMediaUser:selectionType:completion:](v16, "setPreferredMediaUser:selectionType:completion:", 0, 0, v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v24;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed user is not current preferred media user: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    if (v11)
      ((void (**)(_QWORD, void *))v11)[2](v11, v20);

  }
}

- (void)sendRemovalRequest
{
  -[HMDAccessory sendRemovalRequestWithCompletion:](self, "sendRemovalRequestWithCompletion:", 0);
}

- (void)sendRemovalRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory shortDescription](v6, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending removal request for accessory: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleRemoveAccessory:completion:", v6, v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDAccessory home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessory;
  -[HMDAccessory dealloc](&v6, sel_dealloc);
}

- (BOOL)isCurrentAccessory
{
  return 0;
}

- (BOOL)isPrimary
{
  return 1;
}

- (unint64_t)supportedTransports
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setCategory:(id)a3
{
  HMAccessoryCategory *v4;
  HMAccessoryCategory *category;

  objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", a3);
  v4 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();
  category = self->_category;
  self->_category = v4;

}

- (id)shortDescription
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = isInternalBuild();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[HMDAccessory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory isReachable](self, "isReachable");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@/%@/%@"), v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDAccessory uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory isReachable](self, "isReachable");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSArray)transportReports
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDAccessoryTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryTransaction *v9;

  v5 = [HMDAccessoryTransaction alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)backingStoreObjects:(int64_t)a3
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory appData](self, "appData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 3 && v6)
  {
    -[HMDAccessory appData](self, "appData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelObjectWithChangeType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if (a3 > 3)
  {
    -[HMDAccessory softwareUpdate](self, "softwareUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "downloadSize"))
    {
      objc_msgSend(v10, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObjectChangeType:", 1);
      objc_msgSend(v11, "parentUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[HMDAccessory uuid](self, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParentUUIDIfNotNil:", v13);

      }
      objc_msgSend(v5, "addObject:", v11);

    }
  }
  return v5;
}

- (void)_registerForMessages
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[4];

  v81[2] = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v6;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateRoomForAccessoryRequestKey"), self, v8, sel___handleUpdateRoom_);

  objc_msgSend(v3, "administratorHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v10;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kRenameAccessoryRequestKey"), self, v12, sel___handleRename_);

  objc_msgSend(v3, "administratorHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v14;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", CFSTR("kSetAppDataRequestKey"), self, v16, sel___handleSetAppData_);

  objc_msgSend(v3, "administratorHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB8160];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v19;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerForMessage:receiver:policies:selector:", v18, self, v21, sel___handleUpdatePendingConfigurationIdentifierMessage_);

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v23;
  v76[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", CFSTR("kAccessoryAdvertisingParamsRequestKey"), self, v24, sel___handleGetAccessoryAdvertisingParams_);

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v26;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", CFSTR("kListPairingsRequestKey"), self, v28, sel___handleListPairings_);

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0CB79C8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v31;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", v30, self, v33, sel___handleAuditPairings_);

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0CB7D70];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v36;
  v73[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerForMessage:receiver:policies:selector:", v35, self, v37, sel___handlePairingIdentityRequest_);

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRoles:", objc_msgSend(v38, "roles") | 6);
  v39 = (void *)objc_msgSend(v38, "copy");
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v41;
  v72[1] = v39;
  v72[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "registerForMessage:receiver:policies:selector:", CFSTR("kIdentifyAccessoryRequestKey"), self, v42, sel___handleIdentify_);

  if (isInternalBuild())
  {
    -[HMDAccessory msgDispatcher](self, "msgDispatcher");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0CB9640];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v45;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "registerForMessage:receiver:policies:selector:", v44, self, v47, sel__handleWiFiReconfiguration_);

    -[HMDAccessory msgDispatcher](self, "msgDispatcher");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x1E0CB8178];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v50;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "registerForMessage:receiver:policies:selector:", v49, self, v52, sel_handleAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage_);

  }
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x1E0CB7DB0];
  v69[0] = v4;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v55;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "registerForMessage:receiver:policies:selector:", v54, self, v57, sel__handleLastSeenStatusRequestMessage_);

  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = *MEMORY[0x1E0CB7DB8];
  v68[0] = v4;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v60;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "registerForMessage:receiver:policies:selector:", v59, self, v62, sel__handleLinkQualityRequestMessage_);

  if (self)
  {
    -[HMDAccessory msgDispatcher](self, "msgDispatcher");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0CB9630];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v65;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "registerForMessage:receiver:policies:selector:", v64, self, v67, sel__handlePreviewAllowedHosts_);

  }
}

- (void)_handleLastSeenStatusRequestMessage:(id)a3
{
  id v4;
  HMDRemoteMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteMessage *v9;
  id v10;
  void *v11;
  void *v12;
  HMDAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMDRemoteMessage alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v5, "initWithName:destination:payload:type:timeout:secure:", v6, v7, v8, 0, 1, 10.0);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__HMDAccessory__handleLastSeenStatusRequestMessage___block_invoke;
  v18[3] = &unk_1E89C0E20;
  v10 = v4;
  v19 = v10;
  -[HMDRemoteMessage setResponseHandler:](v9, "setResponseHandler:", v18);
  -[HMDAccessory home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDAccessory sendLastSeenStatusResponseMessage:](self, "sendLastSeenStatusResponseMessage:", v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Re-dispatching to primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAccessory uuid](v13, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory workQueue](v13, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "redispatchToResidentMessage:target:responseQueue:", v9, v16, v17);

  }
}

- (void)sendLastSeenStatusResponseMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessory *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v8;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Handling message %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAccessory isReachable](v6, "isReachable"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@LastSeen: Accessory is reachable responding with error", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2505);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v19 = (void *)v13;
    objc_msgSend(v4, "respondWithError:", v13);
    goto LABEL_17;
  }
  if (!-[HMDAccessory hasBattery](v6, "hasBattery")
    || !-[HMDAccessory _getLastKnownLowBatteryStatus](v6, "_getLastKnownLowBatteryStatus"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@LastSeen: Accessory did not report low battery - LastSeen is not tracked", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (-[HMDAccessory hasBattery](v6, "hasBattery"))
  {
    if (-[HMDAccessory isLowBattery](v6, "isLowBattery"))
      v14 = 1;
    else
      v14 = 2;
  }
  else
  {
    v14 = 0;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = v6;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory lastSeenDate](v21, "lastSeenDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v23;
    v29 = 2112;
    v30 = v24;
    v31 = 2048;
    v32 = v14;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Responding from primary with lastSeen: %@, batteryStatus: %lu", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory lastSeenDate](v21, "lastSeenDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("kAccessoryLastSeenKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("kAccessoryLowBatteryStatusKey"));

  objc_msgSend(v4, "respondWithPayload:", v19);
LABEL_17:

}

- (void)_handleLinkQualityRequestMessage:(id)a3
{
  id v4;
  HMDRemoteMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteMessage *v9;
  id v10;
  HMDAccessory *v11;
  HMDAccessory *v12;
  HMDAccessory *v13;
  void *v14;
  void *v15;
  HMDAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = [HMDRemoteMessage alloc];
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v5, "initWithName:destination:payload:type:timeout:secure:", v6, v7, v8, 0, 1, 10.0);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__HMDAccessory__handleLinkQualityRequestMessage___block_invoke;
    v21[3] = &unk_1E89C0E20;
    v10 = v4;
    v22 = v10;
    -[HMDRemoteMessage setResponseHandler:](v9, "setResponseHandler:", v21);
    v11 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13 && -[HMDAccessory communicationProtocol](v13, "communicationProtocol") == 2)
    {
      -[HMDAccessory home](v11, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isCurrentDeviceConfirmedPrimaryResident"))
      {
        -[HMDAccessory handleLinkQualityRequestMessage:](v13, "handleLinkQualityRequestMessage:", v9);
      }
      else
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v11;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v18;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@LinkQuality: Re-dispatching to primary resident", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        -[HMDAccessory uuid](v16, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory workQueue](v16, "workQueue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "redispatchToResidentMessage:target:responseQueue:", v9, v19, v20);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("This Accessory type does not support link quality"), 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v14);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Feature is disabled"), CFSTR("Feature flag is disabled"), 0);
    v9 = (HMDRemoteMessage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v9);
  }

}

- (void)handleAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  HMDAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory update should process transaction removal value request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB8170];
  v18 = 0;
  v11 = objc_msgSend(v9, "hmf_BOOLForKey:error:", v10, &v18);
  v12 = v18;

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get value from payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v4, "respondWithError:", v12);
  }
  else
  {
    -[HMDAccessory setShouldProcessTransactionRemoval:](v6, "setShouldProcessTransactionRemoval:", v11);
    objc_msgSend(v4, "respondWithSuccess");
  }

}

- (void)__handleIdentify:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (isWatch() || !-[HMDAccessory isReachable](self, "isReachable"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      isWatch();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory isReachable](v10, "isReachable");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Relaying request to identify accessory because we are a watch (%@) or the accessory is unreachable (%@)", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    if (-[HMDAccessory isRemoteAccessEnabled](v10, "isRemoteAccessEnabled"))
    {
      -[HMDAccessory _relayIdentifyAccessorytoResidentForMessage:](v10, "_relayIdentifyAccessorytoResidentForMessage:", v4);
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v10;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay request to identify accessory because remote access is not enabled", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling identify", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessory handleIdentifyAccessoryMessage:](v6, "handleIdentifyAccessoryMessage:", v4);
  }

}

- (void)_relayIdentifyAccessorytoResidentForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D285D0];
  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HMDAccessory__relayIdentifyAccessorytoResidentForMessage___block_invoke;
  v12[3] = &unk_1E89C0E20;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v5, "messageWithMessage:messagePayload:responseHandler:", v7, v6, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "redispatchToResidentMessage:target:responseQueue:", v8, v10, v11);

}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  NSObject *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
    dispatch_group_enter(v11);
  -[HMDAccessory setHome:](self, "setHome:", v9);
  -[HMDAccessory setMsgDispatcher:](self, "setMsgDispatcher:", v10);
  -[HMDAccessory workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__HMDAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
  v17[3] = &unk_1E89C07B8;
  v17[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, v17);

}

- (BOOL)isFirstPartyAccessory
{
  HMDAccessory *v2;
  char isKindOfClass;

  v2 = self;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v2 != 0);
}

- (BOOL)hasMediaProfile
{
  void *v2;
  char v3;

  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_220);

  return v3;
}

- (BOOL)hasSiriEndpointProfile
{
  void *v2;
  char v3;

  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_222);

  return v3;
}

- (void)unconfigure
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "unconfigure");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[HMDAccessory setAccessoryProfiles:](self, "setAccessoryProfiles:", 0);
}

- (void)removeCloudData
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeCloudData");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    v5 = (NSString *)objc_msgSend(v7, "copy");
    identifier = self->_identifier;
    self->_identifier = v5;

    os_unfair_recursive_lock_unlock();
    v4 = v7;
  }

}

- (unint64_t)consecutivePairingFailure
{
  unint64_t consecutivePairingFailures;

  os_unfair_recursive_lock_lock_with_options();
  consecutivePairingFailures = self->_consecutivePairingFailures;
  os_unfair_recursive_lock_unlock();
  return consecutivePairingFailures;
}

- (void)setConsecutivePairingFailure:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_consecutivePairingFailures = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)resetOnBackoffExpiry
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_resetOnBackoffExpiry;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setResetOnBackoffExpiry:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_resetOnBackoffExpiry = a3;
  os_unfair_recursive_lock_unlock();
}

- (NSUUID)endpointIdentifier
{
  return 0;
}

- (BOOL)hasBattery
{
  return 0;
}

- (void)setRoom:(id)a3
{
  HMDRoom *v4;
  HMDRoom *room;
  id v6;

  v4 = (HMDRoom *)a3;
  os_unfair_recursive_lock_lock_with_options();
  room = self->_room;
  self->_room = v4;

  os_unfair_recursive_lock_unlock();
  -[HMDAccessory home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureBulletinNotification");

}

- (void)updateRoom:(id)a3 source:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HMDAccessory_updateRoom_source___block_invoke;
  block[3] = &unk_1E89BE2F0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (id)modelWithUpdatedRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRoomUUID:", v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory name](v9, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create update room model because room was not specified for accessory %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v5 = 0;
  }

  return v5;
}

- (void)__handleUpdateRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDAccessory *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  HMDAccessory *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kRoomUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "roomWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rooms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v11;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@__handleUpdateRoom: home: %@, rooms: %@, newRoom: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v6)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory name](v21, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v23;
      v43 = 2112;
      v44 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room for accessory %@ since home cannot be found on accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = 2018;
    goto LABEL_15;
  }
  if (!v7)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v9;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory name](v28, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      v43 = 2112;
      v44 = v31;
      v45 = 2112;
      v46 = v5;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room for accessory %@ since room with UUID %@ cannot be found", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = 2017;
LABEL_15:
    objc_msgSend(v25, "hmPrivateErrorWithCode:", v26);
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v15 = (void *)v32;
    objc_msgSend(v4, "respondWithError:", v32);
    goto LABEL_17;
  }
  if (v5)
  {
    objc_msgSend(v6, "roomForEntireHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "isEqual:", v13);

    if ((v14 & 1) == 0 && (unint64_t)objc_msgSend(v6, "accessoryCountForRoom:", v7) >= 0x3E8)
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v9;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory name](v34, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        v45 = 2112;
        v46 = v38;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Can't assign %@  to room %@; already at maximum accessories allowed",
          buf,
          0x20u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 49);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  -[HMDAccessory modelWithUpdatedRoom:](v9, "modelWithUpdatedRoom:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transaction:options:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "add:withMessage:", v15, v4);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __35__HMDAccessory___handleUpdateRoom___block_invoke;
  v39[3] = &unk_1E89C21C0;
  v39[4] = v9;
  v40 = v7;
  objc_msgSend(v19, "run:", v39);

LABEL_17:
}

- (BOOL)_updateRoom:(id)a3 source:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDAccessory *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  HMDAccessory *v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roomWithUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    v43 = 2112;
    v44 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@_updateRoom to: room: %@, source: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (v8)
  {
    if (!v7)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v7, "roomForEntireHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_12:
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v10;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v27;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room since room with UUID %@ or its home cannot be found", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      v28 = 0;
      goto LABEL_21;
    }
  }
  if (!v8)
    goto LABEL_12;
  -[HMDAccessory room](v10, "room");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v16, "hmf_isEqualToUUID:", v17);

  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v10;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if ((_DWORD)v18)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory is already in the same room. not updating.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }
  else
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v29;
      v41 = 2112;
      v42 = v15;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating room: %@ new room: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDAccessory room](v20, "room");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessory setRoom:](v20, "setRoom:", v8);
    v32 = objc_alloc(MEMORY[0x1E0C99E08]);
    v37 = CFSTR("HMIsCloudSourceKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (a4 & 0xFFFFFFFFFFFFFFFELL) == 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithDictionary:", v34);

    if (v31)
      objc_msgSend(v35, "setObject:forKey:", v31, CFSTR("kRoomOldNameKey"));
    v18 = objc_msgSend(v35, "copy");
    logAndPostNotification(CFSTR("HMDNotificationAccessoryChangedRoom"), v20, (void *)v18);

    LOBYTE(v18) = 0;
  }
  v28 = v18 ^ 1;

LABEL_21:
  return v28;
}

- (void)updateCategory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (-[HMDAccessory categoryIdentifier](self, "categoryIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", v4),
        v5,
        !v6))
  {
    -[HMDAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessoryCategory:", v4);
    -[HMDAccessory home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transaction:options:", CFSTR("AccessoryUpdated"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:withMessage:", v12, 0);
    objc_msgSend(v16, "run");

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory categoryIdentifier](v8, "categoryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@No change in category -- old: %@, new: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)_updateCategory:(id)a3 notifyClients:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[HMDAccessory isPrimary](self, "isPrimary"))
    goto LABEL_11;
  if (!v6)
  {
    -[HMDAccessory category](self, "category");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_11;
  }
  -[HMDAccessory setCategoryIdentifier:](self, "setCategoryIdentifier:", v6);
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "categoryForOther");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_9;
  }
  -[HMDAccessory category](self, "category");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[HMDAccessory category](self, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuidStr");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_9;
  }
  v15 = objc_alloc(MEMORY[0x1E0CBA1D8]);
  objc_msgSend(v8, "uuidStr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "catDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithType:name:", v16, v17);
  -[HMDAccessory setCategory:](self, "setCategory:", v18);

  if (!a4)
  {
LABEL_9:

LABEL_11:
    v23 = 0;
    goto LABEL_12;
  }
  -[HMDAccessory category](self, "category");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObjectForIncomingXPCMessage(v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D285D0];
  v26 = CFSTR("kAccessoryCategory");
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageWithName:messagePayload:", CFSTR("kAccessoryCategoryChangedNotificationKey"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v23;
}

- (void)setInitialCategoryIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *initialCategoryIdentifier;

  v4 = (NSNumber *)a3;
  os_unfair_recursive_lock_lock_with_options();
  initialCategoryIdentifier = self->_initialCategoryIdentifier;
  self->_initialCategoryIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)__handleGetAccessoryAdvertisingParams:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  -[HMDAccessory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("kIdentifierKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "respondWithPayload:", v9);

}

- (void)_handleUpdatedName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7 = CFSTR("kAccessoryName");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  logAndPostNotification(CFSTR("HMDAccessoryNameUpdatedNotification"), self, v6);
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

- (void)_renameAccessory:(id)a3 resetName:(BOOL)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v8 = a5;
  v9 = a3;
  -[HMDAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v9);
  objc_msgSend(v10, "setConfiguredName:", v9);

  -[HMDAccessory home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transaction:options:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v15, "add:withMessage:", v10, 0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__HMDAccessory__renameAccessory_resetName_message___block_invoke;
    v16[3] = &unk_1E89C21C0;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v15, "run:", v16);

  }
  else
  {
    objc_msgSend(v15, "add:withMessage:", v10, v8);
    objc_msgSend(v15, "run");
  }

}

- (void)__handleRename:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  HMDAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kAccessoryName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kAccessoryNameResetKey"));
  v7 = objc_msgSend(v5, "length");
  if ((_DWORD)v6)
  {
    if (v7)
    {
LABEL_3:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = 3;
LABEL_9:
      objc_msgSend(v8, "hmErrorWithCode:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
      goto LABEL_10;
    }
  }
  else if (!v7)
  {
    goto LABEL_3;
  }
  v10 = HMMaxLengthForNaming();
  if (objc_msgSend(v5, "length") > v10)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = 46;
    goto LABEL_9;
  }
  -[HMDAccessory home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  if (v16)
  {
    if (v5 && (objc_msgSend(v16, "validateName:", v5), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = (void *)v17;
      objc_msgSend(v4, "respondWithError:", v17);

    }
    else
    {
      -[HMDAccessory _renameAccessory:resetName:message:](self, "_renameAccessory:resetName:message:", v5, v6, v4);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to change name as no home is associated to the accessory", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2018);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v25);

  }
LABEL_10:

}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  model = self->_model;
  self->_model = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setInitialModel:(id)a3
{
  NSString *v4;
  NSString *initialModel;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  initialModel = self->_initialModel;
  self->_initialModel = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setInitialManufacturer:(id)a3
{
  NSString *v4;
  NSString *initialManufacturer;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  initialManufacturer = self->_initialManufacturer;
  self->_initialManufacturer = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setFirmwareVersion:(id)a3
{
  HMDAccessoryVersion *v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessoryVersion *firmwareVersion;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  HMDAccessoryVersion *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (HMDAccessoryVersion *)a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory firmwareVersion](v6, "firmwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating firmware version from %@ to %@.", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_recursive_lock_lock_with_options();
  firmwareVersion = v6->_firmwareVersion;
  v6->_firmwareVersion = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setDisplayableFirmwareVersion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMDAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSString *displayableFirmwareVersion;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hm_truncatedDisplayableVersionString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory displayableFirmwareVersion](v7, "displayableFirmwareVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating displayable firmware version string from %@ to %@.", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  os_unfair_recursive_lock_lock_with_options();
  displayableFirmwareVersion = v7->_displayableFirmwareVersion;
  v7->_displayableFirmwareVersion = (NSString *)v5;

  os_unfair_recursive_lock_unlock();
}

- (void)setSerialNumber:(id)a3
{
  NSString *v4;
  NSString *serialNumber;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  serialNumber = self->_serialNumber;
  self->_serialNumber = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setProductData:(id)a3
{
  NSString *v4;
  NSString *productData;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)productGroup
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  v3 = (void *)objc_opt_class();
  -[HMDAccessory productData](self, "productData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:", v4, &v7, 0);
  v5 = v7;

  return (NSString *)v5;
}

- (void)updateMediaSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HMDAccessory_updateMediaSession___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyAccessoryNameChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessory *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  HMDAccessory *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5 && v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Name changed to %@, notifying clients", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = (void *)MEMORY[0x1E0D285D0];
    -[HMDAccessory messageDestination](v8, "messageDestination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("kAccessoryName");
    v28[1] = CFSTR("kHomeUUID");
    v29[0] = v5;
    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("kAccessoryNameChangedNotificationKey"), v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessory msgDispatcher](v8, "msgDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:completionHandler:", v17, 0);

    -[HMDAccessory workQueue](v8, "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __43__HMDAccessory_notifyAccessoryNameChanged___block_invoke;
    v25 = &unk_1E89C2328;
    v26 = v8;
    v27 = v5;
    dispatch_async(v19, &v22);

    if (v3)
    {
      objc_msgSend(v6, "homeManager", v22, v23, v24, v25, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "assistantSyncDataChanged:", CFSTR("kAccessoryNameChangedNotificationKey"));

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v21;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Name or home is nil, cannot send name changed notification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMDUserManagementOperationTimestamp)sharedAdminAddedTimestamp
{
  HMDUserManagementOperationTimestamp *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_sharedAdminAddedTimestamp;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSharedAdminAddedTimestamp:(id)a3
{
  HMDUserManagementOperationTimestamp *v4;
  HMDUserManagementOperationTimestamp *sharedAdminAddedTimestamp;

  v4 = (HMDUserManagementOperationTimestamp *)a3;
  os_unfair_recursive_lock_lock_with_options();
  sharedAdminAddedTimestamp = self->_sharedAdminAddedTimestamp;
  self->_sharedAdminAddedTimestamp = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDUserManagementOperationTimestamp)pairingsAuditedTimestamp
{
  HMDUserManagementOperationTimestamp *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pairingsAuditedTimestamp;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setPairingsAuditedTimestamp:(id)a3
{
  HMDUserManagementOperationTimestamp *v4;
  HMDUserManagementOperationTimestamp *pairingsAuditedTimestamp;

  v4 = (HMDUserManagementOperationTimestamp *)a3;
  os_unfair_recursive_lock_lock_with_options();
  pairingsAuditedTimestamp = self->_pairingsAuditedTimestamp;
  self->_pairingsAuditedTimestamp = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)requiresHomeAppForManagement
{
  return 0;
}

- (BOOL)supportsMediaContentProfile
{
  return 0;
}

- (BOOL)supportsPersonalRequests
{
  return 0;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return 0;
}

- (void)setSuspendedCapable:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_suspendCapable = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)reachabilityPingEnabled
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_reachabilityPingEnabled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[HMDAccessory supportsUnreachablePing](self, "supportsUnreachablePing");
  os_unfair_recursive_lock_lock_with_options();
  self->_reachabilityPingEnabled = v3;
  if (self->_reachable)
    v5 = 1;
  os_unfair_recursive_lock_unlock();
  if (!v5 || !v3)
    -[HMDAccessory stopReachabilityCheck](self, "stopReachabilityCheck");
  else
    -[HMDAccessory startReachabilityCheck](self, "startReachabilityCheck");
}

- (BOOL)reachabilityPingNotificationEnabled
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_reachabilityPingNotificationEnabled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setreachabilityPingNotificationEnabled:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_reachabilityPingNotificationEnabled = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setTimeBecameUnreachable:(id)a3
{
  NSDate *v4;
  NSDate *timeBecameUnreachable;

  v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  timeBecameUnreachable = self->_timeBecameUnreachable;
  self->_timeBecameUnreachable = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSDate)timeBecameUnreachable
{
  NSDate *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_timeBecameUnreachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setTimeBecameReachable:(id)a3
{
  NSDate *v4;
  NSDate *timeBecameReachable;

  v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  timeBecameReachable = self->_timeBecameReachable;
  self->_timeBecameReachable = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSDate)timeBecameReachable
{
  NSDate *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_timeBecameReachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_checkForLastSeenUpdateOnBecomingUnreachable
{
  void *v3;
  HMDAccessory *v4;
  HMDAccessory *v5;
  HMDAccessory *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  HMDAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  HMDAccessory *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDAccessory accessoryMetric](v6, "accessoryMetric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionMetric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submissionIntervalSec");
  v10 = v9;

  if (v10 <= 0.0)
  {
    v14 = 86400.0;
  }
  else
  {
    -[HMDAccessory accessoryMetric](v6, "accessoryMetric");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionMetric");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submissionIntervalSec");
    v14 = v13;

  }
  -[HMDAccessory lastSeenDate](v4, "lastSeenDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v18, "timeIntervalSinceNow");
  v20 = v19;
  if (objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident")
    && -[HMDAccessory _getLastKnownLowBatteryStatus](v4, "_getLastKnownLowBatteryStatus")
    && fabs(v20) > v14)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v4;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory lastSeenDate](v22, "lastSeenDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v24;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Saving lastSeen for accessory: %@ to %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory setLastSeenDate:](v22, "setLastSeenDate:", v26);

    -[HMDAccessory saveLastSeenToLocalStore](v22, "saveLastSeenToLocalStore");
    objc_msgSend(v3, "saveToCurrentAccountWithReason:", CFSTR("kAccessoryLastSeenKey"));
  }

}

- (void)saveLastSeenToLocalStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory lastSeenDate](self, "lastSeenDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastSeenDate:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessory _getLastKnownLowBatteryStatus](self, "_getLastKnownLowBatteryStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLowBattery:", v4);

  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transaction:options:", CFSTR("kAccessoryLastSeenKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "add:", v9);
  objc_msgSend(v8, "run");

}

- (BOOL)_getLastKnownLowBatteryStatus
{
  char v3;
  HMDAccessory *v4;
  HMDAccessory *v5;
  HMDAccessory *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[HMDAccessory isLowBattery](self, "isLowBattery");
  v4 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDAccessory findCharacteristicType:forServiceType:](v6, "findCharacteristicType:forServiceType:", *MEMORY[0x1E0CB8A60], *MEMORY[0x1E0CB99B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v9, "BOOLValue");

  }
  return v3;
}

- (void)setRemotelyReachable:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 reachable;
  uint64_t v6;
  void *v7;
  HMDAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  __CFString *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_remotelyReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_remotelyReachable = v3;
    reachable = self->_reachable;
    v6 = os_unfair_recursive_lock_unlock();
    v7 = (void *)MEMORY[0x1D17BA0A0](v6);
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isRemotelyReachable to %{public}@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!reachable && v12 != 0)
      -[HMDAccessory _notifyConnectivityChangedWithRemoteAccessChanged:](v8, "_notifyConnectivityChangedWithRemoteAccessChanged:", 0);
    -[HMDAccessory notificationCenter](v8, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v3)
      v16 = CFSTR("HMDAccessoryIsRemotelyReachableNotification");
    else
      v16 = CFSTR("HMDAccessoryIsNotRemotelyReachableNotification");
    logAndPostNotificationWithNotificationCenter(v14, v16, v8, 0);

  }
}

- (void)setLastSeenDate:(id)a3
{
  NSDate *v4;
  NSDate *lastSeenDate;

  v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setLowBattery:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lowBattery = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setConnected:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_connected = a3;
  os_unfair_recursive_lock_unlock();
}

- (id)messageSendPolicy
{
  return -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:", 1, 1);
}

- (void)_notifyConnectivityChangedWithRemoteAccessChanged:(BOOL)a3
{
  void *v5;
  void *v6;
  HMDAccessory *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isResidentSupported") & 1) != 0
    || a3
    || !-[HMDAccessory isRemoteAccessEnabled](self, "isRemoteAccessEnabled"))
  {
    objc_msgSend(v5, "notifyClientsOfReachabilityUpdateForAccessory:", self);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring non-remote reachability change while remote access is enabled", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)remoteAccessEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HMDAccessory_remoteAccessEnabled___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_remoteAccessEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[HMDAccessory isRemoteAccessEnabled](self, "isRemoteAccessEnabled") != a3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory isRemoteAccessEnabled](v6, "isRemoteAccessEnabled");
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating remote access enabled from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessory home](v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isResidentSupported");

    if (v12)
      -[HMDAccessory setRemotelyReachable:](v6, "setRemotelyReachable:", v3);
    else
      -[HMDAccessory _notifyConnectivityChangedWithRemoteAccessChanged:](v6, "_notifyConnectivityChangedWithRemoteAccessChanged:", 1);
    -[HMDAccessory setRemoteAccessEnabled:](v6, "setRemoteAccessEnabled:", v3);
  }
}

- (void)setConfigNumber:(unint64_t)a3
{
  unint64_t configNumber;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  HMDAccessory *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  configNumber = self->_configNumber;
  self->_configNumber = a3;
  v7 = configNumber != a3 && configNumber != 0;
  v8 = os_unfair_recursive_lock_unlock();
  v9 = (void *)MEMORY[0x1D17BA0A0](v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    v18 = 1024;
    v19 = configNumber;
    v20 = 1024;
    v21 = a3;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@c# was set %u -> %u", buf, 0x18u);

  }
  objc_autoreleasePoolPop(v9);
  if (v7)
  {
    -[HMDAccessory workQueue](v10, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__HMDAccessory_setConfigNumber___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v10;
    dispatch_async(v13, block);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("HMDAccessoryConfigNumberUpdatedNotification"), v10);

  }
}

- (void)_configNumberUpdated
{
  NSObject *v2;

  -[HMDAccessory workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

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

- (void)__handleSetAppData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  __CFString *v9;
  void *v10;
  void *v11;
  HMDAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDApplicationData *v16;
  HMDApplicationData *v17;
  HMDApplicationData *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  HMDAccessory *v31;
  NSObject *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v4, "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v9 = CFSTR("com.apple.homekit-entitledclient.identifer");
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("kAppDataInformationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v14;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to update appData for accessory to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDAccessory appData](v12, "appData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (HMDApplicationData *)objc_msgSend(v15, "copy");
    v17 = v16;
    if (v10)
    {
      if (!v16)
      {
        v18 = [HMDApplicationData alloc];
        -[HMDAccessory uuid](v12, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[HMDApplicationData initWithParentUUID:](v18, "initWithParentUUID:", v19);

      }
      -[HMDApplicationData setApplicationData:forIdentifier:](v17, "setApplicationData:forIdentifier:", v10, CFSTR("com.apple.homekit-entitledclient.identifer"));
      -[HMDApplicationData modelObjectWithChangeType:](v17, "modelObjectWithChangeType:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v15)
        objc_msgSend(v20, "setObjectChangeType:", 1);
      v35 = v15;
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("kAppDataInformationKey"));
      if (v21)
        goto LABEL_10;
    }
    else
    {
      -[HMDApplicationData removeApplicationDataForIdentifier:](v16, "removeApplicationDataForIdentifier:", CFSTR("com.apple.homekit-entitledclient.identifer"));
      if (!v17)
      {
LABEL_17:
        objc_msgSend(v4, "respondWithPayload:", 0);
        goto LABEL_18;
      }
      v35 = v15;
      -[HMDApplicationData modelObjectWithChangeType:](v17, "modelObjectWithChangeType:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
LABEL_10:
        objc_msgSend(v5, "backingStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v23 = v4;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transaction:options:", v24, v25);
        v26 = v10;
        v27 = v8;
        v28 = v5;
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v23;
        objc_msgSend(v29, "add:withMessage:", v21, v23);
        objc_msgSend(v29, "run");

        v5 = v28;
        v8 = v27;
        v10 = v26;

        v15 = v35;
LABEL_18:

        v34 = CFSTR("com.apple.homekit-entitledclient.identifer");
        goto LABEL_19;
      }
    }
    v15 = v35;
    goto LABEL_17;
  }
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v33;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Attempted to set appData on an accessory that is no longer part of a home", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  objc_msgSend(v4, "responseHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, __CFString *, _QWORD))v8)[2](v8, v34, 0);
LABEL_19:

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
  HMDAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDAccessory appData](self, "appData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithModel:", v6);

  }
  else
  {
    v10 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithDictionary:parentUUID:](v10, "initWithDictionary:parentUUID:", v11, v12);
    -[HMDAccessory setAppData:](self, "setAppData:", v13);

    v14 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

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
  -[HMDAccessory setAppData:](self, "setAppData:", 0);
  objc_msgSend(v5, "transactionResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markChanged");
  objc_msgSend(v5, "respondWithPayload:", 0);

}

- (void)addAccessoryProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    -[NSMutableSet addObject:](self->_accessoryProfiles, "addObject:", v7);
    os_unfair_recursive_lock_unlock();
    -[HMDAccessory msgDispatcher](self, "msgDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMDAccessory msgDispatcher](self, "msgDispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configureWithMessageDispatcher:configurationTracker:", v6, 0);

    }
    -[HMDAccessory handleAddedAccessoryProfile:](self, "handleAddedAccessoryProfile:", v7);
    v4 = v7;
  }

}

- (void)handleAddedAccessoryProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    -[HMDAccessory handleAddedMediaProfile:](self, "handleAddedMediaProfile:", v6);
  v9 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    -[HMDAccessory handleAddedSiriEndpointProfile:](self, "handleAddedSiriEndpointProfile:", v8);
  logAndPostNotification(CFSTR("HMDAccessoryProfileAddedNotification"), self, 0);

}

- (void)handleAddedMediaProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling added media profile: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleAddedSiriEndpointProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling added siri endpoint profile: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)removeAccessoryProfile:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_recursive_lock_lock_with_options();
    -[NSMutableSet removeObject:](self->_accessoryProfiles, "removeObject:", v5);
    os_unfair_recursive_lock_unlock();
    v4 = v5;
  }

}

- (void)setAccessoryProfiles:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *accessoryProfiles;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    accessoryProfiles = self->_accessoryProfiles;
    self->_accessoryProfiles = v4;

  }
  else
  {
    -[NSMutableSet removeAllObjects](self->_accessoryProfiles, "removeAllObjects");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)setPrimaryProfileVersion:(id)a3
{
  HMFVersion *v4;
  HMFVersion *primaryProfileVersion;

  v4 = (HMFVersion *)a3;
  os_unfair_recursive_lock_lock_with_options();
  primaryProfileVersion = self->_primaryProfileVersion;
  self->_primaryProfileVersion = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)supportsNetworkProtection
{
  return 0;
}

- (BOOL)needsAirplayAccess
{
  return 0;
}

- (void)setNetworkClientIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *networkClientIdentifier;

  v4 = (NSNumber *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkClientIdentifier = self->_networkClientIdentifier;
  self->_networkClientIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setNetworkRouterUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *networkRouterUUID;

  v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkRouterUUID = self->_networkRouterUUID;
  self->_networkRouterUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)saveNetworkClientIdentifier:(id)a3 networkRouterUUID:(id)a4 clearProfileFingerprint:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[HMDAccessory workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__HMDAccessory_saveNetworkClientIdentifier_networkRouterUUID_clearProfileFingerprint___block_invoke;
  v13[3] = &unk_1E89BCF10;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (int64_t)targetNetworkProtectionMode
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkProtectionGroupRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory networkProtectionGroupUUID](self, "networkProtectionGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "targetProtectionModeForGroupWithUUID:", v5);

  return v6;
}

- (void)setCurrentNetworkProtectionMode:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_currentNetworkProtectionMode = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setNetworkClientLAN:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_networkClientLAN = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setNetworkClientProfileFingerprint:(id)a3
{
  NSUUID *v4;
  NSUUID *networkClientProfileFingerprint;

  v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkClientProfileFingerprint = self->_networkClientProfileFingerprint;
  self->_networkClientProfileFingerprint = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)saveCurrentNetworkProtectionMode:(int64_t)a3 assignedLAN:(int64_t)a4 allowedWANHosts:(id)a5 profileFingerprint:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a5;
  v11 = a6;
  -[HMDAccessory workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke;
  block[3] = &unk_1E89B2C18;
  block[4] = self;
  v16 = v10;
  v18 = a3;
  v19 = a4;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

- (BOOL)supportsWiFiReconfiguration
{
  return 0;
}

- (void)setWifiCredentialType:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_wiFiCredentialType = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setWiFiUniquePreSharedKey:(id)a3
{
  NSData *v4;
  NSData *wiFiUniquePreSharedKey;

  v4 = (NSData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  wiFiUniquePreSharedKey = self->_wiFiUniquePreSharedKey;
  self->_wiFiUniquePreSharedKey = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)saveWiFiUniquePreSharedKey:(id)a3 credentialType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessory_saveWiFiUniquePreSharedKey_credentialType___block_invoke;
  block[3] = &unk_1E89BE2F0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleWiFiReconfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDAccessory *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9638]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CB9658]);
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 27;
LABEL_7:
    objc_msgSend(v12, "hmErrorWithCode:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v9);
    goto LABEL_12;
  }
  v7 = v6;
  if ((objc_msgSend(v5, "integerValue") & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 3;
    goto LABEL_7;
  }
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routerClientManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v5, "integerValue");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__HMDAccessory__handleWiFiReconfiguration___block_invoke;
    v18[3] = &unk_1E89C2350;
    v19 = v4;
    objc_msgSend(v9, "migrateAccessory:toCredentialType:rotate:completion:", self, v10, v7, v18);
    v11 = v19;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to perform Wi-Fi reconfiguration -- no Client Manager", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

LABEL_12:
}

- (void)saveNetworkAccessViolation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HMDAccessory_saveNetworkAccessViolation___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)networkProtectionGroupUUID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMDAccessory configuredNetworkProtectionGroupUUID](self, "configuredNetworkProtectionGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HMDAccessory defaultNetworkProtectionGroupUUID](self, "defaultNetworkProtectionGroupUUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSUUID)defaultNetworkProtectionGroupUUID
{
  id WeakRetained;
  void *v4;
  NSUUID *defaultNetworkProtectionGroupUUID;
  BOOL v6;
  NSUUID *v7;
  NSUUID *v8;
  NSUUID *v9;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v4 = WeakRetained;
  defaultNetworkProtectionGroupUUID = self->_defaultNetworkProtectionGroupUUID;
  if (defaultNetworkProtectionGroupUUID)
    v6 = 1;
  else
    v6 = WeakRetained == 0;
  if (!v6)
  {
    if (self->_initialManufacturer && self->_initialCategoryIdentifier)
    {
      +[HMDAccessoryNetworkProtectionGroupModel modelIDForHome:manufacturer:category:](HMDAccessoryNetworkProtectionGroupModel, "modelIDForHome:manufacturer:category:", WeakRetained);
      v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v8 = self->_defaultNetworkProtectionGroupUUID;
      self->_defaultNetworkProtectionGroupUUID = v7;

      defaultNetworkProtectionGroupUUID = self->_defaultNetworkProtectionGroupUUID;
    }
    else
    {
      defaultNetworkProtectionGroupUUID = 0;
    }
  }
  v9 = defaultNetworkProtectionGroupUUID;

  os_unfair_recursive_lock_unlock();
  return v9;
}

- (void)setConfiguredNetworkProtectionGroupUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *configuredNetworkProtectionGroupUUID;

  v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  configuredNetworkProtectionGroupUUID = self->_configuredNetworkProtectionGroupUUID;
  self->_configuredNetworkProtectionGroupUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setPendingConfigurationIdentifier:(id)a3
{
  NSString *v4;
  NSString *pendingConfigurationIdentifier;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  pendingConfigurationIdentifier = self->_pendingConfigurationIdentifier;
  self->_pendingConfigurationIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)__handleUpdatePendingConfigurationIdentifierMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
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
  HMDAccessory *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update pending configuration identifier message payload: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB7D80]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory transactionWithObjectChangeType:](v6, "transactionWithObjectChangeType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPendingConfigurationIdentifier:", v11);
    objc_msgSend(v10, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:withMessage:", v12, v4);
    objc_msgSend(v16, "run");

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Home is nil", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (void)didEncounterError:(id)a3
{
  id v4;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDHomeManagerXPCMessageSendPolicy *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessory home](v6, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      v12 = objc_alloc(MEMORY[0x1E0D285D8]);
      objc_msgSend(v9, "messageTargetUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

      v15 = (void *)MEMORY[0x1E0D285F8];
      v16 = *MEMORY[0x1E0CB8CC0];
      -[HMDAccessory uuid](v6, "uuid", CFSTR("kAccessoryUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = *MEMORY[0x1E0CB8D60];
      v24[0] = v18;
      v24[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "messageWithName:destination:payload:", v16, v14, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:active:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:active:", 0, -1, 1);
      objc_msgSend(v20, "setSendPolicy:", v21);

      -[HMDAccessory msgDispatcher](v6, "msgDispatcher");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:completionHandler:", v20, 0);

    }
  }

}

- (void)__handleListPairings:(id)a3
{
  id v4;
  HMDAccessory *v5;
  HMDAccessory *v6;
  HMDAccessory *v7;
  void *v8;
  void *v9;
  HMDAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  if (-[HMDAccessory conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EFABB088))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__HMDAccessory___handleListPairings___block_invoke;
    v13[3] = &unk_1E89B5940;
    v14 = v4;
    -[HMDAccessory pairingsWithCompletionHandler:](v7, "pairingsWithCompletionHandler:", v13);
    v8 = v14;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (void)__handleAuditPairings:(id)a3
{
  id v4;
  HMDAccessory *v5;
  HMDAccessory *v6;
  HMDAccessory *v7;
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
  HMDAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAccessory *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDAccessory isPrimary](self, "isPrimary"))
  {
    v5 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 1, 2, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory home](v5, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backingStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transaction:options:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDUserManagementOperation auditUserManagementOperationAccessory:model:](HMDUserManagementOperation, "auditUserManagementOperationAccessory:model:", v5, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](v5, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modelObjectWithChangeType:parentUUID:", 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v12, "add:withMessage:", v15, v4);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __38__HMDAccessory___handleAuditPairings___block_invoke;
        v29[3] = &unk_1E89C2350;
        v30 = v4;
        objc_msgSend(v12, "run:", v29);
        v16 = v30;
      }
      else
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v5;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v28;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit model", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v16);
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v5;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot audit accessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v8);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Can only audit pairings on a primary accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v7 = (HMDAccessory *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }

}

- (BOOL)supportsUserManagement
{
  return 0;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDAccessory *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
    __transactionAccessoryUpdated(self, v12, v10);
    v13 = v9;
  }
  else
  {
    v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      -[HMDAccessory appDataUpdated:message:](self, "appDataUpdated:message:", v15, v10);
    }
    else
    {
      v13 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v13;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        -[HMDAccessory softwareUpdate](self, "softwareUpdate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (objc_msgSend(v17, "propertyWasSet:", CFSTR("softwareVersion")))
          {
            objc_msgSend(v17, "softwareVersion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v17, "softwareVersion");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "version");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "isEqualToVersion:", v21);

              if (v22)
                -[HMDAccessory handleUpdatedSoftwareUpdateModel:newValues:message:](self, "handleUpdatedSoftwareUpdateModel:newValues:message:", v8, v17, v10);
              else
                -[HMDAccessory handleAddedSoftwareUpdateModel:message:](self, "handleAddedSoftwareUpdateModel:message:", v17, v10);

            }
            else
            {
              -[HMDAccessory handleRemovedSoftwareUpdateModel:message:](self, "handleRemovedSoftwareUpdateModel:message:", v17, v10);
            }
          }
          else
          {
            -[HMDAccessory handleUpdatedSoftwareUpdateModel:newValues:message:](self, "handleUpdatedSoftwareUpdateModel:newValues:message:", v8, v17, v10);
          }
        }
        else
        {
          objc_msgSend(v17, "softwareVersion");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            -[HMDAccessory handleAddedSoftwareUpdateModel:message:](self, "handleAddedSoftwareUpdateModel:message:", v17, v10);
        }

      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543874;
          v30 = v26;
          v31 = 2112;
          v32 = v13;
          v33 = 2112;
          v34 = (id)objc_opt_class();
          v27 = v34;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v29, 0x20u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "respondWithError:", v13);
      }
    }
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
  HMDAccessory *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    -[HMDAccessory appDataRemoved:message:](self, "appDataRemoved:message:", v10, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v15 = v22;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v16);

  }
}

- (id)dumpState
{
  HMDAccessory *v3;
  HMDAccessory *v4;
  HMDAccessory *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessory *v18;
  void *v19;
  __CFString *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  void *v80;
  void *v81;
  HMDAccessory *v82;
  void *v83;
  void *v84;
  void *v85;
  HMDAccessory *v86;
  id obj;
  id obja;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v82 = v5;
  v6 = -[HMDAccessory isSecureSessionEstablished](v5, "isSecureSessionEstablished");
  v84 = (void *)MEMORY[0x1E0CB37A0];
  -[HMDAccessory name](v3, "name");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory providedName](v3, "providedName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory configuredName](v3, "configuredName");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](v3, "uuid");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "UUIDString");
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory identifier](v3, "identifier");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = "YES";
  if (!-[HMDAccessory isReachable](v3, "isReachable")
    && !-[HMDAccessory isRemotelyReachable](v3, "isRemotelyReachable"))
  {
    v7 = "NO";
  }
  v71 = v7;
  if (-[HMDAccessory isReachable](v3, "isReachable"))
    v8 = "Yes";
  else
    v8 = "No";
  v72 = v8;
  if (-[HMDAccessory isRemotelyReachable](v3, "isRemotelyReachable"))
    v9 = "Yes";
  else
    v9 = "No";
  v70 = v9;
  if (-[HMDAccessory isSuspendCapable](v3, "isSuspendCapable"))
    v10 = "Yes";
  else
    v10 = "No";
  if (v6)
    v11 = "Yes";
  else
    v11 = "No";
  v68 = v11;
  v69 = v10;
  -[HMDAccessory room](v3, "room");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "name");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory firmwareVersion](v3, "firmwareVersion");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory primaryProfileVersion](v3, "primaryProfileVersion");
  v86 = v3;
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory productData](v3, "productData");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory sharedAdminAddedTimestamp](v3, "sharedAdminAddedTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory pairingsAuditedTimestamp](v86, "pairingsAuditedTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory pendingConfigurationIdentifier](v86, "pendingConfigurationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory urlString](v86, "urlString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory lastSeenDate](v86, "lastSeenDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory isLowBattery](v86, "isLowBattery");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "stringWithFormat:", CFSTR("name: %@, providedName: %@, configuredName: %@, uuid: %@, identifier: %@, Accessory Reachable: %s (local: %s, remote: %s), suspendCapable: %s, HAP secure session: %s, room: %@, firmwareVersion: %@, primaryProfileVersion: %@, productData: %@, share admin added: %@, pairings audited: %@,pendingConfigurationIdentifier: %@, assistantIdentifier: %@, lastSeenDate: %@, lowBattery: %@"), v80, v78, v76, obj, v74, v71, v72, v70, v69, v68, v67, v66, v65, v64, v12, v13,
    v14,
    v15,
    v16,
    v17);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v86;
  -[HMDAccessory wiFiUniquePreSharedKey](v86, "wiFiUniquePreSharedKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (isInternalBuild())
      v20 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 1);
    else
      v20 = CFSTR("(present)");
  }
  else
  {
    v20 = CFSTR("(null)");
  }
  v22 = v83;
  v21 = v85;
  -[HMDAccessory supportsWiFiReconfiguration](v86, "supportsWiFiReconfiguration");
  HMFBooleanToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory wiFiCredentialType](v86, "wiFiCredentialType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "appendFormat:", CFSTR(", supportsWiFiReconfiguration: %@, wiFiCredentialType: %@, wiFiUniquePreSharedKey: %@"), v23, v24, v20);

  -[HMDAccessory supportsNetworkProtection](v86, "supportsNetworkProtection");
  HMFBooleanToString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "appendFormat:", CFSTR(", supportsNetworkProtection: %@"), v25);

  if (-[HMDAccessory supportsNetworkProtection](v86, "supportsNetworkProtection"))
  {
    v79 = v20;
    v81 = v19;
    -[HMDAccessory networkClientIdentifier](v86, "networkClientIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory networkRouterUUID](v86, "networkRouterUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory targetNetworkProtectionMode](v86, "targetNetworkProtectionMode"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory currentNetworkProtectionMode](v86, "currentNetworkProtectionMode"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessory networkClientLAN](v86, "networkClientLAN"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory networkClientProfileFingerprint](v86, "networkClientProfileFingerprint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "appendFormat:", CFSTR(", networkClientIdentifier: %@, networkRouterUUID: %@, targetNetworkProtectionMode: %@, currentNetworkProtectionMode: %@, LAN: %@, Fingerprint: %@"), v26, v28, v29, v30, v31, v32);

    -[HMDAccessory allowedHosts](v86, "allowedHosts");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v77 = v34;
      obja = v34;
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v94 != v38)
              objc_enumerationMutation(obja);
            v40 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v40, "name");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addresses");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "allObjects");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "componentsJoinedByString:", CFSTR(","));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("Allow %@ (%@) purpose = 0x%lx"), v42, v45, objc_msgSend(v40, "purpose"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v46);

          }
          v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        }
        while (v37);
      }

      v47 = (void *)objc_msgSend(v35, "copy");
      objc_msgSend(v83, "setObject:forKeyedSubscript:", v47, CFSTR("Accessory Firewall WAN Rule"));

      v21 = v85;
      v18 = v86;
      v34 = v77;
    }

    v22 = v83;
    v20 = v79;
    v19 = v81;
  }
  -[HMDAccessory supportsDiagnosticsTransfer](v18, "supportsDiagnosticsTransfer");
  HMFBooleanToString();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendFormat:", CFSTR(", supportsDiagnosticsTransfer: %@"), v48);

  v49 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v49, *MEMORY[0x1E0D27F80]);

  -[HMDAccessory appData](v18, "appData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "dumpState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0D27E60]);

  -[HMDAccessory category](v18, "category");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[HMDAccessory category](v18, "category");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dumpState");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D27E30]);

  }
  -[HMDAccessory accessoryProfiles](v18, "accessoryProfiles");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v55, "count"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v57 = v55;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v90 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "dumpState");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      }
      while (v59);
    }

    objc_msgSend(v22, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D27E40]);
    v21 = v85;
  }

  return v22;
}

- (id)dumpSimpleState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = "YES";
  if (!-[HMDAccessory isReachable](self, "isReachable")
    && !-[HMDAccessory isRemotelyReachable](self, "isRemotelyReachable"))
  {
    v7 = "NO";
  }
  if (-[HMDAccessory isReachable](self, "isReachable"))
    v8 = "Yes";
  else
    v8 = "No";
  if (-[HMDAccessory isRemotelyReachable](self, "isRemotelyReachable"))
    v9 = "Yes";
  else
    v9 = "No";
  -[HMDAccessory room](self, "room");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory firmwareVersion](self, "firmwareVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("name: %@, uuid: %@, Accessory Reachable: %s (local: %s, remote: %s), room: %@, firmwareVersion: %@"), v4, v6, v7, v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D27F80]);
  return v3;
}

- (id)dumpNetworkState
{
  HMDAccessory *v2;
  HMDAccessory *v3;
  HMDAccessory *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[HMDAccessory uuid](v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDAccessory isIPSecureSessionEstablished](v4, "isIPSecureSessionEstablished"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (-[HMDAccessory isBLESecureSessionEstablished](v4, "isBLESecureSessionEstablished"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("uuid: %@ ipSession: %@ bleSession: %@ "), v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D27F80]);
  }

  return v5;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((isInternalBuild() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HMDAccessory uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDAccessory uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessory messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (NSSet)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[HMDAccessory softwareUpdate](self, "softwareUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAccessory softwareUpdate](self, "softwareUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v7;
}

- (HMDAccessory)initWithCoder:(id)a3
{
  id v4;
  HMDAccessory *v5;
  void *v6;
  void *v7;
  NSUUID **p_uuid;
  void *v9;
  uint64_t v10;
  HMDRoom *room;
  uint64_t v12;
  HMAccessoryCategory *category;
  uint64_t v14;
  void *categoryIdentifier;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDAccessory *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSNumber *v23;
  uint64_t v24;
  uint64_t v25;
  NSDate *lastSeenDate;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  HMAccessoryCategory *v34;
  int v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  NSString *configuredName;
  void *v41;
  uint64_t v42;
  NSString *providedName;
  uint64_t v44;
  uint64_t v45;
  void *identifier;
  uint64_t v47;
  NSString *v48;
  uint64_t v49;
  NSString *manufacturer;
  uint64_t v51;
  NSString *model;
  uint64_t v53;
  NSString *serialNumber;
  uint64_t v55;
  NSString *initialManufacturer;
  uint64_t v57;
  NSString *initialModel;
  uint64_t v59;
  NSNumber *initialCategoryIdentifier;
  uint64_t v61;
  NSString *productData;
  uint64_t v63;
  uint64_t v64;
  NSString *displayableFirmwareVersion;
  uint64_t v66;
  void *firmwareVersion;
  HMDAccessoryVersion *v68;
  HMDAccessoryVersion *v69;
  uint64_t v70;
  HMDSoftwareUpdate *softwareUpdate;
  uint64_t v72;
  HMDApplicationData *appData;
  uint64_t v74;
  NSNumber *networkClientIdentifier;
  void *v76;
  uint64_t v77;
  NSUUID *networkRouterUUID;
  void *v79;
  uint64_t v80;
  NSUUID *networkClientProfileFingerprint;
  uint64_t v82;
  HMDAccessoryNetworkAccessViolation *networkAccessViolation;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSArray *allowedHosts;
  uint64_t v91;
  NSData *wiFiUniquePreSharedKey;
  void *v93;
  uint64_t v94;
  NSUUID *configuredNetworkProtectionGroupUUID;
  void *v96;
  uint64_t v97;
  HMFVersion *primaryProfileVersion;
  uint64_t v99;
  HMDUserManagementOperationTimestamp *sharedAdminAddedTimestamp;
  uint64_t v101;
  HMDUserManagementOperationTimestamp *pairingsAuditedTimestamp;
  void *v103;
  uint64_t v104;
  NSString *pendingConfigurationIdentifier;
  _QWORD v107[2];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDAccessory init](self, "init");
  if (!v5)
  {
LABEL_47:
    v19 = v5;
    goto LABEL_48;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  else
    v7 = 0;
  p_uuid = &v5->_uuid;
  objc_storeStrong((id *)&v5->_uuid, v7);
  if (v6)

  if (*p_uuid)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_home, v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryRoom"));
    v10 = objc_claimAutoreleasedReturnValue();
    room = v5->_room;
    v5->_room = (HMDRoom *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryCategory"));
    v12 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (HMAccessoryCategory *)v12;

    if (v5->_category)
    {
      objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryIdentifierForCategory:");
      v14 = objc_claimAutoreleasedReturnValue();
      categoryIdentifier = v5->_categoryIdentifier;
      v5->_categoryIdentifier = (NSNumber *)v14;
    }
    else
    {
      +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "categoryForOther");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v5->_categoryIdentifier;
      v5->_categoryIdentifier = (NSNumber *)v22;

      objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryWithCategoryIdentifier:", v5->_categoryIdentifier);
      v24 = objc_claimAutoreleasedReturnValue();
      categoryIdentifier = v5->_category;
      v5->_category = (HMAccessoryCategory *)v24;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAccessoryLastSeenDateCodingKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    lastSeenDate = v5->_lastSeenDate;
    v5->_lastSeenDate = (NSDate *)v25;

    v5->_lowBattery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMDAccessoryLowBatteryCodingKey"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMDAccessoryConfigurationNumberCodingKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAccessoryConfigurationNumberCodingKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_configNumber = objc_msgSend(v27, "unsignedIntegerValue");

    }
    -[HMAccessoryCategory categoryType](v5->_category, "categoryType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB7AD0]);

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CBA1D8];
      v31 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v32 = (void *)objc_msgSend(v31, "initWithUUIDString:", *MEMORY[0x1E0CB7AC8]);
      objc_msgSend(v30, "categoryWithIdentifier:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v5->_category;
      v5->_category = (HMAccessoryCategory *)v33;

    }
    v35 = objc_msgSend(v4, "containsValueForKey:", CFSTR("accessoryConfiguredName"));
    v36 = objc_opt_class();
    if (v35)
      v37 = CFSTR("accessoryConfiguredName");
    else
      v37 = CFSTR("accessoryName");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hm_truncatedNameString");
    v39 = objc_claimAutoreleasedReturnValue();
    configuredName = v5->_configuredName;
    v5->_configuredName = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryProvidedName"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hm_truncatedNameString");
    v42 = objc_claimAutoreleasedReturnValue();
    providedName = v5->_providedName;
    v5->_providedName = (NSString *)v42;

    v5->_suspendCapable = objc_msgSend(v4, "decodeBoolForKey:", *MEMORY[0x1E0CBAA58]);
    LODWORD(v41) = objc_msgSend(v4, "containsValueForKey:", CFSTR("accessoryServerIdentifier"));
    v44 = objc_opt_class();
    if ((_DWORD)v41)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v44, CFSTR("accessoryServerIdentifier"));
      v45 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v45;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v44, CFSTR("accessoryIdentifier"));
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D163A8], "serverIdentifierWithUniqueIdentifier:", identifier);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v5->_identifier;
      v5->_identifier = (NSString *)v47;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.manufacturer"));
    v49 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.model"));
    v51 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.serialNumber"));
    v53 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.initialManufacturer"));
    v55 = objc_claimAutoreleasedReturnValue();
    initialManufacturer = v5->_initialManufacturer;
    v5->_initialManufacturer = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.initialModel"));
    v57 = objc_claimAutoreleasedReturnValue();
    initialModel = v5->_initialModel;
    v5->_initialModel = (NSString *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.initialCategoryIdentifier"));
    v59 = objc_claimAutoreleasedReturnValue();
    initialCategoryIdentifier = v5->_initialCategoryIdentifier;
    v5->_initialCategoryIdentifier = (NSNumber *)v59;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMDA.productData2")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.productData2"));
      v61 = objc_claimAutoreleasedReturnValue();
      productData = v5->_productData;
      v5->_productData = (NSString *)v61;

    }
    v63 = *MEMORY[0x1E0CB7BE8];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB7BE8]))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v63);
      v64 = objc_claimAutoreleasedReturnValue();
      displayableFirmwareVersion = v5->_displayableFirmwareVersion;
      v5->_displayableFirmwareVersion = (NSString *)v64;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.firmwareVersionObject")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.firmwareVersionObject"));
      v66 = objc_claimAutoreleasedReturnValue();
      firmwareVersion = v5->_firmwareVersion;
      v5->_firmwareVersion = (HMDAccessoryVersion *)v66;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.firmwareVersion"));
      firmwareVersion = (void *)objc_claimAutoreleasedReturnValue();
      if (firmwareVersion)
      {
        v68 = -[HMDAccessoryVersion initWithVersionString:]([HMDAccessoryVersion alloc], "initWithVersionString:", firmwareVersion);
        v69 = v5->_firmwareVersion;
        v5->_firmwareVersion = v68;

      }
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB8010]);
    v70 = objc_claimAutoreleasedReturnValue();
    softwareUpdate = v5->_softwareUpdate;
    v5->_softwareUpdate = (HMDSoftwareUpdate *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v72 = objc_claimAutoreleasedReturnValue();
    appData = v5->_appData;
    v5->_appData = (HMDApplicationData *)v72;

    -[HMDApplicationData updateParentUUIDIfNil:](v5->_appData, "updateParentUUIDIfNil:", *p_uuid);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.nci"));
    v74 = objc_claimAutoreleasedReturnValue();
    networkClientIdentifier = v5->_networkClientIdentifier;
    v5->_networkClientIdentifier = (NSNumber *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.nruuid"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v76);
    networkRouterUUID = v5->_networkRouterUUID;
    v5->_networkRouterUUID = (NSUUID *)v77;

    v5->_networkClientLAN = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDA.ncl"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.ncfp"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v79);
    networkClientProfileFingerprint = v5->_networkClientProfileFingerprint;
    v5->_networkClientProfileFingerprint = (NSUUID *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7CE0]);
    v82 = objc_claimAutoreleasedReturnValue();
    networkAccessViolation = v5->_networkAccessViolation;
    v5->_networkAccessViolation = (HMDAccessoryNetworkAccessViolation *)v82;

    v84 = *MEMORY[0x1E0CB7BA0];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB7BA0]))
      v5->_currentNetworkProtectionMode = objc_msgSend(v4, "decodeIntegerForKey:", v84);
    v85 = *MEMORY[0x1E0CB81A8];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB81A8]))
      v5->_wiFiCredentialType = objc_msgSend(v4, "decodeIntegerForKey:", v85);
    v86 = (void *)MEMORY[0x1E0C99E60];
    v107[0] = objc_opt_class();
    v107[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setWithArray:", v87, v107[0]);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v88, *MEMORY[0x1E0CB79A0]);
    v89 = objc_claimAutoreleasedReturnValue();
    allowedHosts = v5->_allowedHosts;
    v5->_allowedHosts = (NSArray *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.wifiUniquePSK"));
    v91 = objc_claimAutoreleasedReturnValue();
    wiFiUniquePreSharedKey = v5->_wiFiUniquePreSharedKey;
    v5->_wiFiUniquePreSharedKey = (NSData *)v91;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7B60]);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      v94 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v93);
      configuredNetworkProtectionGroupUUID = v5->_configuredNetworkProtectionGroupUUID;
      v5->_configuredNetworkProtectionGroupUUID = (NSUUID *)v94;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDA.primaryProfileVersion"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      v97 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v96);
      primaryProfileVersion = v5->_primaryProfileVersion;
      v5->_primaryProfileVersion = (HMFVersion *)v97;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.sharedAdminAddedTimestamp")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.sharedAdminAddedTimestamp"));
      v99 = objc_claimAutoreleasedReturnValue();
      sharedAdminAddedTimestamp = v5->_sharedAdminAddedTimestamp;
      v5->_sharedAdminAddedTimestamp = (HMDUserManagementOperationTimestamp *)v99;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.pairingsAuditedTimestamp")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.pairingsAuditedTimestamp"));
      v101 = objc_claimAutoreleasedReturnValue();
      pairingsAuditedTimestamp = v5->_pairingsAuditedTimestamp;
      v5->_pairingsAuditedTimestamp = (HMDUserManagementOperationTimestamp *)v101;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.hostAccessory")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.hostAccessory"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "addHostedAccessory:", v5);
      objc_storeWeak((id *)&v5->_hostAccessory, v103);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7D80]);
    v104 = objc_claimAutoreleasedReturnValue();
    pendingConfigurationIdentifier = v5->_pendingConfigurationIdentifier;
    v5->_pendingConfigurationIdentifier = (NSString *)v104;

    goto LABEL_47;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v109 = v18;
    v110 = 2112;
    v111 = v6;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_FAULT, "%{public}@Cannot decode accessory with invalid uuid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);

  v19 = 0;
LABEL_48:

  return v19;
}

- (BOOL)supportsIdentify
{
  return 0;
}

- (void)handleIdentifyAccessoryMessage:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  objc_msgSend(v3, "hmErrorWithCode:", 48);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v5);

}

- (BOOL)supportsTargetController
{
  return 0;
}

- (BOOL)supportsTargetControl
{
  return 0;
}

- (BOOL)supportsMultiUser
{
  return 0;
}

- (BOOL)supportsAudioReturnChannel
{
  return 0;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  return 0;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  return 0;
}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  return 0;
}

- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3
{
  return 0;
}

- (BOOL)supportsMusicAlarm
{
  return 0;
}

- (BOOL)supportsThirdPartyMusic
{
  return 0;
}

- (BOOL)supportsAudioAnalysis
{
  return 0;
}

- (BOOL)supportsDropIn
{
  return 0;
}

- (BOOL)supportsJustSiri
{
  return 0;
}

- (BOOL)supportsAnnounce
{
  return 0;
}

- (BOOL)supportsMediaActions
{
  return 0;
}

- (BOOL)supportsDiagnosticsTransfer
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  int v5;
  __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
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
  _BOOL8 v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int64_t v48;
  int64_t v49;
  int64_t v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  void *v54;
  int64_t v55;
  void *v56;
  _BOOL8 v57;
  _BOOL8 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL8 v71;
  _BOOL8 v72;
  void *v73;
  _BOOL8 v74;
  _BOOL8 v75;
  _BOOL8 v76;
  _BOOL8 v77;
  _BOOL8 v78;
  _BOOL8 v79;
  _BOOL8 v80;
  _BOOL8 v81;
  _BOOL8 v82;
  void *v83;
  void *v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  uint64_t *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;

  v89 = a3;
  v4 = objc_msgSend(v89, "hmd_isForXPCTransport");
  v5 = objc_msgSend(v89, "hmd_isForXPCTransportEntitledForSPIAccess");
  v6 = objc_msgSend(v89, "hmd_homeManagerOptions");
  -[HMDAccessory uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v8, CFSTR("accessoryUUID"));

  -[HMDAccessory getConfiguredName](self, "getConfiguredName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v9, CFSTR("accessoryConfiguredName"));

  -[HMDAccessory displayableFirmwareVersion](self, "displayableFirmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v10, *MEMORY[0x1E0CB7BE8]);

  v11 = (_QWORD *)MEMORY[0x1E0CBAA58];
  if ((v4 & 1) != 0)
  {
    -[HMDAccessory name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v12, CFSTR("accessoryName"));

    -[HMDAccessory firmwareVersion](self, "firmwareVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortVersionString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v14, CFSTR("HM.firmwareVersion"));

    if (!v5)
    {
      -[HMDAccessory manufacturer](self, "manufacturer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v15, CFSTR("HM.manufacturer"));

      -[HMDAccessory model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v16, CFSTR("HM.model"));

      objc_msgSend(v89, "encodeBool:forKey:", -[HMDAccessory isSuspendCapable](self, "isSuspendCapable"), *v11);
      goto LABEL_9;
    }
  }
  else
  {
    -[HMDAccessory configuredName](self, "configuredName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v17, CFSTR("accessoryName"));

    -[HMDAccessory firmwareVersion](self, "firmwareVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rawVersionString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v19, CFSTR("HM.firmwareVersion"));

    -[HMDAccessory hostAccessory](self, "hostAccessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v89, "encodeConditionalObject:forKey:", v20, CFSTR("HM.hostAccessory"));

  }
  -[HMDAccessory serialNumber](self, "serialNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v21, CFSTR("HM.serialNumber"));

  -[HMDAccessory manufacturer](self, "manufacturer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v22, CFSTR("HM.manufacturer"));

  -[HMDAccessory model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "encodeObject:forKey:", v23, CFSTR("HM.model"));

  objc_msgSend(v89, "encodeBool:forKey:", -[HMDAccessory isSuspendCapable](self, "isSuspendCapable"), *v11);
  if (v5)
    objc_msgSend(v89, "encodeInt32:forKey:", -[HMDAccessory accessoryReprovisionState](self, "accessoryReprovisionState"), CFSTR("HM.accessoryReprovisionState"));
LABEL_9:
  v24 = -[HMDAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    objc_msgSend(v89, "encodeBool:forKey:", v24, *MEMORY[0x1E0CB7B98]);
    v25 = -[HMDAccessory supportsIdentify](self, "supportsIdentify");
    objc_msgSend(v89, "encodeBool:forKey:", v25, *MEMORY[0x1E0CB8080]);
  }
  if ((v6 & 0x9741) != 0 || v24 && (v6 & 0x10) != 0)
  {
    -[HMDAccessory home](self, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory allowedHosts](self, "allowedHosts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v27, *MEMORY[0x1E0CB79A0]);

    -[HMDAccessory networkAccessViolation](self, "networkAccessViolation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v28, *MEMORY[0x1E0CB7CE0]);

    if ((objc_msgSend(v89, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      -[HMDAccessory category](self, "category");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v29, CFSTR("HM.accessoryCategory"));

    }
    if ((v4 & 1) == 0)
    {
      -[HMDAccessory firmwareVersion](self, "firmwareVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v30, CFSTR("HM.firmwareVersionObject"));

      -[HMDAccessory productData](self, "productData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v31, CFSTR("HMDA.productData2"));

      -[HMDAccessory primaryProfileVersion](self, "primaryProfileVersion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "versionString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v33, CFSTR("HMDA.primaryProfileVersion"));

    }
    if (objc_msgSend(v89, "hmd_isForLocalStore"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessory configNumber](self, "configNumber"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v34, CFSTR("HMDAccessoryConfigurationNumberCodingKey"));

      -[HMDAccessory lastSeenDate](self, "lastSeenDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v35, CFSTR("HMDAccessoryLastSeenDateCodingKey"));

      objc_msgSend(v89, "encodeBool:forKey:", -[HMDAccessory isLowBattery](self, "isLowBattery"), CFSTR("HMDAccessoryLowBatteryCodingKey"));
      -[HMDAccessory sharedAdminAddedTimestamp](self, "sharedAdminAddedTimestamp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v36, CFSTR("HM.sharedAdminAddedTimestamp"));

      -[HMDAccessory pairingsAuditedTimestamp](self, "pairingsAuditedTimestamp");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v37, CFSTR("HM.pairingsAuditedTimestamp"));

    }
    if ((objc_msgSend(v89, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v89, "hmd_isForRemoteTransport")
      && (objc_msgSend(v89, "hmd_isForRemoteTransportOnSameAccount") & 1) == 0
      && (objc_msgSend(v89, "hmd_isForRemoteUserAdministrator") & 1) != 0
      || objc_msgSend(v89, "hmd_isForRemoteTransportOnSameAccount")
      && (objc_msgSend(v89, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      -[HMDAccessory networkClientIdentifier](self, "networkClientIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v38, CFSTR("HMDA.nci"));

      -[HMDAccessory networkRouterUUID](self, "networkRouterUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "UUIDString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v40, CFSTR("HMDA.nruuid"));

      objc_msgSend(v89, "encodeInteger:forKey:", -[HMDAccessory networkClientLAN](self, "networkClientLAN"), CFSTR("HMDA.ncl"));
      -[HMDAccessory networkClientProfileFingerprint](self, "networkClientProfileFingerprint");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "UUIDString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v42, CFSTR("HMDA.ncfp"));

      -[HMDAccessory wiFiUniquePreSharedKey](self, "wiFiUniquePreSharedKey");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v43, CFSTR("HMDA.wifiUniquePSK"));

      -[HMDAccessory initialManufacturer](self, "initialManufacturer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v44, CFSTR("HMDA.initialManufacturer"));

      -[HMDAccessory initialModel](self, "initialModel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v45, CFSTR("HMDA.initialModel"));

      -[HMDAccessory initialCategoryIdentifier](self, "initialCategoryIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v46, CFSTR("HMDA.initialCategoryIdentifier"));

    }
    v47 = v4 ^ 1 | v5;
    if (!objc_msgSend(v89, "hmd_isForRemoteGatewayCoder") && v47)
    {
      v48 = -[HMDAccessory targetNetworkProtectionMode](self, "targetNetworkProtectionMode");
      objc_msgSend(v89, "encodeInteger:forKey:", v48, *MEMORY[0x1E0CB8138]);
      v49 = -[HMDAccessory currentNetworkProtectionMode](self, "currentNetworkProtectionMode");
      objc_msgSend(v89, "encodeInteger:forKey:", v49, *MEMORY[0x1E0CB7BA0]);
      v50 = -[HMDAccessory wiFiCredentialType](self, "wiFiCredentialType");
      objc_msgSend(v89, "encodeInteger:forKey:", v50, *MEMORY[0x1E0CB81A8]);
      if (v4)
      {
        -[HMDAccessory networkProtectionGroupUUID](self, "networkProtectionGroupUUID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (_QWORD *)MEMORY[0x1E0CB7DA8];
      }
      else
      {
        -[HMDAccessory configuredNetworkProtectionGroupUUID](self, "configuredNetworkProtectionGroupUUID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (_QWORD *)MEMORY[0x1E0CB7B60];
      }
      objc_msgSend(v51, "UUIDString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v53, *v52);

      if (-[HMDAccessory supportsSoftwareUpdate](self, "supportsSoftwareUpdate"))
      {
        if ((objc_msgSend(v89, "hmd_isForNonAdminSharedUser") & 1) == 0)
        {
          if (v4 && !objc_msgSend(v26, "isAdminUser"))
            goto LABEL_37;
          -[HMDAccessory softwareUpdate](self, "softwareUpdate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "encodeObject:forKey:", v54, *MEMORY[0x1E0CB8010]);

        }
      }
    }
    if (!v4)
    {
      objc_msgSend(v89, "encodeConditionalObject:forKey:", v26, CFSTR("home"));
      -[HMDAccessory appData](self, "appData");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v66, CFSTR("HM.appDataRepository"));

      if ((objc_msgSend(v89, "hmd_isForRemoteGatewayCoder") & 1) == 0)
      {
        -[HMDAccessory providedName](self, "providedName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "encodeObject:forKey:", v67, CFSTR("accessoryProvidedName"));

        -[HMDAccessory room](self, "room");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "encodeConditionalObject:forKey:", v68, CFSTR("accessoryRoom"));

      }
      -[HMDAccessory identifier](self, "identifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v69, CFSTR("accessoryServerIdentifier"));
      goto LABEL_51;
    }
LABEL_37:
    objc_msgSend(v89, "encodeBool:forKey:", -[HMDAccessory isReachableForXPCClients](self, "isReachableForXPCClients"), CFSTR("reachable"));
    if (v5)
    {
      v55 = -[HMDAccessory reachableTransports](self, "reachableTransports");
      objc_msgSend(v89, "encodeInteger:forKey:", v55, *MEMORY[0x1E0CBAA68]);
      -[HMDAccessory room](self, "room");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v56, CFSTR("accessoryRoom"));

      v57 = -[HMDAccessory supportsNetworkProtection](self, "supportsNetworkProtection");
      objc_msgSend(v89, "encodeBool:forKey:", v57, *MEMORY[0x1E0CB7D58]);
      v58 = -[HMDAccessory currentNetworkProtectionMode](self, "currentNetworkProtectionMode") == 1;
      objc_msgSend(v89, "encodeBool:forKey:", v58, *MEMORY[0x1E0CB7CF8]);
      -[HMDAccessory vendorInfo](self, "vendorInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "appBundleID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v60, CFSTR("HM.bundleID"));

      objc_msgSend(v59, "appStoreID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v61, CFSTR("HM.storeID"));

      -[HMDAccessory firmwareVersion](self, "firmwareVersion");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62 && -[HMDAccessory isPrimary](self, "isPrimary"))
      {
        objc_msgSend(v59, "firmwareVersion");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory firmwareVersion](self, "firmwareVersion");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v63, "isGreaterThanVersion:", v64);

      }
      else
      {
        v65 = 0;
      }

      objc_msgSend(v89, "encodeBool:forKey:", v65, CFSTR("HM.firmwareUpdateAvailable"));
      -[HMDAccessory identifier](self, "identifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v73, CFSTR("accessoryServerIdentifier"));

      v74 = -[HMDAccessory supportsWiFiReconfiguration](self, "supportsWiFiReconfiguration");
      objc_msgSend(v89, "encodeBool:forKey:", v74, *MEMORY[0x1E0CB81B8]);
      v75 = -[HMDAccessory supportsMultiUser](self, "supportsMultiUser");
      objc_msgSend(v89, "encodeBool:forKey:", v75, *MEMORY[0x1E0CB7CD8]);
      v76 = -[HMDAccessory supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
      objc_msgSend(v89, "encodeBool:forKey:", v76, *MEMORY[0x1E0CB7C90]);
      v77 = -[HMDAccessory supportsDoorbellChime](self, "supportsDoorbellChime");
      objc_msgSend(v89, "encodeBool:forKey:", v77, *MEMORY[0x1E0CB8078]);
      v78 = -[HMDAccessory supportsUserMediaSettings](self, "supportsUserMediaSettings");
      objc_msgSend(v89, "encodeBool:forKey:", v78, *MEMORY[0x1E0CB80E8]);
      v79 = -[HMDAccessory supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
      objc_msgSend(v89, "encodeBool:forKey:", v79, *MEMORY[0x1E0CB8050]);
      v80 = -[HMDAccessory supportsMusicAlarm](self, "supportsMusicAlarm");
      objc_msgSend(v89, "encodeBool:forKey:", v80, *MEMORY[0x1E0CB80B8]);
      v81 = -[HMDAccessory supportsAnnounce](self, "supportsAnnounce");
      objc_msgSend(v89, "encodeBool:forKey:", v81, *MEMORY[0x1E0CB8048]);
      v82 = -[HMDAccessory supportsMediaActions](self, "supportsMediaActions");
      objc_msgSend(v89, "encodeBool:forKey:", v82, *MEMORY[0x1E0CB80A0]);

    }
    else
    {
      -[HMDAccessory room](self, "room");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v70, CFSTR("accessoryRoom"));

      v71 = -[HMDAccessory supportsNetworkProtection](self, "supportsNetworkProtection");
      objc_msgSend(v89, "encodeBool:forKey:", v71, *MEMORY[0x1E0CB7D58]);
      v72 = -[HMDAccessory currentNetworkProtectionMode](self, "currentNetworkProtectionMode") == 1;
      objc_msgSend(v89, "encodeBool:forKey:", v72, *MEMORY[0x1E0CB7CF8]);
    }
    -[HMDAccessory appData](self, "appData");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "encodeForXPCTransportWithCoder:key:", v89, CFSTR("HM.appData"));

    -[HMDAccessory accessoryProfiles](self, "accessoryProfiles");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v84, "copy");

    if (v5)
    {
      v91 = MEMORY[0x1E0C809B0];
      v85 = __32__HMDAccessory_encodeWithCoder___block_invoke;
      v86 = &v91;
    }
    else
    {
      v90 = MEMORY[0x1E0C809B0];
      v85 = __32__HMDAccessory_encodeWithCoder___block_invoke_2;
      v86 = &v90;
    }
    v86[1] = 3221225472;
    v86[2] = (uint64_t)v85;
    v86[3] = (uint64_t)&unk_1E89AA8E0;
    v86[4] = (uint64_t)self;
    objc_msgSend(v69, "na_filter:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "encodeObject:forKey:", v87, CFSTR("HM.accessoryProfiles"));

LABEL_51:
    objc_msgSend(v89, "encodeBool:forKey:", -[HMDAccessory isPrimary](self, "isPrimary"), CFSTR("isPrimary"));
    if (v47)
    {
      -[HMDAccessory pendingConfigurationIdentifier](self, "pendingConfigurationIdentifier");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "encodeObject:forKey:", v88, *MEMORY[0x1E0CB7D80]);

    }
  }

}

- (BOOL)providesHashRouteID
{
  return 0;
}

- (void)resetHashedRoute
{
  void *v3;
  HMDAccessory *v4;
  NSObject *v5;
  void *v6;
  NSString *hashRouteID;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[HMDAccessory providesHashRouteID](self, "providesHashRouteID"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting cached hashed route", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    os_unfair_recursive_lock_lock_with_options();
    hashRouteID = v4->_hashRouteID;
    v4->_hashRouteID = 0;

    os_unfair_recursive_lock_unlock();
  }
}

- (NSString)hashRouteID
{
  NSString **p_hashRouteID;
  NSString *hashRouteID;
  NSString *v5;
  uint64_t v7;
  void *v8;
  HMDAccessory *v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  HMDAccessory *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[HMDAccessory providesHashRouteID](self, "providesHashRouteID"))
    return (NSString *)0;
  os_unfair_recursive_lock_lock_with_options();
  p_hashRouteID = &self->_hashRouteID;
  hashRouteID = self->_hashRouteID;
  if (hashRouteID)
  {
    v5 = hashRouteID;
  }
  else
  {
    v7 = os_unfair_recursive_lock_unlock();
    v8 = (void *)MEMORY[0x1D17BA0A0](v7);
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Do not have cached hashed route, reaching out to siri to fetch it", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessory hashedRouteFactory](v9, "hashedRouteFactory");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDAccessory identifier](v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v13);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v9;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Caching hashed route from siri: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)p_hashRouteID, v5);
  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)addHostedAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)removeHostedAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setHostAccessory:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeWeak((id *)&self->_hostAccessory, v4);

  os_unfair_recursive_lock_unlock();
}

- (void)_updateHost:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[HMDAccessory hostAccessory](self, "hostAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v24, "isEqual:", v5);

  if (v6)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (!v4
      || (objc_msgSend(v4, "uuid"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqual:", v24),
          v8,
          (v9 & 1) == 0))
    {
      v10 = v24;
      if (self)
      {
        -[HMDAccessory home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessoryWithUUID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          v23 = v11;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v11, "allNewlyConfiguredAccessories");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_msgSend(v20, "uuid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqual:", v10);

                if ((v22 & 1) != 0)
                {
                  v14 = v20;

                  goto LABEL_21;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
              if (v17)
                continue;
              break;
            }
          }

          v14 = 0;
LABEL_21:
          v13 = 0;
          v11 = v23;
        }

      }
      else
      {
        v14 = 0;
      }

      objc_msgSend(v4, "removeHostedAccessory:", self);
      objc_msgSend(v14, "addHostedAccessory:", self);
      -[HMDAccessory setHostAccessory:](self, "setHostAccessory:", v14);

    }
  }
  else
  {
    objc_msgSend(v4, "removeHostedAccessory:", self);
    -[HMDAccessory setHostAccessory:](self, "setHostAccessory:", 0);
  }

}

- (BOOL)supportsMinimumUserPrivilege
{
  return 0;
}

- (void)__handlePairingIdentityRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  HMDAccessory *v8;
  HMDAccessory *v9;
  HMDAccessory *v10;
  void *v11;
  HMDAccessory *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  HMDAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAccessory *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) != 0)
  {
    v8 = self;
    if (-[HMDAccessory conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EFABB088))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (!v10)
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v30;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity from an accessory that does not support pairing identity", (uint8_t *)&v38, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
      goto LABEL_26;
    }
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543362;
      v39 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received request to to retrieve pairing identity for accessory", (uint8_t *)&v38, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDAccessory pairingIdentity](v10, "pairingIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CB7D68]);
      objc_msgSend(v4, "proxyConnection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "entitlements");

      if (!(_DWORD)v17 || (v19 & 0x10) != 0)
      {
        -[HMDAccessory home](v12, "home");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "homeManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sendPairingIdentity:includePrivateKey:requestMessage:", v16, v17, v4);

        goto LABEL_25;
      }
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v12;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Client requested private key but does not have entitlement for private key", (uint8_t *)&v38, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = 17;
    }
    else
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v12;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory name](v32, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v34;
        v40 = 2112;
        v41 = v35;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Pairing identity for accessory not found : %@", (uint8_t *)&v38, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = 2;
    }
    objc_msgSend(v24, "hmErrorWithCode:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v36);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v29;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v10 = (HMDAccessory *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v10);
LABEL_27:

}

- (void)setSoftwareUpdateForTesting:(id)a3
{
  HMDSoftwareUpdate *v4;
  HMDSoftwareUpdate *softwareUpdate;

  v4 = (HMDSoftwareUpdate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  softwareUpdate = self->_softwareUpdate;
  self->_softwareUpdate = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setSoftwareUpdate:(id)a3
{
  HMDSoftwareUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    v5 = self->_softwareUpdate;
    objc_storeStrong((id *)&self->_softwareUpdate, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDAccessory msgDispatcher](self, "msgDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureWithAccessory:dataSource:messageDispatcher:", self, self, v6);

    -[HMDAccessory home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (-[HMDAccessory isCurrentAccessory](self, "isCurrentAccessory"))
      {
        objc_msgSend(v7, "homeManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "softwareUpdateManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "updateAvailableUpdate:", v10);
      }
      objc_msgSend(v7, "reevaluateAccessoryInfo");
    }

    if (v5)
    {
      -[HMDSoftwareUpdate invalidate](v5, "invalidate");

    }
  }

}

- (id)notificationCenterForSoftwareUpdate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
}

- (void)updateGenerationCounterWithReason:(id)a3 sourceUUID:(id)a4 shouldNotifyClients:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[HMDAccessory home](self, "home");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v9, v8, v5);

}

- (BOOL)supportsSoftwareUpdate
{
  return 0;
}

- (BOOL)supportsSoftwareUpdateV2
{
  return 0;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return 0;
}

- (BOOL)requiresRemovalOnPrimaryResident
{
  return 0;
}

- (BOOL)supportsFirmwareUpdate
{
  return 0;
}

- (void)updateSoftwareUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDAccessory_updateSoftwareUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessory home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transaction:options:", CFSTR("HMDAccessorySoftwareUpdate"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "add:withMessage:", v7, 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HMDAccessory__applySoftwareUpdateModel_completion___block_invoke;
  v14[3] = &unk_1E89C1A48;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "run:", v14);

}

- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3
{
  void *v5;
  int v6;
  BOOL result;

  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOwnerUser");

  if (!v6)
    return 1;
  result = -[HMDAccessory supportsFirmwareUpdate](self, "supportsFirmwareUpdate");
  if (a3 < 2)
    return 1;
  return result;
}

- (void)handleUpdatedSoftwareUpdateModel:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "transactionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", objc_msgSend(v11, "source")))
  {
    -[HMDAccessory softwareUpdate](self, "softwareUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionObjectUpdated:newValues:message:", v8, v9, v10);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "source"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating software update is not allowed from source %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v12);
  }

}

- (void)handleAddedSoftwareUpdateModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSoftwareUpdate *v9;
  void *v10;
  HMDAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  HMDAccessory *v17;
  NSObject *v18;
  void *v19;
  HMDSoftwareUpdate *v20;
  int v21;
  void *v22;
  __int16 v23;
  HMDSoftwareUpdate *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", objc_msgSend(v8, "source")))
  {
    v9 = -[HMDSoftwareUpdate initWithModel:]([HMDSoftwareUpdate alloc], "initWithModel:", v6);
    v10 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessory setSoftwareUpdate:](self, "setSoftwareUpdate:", v9));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Added software update: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v8, "markChanged");
    objc_msgSend(v7, "responseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "responseHandler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, 0);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "source"));
      v20 = (HMDSoftwareUpdate *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding software update is not allowed from source %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v9 = (HMDSoftwareUpdate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v9);
  }

}

- (void)handleRemovedSoftwareUpdateModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMDAccessory *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", objc_msgSend(v8, "source"));
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "source"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing software update is not allowed from source %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v17);
    goto LABEL_9;
  }
  if (v13)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory softwareUpdate](v11, "softwareUpdate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing software update: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAccessory setSoftwareUpdate:](v11, "setSoftwareUpdate:", 0);
  objc_msgSend(v8, "markChanged");
  objc_msgSend(v7, "responseHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "responseHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, 0);
LABEL_9:

  }
}

- (void)startReachabilityCheck
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)stopReachabilityCheck
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)supportsUnreachablePing
{
  return 0;
}

- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDHomeManagerXPCMessageSendPolicy *v17;
  void *v18;
  void *v19;
  HMDAccessory *v20;
  HMDAccessory *v21;
  HMDAccessory *v22;
  HMDAccessory *v23;
  HMDAccessory *v24;
  HMDAccessory *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated accessory controllable value: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, *MEMORY[0x1E0CB7B88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CB7B90];
  objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", *MEMORY[0x1E0CB7B90], v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessory messageTargetUUID](v6, "messageTargetUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
  objc_msgSend(v13, "setDestination:", v16);

  v17 = -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:active:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:active:", 0, -1, 1);
  objc_msgSend(v13, "setSendPolicy:", v17);

  -[HMDAccessory msgDispatcher](v6, "msgDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v18, "sendMessage:completionHandler:", v19, 0);

  v20 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v23 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    v26 = -[HMDAccessory supportsFirmwareUpdate](v25, "supportsFirmwareUpdate");
    if (v22)
      goto LABEL_14;
  }
  else
  {
    v26 = 0;
    if (v22)
    {
LABEL_14:
      -[HMDAccessory home](v23, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "saveToCurrentAccountWithReason:", v12);

      goto LABEL_15;
    }
  }
  if (v26)
    goto LABEL_14;
LABEL_15:

}

- (void)submitLogEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventSubmitter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:error:", v4, 0);

}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setWiFiCredentialType:(int64_t)a3
{
  self->_wiFiCredentialType = a3;
}

- (void)setAllowedHosts:(id)a3
{
  objc_storeStrong((id *)&self->_allowedHosts, a3);
}

- (void)setReachabilityPingNotificationEnabled:(BOOL)a3
{
  self->_reachabilityPingNotificationEnabled = a3;
}

- (void)setPreferredMediaUserUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setPreferredMediaUserSelectionTypeNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setHashRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_hashRouteID, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (BOOL)supportsDoorbellChime
{
  return self->_supportsDoorbellChime;
}

- (BOOL)supportsUserMediaSettings
{
  return self->_supportsUserMediaSettings;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  return self->_supportsCoordinationDoorbellChime;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  return self->_supportsCoordinationFreeDoorbellChime;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  return self->_supportsTVOSUpdateManualUpdateAvailableNotification;
}

- (void)setSuspendCapable:(BOOL)a3
{
  self->_suspendCapable = a3;
}

- (BOOL)shouldProcessTransactionRemoval
{
  return self->_shouldProcessTransactionRemoval;
}

- (void)setShouldProcessTransactionRemoval:(BOOL)a3
{
  self->_shouldProcessTransactionRemoval = a3;
}

- (void)setTransportReports:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (BOOL)supportsManagedConfigurationProfile
{
  return self->_supportsManagedConfigurationProfile;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNetworkAccessViolation:(id)a3
{
  objc_storeStrong((id *)&self->_networkAccessViolation, a3);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 400, 1);
}

- (void)setFeaturesDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (id)hashedRouteFactory
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setHashedRouteFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (void)setRemoteAccessEnabled:(BOOL)a3
{
  self->_remoteAccessEnabled = a3;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (unint64_t)accessoryReprovisionState
{
  return self->_accessoryReprovisionState;
}

- (void)setAccessoryReprovisionState:(unint64_t)a3
{
  self->_accessoryReprovisionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_hashedRouteFactory, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_networkAccessViolation, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_transportReports, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_hostAccessory);
  objc_storeStrong((id *)&self->_hashRouteID, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserSelectionTypeNumber, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserUUID, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_timeBecameUnreachable, 0);
  objc_storeStrong((id *)&self->_pairingsAuditedTimestamp, 0);
  objc_storeStrong((id *)&self->_sharedAdminAddedTimestamp, 0);
  objc_storeStrong((id *)&self->_softwareUpdate, 0);
  objc_storeStrong((id *)&self->_initialCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryProfileVersion, 0);
  objc_storeStrong((id *)&self->_defaultNetworkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_wiFiUniquePreSharedKey, 0);
  objc_storeStrong((id *)&self->_allowedHosts, 0);
  objc_storeStrong((id *)&self->_networkClientProfileFingerprint, 0);
  objc_storeStrong((id *)&self->_networkRouterUUID, 0);
  objc_storeStrong((id *)&self->_networkClientIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_providedName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_displayableFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_initialManufacturer, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_initialModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryProfiles, 0);
}

uint64_t __53__HMDAccessory__applySoftwareUpdateModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__HMDAccessory_updateSoftwareUpdate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsSoftwareUpdate") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "softwareUpdate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (HMFEqualObjects())
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v4 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v6;
        _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot update software update, matches existing update", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_39;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_38;
    }
    v12 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v7 = v13;

    if ((objc_msgSend(v7, "supportsCHIP") & 1) == 0)
    {
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_23;
      objc_msgSend(*(id *)(a1 + 32), "firmwareVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "version");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isAtLeastVersion:", v15);

      if (v16)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "version");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "versionString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "firmwareVersion");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "versionString");
          v41 = v17;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v20;
          v44 = 2112;
          v45 = v22;
          v46 = 2112;
          v47 = v24;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Software update, '%@', is older than current software version, '%@'", buf, 0x20u);

          v17 = v41;
        }

        objc_autoreleasePoolPop(v17);
        if (!*(_QWORD *)(a1 + 48))
          goto LABEL_38;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = 44;
        goto LABEL_36;
      }
    }
    v27 = *(void **)(a1 + 40);
    if (v27 && !objc_msgSend(v27, "downloadSize"))
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v43 = v39;
        v44 = 2112;
        v45 = v40;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Software update, '%@', has invalid 0 download size.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_38;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = 3;
LABEL_36:
      objc_msgSend(v25, "hmErrorWithCode:", v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
LABEL_23:
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Updating software update to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(*(id *)(a1 + 40), "configureWithAccessory:dataSource:messageDispatcher:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), 0);
    v33 = *(void **)(a1 + 40);
    if (v33)
    {
      objc_msgSend(v33, "model");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v2, "transactionWithObjectChangeType:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSoftwareVersion:", 0);
      objc_msgSend(v34, "setDisplayableSoftwareVersion:", 0);
      objc_msgSend(v34, "setState:", 0);
      objc_msgSend(v34, "setInstallDuration:", 0);
      objc_msgSend(v34, "setDownloadSize:", 0);
      objc_msgSend(v34, "setReleaseDate:", 0);
    }
    if (v2)
      v35 = 2;
    else
      v35 = 1;
    objc_msgSend(v34, "setObjectChangeType:", v35);
    objc_msgSend(*(id *)(a1 + 32), "_applySoftwareUpdateModel:completion:", v34, *(_QWORD *)(a1 + 48));
    goto LABEL_37;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot update software update for an accessory that does not support software update", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_39:

  }
}

uint64_t __32__HMDAccessory_encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldFilterAccessoryProfileForUnentitledClients:", a2) ^ 1;
}

uint64_t __32__HMDAccessory_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldFilterAccessoryProfileForEntitledClients:", a2) ^ 1;
}

void __38__HMDAccessory___handleAuditPairings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

void __37__HMDAccessory___handleListPairings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v23 = a1;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "publicKey");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "permissions");
          HMFBooleanToString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("Identifier = %@, PublicKey = %@, Admin = %@\n"), v15, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v19);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v10);
    }

    v30 = CFSTR("kDescriptionKey");
    v20 = (void *)objc_msgSend(v8, "copy");
    v31 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v5 = v24;
    a1 = v23;
  }
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v22)[2](v22, v6, v7);

  }
}

void __43__HMDAccessory_saveNetworkAccessViolation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "networkAccessViolation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastViolationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    EpochIntervalFromDate(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastNetworkAccessViolationOccurrenceSince1970:", v5);

    objc_msgSend(*(id *)(a1 + 40), "lastResetDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    EpochIntervalFromDate(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastNetworkAccessViolationResetSince1970:", v7);

    +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 2, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transaction:options:", CFSTR("SaveNetworkAccessViolation"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "add:", v12);
    objc_msgSend(v11, "run");

  }
}

uint64_t __43__HMDAccessory__handleWiFiReconfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a2);
}

void __58__HMDAccessory_saveWiFiUniquePreSharedKey_credentialType___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wiFiUniquePreSharedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWiFiUniquePreSharedKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWiFiCredentialType:", v5);

    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wiFiCredentialType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting wiFiCredentialType to %@ in accessory transaction", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 2, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("SaveWiFiUniquePreSharedKey"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "add:", v4);
    objc_msgSend(v14, "run");

  }
}

void __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
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

  objc_msgSend(*(id *)(a1 + 32), "allowedHosts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  if (!v3
    || objc_msgSend(*(id *)(a1 + 32), "currentNetworkProtectionMode") != *(_QWORD *)(a1 + 56)
    || objc_msgSend(*(id *)(a1 + 32), "networkClientLAN") != *(_QWORD *)(a1 + 64)
    || (objc_msgSend(*(id *)(a1 + 32), "networkClientProfileFingerprint"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = HMFEqualObjects(),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_236);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v15, "setAppliedFirewallWANRules:", v7);

    }
    else
    {
      objc_msgSend(v15, "setAppliedFirewallWANRules:", 0);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCurrentNetworkProtectionMode:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNetworkClientLAN:", v9);

    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNetworkClientProfileFingerprint:", v10);

    objc_msgSend(*(id *)(a1 + 32), "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backingStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultResidenceOptions](HMDBackingStoreTransactionOptions, "defaultResidenceOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transaction:options:", CFSTR("SaveCurrentNetworkProtectionModeAndFirewallWANRules"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "add:", v15);
    objc_msgSend(v14, "run");

  }
}

uint64_t __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonWANRule");
}

void __86__HMDAccessory_saveNetworkClientIdentifier_networkRouterUUID_clearProfileFingerprint___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "networkClientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  if (!v3
    || (objc_msgSend(*(id *)(a1 + 32), "networkRouterUUID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = HMFEqualObjects(),
        v4,
        !v5)
    || *(_BYTE *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 32), "networkClientProfileFingerprint"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNetworkClientIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNetworkRouterUUID:", v7);

    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v12, "setNetworkClientProfileFingerprint:", 0);
    +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 2, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transaction:options:", CFSTR("SaveNetworkClientIdentifier"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "add:", v12);
    objc_msgSend(v11, "run");

  }
}

uint64_t __32__HMDAccessory_setConfigNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configNumberUpdated");
}

uint64_t __36__HMDAccessory_remoteAccessEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteAccessEnabled:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __43__HMDAccessory_notifyAccessoryNameChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedName:", *(_QWORD *)(a1 + 40));
}

void __35__HMDAccessory_updateMediaSession___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessoryProfiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        objc_msgSend(v9, "setMediaSession:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __51__HMDAccessory__renameAccessory_resetName_message___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v7 = CFSTR("kAccessoryName");
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", v4, v3);

}

void __35__HMDAccessory___handleUpdateRoom___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Finished updating the room (%@) for the accessory finished with error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __34__HMDAccessory_updateRoom_source___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateRoom:source:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __38__HMDAccessory_hasSiriEndpointProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __31__HMDAccessory_hasMediaProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

void __90__HMDAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "roomForEntireHome");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRoom:", v3);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerForMessages");
    if (*(_QWORD *)(a1 + 48))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "accessoryProfiles", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "configureWithMessageDispatcher:configurationTracker:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithAccessory:dataSource:messageDispatcher:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  v10 = *(NSObject **)(a1 + 56);
  if (v10)
    dispatch_group_leave(v10);
}

void __60__HMDAccessory__relayIdentifyAccessorytoResidentForMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

uint64_t __49__HMDAccessory__handleLinkQualityRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithPayload:");
}

uint64_t __52__HMDAccessory__handleLastSeenStatusRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithPayload:");
}

void __63__HMDAccessory_setPreferredMediaUser_selectionType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to set preferred media user, error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

uint64_t __58__HMDAccessory_runTransactionWithModels_label_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __43__HMDAccessory_initWithNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[HMDHelper sharedHelper](HMDHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashedRouteIDForIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)validateProductData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)splitProductDataIntoProductGroupAndProductNumber:(id)a3 productGroup:(id *)a4 productNumber:(id *)a5
{
  id v7;
  int v8;

  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(), "validateProductData:", v7);
  if (v8)
  {
    if (a4)
    {
      objc_msgSend(v7, "substringWithRange:", 0, 8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v7, "substringWithRange:", 8, 8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __27__HMDAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v173;
  logCategory__hmf_once_v173 = v0;

}

- (void)populateVendorDetailsForCoreAnalytics:(id)a3 keyPrefix:(id)a4
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryMetricVendorDetails *v20;

  v6 = a4;
  v7 = a3;
  v20 = -[HMDAccessoryMetricVendorDetails initWithAccessory:]([HMDAccessoryMetricVendorDetails alloc], "initWithAccessory:", self);
  -[HMDAccessoryMetricVendorDetails productData](v20, "productData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("ProductData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  -[HMDAccessoryMetricVendorDetails manufacturer](v20, "manufacturer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("Manufacturer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

  -[HMDAccessoryMetricVendorDetails model](v20, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("Model"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

  -[HMDAccessoryMetricVendorDetails firmwareVersion](v20, "firmwareVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("FirmwareVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

  -[HMDAccessoryMetricVendorDetails category](v20, "category");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("Category"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

  -[HMDAccessoryMetricVendorDetails differentiationNumber](v20, "differentiationNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("DifferentiationNumber"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);
}

- (id)metricLoggingTransportDetails
{
  return -[HMDAccessoryMetricTransportDetails initWithAccessory:]([HMDAccessoryMetricTransportDetails alloc], "initWithAccessory:", self);
}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)assistantObject
{
  void *v3;
  void *v4;
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
  char v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[6];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[HMDAccessory name](self, "name"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    v27[0] = *MEMORY[0x1E0D88A10];
    -[HMDAccessory name](self, "name", CFSTR("objectType"), CFSTR("objectName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v6;
    v26[2] = CFSTR("objectIdentifier");
    -[HMDAccessory urlString](self, "urlString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v7;
    v26[3] = CFSTR("objectHome");
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v8;
    v26[4] = CFSTR("objectHomeIdentifier");
    objc_msgSend(v3, "urlString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = CFSTR("objectReference");
    v27[4] = v9;
    v27[5] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithDictionary:", v10);

    -[HMDAccessory hashRouteID](self, "hashRouteID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("objectHashedRouteUID"));
    -[HMDAccessory room](self, "room");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("objectRoom"));
        objc_msgSend(v13, "urlString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("objectRoomIdentifier"));

      }
    }
    v18 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](self, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because accessory.home or accessory.name is nil for %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return (NSDictionary *)v18;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)metadataIdentifier
{
  HMDAccessory *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAccessory *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  HMDAccessory *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory productData](self, "productData");
  v3 = (HMDAccessory *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessory firmwareVersion](self, "firmwareVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDNetworkRouterFirewallRuleAccessoryIdentifier createWithProductData:firmwareVersion:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "createWithProductData:firmwareVersion:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v15;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate meta-data identifier with product data '%@' and firmware version '%@'", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to generate meta-data identifier because the productData is nil -- %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v6 = 0;
  }

  return (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v6;
}

@end
