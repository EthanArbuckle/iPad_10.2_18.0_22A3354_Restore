@implementation HMDMediaBrowser

- (HMDMediaBrowser)initWithHomeManager:(id)a3
{
  id v4;
  HMDMediaBrowserDataSource *v5;
  HMDMediaBrowser *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDMediaBrowserDataSource);
  v6 = -[HMDMediaBrowser initWithHomeManager:dataSource:](self, "initWithHomeManager:dataSource:", v4, v5);

  return v6;
}

- (HMDMediaBrowser)initWithHomeManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDMediaBrowser *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *clientQueue;
  uint64_t v14;
  NSMutableSet *identifiersOfAssociatedMediaAccessories;
  uint64_t v16;
  NSMutableSet *mediaEndpoints;
  uint64_t v18;
  NSMutableSet *accessoryAdvertisements;
  uint64_t v20;
  NSMapTable *currentBrowseOperations;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDMediaBrowser;
  v8 = -[HMDMediaBrowser init](&v23, sel_init);
  if (v8)
  {
    HMDispatchQueueNameString();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_dataSource, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    identifiersOfAssociatedMediaAccessories = v8->_identifiersOfAssociatedMediaAccessories;
    v8->_identifiersOfAssociatedMediaAccessories = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    mediaEndpoints = v8->_mediaEndpoints;
    v8->_mediaEndpoints = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    accessoryAdvertisements = v8->_accessoryAdvertisements;
    v8->_accessoryAdvertisements = (NSMutableSet *)v18;

    v8->_discoverUnassociatedAccessories = 0;
    v8->_discoverAssociatedAccessories = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    currentBrowseOperations = v8->_currentBrowseOperations;
    v8->_currentBrowseOperations = (NSMapTable *)v20;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    v8->_updateAvailableOutputDevices = 0;
    v8->_discoverySession = (void *)MRAVRoutingDiscoverySessionCreate();
  }

  return v8;
}

- (void)dealloc
{
  HMFTimer *discoveryPollTimer;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_discoverySession)
  {
    if (self->_discoverySessionCallbackToken)
      MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
    -[HMFTimer suspend](self->_discoveryPollTimer, "suspend");
    discoveryPollTimer = self->_discoveryPollTimer;
    self->_discoveryPollTimer = 0;

    CFRelease(self->_discoverySession);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableSet allObjects](self->_mediaEndpoints, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "disconnectWithCompletionHandler:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)HMDMediaBrowser;
  -[HMDMediaBrowser dealloc](&v9, sel_dealloc);
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDMediaBrowser descriptionWithPointer:additionalDescription:](self, 1);
}

- (NSString)description
{
  return (NSString *)-[HMDMediaBrowser descriptionWithPointer:additionalDescription:](self, 0);
}

