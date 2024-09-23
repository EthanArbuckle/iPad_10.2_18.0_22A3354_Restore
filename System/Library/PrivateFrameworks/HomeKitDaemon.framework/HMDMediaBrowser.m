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
  SEL v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDMediaBrowser;
  v8 = -[HMDMediaBrowser init](&v25, sel_init);
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
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    identifiersOfAssociatedMediaAccessories = v8->_identifiersOfAssociatedMediaAccessories;
    v8->_identifiersOfAssociatedMediaAccessories = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    mediaEndpoints = v8->_mediaEndpoints;
    v8->_mediaEndpoints = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    accessoryAdvertisements = v8->_accessoryAdvertisements;
    v8->_accessoryAdvertisements = (NSMutableSet *)v18;

    v8->_discoverUnassociatedAccessories = 0;
    v8->_discoverAssociatedAccessories = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    currentBrowseOperations = v8->_currentBrowseOperations;
    v8->_currentBrowseOperations = (NSMapTable *)v20;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    v8->_updateAvailableOutputDevices = 0;
    v8->_discoverySession = (void *)MRAVRoutingDiscoverySessionCreate();
    objc_msgSend(objc_getProperty(v8, v22, 96, 1), "airPlayBonjourBrowser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", v8);

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

  v15 = *MEMORY[0x24BDAC8D0];
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
  const char *v3;
  id v4;
  void *v5;
  id Property;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  HMDHomeKitVersion *v16;
  uint64_t v17;
  id v18;
  void *v19;
  HMDMediaBrowser *v20;
  NSObject *v21;
  void *v22;
  HMDUnassociatedAppleMediaAccessory *v23;
  id v24;
  HMDHomeKitVersion *v25;
  HMDUnassociatedAppleMediaAccessory *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  int *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  HMDHomeKitVersion *v42;
  void *v43;
  SEL v44;
  void *v45;
  void *v46;
  SEL v47;
  id v48;
  const char *v49;
  SEL v50;
  id v51;
  void *v52;
  void *v53;
  HMDMediaBrowser *v54;
  NSObject *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  HMDHomeKitVersion *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v2 = self;
  v71 = *MEMORY[0x24BDAC8D0];
  if (self)
    self = (HMDMediaBrowser *)objc_getProperty(self, a2, 96, 1);
  -[HMDMediaBrowser currentAccessoryMediaRouteIdentifier](self, "currentAccessoryMediaRouteIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68
    && (!v2 ? (v4 = 0) : (v4 = objc_getProperty(v2, v3, 96, 1)),
        objc_msgSend(v4, "isAppleMediaAccessory")))
  {
    v5 = (void *)MEMORY[0x24BDD7338];
    if (v2)
      Property = objc_getProperty(v2, v3, 96, 1);
    else
      Property = 0;
    objc_msgSend(Property, "productInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryForProductInfo:", v7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      v9 = objc_getProperty(v2, v8, 96, 1);
    else
      v9 = 0;
    objc_msgSend(v9, "systemInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "productColor");
    -[HMDMediaBrowser homeManager](v2, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v14 = objc_getProperty(v2, v12, 96, 1);
    else
      v14 = 0;
    if (objc_msgSend(v14, "requiresHomePodMiniPairing"))
    {
      v16 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("7.0.1"));
      v17 = 3;
    }
    else
    {
      v16 = 0;
      v17 = 1;
    }
    if (v2)
      v24 = objc_getProperty(v2, v15, 96, 1);
    else
      v24 = 0;
    v63 = v11;
    v64 = v10;
    if (objc_msgSend(v24, "requiresHomePod2ndGenPairing"))
    {
      v61 = v17 | 4;
      v25 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("10.0"));

    }
    else
    {
      v25 = v16;
      v61 = v17;
    }
    v26 = [HMDUnassociatedAppleMediaAccessory alloc];
    +[HMDDeviceAddress localDeviceIDSIdentifier](HMDDeviceAddress, "localDeviceIDSIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "capabilitiesController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "encodedCurrentAccessoryCapabilities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v13;
    objc_msgSend(v13, "capabilitiesController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "encodedCurrentResidentCapabilities");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaBrowser messageDispatcher](v2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v61;
    v62 = v25;
    v23 = -[HMDUnassociatedAppleMediaAccessory initWithIdentifier:name:category:requiredPairingCapabilities:minimumPairingSoftware:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:](v26, "initWithIdentifier:name:category:requiredPairingCapabilities:minimumPairingSoftware:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v68, v66, v67, v34, v25, v63, v28, v30, v32, v33);

    -[HMDUnassociatedAppleMediaAccessory setCurrentAccessory:](v23, "setCurrentAccessory:", 1);
    v35 = v64;
    v36 = v35;
    if (v2)
    {
      objc_msgSend(v35, "model");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
      if (v37)
      {
        objc_msgSend(v36, "regionInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v37, "stringByAppendingString:", v39);
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = v37;
        }
        v41 = v40;
        v42 = v62;

      }
      else
      {
        v41 = &stru_24E79DB48;
        v42 = v62;
      }

      -[HMDUnassociatedAppleMediaAccessory setModel:](v23, "setModel:", v41);
      objc_msgSend(v36, "serialNumber");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAppleMediaAccessory setSerialNumber:](v23, "setSerialNumber:", v43);

      objc_msgSend(objc_getProperty(v2, v44, 96, 1), "productInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "softwareVersion");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAppleMediaAccessory setSoftwareVersion:](v23, "setSoftwareVersion:", v46);

      v48 = objc_getProperty(v2, v47, 96, 1);
    }
    else
    {

      -[HMDUnassociatedAppleMediaAccessory setModel:](v23, "setModel:", 0);
      objc_msgSend(v36, "serialNumber");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAppleMediaAccessory setSerialNumber:](v23, "setSerialNumber:", v58);

      objc_msgSend(0, "productInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "softwareVersion");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAppleMediaAccessory setSoftwareVersion:](v23, "setSoftwareVersion:", v60);

      v48 = 0;
      v38 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
      v42 = v62;
    }
    -[HMDUnassociatedAppleMediaAccessory setVariant:](v23, "setVariant:", objc_msgSend(v48, "appleMediaAccessoryVariant"));
    if (v2)
    {
      -[HMDUnassociatedAppleMediaAccessory setSupportedStereoPairVersions:](v23, "setSupportedStereoPairVersions:", objc_msgSend(objc_getProperty(v2, v49, v38[459], 1), "supportedStereoPairVersions"));
      v51 = objc_getProperty(v2, v50, v38[459], 1);
    }
    else
    {
      -[HMDUnassociatedAppleMediaAccessory setSupportedStereoPairVersions:](v23, "setSupportedStereoPairVersions:", objc_msgSend(0, "supportedStereoPairVersions"));
      v51 = 0;
    }
    objc_msgSend(v51, "currentDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      -[HMDUnassociatedAppleMediaAccessory setDevice:](v23, "setDevice:", v52);
    }
    else
    {
      v53 = (void *)MEMORY[0x227676638]();
      v54 = v2;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v56;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain device for current accessory.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v53);
    }

  }
  else
  {
    if (v2)
      v18 = objc_getProperty(v2, v3, 96, 1);
    else
      v18 = 0;
    if (objc_msgSend(v18, "isAppleMediaAccessory"))
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v2;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@No identifier found for current accessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    v23 = 0;
  }

  return (HMDUnassociatedMediaAccessory *)v23;
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

- (void)startDiscoveringAssociatedAccessoriesViaBonjour
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDMediaBrowser_startDiscoveringAssociatedAccessoriesViaBonjour__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringAssociatedAccessoriesViaBonjour
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDMediaBrowser_stopDiscoveringAssociatedAccessoriesViaBonjour__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDMediaBrowser *v10;

  v5 = a4;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HMDMediaBrowser_discovery_didDiscoverAccessory___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HMDMediaBrowser *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDMediaBrowser_discovery_didLoseAccessory_error___block_invoke;
  block[3] = &unk_24E79BBD0;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaBrowser *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Started HAP2BonjourBrowser for airplay with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaBrowser *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Stopped HAP2BonjourBrowser for airplay with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)startDiscoveringUnassociatedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDMediaBrowser_startDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringUnassociatedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMediaBrowser clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDMediaBrowser_stopDiscoveringUnassociatedAccessories__block_invoke;
  block[3] = &unk_24E79C240;
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

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
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

  v36 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
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
        v15 = objc_msgSend(v14, "isEqual:", *MEMORY[0x24BDD49A0]);

        if (v15)
        {
          v16 = [HMDUnassociatedAirPlayAccessory alloc];
          -[HMDMediaBrowser messageDispatcher](self);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HMDUnassociatedMediaAccessory initWithAdvertisement:messageDispatcher:](v16, "initWithAdvertisement:messageDispatcher:", v7, v17);

          v19 = (void *)MEMORY[0x227676638]();
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
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from ATV advertisement: %@", (uint8_t *)&v30, 0x20u);

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

      v25 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating an AirPlay accessory '%@' from advertisement: %@", (uint8_t *)&v30, 0x20u);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__HMDMediaBrowser_registerAccessories___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDMediaBrowser_updateSessionsForAccessories___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke;
  v7[3] = &unk_24E79C268;
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

  v19 = *MEMORY[0x24BDAC8D0];
  if (a1[32] || a1[33])
  {
    +[HMDMediaBrowser advertisementsFromOutputDevices:](HMDMediaBrowser, "advertisementsFromOutputDevices:", a2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDBCF20];
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
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring media browser callback since not discovering media accessories", buf, 0xCu);

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

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing advertisements %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __41__HMDMediaBrowser__removeAdvertisements___block_invoke;
      v15[3] = &unk_24E79C268;
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

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding advertisements %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
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
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __38__HMDMediaBrowser__addAdvertisements___block_invoke;
      v16[3] = &unk_24E79C268;
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

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of added accessory advertisements: %@", (uint8_t *)&v8, 0x16u);

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

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of removed accessory advertisements: %@", (uint8_t *)&v8, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v3, "browser:didRemoveAdvertisements:", v5, v2);
    }

  }
}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
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
  v71 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v45)
  {
    v4 = *(_QWORD *)v59;
    *(_QWORD *)&v3 = 138543874;
    v40 = v3;
    v41 = *(_QWORD *)v59;
    v42 = v1;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v59 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v5);
        v7 = *(_QWORD *)(v1 + 40);
        if (v7)
          v8 = *(void **)(v7 + v2[460]);
        else
          v8 = 0;
        if (objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v5), v40))
        {
          v9 = (void *)MEMORY[0x227676638]();
          v10 = *(id *)(v1 + 40);
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          v44 = v5;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v12;
            v64 = 2112;
            v65 = v6;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@De-registering associated media accessory %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          v13 = *(_QWORD *)(v1 + 40);
          if (v13)
            v14 = *(void **)(v13 + v2[460]);
          else
            v14 = 0;
          objc_msgSend(v14, "removeObject:", v6);
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v15 = *(_QWORD *)(v1 + 40);
          if (v15)
            v16 = *(void **)(v15 + 88);
          else
            v16 = 0;
          objc_msgSend(v16, "allObjects");
          v46 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
          if (v17)
          {
            v18 = v17;
            v47 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v55 != v47)
                  objc_enumerationMutation(v46);
                v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                objc_msgSend(v20, "advertisements");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v22 = v21;
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
                if (v23)
                {
                  v24 = v23;
                  v25 = *(_QWORD *)v51;
LABEL_22:
                  v26 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v51 != v25)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v26), "identifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v6, "isEqual:", v27);

                    if ((v28 & 1) != 0)
                      break;
                    if (v24 == ++v26)
                    {
                      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
                      if (v24)
                        goto LABEL_22;
                      goto LABEL_28;
                    }
                  }
                  v29 = v20;

                  if (!v29)
                    continue;

                  v31 = (void *)MEMORY[0x227676638]();
                  v1 = v42;
                  v32 = *(id *)(v42 + 40);
                  HMFGetOSLogHandle();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v40;
                    v63 = v34;
                    v64 = 2112;
                    v65 = v29;
                    v66 = 2112;
                    v67 = v6;
                    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from and removing the endpoint %@ for media accessory %@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v31);
                  v48[0] = MEMORY[0x24BDAC760];
                  v48[1] = 3221225472;
                  v48[2] = __41__HMDMediaBrowser_deregisterAccessories___block_invoke_95;
                  v48[3] = &unk_24E79BCC8;
                  v48[4] = *(_QWORD *)(v42 + 40);
                  v30 = v29;
                  v49 = v30;
                  objc_msgSend(v30, "disconnectWithCompletionHandler:", v48);
                  v35 = *(_QWORD *)(v42 + 40);
                  v2 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
                  v4 = v41;
                  if (v35)
                    v36 = *(void **)(v35 + 88);
                  else
                    v36 = 0;
                  v5 = v44;
                  objc_msgSend(v36, "removeObject:", v30);

                  goto LABEL_39;
                }