- (HMDUnassociatedMediaAccessory)currentAccessory
{
  HMDMediaBrowser *v2;
  int *v3;
  const char *v4;
  void *v5;
  id v6;
  void *v7;
  id Property;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  int v16;
  SEL v17;
  id v18;
  id v19;
  uint64_t v20;
  HMDHomeKitVersion *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HMDMediaBrowser *v31;
  NSObject *v32;
  void *v33;
  int v34;
  SEL v35;
  id v36;
  uint64_t v37;
  HMDHomeKitVersion *v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  SEL v50;
  void *v51;
  void *v52;
  SEL v53;
  id v54;
  const char *v55;
  SEL v56;
  id v57;
  void *v58;
  void *v59;
  HMDMediaBrowser *v60;
  NSObject *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  HMDHomeKitVersion *v67;
  HMDHomeKitVersion *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint8_t buf[4];
  void *v80;
  uint64_t v81;

  v2 = self;
  v81 = *MEMORY[0x1E0C80C00];
  v3 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
  if (self)
    self = (HMDMediaBrowser *)objc_getProperty(self, a2, 96, 1);
  -[HMDMediaBrowser currentAccessoryMediaRouteIdentifier](self, "currentAccessoryMediaRouteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v2 ? objc_getProperty(v2, v4, 96, 1) : 0;
    if (objc_msgSend(v6, "isAppleMediaAccessory"))
    {
      v7 = (void *)MEMORY[0x1E0CBA1D8];
      if (v2)
        Property = objc_getProperty(v2, v4, 96, 1);
      else
        Property = 0;
      objc_msgSend(Property, "productInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "categoryForProductInfo:", v9);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
        v11 = objc_getProperty(v2, v10, 96, 1);
      else
        v11 = 0;
      objc_msgSend(v11, "systemInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "productColor");
      -[HMDMediaBrowser homeManager](v2, "homeManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v5;
      v74 = v12;
      v75 = v15;
      if (v2)
      {
        v16 = objc_msgSend(objc_getProperty(v2, v14, 96, 1), "requiresHomePodMiniPairing");
        v18 = objc_getProperty(v2, v17, 96, 1);
        if (v16)
        {
          v70 = v13;
LABEL_14:
          v19 = v18;
          +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "UUIDString");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0.1"));
          objc_msgSend(v15, "capabilitiesController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "encodedCurrentAccessoryCapabilities");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "capabilitiesController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "encodedCurrentResidentCapabilities");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaBrowser messageDispatcher](v2);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v67 = v21;
          v73 = v21;
          v27 = (void *)v20;
          objc_msgSend(v19, "createUnassociatedHomePodAccessory:name:category:productColor:idsIdentifierString:requiredPairingCapabilities:minimumPairingSoftware:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v78, v76, v77, v70, v20, 3, v67, v23, v25, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
LABEL_31:

          objc_msgSend(v28, "setCurrentAccessory:", 1);
          v43 = v74;
          v44 = v43;
          if (v2)
          {
            objc_msgSend(v43, "model");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = v78;
            if (v45)
            {
              objc_msgSend(v44, "regionInfo");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46)
              {
                objc_msgSend(v45, "stringByAppendingString:", v46);
                v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v47 = v45;
              }
              v48 = v47;

            }
            else
            {
              v48 = &stru_1E89C3E38;
            }

            objc_msgSend(v28, "setModel:", v48);
            objc_msgSend(v44, "serialNumber");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSerialNumber:", v49);

            objc_msgSend(objc_getProperty(v2, v50, v3[449], 1), "productInfo");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "softwareVersion");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSoftwareVersion:", v52);

            v54 = objc_getProperty(v2, v53, v3[449], 1);
          }
          else
          {

            objc_msgSend(v28, "setModel:", 0);
            objc_msgSend(v44, "serialNumber");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSerialNumber:", v64);

            objc_msgSend(0, "productInfo");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "softwareVersion");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSoftwareVersion:", v66);

            v54 = 0;
            v5 = v78;
          }
          objc_msgSend(v28, "setVariant:", objc_msgSend(v54, "appleMediaAccessoryVariant"));
          if (v2)
          {
            objc_msgSend(v28, "setSupportedStereoPairVersions:", objc_msgSend(objc_getProperty(v2, v55, v3[449], 1), "supportedStereoPairVersions"));
            v57 = objc_getProperty(v2, v56, v3[449], 1);
          }
          else
          {
            objc_msgSend(v28, "setSupportedStereoPairVersions:", objc_msgSend(0, "supportedStereoPairVersions"));
            v57 = 0;
          }
          objc_msgSend(v57, "currentDevice");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58)
          {
            objc_msgSend(v28, "setDevice:", v58);
          }
          else
          {
            v59 = (void *)MEMORY[0x1D17BA0A0]();
            v60 = v2;
            HMFGetOSLogHandle();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v80 = v62;
              _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain device for current accessory.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v59);
          }

          goto LABEL_47;
        }
        v34 = objc_msgSend(v18, "requiresHomePod2ndGenPairing");
        v36 = objc_getProperty(v2, v35, 96, 1);
        if (v34)
        {
LABEL_23:
          v71 = v13;
          v69 = v36;
          +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "UUIDString");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("10.0"));
          objc_msgSend(v15, "capabilitiesController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "encodedCurrentAccessoryCapabilities");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "capabilitiesController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "encodedCurrentResidentCapabilities");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaBrowser messageDispatcher](v2);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v68 = v38;
          v73 = v38;
          v27 = (void *)v37;
          objc_msgSend(v69, "createUnassociatedHomePodAccessory:name:category:productColor:idsIdentifierString:requiredPairingCapabilities:minimumPairingSoftware:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v78, v76, v77, v71, v37, 5, v68, v23, v25, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
      }
      else
      {
        v70 = v13;
        v39 = objc_msgSend(0, "requiresHomePodMiniPairing");
        v18 = 0;
        if ((v39 & 1) != 0)
          goto LABEL_14;
        v40 = objc_msgSend(0, "requiresHomePod2ndGenPairing");
        v36 = 0;
        if ((v40 & 1) != 0)
          goto LABEL_23;
      }
      v26 = v36;
      +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "UUIDString");
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "capabilitiesController");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "encodedCurrentAccessoryCapabilities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "capabilitiesController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "encodedCurrentResidentCapabilities");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaBrowser messageDispatcher](v2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v13;
      v27 = (void *)v41;
      objc_msgSend(v26, "createUnassociatedAppleMediaAccessory:name:category:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v78, v76, v77, v42, v41, v22, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
  }
  if (v2)
    v29 = objc_getProperty(v2, v4, 96, 1);
  else
    v29 = 0;
  if (objc_msgSend(v29, "isAppleMediaAccessory"))
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v2;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v33;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@No identifier found for current accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
  }
  v28 = 0;
LABEL_47:

  return (HMDUnassociatedMediaAccessory *)v28;
}

- (NSArray)accessoryAdvertisements
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_accessoryAdvertisements, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)startDiscoveringUnassociatedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDMediaBrowser_startDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringUnassociatedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDMediaBrowser_stopDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDMediaBrowser accessoryAdvertisements](self, "accessoryAdvertisements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDMediaBrowser accessoryAdvertisements](self, "accessoryAdvertisements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

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
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)unassociatedAccessoryFromAdvertisementData:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *identifiersOfAssociatedMediaAccessories;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  HMDUnassociatedAirPlayAccessory *v16;
  void *v17;
  HMDUnassociatedAirPlayAccessory *v18;
  void *v19;
  HMDMediaBrowser *v20;
  NSObject *v21;
  void *v22;
  HMDUnassociatedAirPlayAccessory *v23;
  void *v24;
  void *v25;
  HMDMediaBrowser *v26;
  NSObject *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  HMDUnassociatedAirPlayAccessory *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    identifiersOfAssociatedMediaAccessories = self->_identifiersOfAssociatedMediaAccessories;
  else
    identifiersOfAssociatedMediaAccessories = 0;
  if ((-[NSMutableSet containsObject:](identifiersOfAssociatedMediaAccessories, "containsObject:", v5) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18 = 0;
  }
  else
  {
    v7 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferenceForKey:", CFSTR("forceAirPlay2ATV"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
      {
        objc_msgSend(v9, "category");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "categoryType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CB7A18]);

        if (v15)
        {
          v16 = [HMDUnassociatedAirPlayAccessory alloc];
          -[HMDMediaBrowser messageDispatcher](self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HMDUnassociatedMediaAccessory initWithAdvertisement:messageDispatcher:](v16, "initWithAdvertisement:messageDispatcher:", v7, v17);

          v19 = (void *)MEMORY[0x1D17BA0A0]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138543874;
            v31 = v22;
            v32 = 2112;
            v33 = v18;
            v34 = 2112;
            v35 = v7;
            _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from ATV advertisement: %@", (uint8_t *)&v30, 0x20u);

          }
          objc_autoreleasePoolPop(v19);
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v23 = [HMDUnassociatedAirPlayAccessory alloc];
      -[HMDMediaBrowser messageDispatcher](self);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDUnassociatedMediaAccessory initWithAdvertisement:messageDispatcher:](v23, "initWithAdvertisement:messageDispatcher:", v7, v24);

      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v28;
        v32 = 2112;
        v33 = v18;
        v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from advertisement: %@", (uint8_t *)&v30, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  return v18;
}

- (void)registerAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDMediaBrowser *v9;

  v4 = a3;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HMDMediaBrowser_registerAccessories___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateSessionsForAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMDMediaBrowser_updateSessionsForAccessories___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)deregisterAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDMediaBrowser *v9;

  v4 = a3;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  HMFTimer *discoveryPollTimer;
  uint64_t v6;
  const void *v7;
  HMFTimer *v8;

  v8 = (HMFTimer *)a3;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self)
  {
    discoveryPollTimer = self->_discoveryPollTimer;

    if (discoveryPollTimer == v8 && self->_updateAvailableOutputDevices)
    {
      self->_updateAvailableOutputDevices = 0;
      v6 = MRAVRoutingDiscoverySessionCopyAvailableOutputDevices();
      if (v6)
      {
        v7 = (const void *)v6;
        -[HMDMediaBrowser _handleAvailableOutputDevices:](self, v6);
        CFRelease(v7);
      }
    }
  }
  else
  {

  }
}