LABEL_28:

              }
              v18 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
              if (v18)
                continue;
              break;
            }
            v4 = v41;
            v1 = v42;
            v2 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
          }
          v5 = v44;
          v30 = v46;
LABEL_39:

        }
        ++v5;
      }
      while (v5 != v45);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      v45 = v37;
    }
    while (v37);
  }

  v38 = *(_QWORD *)(v1 + 40);
  if (v38)
    v39 = *(void **)(v38 + v2[460]);
  else
    v39 = 0;
  if (!objc_msgSend(v39, "count"))
    -[HMDMediaBrowser _stopDiscoveringAssociatedAccessoriesViaBonjour](*(void **)(v1 + 40));
}

void __41__HMDMediaBrowser_deregisterAccessories___block_invoke_95(uint64_t a1, void *a2)
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

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, v12);

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

- (void)_stopDiscoveringAssociatedAccessoriesViaBonjour
{
  NSObject *v2;
  SEL v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  SEL v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a1, "clientQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(objc_getProperty(a1, v3, 96, 1), "airPlayBonjourBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDiscovering");

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = a1;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for associated media accessories via bonjour", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(objc_getProperty(v7, v10, 96, 1), "airPlayBonjourBrowser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopDiscovering");

    }
  }
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

  v40 = *MEMORY[0x24BDAC8D0];
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
            v17 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not starting browse operation as one is already in process for accessory: %@", buf, 0x16u);

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
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke;
            v29[3] = &unk_24E798350;
            objc_copyWeak(&v31, &location);
            objc_copyWeak(&v32, &from);
            v9 = v4;
            v30 = v9;
            v10 = (void *)MEMORY[0x227676638](-[HMDMediaAccessoryBrowseOperation setCompletionBlock:](v8, "setCompletionBlock:", v29));
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
              _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting a reconnaissance session for accessory %@", buf, 0x16u);

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
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_2;
        v8[3] = &unk_24E798328;
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

  v49 = *MEMORY[0x24BDAC8D0];
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
    v8 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_90;
    v41[3] = &unk_24E7982D8;
    v9 = v3;
    v42 = v9;
    v10 = v4;
    v43 = v10;
    objc_msgSend(v7, "hmf_objectPassingTest:", v41);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Endpoint already exists for accessory '%@' with session identifier '%@'", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      if ((objc_msgSend(v11, "isEqual:", v9) & 1) != 0)
        goto LABEL_22;
      v17 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating to new media endpoint %@", buf, 0x16u);

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
      v28 = (void *)MEMORY[0x227676638](objc_msgSend(v27, "addObject:", v11));
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
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Creating and connecting to endpoint %@ for accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
    }
    objc_msgSend(v11, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_92;
    v38[3] = &unk_24E798300;
    objc_copyWeak(&v40, (id *)(a1 + 56));
    v34 = v33;
    v39 = v34;
    objc_msgSend(v11, "updateOutputDevicesAndConnectWithCompletionHandler:", v38);
    v35 = *(void **)(a1 + 40);
    v44 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v35, "clientQueue");
      v37 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v8;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __53__HMDMediaBrowser__notifyDelegateOfUpdatedEndpoints___block_invoke;
      v46 = &unk_24E79C268;
      v47 = v35;
      v48 = v36;
      dispatch_async(v37, buf);

    }
    objc_destroyWeak(&v40);

LABEL_22:
    goto LABEL_23;
  }
  v21 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@No media endpoint found for accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
LABEL_23:

}

uint64_t __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_90(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v3;
}

void __46__HMDMediaBrowser__updateSessionForAccessory___block_invoke_92(uint64_t a1, void *a2)
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

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);

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
  __int128 v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  v5 = &OBJC_IVAR___HMDHH2DuplicateUserModelTuple__userMergeID;
  if (v3)
  {
    v6 = v3;
    v7 = *(_QWORD *)v32;
    *(_QWORD *)&v4 = 138543618;
    v29 = v4;
    v30 = v1;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v10 = *(_QWORD *)(v1 + 40);
        if (v10)
          v11 = *(void **)(v10 + v5[460]);
        else
          v11 = 0;
        if ((objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8), v29) & 1) == 0)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = *(id *)(v1 + 40);
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = v6;
            v16 = v7;
            v17 = v5;
            v18 = v2;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v36 = v19;
            v37 = 2112;
            v38 = v9;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering associated media accessory %@", buf, 0x16u);

            v2 = v18;
            v5 = v17;
            v7 = v16;
            v6 = v15;
            v1 = v30;
          }

          objc_autoreleasePoolPop(v12);
          v20 = *(_QWORD *)(v1 + 40);
          if (v20)
            v21 = *(void **)(v20 + v5[460]);
          else
            v21 = 0;
          objc_msgSend(v21, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v22 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v6 = v22;
    }
    while (v22);
  }

  v23 = *(_QWORD *)(v1 + 40);
  if (v23)
    v24 = *(void **)(v23 + v5[460]);
  else
    v24 = 0;
  if (objc_msgSend(v24, "count"))
    -[HMDMediaBrowser _startDiscoveringAssociatedAccessoriesViaBonjour](*(id **)(v1 + 40));
  v25 = (void *)MEMORY[0x227676638]();
  v26 = *(id *)(v1 + 40);
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v28;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Bypassing associating local media session for registered media accessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
}