- (HMDMediaBrowserDelegate)delegate
{
  return (HMDMediaBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_mediaEndpoints, 0);
  objc_storeStrong((id *)&self->_identifiersOfAssociatedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_discoveryPollTimer, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentBrowseOperations, 0);
  objc_storeStrong((id *)&self->_accessoryAdvertisements, 0);
}

- (void)_handleAvailableOutputDevices:(_BYTE *)a1
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
  _BYTE *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1[32] || a1[33])
  {
    +[HMDMediaBrowser advertisementsFromOutputDevices:](HMDMediaBrowser, "advertisementsFromOutputDevices:", a2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "accessoryAdvertisements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "intersectSet:", v16);
    v7 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v7, "intersectSet:", v6);
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "minusSet:", v6);
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaBrowser _removeAdvertisements:](a1, v9);

    v10 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v10, "minusSet:", v7);
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaBrowser _addAdvertisements:](a1, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring media browser callback since not discovering media accessories", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
}

- (void)_removeAdvertisements:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing advertisements %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(*((id *)v5 + 2), "containsObject:", v13))
          {
            objc_msgSend(*((id *)v5 + 2), "removeObject:", v13);
            objc_msgSend(v8, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v5, "clientQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __41__HMDMediaBrowser__removeAdvertisements___block_invoke;
      v15[3] = &unk_1E89C2328;
      v15[4] = v5;
      v16 = v8;
      dispatch_async(v14, v15);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 2);
  }

}

- (void)_addAdvertisements:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v8;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding advertisements %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(*((id *)v6 + 2), "containsObject:", v14) & 1) == 0)
          {
            objc_msgSend(*((id *)v6 + 2), "addObject:", v14);
            objc_msgSend(v9, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v6, "clientQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __38__HMDMediaBrowser__addAdvertisements___block_invoke;
      v16[3] = &unk_1E89C2328;
      v16[4] = v6;
      v17 = v9;
      dispatch_async(v15, v16);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
  }

}

void __38__HMDMediaBrowser__addAdvertisements___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
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
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = v1;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v7;
        v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of added accessory advertisements: %@", (uint8_t *)&v8, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v3, "browser:didAddAdvertisements:", v5, v2);
    }

  }
}

void __41__HMDMediaBrowser__removeAdvertisements___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
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
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = v1;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v7;
        v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of removed accessory advertisements: %@", (uint8_t *)&v8, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v3, "browser:didRemoveAdvertisements:", v5, v2);
    }

  }
}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
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
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v1 = a1;
  v71 = *MEMORY[0x1E0C80C00];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v59;
    *(_QWORD *)&v3 = 138543874;
    v40 = v3;
    v6 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
    v41 = *(_QWORD *)v59;
    v42 = v1;
    do
    {
      v7 = 0;
      v43 = v4;
      do
      {
        if (*(_QWORD *)v59 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v7);
        v9 = *(_QWORD *)(v1 + 40);
        if (v9)
          v10 = *(void **)(v9 + v6[450]);
        else
          v10 = 0;
        if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v7), v40))
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = *(id *)(v1 + 40);
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          v45 = v7;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v14;
            v64 = 2112;
            v65 = v8;
            _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@De-registering associated media accessory %@", buf, 0x16u);

            v6 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
          }

          objc_autoreleasePoolPop(v11);
          v15 = *(_QWORD *)(v1 + 40);
          if (v15)
            v16 = *(void **)(v15 + v6[450]);
          else
            v16 = 0;
          objc_msgSend(v16, "removeObject:", v8);
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v17 = *(_QWORD *)(v1 + 40);
          if (v17)
            v18 = *(void **)(v17 + 88);
          else
            v18 = 0;
          objc_msgSend(v18, "allObjects");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
          if (v19)
          {
            v20 = v19;
            v47 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v55 != v47)
                  objc_enumerationMutation(v46);
                v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                objc_msgSend(v22, "advertisements");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v24 = v23;
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
                if (v25)
                {
                  v26 = v25;
                  v27 = *(_QWORD *)v51;
LABEL_22:
                  v28 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v51 != v27)
                      objc_enumerationMutation(v24);
                    objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v28), "identifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v8, "isEqual:", v29);

                    if ((v30 & 1) != 0)
                      break;
                    if (v26 == ++v28)
                    {
                      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
                      if (v26)
                        goto LABEL_22;
                      goto LABEL_28;
                    }
                  }
                  v31 = v22;

                  if (!v31)
                    continue;

                  v33 = (void *)MEMORY[0x1D17BA0A0]();
                  v1 = v42;
                  v34 = *(id *)(v42 + 40);
                  HMFGetOSLogHandle();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v40;
                    v63 = v36;
                    v64 = 2112;
                    v65 = v31;
                    v66 = 2112;
                    v67 = v8;
                    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from and removing the endpoint %@ for media accessory %@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v33);
                  v48[0] = MEMORY[0x1E0C809B0];
                  v48[1] = 3221225472;
                  v48[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke_86;
                  v48[3] = &unk_1E89C21C0;
                  v48[4] = *(_QWORD *)(v42 + 40);
                  v32 = v31;
                  v49 = v32;
                  objc_msgSend(v32, "disconnectWithCompletionHandler:", v48);
                  v37 = *(_QWORD *)(v42 + 40);
                  v5 = v41;
                  v4 = v43;
                  if (v37)
                    v38 = *(void **)(v37 + 88);
                  else
                    v38 = 0;
                  v6 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
                  v7 = v45;
                  objc_msgSend(v38, "removeObject:", v32);

                  goto LABEL_39;
                }
LABEL_28:

              }
              v20 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
              if (v20)
                continue;
              break;
            }
            v5 = v41;
            v1 = v42;
            v4 = v43;
          }
          v6 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
          v7 = v45;
          v32 = v46;