- (void)_startDiscoveringAssociatedAccessoriesViaBonjour
{
  void *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  SEL v7;
  uint64_t v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  SEL v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (isWatch())
    {
      v2 = (void *)MEMORY[0x227676638]();
      v3 = a1;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v5;
        _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Browsing via bonjour is not allowed on watch", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
    }
    else
    {
      objc_msgSend(a1, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v6);

      objc_msgSend(objc_getProperty(a1, v7, 96, 1), "airPlayBonjourBrowser");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isDiscovering"))
      {

      }
      else
      {
        v8 = objc_msgSend(a1[10], "count");

        if (v8)
        {
          v9 = (void *)MEMORY[0x227676638]();
          v10 = a1;
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v17 = v12;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting browse for associated media accessories via bonjour", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(objc_getProperty(v10, v13, 96, 1), "airPlayBonjourBrowser");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startDiscovering");

        }
      }
    }
  }
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

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery of unassociated accessories", (uint8_t *)&v14, 0xCu);

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
      v10 = (void *)MEMORY[0x227676638](v9);
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
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting MR discovery mode to %ld", (uint8_t *)&v14, 0x16u);

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

  v53[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferenceForKey:", CFSTR("enableAddAirplay2Accessories"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    v5 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting discovery of unassociated accessories", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
      v10 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v10 + 33))
      {
        objc_initWeak(&location, *(id *)(a1 + 32));
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v51 = __47__HMDMediaBrowser__startDiscoveringAccessories__block_invoke;
        v52 = &unk_24E7982B0;
        objc_copyWeak(v53, &location);
        v11 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
        if (v11)
        {
          *(_QWORD *)(v10 + 64) = v11;
          v12 = objc_alloc(MEMORY[0x24BE3F298]);
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
          v18 = (void *)MEMORY[0x227676638](v17);
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
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@_startDiscoveringAccessories: Setting MR discovery mode to %ld and adding all supported output devices to the browser", v46, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v22 = (const void *)MRAVRoutingDiscoverySessionCopyAvailableOutputDevices();
          if (v22)
          {
            v23 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Adding initially available output devices: %@", v46, 0x16u);

            }
            objc_autoreleasePoolPop(v23);
            -[HMDMediaBrowser _handleAvailableOutputDevices:](v24, (uint64_t)v22);
            CFRelease(v22);
          }
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = (id)v10;
          HMFGetOSLogHandle();
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v46 = 138543362;
            v47 = v31;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to register callback for unassociated accessory discovery", v46, 0xCu);

          }
          objc_autoreleasePoolPop(v28);
        }
        objc_destroyWeak(v53);
        objc_destroyWeak(&location);
        v10 = *(_QWORD *)(a1 + 32);
      }
      v32 = (void *)MEMORY[0x24BDBCEB8];
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
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Bypassing local discovery of unassociated accessories", (uint8_t *)&buf, 0xCu);

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
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__HMDMediaBrowser_checkForUpdatedAvailableOutputDevices___block_invoke;
    block[3] = &unk_24E79C240;
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