LABEL_39:

        }
        ++v7;
      }
      while (v7 != v4);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      v4 = v39;
    }
    while (v39);
  }

}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v10 = "%{public}@Disconnection from endpoint %@ failed with error %@";
      v11 = v6;
      v12 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, v12);

    }
  }
  else if (v7)
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v13;
    v10 = "%{public}@Disconnected from endpoint %@";
    v11 = v6;
    v12 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __48__HMDMediaBrowser_updateSessionsForAccessories___block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  uint64_t i;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDMediaAccessoryBrowseOperation *v8;
  id v9;
  void *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  SEL v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id from;
  id location;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "clientQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v21;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(obj);
          v4 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v1, "clientQueue");
          v5 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v5);

          objc_msgSend(v1[3], "objectForKey:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          if (v6 && (objc_msgSend(v6, "isFinished") & 1) == 0)
          {
            v17 = (void *)MEMORY[0x1D17BA0A0]();
            v18 = v1;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v20;
              v38 = 2112;
              v39 = v4;
              _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Not starting browse operation as one is already in process for accessory: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v17);
          }
          else
          {
            v8 = -[HMDMediaAccessoryBrowseOperation initWithAccessoryIdentifier:]([HMDMediaAccessoryBrowseOperation alloc], "initWithAccessoryIdentifier:", v4);
            -[HMDMediaAccessoryBrowseOperation setEndpointFeatures:](v8, "setEndpointFeatures:", 8);
            -[HMFOperation setQualityOfService:](v8, "setQualityOfService:", 9);
            objc_msgSend(v1[3], "setObject:forKey:", v8, v4);
            objc_initWeak(&location, v1);
            objc_initWeak(&from, v8);
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke;
            v29[3] = &unk_1E89BF2A0;
            objc_copyWeak(&v31, &location);
            objc_copyWeak(&v32, &from);
            v9 = v4;
            v30 = v9;
            v10 = (void *)MEMORY[0x1D17BA0A0](-[HMDMediaAccessoryBrowseOperation setCompletionBlock:](v8, "setCompletionBlock:", v29));
            v11 = v1;
            HMFGetOSLogHandle();
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v13;
              v38 = 2112;
              v39 = v9;
              _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting a reconnaissance session for accessory %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v10);
            v15 = objc_getProperty(v11, v14, 96, 1);
            v16 = (id)objc_msgSend(v15, "performOperation:", v8);

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v31);
            objc_destroyWeak(&from);
            objc_destroyWeak(&location);

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v24);
    }

  }
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke(id *a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  id v11;
  id v12;

  v2 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_msgSend(v4, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = WeakRetained[13];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_2;
        v8[3] = &unk_1E89BF278;
        v9 = v5;
        v10 = WeakRetained;
        v11 = a1[4];
        objc_copyWeak(&v12, v2);
        dispatch_async(v7, v8);
        objc_destroyWeak(&v12);

      }
    }
  }

}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _BYTE buf[24];
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD **)(a1 + 40);
    if (v5)
      v5 = (_QWORD *)v5[11];
    v6 = v5;
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_81;
    v41[3] = &unk_1E89BF228;
    v9 = v3;
    v42 = v9;
    v10 = v4;
    v43 = v10;
    objc_msgSend(v7, "hmf_objectPassingTest:", v41);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v46 = v10;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Endpoint already exists for accessory '%@' with session identifier '%@'", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      if ((objc_msgSend(v11, "isEqual:", v9) & 1) != 0)
        goto LABEL_22;
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating to new media endpoint %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v9, "updateWithEndpoint:", v11);
    }
    else
    {
      v11 = v9;
      objc_msgSend(v11, "setBrowser:", *(_QWORD *)(a1 + 40));
      v26 = *(_QWORD *)(a1 + 40);
      if (v26)
        v27 = *(void **)(v26 + 88);
      else
        v27 = 0;
      v28 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v27, "addObject:", v11));
      v29 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v46 = v32;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Creating and connecting to endpoint %@ for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
    }
    objc_msgSend(v11, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_83;
    v38[3] = &unk_1E89BF250;
    objc_copyWeak(&v40, (id *)(a1 + 56));
    v34 = v33;
    v39 = v34;
    objc_msgSend(v11, "updateOutputDevicesAndConnectWithCompletionHandler:", v38);
    v35 = *(void **)(a1 + 40);
    v44 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v35, "clientQueue");
      v37 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v8;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __53__HMDMediaBrowser__notifyDelegateOfUpdatedEndpoints___block_invoke;
      v46 = &unk_1E89C2328;
      v47 = v35;
      v48 = v36;
      dispatch_async(v37, buf);

    }
    objc_destroyWeak(&v40);

LABEL_22:
    goto LABEL_23;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@No media endpoint found for accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
LABEL_23:

}

uint64_t __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_81(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v3;
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      v11 = "%{public}@Connection to endpoint %@ failed with error %@";
      v12 = v7;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);

    }
  }
  else if (v8)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v14;
    v11 = "%{public}@Connection to endpoint %@";
    v12 = v7;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

void __53__HMDMediaBrowser__notifyDelegateOfUpdatedEndpoints___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "browser:didUpdateEndpoints:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__HMDMediaBrowser_registerAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v1 = a1;
  v36 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    v6 = &OBJC_IVAR___HMDHomeManager__hh2MigrationInProgress;
    v26 = v1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v9 = *(_QWORD *)(v1 + 40);
        if (v9)
          v10 = *(void **)(v9 + v6[450]);
        else
          v10 = 0;
        if ((objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7)) & 1) == 0)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = *(id *)(v1 + 40);
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = v4;
            v15 = v5;
            v16 = v6;
            v17 = v2;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v18;
            v33 = 2112;
            v34 = v8;
            _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Registering associated media accessory %@", buf, 0x16u);

            v2 = v17;
            v6 = v16;
            v5 = v15;
            v4 = v14;
            v1 = v26;
          }

          objc_autoreleasePoolPop(v11);
          v19 = *(_QWORD *)(v1 + 40);
          if (v19)
            v20 = *(void **)(v19 + v6[450]);
          else
            v20 = 0;
          objc_msgSend(v20, "addObject:", v8);
        }
        ++v7;
      }
      while (v4 != v7);
      v21 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v4 = v21;
    }
    while (v21);
  }

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = *(id *)(v1 + 40);
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Bypassing associating local media session for registered media accessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
}

- (id)messageDispatcher
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "homeManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "messageDispatcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __57__HMDMediaBrowser_stopDiscoveringUnassociatedAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery of unassociated accessories", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 33))
    {
      if (*(_QWORD *)(v6 + 64))
      {
        MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
        *(_QWORD *)(v6 + 64) = 0;
      }
      objc_msgSend(*(id *)(v6 + 72), "suspend");
      v7 = *(void **)(v6 + 72);
      *(_QWORD *)(v6 + 72) = 0;

      objc_msgSend((id)v6, "accessoryAdvertisements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
        -[HMDMediaBrowser _removeAdvertisements:]((void *)v6, v8);
      v9 = MRAVRoutingDiscoverySessionSetDiscoveryMode();
      v10 = (void *)MEMORY[0x1D17BA0A0](v9);
      v11 = (id)v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2048;
        v17 = 0;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting MR discovery mode to %ld", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v10);

    }
  }
}

void __58__HMDMediaBrowser_startDiscoveringUnassociatedAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  const void *v22;
  void *v23;
  _BYTE *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id location;
  uint8_t v45[128];
  uint8_t v46[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int128 buf;
  void (*v51)(uint64_t);
  void *v52;
  id v53[2];

  v53[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferenceForKey:", CFSTR("enableAddAirplay2Accessories"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting discovery of unassociated accessories", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
      v10 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v10 + 33))
      {
        objc_initWeak(&location, *(id *)(a1 + 32));
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v51 = __47__HMDMediaBrowser__startDiscoveringAccessories__block_invoke;
        v52 = &unk_1E89BF200;
        objc_copyWeak(v53, &location);
        v11 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
        if (v11)
        {
          *(_QWORD *)(v10 + 64) = v11;
          v12 = objc_alloc(MEMORY[0x1E0D286C8]);
          v13 = objc_msgSend(v12, "initWithTimeInterval:options:", 4, *(double *)&mediaBrowserProcessingInterval);
          v14 = *(void **)(v10 + 72);
          *(_QWORD *)(v10 + 72) = v13;

          v15 = *(void **)(v10 + 72);
          objc_msgSend((id)v10, "clientQueue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDelegateQueue:", v16);

          objc_msgSend(*(id *)(v10 + 72), "setDelegate:", v10);
          objc_msgSend(*(id *)(v10 + 72), "resume");
          v17 = MRAVRoutingDiscoverySessionSetDiscoveryMode();
          v18 = (void *)MEMORY[0x1D17BA0A0](v17);
          v19 = (id)v10;
          HMFGetOSLogHandle();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v46 = 138543618;
            v47 = v21;
            v48 = 2048;
            v49 = 2;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@_startDiscoveringAccessories: Setting MR discovery mode to %ld and adding all supported output devices to the browser", v46, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v22 = (const void *)MRAVRoutingDiscoverySessionCopyAvailableOutputDevices();
          if (v22)
          {
            v23 = (void *)MEMORY[0x1D17BA0A0]();
            v24 = v19;
            HMFGetOSLogHandle();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v46 = 138543618;
              v47 = v26;
              v48 = 2112;
              v49 = (uint64_t)v22;
              _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Adding initially available output devices: %@", v46, 0x16u);

            }
            objc_autoreleasePoolPop(v23);
            -[HMDMediaBrowser _handleAvailableOutputDevices:](v24, (uint64_t)v22);
            CFRelease(v22);
          }
        }
        else
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = (id)v10;
          HMFGetOSLogHandle();
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v46 = 138543362;
            v47 = v31;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to register callback for unassociated accessory discovery", v46, 0xCu);

          }
          objc_autoreleasePoolPop(v28);
        }
        objc_destroyWeak(v53);
        objc_destroyWeak(&location);
        v10 = *(_QWORD *)(a1 + 32);
      }
      v32 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)v10, "accessoryAdvertisements");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "accessoryAdvertisements", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(v35);
            v39 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if ((objc_msgSend(v39, "isAssociated") & 1) == 0)
              objc_msgSend(v34, "addObject:", v39);
          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v36);
      }

      if (objc_msgSend(v34, "count"))
        -[HMDMediaBrowser _addAdvertisements:](*(void **)(a1 + 32), v34);

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Bypassing local discovery of unassociated accessories", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
  }
}