void __52__HMDMediaBrowser_discovery_didLoseAccessory_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "airPlayDeviceUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rawDiscoveryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v3;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@HAP2BonjourBrowser did lose accessory : %@ -> %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(void **)(v10 + 80);
  else
    v11 = 0;
  v12 = objc_msgSend(v11, "containsObject:", v3);
  if (v4)
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      v14 = *(void **)(v13 + 80);
    else
      v14 = 0;
    v15 = objc_msgSend(v14, "containsObject:", v4);
  }
  else
  {
    v15 = 0;
  }
  if (v12)
    v16 = v3;
  else
    v16 = v4;
  if ((v12 | v15) == 1)
  {
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v22;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of lost accessory : %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(v18, "browser:didLoseAssociatedMediaAccessory:error:", *(_QWORD *)(a1 + 40), v17, *(_QWORD *)(a1 + 48));
    }

  }
}

void __50__HMDMediaBrowser_discovery_didDiscoverAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "airPlayDeviceUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rawDiscoveryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v3;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@HAP2BonjourBrowser did discover accessory : %@ -> %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(void **)(v10 + 80);
  else
    v11 = 0;
  v12 = objc_msgSend(v11, "containsObject:", v3);
  if (v4)
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      v14 = *(void **)(v13 + 80);
    else
      v14 = 0;
    v15 = objc_msgSend(v14, "containsObject:", v4);
  }
  else
  {
    v15 = 0;
  }
  if (v12)
    v16 = v3;
  else
    v16 = v4;
  if ((v12 | v15) == 1)
  {
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v22;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegates of found accessory : %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(v18, "browser:didFindAssociatedMediaAccessory:", *(_QWORD *)(a1 + 40), v17);
    }

  }
}

void __65__HMDMediaBrowser_stopDiscoveringAssociatedAccessoriesViaBonjour__block_invoke(uint64_t a1)
{
  -[HMDMediaBrowser _stopDiscoveringAssociatedAccessoriesViaBonjour](*(void **)(a1 + 32));
}

void __66__HMDMediaBrowser_startDiscoveringAssociatedAccessoriesViaBonjour__block_invoke(uint64_t a1)
{
  -[HMDMediaBrowser _startDiscoveringAssociatedAccessoriesViaBonjour](*(id **)(a1 + 32));
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
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)objc_opt_class(), "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), a1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_24E79DB48;
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
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", Count);
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
  if (logCategory__hmf_once_t43_235577 != -1)
    dispatch_once(&logCategory__hmf_once_t43_235577, &__block_literal_global_235578);
  return (id)logCategory__hmf_once_v44_235579;
}

void __30__HMDMediaBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v44_235579;
  logCategory__hmf_once_v44_235579 = v0;

}

@end