void __47__HMDMediaBrowser__startDiscoveringAccessories__block_invoke(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v1 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMDMediaBrowser_checkForUpdatedAvailableOutputDevices___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = WeakRetained;
    dispatch_async(v1, block);

  }
}

uint64_t __57__HMDMediaBrowser_checkForUpdatedAvailableOutputDevices___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    *(_BYTE *)(v1 + 34) = 1;
  return result;
}

- (id)descriptionWithPointer:(void *)a1 additionalDescription:(int)a2
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), a1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E89C3E38;
    }
    objc_msgSend(a1, "accessoryAdvertisements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@%@, Advertising accessories = %@>"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2)
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)advertisementsFromOutputDevices:(__CFArray *)a3
{
  CFIndex Count;
  void *v5;
  CFIndex v6;
  const void *ValueAtIndex;
  HMDMediaOutputDevice *v8;
  unsigned int v9;
  HMDMediaOutputDevice *v11;
  HMDMediaOutputDevice *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  HMDAppleMediaAccessoryAdvertisement *v16;
  void *v17;

  if (a3)
  {
    Count = CFArrayGetCount(a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", Count);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (Count >= 1)
    {
      v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, v6);
        if (ValueAtIndex)
          break;
LABEL_11:
        if (Count == ++v6)
          goto LABEL_25;
      }
      v8 = -[HMDMediaOutputDevice initWithOutputDevice:]([HMDMediaOutputDevice alloc], "initWithOutputDevice:", ValueAtIndex);
      v9 = -[HMDMediaOutputDevice deviceSubtype](v8, "deviceSubtype");
      if (v9 - 15 >= 4 && v9 != 11)
      {
        v11 = v8;
        v12 = v11;
        if (v11 && !-[HMDMediaOutputDevice supportsHAP](v11, "supportsHAP"))
        {
          -[HMDMediaOutputDevice modelID](v12, "modelID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = +[HMDMediaAccessoryAdvertisement canAirPortExpressSupportMediaAccessory:](HMDMediaAccessoryAdvertisement, "canAirPortExpressSupportMediaAccessory:", v13);

          if (v14)
          {

          }
          else
          {
            v15 = -[HMDMediaOutputDevice supportsWHA](v12, "supportsWHA");

            if (!v15)
              goto LABEL_10;
          }
          if (-[HMDMediaOutputDevice isAppleMediaAccessory](v12, "isAppleMediaAccessory"))
            v16 = -[HMDAppleMediaAccessoryAdvertisement initWithOutputDevice:device:]([HMDAppleMediaAccessoryAdvertisement alloc], "initWithOutputDevice:device:", v12, 0);
          else
            v16 = -[HMDMediaAccessoryAdvertisement initWithOutputDevice:]([HMDMediaAccessoryAdvertisement alloc], "initWithOutputDevice:", v12);
          v8 = (HMDMediaOutputDevice *)v16;

          if (!v8)
            goto LABEL_11;
          objc_msgSend(v5, "addObject:", v8);
          goto LABEL_10;
        }

      }
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_25:
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_172792 != -1)
    dispatch_once(&logCategory__hmf_once_t34_172792, &__block_literal_global_172793);
  return (id)logCategory__hmf_once_v35_172794;
}

void __30__HMDMediaBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35_172794;
  logCategory__hmf_once_v35_172794 = v0;

}

@end
