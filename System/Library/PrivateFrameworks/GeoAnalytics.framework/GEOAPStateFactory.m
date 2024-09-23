@implementation GEOAPStateFactory

+ (id)sharedFactory
{
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  return (id)qword_2543169A8;
}

void __34__GEOAPStateFactory_sharedFactory__block_invoke()
{
  GEOAPStateFactory *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAPStateFactory);
  v1 = (void *)qword_2543169A8;
  qword_2543169A8 = (uint64_t)v0;

}

- (GEOAPStateFactory)init
{
  GEOAPStateFactory *v2;
  uint64_t v3;
  OS_dispatch_queue *isolationQueue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOLogMsgState *deviceIdentifierState;
  uint64_t v12;
  GEOLogMsgState *deviceIdentifierInternalState;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  GEOLogMsgState *applicationIdentifierState;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *countryCode;
  NSNumber *offlineSearchODSVersion;
  NSNumber *offlineDirectionsODSVersion;
  id v32;
  void *v33;
  void *v34;
  objc_super v36;
  _QWORD v37[4];
  id v38;

  v36.receiver = self;
  v36.super_class = (Class)GEOAPStateFactory;
  v2 = -[GEOAPStateFactory init](&v36, sel_init);
  if (v2)
  {
    geo_dispatch_queue_create_with_qos();
    v3 = objc_claimAutoreleasedReturnValue();
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    createDeviceIdentifierInternalState();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "osAndBuildVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceOsVersion:", v7);

    objc_msgSend(v5, "hardwareIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceHwIdentifier:", v9);

    deviceIdentifierState = v2->_deviceIdentifierState;
    v2->_deviceIdentifierState = (GEOLogMsgState *)v6;

    createDeviceIdentifierInternalState();
    v12 = objc_claimAutoreleasedReturnValue();
    deviceIdentifierInternalState = v2->_deviceIdentifierInternalState;
    v2->_deviceIdentifierInternalState = (GEOLogMsgState *)v12;

    v14 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v14, "setStateType:", 301);
    v15 = objc_alloc_init(MEMORY[0x24BE3CDF8]);
    objc_msgSend(v14, "setApplicationIdentifier:", v15);

    GEOApplicationIdentifierOrProcessName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applicationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAppIdentifier:", v16);

    objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v18, "isInternalInstall");

    if ((_DWORD)v17)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applicationIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProcessName:", v20);

    }
    objc_msgSend(v14, "applicationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __createApplicationIdentifierState_block_invoke;
    v37[3] = &unk_250DC0638;
    v24 = v14;
    v38 = v24;
    +[GEOAPUtils appTypeForAppId:resultBlock:](GEOAPUtils, "appTypeForAppId:resultBlock:", v23, v37);

    applicationIdentifierState = v2->_applicationIdentifierState;
    v2->_applicationIdentifierState = (GEOLogMsgState *)v24;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel_deviceCountryChanged_, *MEMORY[0x24BE3C9E0], 0);

    objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "countryCode");
    v28 = objc_claimAutoreleasedReturnValue();
    countryCode = v2->_countryCode;
    v2->_countryCode = (NSString *)v28;

    offlineSearchODSVersion = v2->_offlineSearchODSVersion;
    v2->_offlineSearchODSVersion = 0;

    offlineDirectionsODSVersion = v2->_offlineDirectionsODSVersion;
    v2->_offlineDirectionsODSVersion = 0;

    v32 = objc_alloc(MEMORY[0x24BDD17C8]);
    v33 = (void *)objc_msgSend(v32, "initWithUTF8String:", *MEMORY[0x24BE3CAA0]);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel_offlineDataActiceVersionChanged_, v33, 0);

    -[GEOAPStateFactory _updateOfflineVersionInfo](v2, "_updateOfflineVersionInfo");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEOAPStateFactory;
  -[GEOAPStateFactory dealloc](&v4, sel_dealloc);
}

- (void)_updateOfflineVersionInfo
{
  void *v3;
  OS_dispatch_queue *isolationQueue;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BE3CFA8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke;
  v5[3] = &unk_250DC04A8;
  v5[4] = self;
  objc_msgSend(v3, "getOfflineVersionMetadataWithCallbackQueue:callback:", isolationQueue, v5);

}

uint64_t __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke_2;
  v3[3] = &unk_250DC0480;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateLayerVersions:", v3);
}

void __46__GEOAPStateFactory__updateOfflineVersionInfo__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2 == 7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

  }
  else if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

  }
}

- (id)deviceIdentifier
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (id)deviceIndentifierInternal
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (id)deviceIdentifierHardwareClass
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy");
    objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hardwareClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceHwIdentifier:", v3);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)applicationIdentifier
{
  if (a1)
    a1 = (id *)a1[4];
  return a1;
}

- (id)deviceLocaleLimited
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 402);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE20]);
    objc_msgSend(v1, "setDeviceLocale:", v2);

    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceSettingsLocale:", v4);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceLocale
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    -[GEOAPStateFactory deviceLocaleLimited](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceInputLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceInputLocale:", v3);

    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceOutputLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceOutputLocale:", v6);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceConnectionLimited
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 403);
    v3 = objc_alloc_init(MEMORY[0x24BE3CE10]);
    objc_msgSend(v2, "setDeviceConnection:", v3);

    objc_msgSend(a1, "countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceCountryCode:", v4);

    objc_msgSend(MEMORY[0x24BE3CF90], "sharedNetworkObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isNetworkReachable") & 1) != 0)
    {
      if (objc_msgSend(v6, "isWiFiConnection"))
      {
        objc_msgSend(v2, "deviceConnection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 3;
      }
      else
      {
        v10 = objc_msgSend(v6, "isCellConnection");
        objc_msgSend(v2, "deviceConnection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v10)
          v9 = 2;
        else
          v9 = 0;
      }
    }
    else
    {
      objc_msgSend(v2, "deviceConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
    }
    objc_msgSend(v7, "setDeviceNetworkConnectivity:", v9);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)deviceConnection
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    -[GEOAPStateFactory deviceConnectionLimited](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCellularDataState:", 4);

    objc_msgSend(v1, "deviceConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceCarrierName:", 0);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceSettings_DailySettings
{
  id v1;
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 407);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE28]);
    objc_msgSend(v1, "setDeviceSettings:", v2);

    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasDeviceInDarkMode");

    if (v4)
    {
      +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "deviceInDarkMode");
      objc_msgSend(v1, "deviceSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDeviceDarkMode:", v6);

    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceSettings_Min
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 407);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE28]);
    objc_msgSend(v1, "setDeviceSettings:", v2);

    objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsAdvancedMap");
    objc_msgSend(v1, "deviceSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportsAdvancedMap:", v4);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)deviceSettings_Short
{
  if (a1)
  {
    -[GEOAPStateFactory deviceSettings_Min]((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)deviceSettings_Long
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a1)
  {
    -[GEOAPStateFactory deviceSettings_Min](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEONanoInfo sharedInfo](GEONanoInfo, "sharedInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasDeviceInDarkMode");

    if (v4)
    {
      +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "deviceInDarkMode");
      objc_msgSend(v1, "deviceSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDeviceDarkMode:", v6);

    }
    objc_msgSend(v2, "hasPairedDeviceIfAvailable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "BOOLValue"))
    {
      objc_msgSend(v2, "deviceIsAltAcctIfAvailable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");
      objc_msgSend(v1, "deviceSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIsAltAccountPairedDevice:", v11);

    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)carPlayLimited
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 404);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE00]);
    objc_msgSend(v1, "setCarPlay:", v2);

    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasCarPlayInfo");
    objc_msgSend(v1, "carPlay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsConnected:", v4);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)carPlay
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    -[GEOAPStateFactory carPlayLimited](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "carPlayInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "carPlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCarInfo:", v3);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)pairedDevice
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    +[GEONanoInfo sharedInfo](GEONanoInfo, "sharedInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "hasPairedDeviceIfAvailable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 && objc_msgSend(v2, "BOOLValue"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v4, "setStateType:", 405);
      v5 = objc_alloc_init(MEMORY[0x24BE3CED0]);
      objc_msgSend(v4, "setPairedDevice:", v5);

      objc_msgSend(v4, "pairedDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setType:", 1);

      v7 = objc_alloc_init(MEMORY[0x24BE3CE18]);
      objc_msgSend(v4, "pairedDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPairedDeviceIdentifier:", v7);

      objc_msgSend(v1, "deviceOsVersionIfAvailable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairedDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pairedDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDeviceOsVersion:", v9);

      objc_msgSend(v1, "deviceProductType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairedDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pairedDeviceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDeviceHwIdentifier:", v12);

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)pairedDeviceLong
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  if (a1)
  {
    +[GEONanoInfo sharedInfo](GEONanoInfo, "sharedInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "hasPairedDeviceIfAvailable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 && objc_msgSend(v2, "BOOLValue"))
    {
      v4 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v4, "setStateType:", 405);
      v5 = objc_alloc_init(MEMORY[0x24BE3CED0]);
      objc_msgSend(v4, "setPairedDevice:", v5);

      objc_msgSend(v4, "pairedDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setType:", 1);

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)extension
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 406);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE40]);
    objc_msgSend(v1, "setExtension:", v2);

    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasTableBookingAppInstalled"))
    {
      v4 = objc_msgSend(v3, "tableBookingAppInstalled");
      objc_msgSend(v1, "extension");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHasTableBookingAppInstalled:", v4);

      if (objc_msgSend(v3, "hasTableBookingAppEnabled"))
      {
        v6 = objc_msgSend(v3, "tableBookingAppEnabled");
        objc_msgSend(v1, "extension");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHasTableBookingAppEnabled:", v6);

      }
    }
    if (objc_msgSend(v3, "hasRideBookingAppInstalled"))
    {
      v8 = objc_msgSend(v3, "rideBookingAppInstalled");
      objc_msgSend(v1, "extension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHasRideBookingAppInstalled:", v8);

      if (objc_msgSend(v3, "hasRideBookingAppEnabled"))
      {
        v10 = objc_msgSend(v3, "rideBookingAppEnabled");
        objc_msgSend(v1, "extension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setHasRideBookingAppEnabled:", v10);

      }
    }

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)mapView
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  if (!a1)
    return 0;
  v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v1, "setStateType:", 501);
  v2 = objc_alloc_init(MEMORY[0x24BE3CE80]);
  objc_msgSend(v1, "setMapView:", v2);

  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__GEOAPStateFactory_mapView__block_invoke;
  v9[3] = &unk_250DC04D0;
  v10 = v3;
  v4 = v1;
  v11 = v4;
  v5 = v3;
  objc_msgSend(v5, "performMapViewStateUpdate:", v9);
  v6 = v11;
  v7 = v4;

  return v7;
}

void __28__GEOAPStateFactory_mapView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewMapType"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapViewMapType");
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMapType:", v2);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewViewMode"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "mapViewViewMode");
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setViewMode:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewZoomLevel"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapViewZoomLevel");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setZoomLevel:", v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewStyleZoomLevel"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapViewStyleZoomLevel");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStyleZoomLevel:", v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewIsAdvancedMap"))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "mapViewIsAdvancedMap");
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIsAdvancedMap:", v12);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewIsGlobeProjection"))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "mapViewIsGlobeProjection");
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsGlobeProjection:", v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "mapViewMapRegion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mapView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMapRegion:", v16);

  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewPitch"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapViewPitch");
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 40), "mapView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPitch:", v19);

  }
}

- (id)mapViewLocation
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  if (!a1)
    return 0;
  v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v1, "setStateType:", 502);
  v2 = objc_alloc_init(MEMORY[0x24BE3CE88]);
  objc_msgSend(v1, "setMapViewLocation:", v2);

  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__GEOAPStateFactory_mapViewLocation__block_invoke;
  v9[3] = &unk_250DC04D0;
  v10 = v3;
  v4 = v1;
  v11 = v4;
  v5 = v3;
  objc_msgSend(v5, "performMapViewStateUpdate:", v9);
  v6 = v11;
  v7 = v4;

  return v7;
}

void __36__GEOAPStateFactory_mapViewLocation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewLocationPuckInViewport"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "mapViewLocationPuckInViewport");
    objc_msgSend(*(id *)(a1 + 40), "mapViewLocation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsCurrentLocationInViewport:", v2);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasMapViewLocationIsTourist"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE3D0A0]);
    objc_msgSend(*(id *)(a1 + 40), "mapViewLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTouristInfo:", v4);

    v6 = objc_msgSend(*(id *)(a1 + 32), "mapViewLocationIsTourist");
    objc_msgSend(*(id *)(a1 + 40), "mapViewLocation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "touristInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsTourist:", v6);

  }
}

- (id)mapSettingsDetailed
{
  id v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 504);
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stateMapSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setMapSettings:", v3);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)mapSettings
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    -[GEOAPStateFactory mapSettingsDetailed](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mapSettings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHasWalkingAvoidHills:", 0);

    objc_msgSend(v1, "mapSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHasWalkingAvoidBusyRoads:", 0);

    objc_msgSend(v1, "mapSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasWalkingAvoidStairs:", 0);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)mapSettingsShort
{
  id v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 504);
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stateMapSettingsShort");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setMapSettings:", v3);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)mapUI
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 505);
    v2 = objc_alloc_init(MEMORY[0x24BE3CE70]);
    objc_msgSend(v1, "setMapUi:", v2);

    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasMapUiLayoutInfo"))
    {
      v4 = objc_msgSend(v3, "layoutInfoAsGEOLayoutInfo");
      objc_msgSend(v1, "mapUi");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLayoutInfo:", v4);

    }
    if (objc_msgSend(v3, "hasMapUiLayoutStyle"))
    {
      v6 = objc_msgSend(v3, "layoutStyleAsGEOLayoutStyle");
      objc_msgSend(v1, "mapUi");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLayoutStyle:", v6);

    }
    if (objc_msgSend(v3, "hasMapUiNumberOfMapsWindows"))
    {
      if (objc_msgSend(v3, "mapUiNumberOfMapsWindows") > 3)
        v8 = 3;
      else
        v8 = objc_msgSend(v3, "mapUiNumberOfMapsWindows");
      objc_msgSend(v1, "mapUi");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNumberOfMapsWindows:", v8);

    }
    if (objc_msgSend(v3, "hasWindowSize"))
    {
      switch(objc_msgSend(v3, "windowSize"))
      {
        case 0u:
          objc_msgSend(v1, "mapUi");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v12 = 1;
          goto LABEL_17;
        case 1u:
          objc_msgSend(v1, "mapUi");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v12 = 2;
          goto LABEL_17;
        case 2u:
          objc_msgSend(v1, "mapUi");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v12 = 3;
          goto LABEL_17;
        case 3u:
          objc_msgSend(v1, "mapUi");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          v12 = 4;
LABEL_17:
          objc_msgSend(v10, "setWindowSize:", v12);

          break;
        default:
          break;
      }
    }
    if (objc_msgSend(v3, "hasLandscape"))
    {
      v13 = objc_msgSend(v3, "landscape");
      objc_msgSend(v1, "mapUi");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLandscape:", v13);

    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)mapUIShown
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v2, "setStateType:", 506);
  v3 = objc_alloc_init(MEMORY[0x24BE3CE78]);
  objc_msgSend(v2, "setMapUiShown:", v3);

  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mapUiShownAqiShown");
  objc_msgSend(v2, "mapUiShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAirQualityShown:", v5);

  v7 = objc_msgSend(v4, "mapUiShownWeatherShown");
  objc_msgSend(v2, "mapUiShown");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsWeatherShown:", v7);

  v9 = objc_msgSend(v4, "venueExperienceShown");
  objc_msgSend(v2, "mapUiShown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsVenueExperienceShown:", v9);

  v11 = objc_msgSend(v4, "activeNavModeAsGEOTransportType");
  objc_msgSend(v2, "mapUiShown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActiveNavMode:", v11);

  if (objc_msgSend(v4, "hasLookAroundEntryIconShown"))
  {
    v13 = objc_msgSend(v4, "lookAroundEntryIconShown");
    objc_msgSend(v2, "mapUiShown");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsLookAroundEntryIconShown:", v13);

  }
  return v2;
}

- (id)searchResults
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v2, "setStateType:", 8);
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchResults:", v4);

  return v2;
}

- (id)mapsPlaceIds
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v2, "setStateType:", 729);
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapsPlaceIdsState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMapsPlaceIds:", v4);

  return v2;
}

- (id)impressionObject
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
  objc_msgSend(v2, "setStateType:", 10);
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateImpressionObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImpressionObject:", v4);

  return v2;
}

- (id)experimentsIncludingClientConfig:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (a1)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v3, "setStateType:", 602);
    v4 = objc_alloc_init(MEMORY[0x24BE3CE38]);
    objc_msgSend(v3, "setExperiments:", v4);

    if (a2)
    {
      objc_msgSend(MEMORY[0x24BE3CBD8], "sharedConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "experiments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClientAbExperimentAssignment:", v6);

    }
    v8 = objc_alloc_init(MEMORY[0x24BE3CFB8]);
    objc_msgSend(v3, "experiments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDatasetAbStatus:", v8);

    objc_msgSend(MEMORY[0x24BE3CBD8], "sharedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "experimentsInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapsAbClientMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientDatasetMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "datasetId");
    objc_msgSend(v3, "experiments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "datasetAbStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDatasetId:", v14);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)placeCard
{
  void *v1;
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!a1)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__GEOAPStateFactory_placeCard__block_invoke;
  v5[3] = &unk_250DC04F8;
  v2 = v1;
  v6 = v2;
  v7 = &v8;
  objc_msgSend(v2, "performPlaceCardStateUpdate:", v5);
  v3 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v3;
}

void __30__GEOAPStateFactory_placeCard__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
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
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardStateData") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardState"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 702);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardState"))
    {
      objc_msgSend(*(id *)(a1 + 32), "placeCardState");
      v105 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v105, "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPlaceCard:", v5);

LABEL_68:
      return;
    }
    v6 = objc_alloc_init(MEMORY[0x24BE3CED8]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPlaceCard:", v6);

    if (objc_msgSend(*(id *)(a1 + 32), "placeCardPossibleActionsCount")
      && objc_msgSend(*(id *)(a1 + 32), "placeCardPossibleActionsCount"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPossibleAction:", *(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "placeCardPossibleActions") + 4 * v7));

        ++v7;
      }
      while (v7 < objc_msgSend(*(id *)(a1 + 32), "placeCardPossibleActionsCount"));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "placeCardUnactionableUiElementsCount")
      && objc_msgSend(*(id *)(a1 + 32), "placeCardUnactionableUiElementsCount"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addUnactionableUiElement:", *(unsigned int *)(objc_msgSend(*(id *)(a1 + 32), "placeCardUnactionableUiElements") + 4 * v9));

        ++v9;
      }
      while (v9 < objc_msgSend(*(id *)(a1 + 32), "placeCardUnactionableUiElementsCount"));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceCardType"))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceCardType");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPlacecardType:", v11);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceCardCategory"))
    {
      objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceCardCategory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPlacecardCategory:", v13);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardTransitAdvisoryBanner"))
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "placeCardTransitAdvisoryBanner");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTransitAdvisoryBanner:", v15);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails"))
    {
      v17 = objc_alloc_init(MEMORY[0x24BE3CFC0]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPlaceActionDetails:", v17);

      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsActionUrl"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsActionUrl");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "placeActionDetails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActionUrl:", v19);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsAnimationId"))
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsAnimationId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "placeActionDetails");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAnimationID:", v22);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsBusinessId"))
      {
        v25 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsBusinessId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "placeActionDetails");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setBusinessID:", v25);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsDestinationApp"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsDestinationApp");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "placeActionDetails");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setDestinationApp:", v28);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsPhotoId"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsPhotoId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "placeActionDetails");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setPhotoId:", v31);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsPlaceId"))
      {
        v34 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsPlaceId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "placeActionDetails");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPlaceID:", v34);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsRichProviderId"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsRichProviderId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "placeActionDetails");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setRichProviderId:", v37);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsSearchResponseRelativeTimestamp");
        v41 = v40;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "placeActionDetails");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setSearchResponseRelativeTimestamp:", v41);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTargetId"))
      {
        v44 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTargetId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "placeActionDetails");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setTargetID:", v44);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsLocalSearchProviderId"))
      {
        v47 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsLocalSearchProviderId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "placeActionDetails");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setLocalSearchProviderID:", v47);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsResultIndex"))
      {
        v50 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsResultIndex");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "placeActionDetails");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setResultIndex:", v50);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsShowcaseId"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsShowcaseId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "placeActionDetails");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setShowcaseId:", v53);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails_TransitPlaceCard"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "placeActionDetails");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
        v58 = objc_alloc_init(MEMORY[0x24BE3CFC0]);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setPlaceActionDetails:", v58);

      }
      v60 = objc_alloc_init(MEMORY[0x24BE3D0B8]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "placeActionDetails");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setTransitPlaceCard:", v60);

      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTransitPlaceCardIncidentType");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "placeActionDetails");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "transitPlaceCard");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setIncidentType:", v63);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "placeActionDetails");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "transitPlaceCard");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setTransitSystemName:", v67);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCard_PlaceActionDetails_TransitPlaceCard_TransitDepartureSequence"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "placeActionDetails");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
      {
        v73 = objc_alloc_init(MEMORY[0x24BE3CFC0]);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setPlaceActionDetails:", v73);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "placeActionDetails");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "transitPlaceCard");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
      {
        v78 = objc_alloc_init(MEMORY[0x24BE3D0B8]);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "placeActionDetails");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setTransitPlaceCard:", v78);

      }
      v81 = objc_alloc_init(MEMORY[0x24BE3D0B0]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "placeActionDetails");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "transitPlaceCard");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setTransitDepartureSequenceUsage:", v81);

      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId"))
      {
        v85 = objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "placeActionDetails");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "transitPlaceCard");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "transitDepartureSequenceUsage");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setLineId:", v85);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "placeActionDetails");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "transitPlaceCard");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "transitDepartureSequenceUsage");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setHeadsign:", v90);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection"))
      {
        objc_msgSend(*(id *)(a1 + 32), "placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "placeActionDetails");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "transitPlaceCard");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "transitDepartureSequenceUsage");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setDirection:", v95);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardIsPersonPlacecard"))
    {
      v100 = objc_msgSend(*(id *)(a1 + 32), "placeCardIsPersonPlacecard");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setIsPersonPlacecard:", v100);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardIsPersonAddressAvailable"))
    {
      v102 = objc_msgSend(*(id *)(a1 + 32), "placeCardIsPersonAddressAvailable");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setIsPersonAddressAvailable:", v102);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardIsPersonLocationShared"))
    {
      v104 = objc_msgSend(*(id *)(a1 + 32), "placeCardIsPersonLocationShared");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
      v105 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setIsPersonLocationShared:", v104);
      goto LABEL_68;
    }
  }
}

- (id)placeCardReveal
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  -[GEOAPStateFactory placeCard]((uint64_t)self);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__GEOAPStateFactory_placeCardReveal__block_invoke;
  v6[3] = &unk_250DC04F8;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performPlaceCardStateUpdate:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __36__GEOAPStateFactory_placeCardReveal__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "placeCardRevealedPlaceCardModules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v4 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v4, "setStateType:", 702);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
    objc_msgSend(*(id *)(a1 + 32), "placeCardRevealedPlaceCardModules");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "placeCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRevealedModules:", v7);

  }
}

- (id)placeCardRap
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  GEOAPStateFactory *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__GEOAPStateFactory_placeCardRap__block_invoke;
  v7[3] = &unk_250DC0520;
  v4 = v3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  objc_msgSend(v4, "performPlaceCardStateUpdate:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __33__GEOAPStateFactory_placeCardRap__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardStateData") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardState"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 702);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = objc_alloc_init(MEMORY[0x24BE3CED8]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPlaceCard:", v5);

    if (objc_msgSend(*(id *)(a1 + 32), "hasPlaceCardState"))
    {
      objc_msgSend(*(id *)(a1 + 32), "placeCardState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasPlacecardType");

      if (v7)
      {
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "placeCardState");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_rapPlaceCardTypeForRawType:", objc_msgSend(v11, "placecardType"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "placeCard");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPlacecardType:", v9);

      }
    }
  }
}

- (int)_rapPlaceCardTypeForRawType:(int)a3
{
  if ((a3 - 1) > 0x10)
    return 0;
  else
    return dword_23CC480E8[a3 - 1];
}

- (id)tapEvent
{
  void *v1;
  id v2;
  void *v3;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasTapEventState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 11);
      objc_msgSend(v1, "tapEventState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setTapEvent:", v3);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)actionButtonDetails
{
  void *v1;
  void *v2;
  id v3;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "actionButtonDetailsState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v3, "setStateType:", 12);
      objc_msgSend(v3, "setActionButtonDetails:", v2);
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)route
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasRouteRouteDetails"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 703);
      v3 = objc_alloc_init(MEMORY[0x24BE3CEF0]);
      objc_msgSend(v2, "setRoute:", v3);

      objc_msgSend(v1, "routeRouteDetails");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "route");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRouteDetails:", v4);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)mapsServer
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasMapsServerData"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 705);
    v3 = objc_alloc_init(MEMORY[0x24BE3CEA0]);
    objc_msgSend(v2, "setMapsServer:", v3);

    if (objc_msgSend(v1, "hasMapsServerMetadata"))
    {
      objc_msgSend(v1, "mapsServerMetadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "mapsServer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setServerMetadata:", v4);

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x24BE3CF78]);
      objc_msgSend(v2, "mapsServer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setServerMetadata:", v6);

      objc_msgSend(v1, "mapsServerMetadataSuggestionEntryTappedOn");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "mapsServer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serverMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSuggestionEntryMetadataTappedOn:", v8);

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v1, "mapsServerMetadataSuggestionEntryDisplayeds", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v4);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
            objc_msgSend(v2, "mapsServer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "serverMetadata");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addSuggestionEntryMetadataDisplayed:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)tileSet
{
  id v1;
  id v2;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 706);
    v2 = objc_alloc_init(MEMORY[0x24BE3CF28]);
    objc_msgSend(v1, "setTileSet:", v2);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)lookAroundSummary
{
  void *v1;
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasLookaroundSessionStartTime")
      && objc_msgSend(v1, "hasLookaroundSessionEndTime"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 714);
      v3 = objc_alloc_init(MEMORY[0x24BE3CF18]);
      objc_msgSend(v2, "setSummaryLookAroundLog:", v3);

      objc_msgSend(v1, "lookaroundSessionEndTime");
      v5 = v4;
      objc_msgSend(v1, "lookaroundSessionStartTime");
      v7 = (v5 - v6);
      if (v7 <= 0x257)
      {
        if (v7 < 0xB4)
        {
          if (v7 >= 0x3C)
            v7 = (v5 - v6) - (v5 - v6) % 0xAu;
        }
        else
        {
          v7 = 60 * vcvtps_u32_f32((float)v7 / 60.0);
        }
      }
      else
      {
        v7 = 600;
      }
      objc_msgSend(v2, "summaryLookAroundLog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDurationSec:", v7);

      v9 = objc_msgSend(v1, "lookaroundSessionHadPanAction");
      objc_msgSend(v2, "summaryLookAroundLog");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHadPanActions:", v9);

      v11 = objc_msgSend(v1, "lookaroundSessionHadMoveAction");
      objc_msgSend(v2, "summaryLookAroundLog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHadMoveActions:", v11);

      v13 = objc_msgSend(v1, "lookaroundSessionHadZoomAction");
      objc_msgSend(v2, "summaryLookAroundLog");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHadZoomActions:", v13);

      v15 = objc_msgSend(v1, "lookaroundSessionHadTapPoiAction");
      objc_msgSend(v2, "summaryLookAroundLog");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHadPoiTapActions:", v15);

      v17 = objc_msgSend(v1, "lookaroundSessionHadShareAction");
      objc_msgSend(v2, "summaryLookAroundLog");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHadShareActions:", v17);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)lookAroundView
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasLookAroundLocation"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 716);
      v3 = objc_alloc_init(MEMORY[0x24BE3CE50]);
      objc_msgSend(v2, "setLookAroundView:", v3);

      objc_msgSend(v1, "lookAroundLocation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "lookAroundView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocation:", v4);

      v6 = objc_msgSend(v1, "lookAroundHeading");
      objc_msgSend(v2, "lookAroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHeading:", v6);

      objc_msgSend(v1, "lookAroundZoom");
      v9 = v8;
      objc_msgSend(v2, "lookAroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setZoomLevel:", v9);

      v11 = objc_msgSend(v1, "lookAroundNumberPoisInView");
      objc_msgSend(v2, "lookAroundView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNumberPoisInView:", v11);

      v13 = objc_msgSend(v1, "lookAroundIsLabelingShown");
      objc_msgSend(v2, "lookAroundView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIsLabelingShown:", v13);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)muninResourceLog
{
  id v1;
  id v2;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 717);
    v2 = objc_alloc_init(MEMORY[0x24BE3CEB8]);
    objc_msgSend(v1, "setMuninResource:", v2);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)suggestions
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasSuggestionsData"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 710);
    v3 = objc_alloc_init(MEMORY[0x24BE3CF10]);
    objc_msgSend(v2, "setSuggestions:", v3);

    if (objc_msgSend(v1, "hasSuggestionsSearchString"))
    {
      objc_msgSend(v1, "suggestionsSearchString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "suggestions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSearchString:", v4);

    }
    if (objc_msgSend(v1, "hasSuggestionsAcSequenceNumber"))
    {
      v6 = objc_msgSend(v1, "suggestionsAcSequenceNumber");
      objc_msgSend(v2, "suggestions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAcSequenceNumber:", v6);

    }
    if (objc_msgSend(v1, "hasSuggestionsSelectedIndex"))
    {
      v8 = objc_msgSend(v1, "suggestionsSelectedIndex");
      objc_msgSend(v2, "suggestions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSelectedIndex:", v8);

    }
    if (objc_msgSend(v1, "hasSuggestionsSearchFieldType"))
    {
      v10 = objc_msgSend(v1, "suggestionsSearchFieldType");
      objc_msgSend(v2, "suggestions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSearchFieldType:", v10);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v1, "suggestionsDisplayedResults", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
          objc_msgSend(v2, "suggestions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addDisplayedResult:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)mapRestore
{
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasMapRestoreData"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 709);
      v3 = objc_alloc_init(MEMORY[0x24BE3CE60]);
      objc_msgSend(v2, "setMapRestore:", v3);

      v4 = objc_alloc_init(MEMORY[0x24BE3D070]);
      if (objc_msgSend(v1, "hasRestoreUiTarget"))
        objc_msgSend(v4, "setUiTarget:", objc_msgSend(v1, "restoreUiTarget"));
      if (objc_msgSend(v1, "hasRestoreLayoutStyle"))
        objc_msgSend(v4, "setLayoutStyle:", objc_msgSend(v1, "restoreLayoutStyle"));
      if (objc_msgSend(v1, "hasRestoreLayoutInfo"))
        objc_msgSend(v4, "setLayoutInfo:", objc_msgSend(v1, "restoreLayoutInfo"));
      objc_msgSend(v2, "mapRestore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addTargetLayout:", v4);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)curatedCollection
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasCuratedCollectionState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 719);
      objc_msgSend(v1, "curatedCollectionState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v2, "setCuratedCollection:", v4);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)curatedCollectionRedacted
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasCuratedCollectionState"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v3, "setStateType:", 719);
    objc_msgSend(v2, "curatedCollectionState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setCuratedCollection:", v5);

    objc_msgSend(v3, "curatedCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearCollectionIds");

    objc_msgSend(v3, "curatedCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publisherDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearPublisherIds");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)ugc
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasUgcPhotoState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 720);
      objc_msgSend(v1, "ugcPhotoState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v2, "setUgcPhoto:", v4);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int)_privacyAllowedActionFromActualAction:(int)a3
{
  if ((a3 - 2) > 0x23)
    return 0;
  else
    return dword_23CC4812C[a3 - 2];
}

- (int)_launchActionFromAPLaunchAction:(int)a3
{
  if ((a3 - 1) >= 0x28)
    return 0;
  else
    return a3;
}

- (id)mapLaunch
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasMapLaunchData"))
    {
      v3 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v3, "setStateType:", 718);
      v4 = objc_alloc_init(MEMORY[0x24BE3CE58]);
      objc_msgSend(v3, "setMapLaunch:", v4);

      if (objc_msgSend(v2, "hasMapLaunchSourceAppId"))
      {
        objc_msgSend(v2, "mapLaunchSourceAppId");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "mapLaunch");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSourceAppId:", v5);

      }
      if (objc_msgSend(v2, "hasMapLaunchLaunchUri"))
      {
        objc_msgSend(v2, "mapLaunchLaunchUri");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "mapLaunch");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLaunchUri:", v7);

      }
      if (objc_msgSend(v2, "hasMapLaunchReferringWebsite"))
      {
        objc_msgSend(v2, "mapLaunchReferringWebsite");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "mapLaunch");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setReferringWebsite:", v9);

      }
      if (objc_msgSend(v2, "hasMapLaunchIsHandoff"))
      {
        v11 = objc_msgSend(v2, "mapLaunchIsHandoff");
        objc_msgSend(v3, "mapLaunch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIsHandoff:", v11);

      }
      if (objc_msgSend(v2, "hasMapLaunchSourceHandoffDevice"))
      {
        objc_msgSend(v2, "mapLaunchSourceHandoffDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "mapLaunch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSourceHandoffDevice:", v13);

      }
      if (objc_msgSend(v2, "hasMapLaunchAction"))
      {
        v15 = objc_msgSend(a1, "_launchActionFromAPLaunchAction:", objc_msgSend(v2, "mapLaunchAction"));
        objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isInternalInstall");

        if (v17)
        {
          objc_msgSend(v3, "mapLaunch");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setLaunchActionInternal:", v15);

        }
        v19 = objc_msgSend(a1, "_privacyAllowedActionFromActualAction:", v15);
        objc_msgSend(v3, "mapLaunch");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLaunchAction:", v19);

      }
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)_monthResolution:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", a3);
  objc_msgSend(v5, "components:fromDate:", 12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return v10;
}

- (id)mapsUser
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t BOOL;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v3, "setStateType:", 2);
    v4 = objc_alloc_init(MEMORY[0x24BE3CF40]);
    objc_msgSend(v3, "setUser:", v4);

    objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_getMapsUserStartDate");
    v7 = v6;

    if (v7 != 0.0)
    {
      objc_msgSend(a1, "_monthResolution:", v7);
      v9 = v8;
      objc_msgSend(v3, "user");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBestMapsUseStartDate:", v9);

    }
    if (_GEOConfigHasValue())
    {
      GEOConfigGetDouble();
      objc_msgSend(a1, "_monthResolution:");
      v12 = v11;
      objc_msgSend(v3, "user");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMapsUseStartDate:", v12);

    }
    BOOL = GEOConfigGetBOOL();
    objc_msgSend(v3, "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsSignedInWithDsid:", BOOL);

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __29__GEOAPStateFactory_mapsUser__block_invoke;
    v25[3] = &unk_250DC0548;
    v25[4] = &v32;
    v25[5] = &v26;
    objc_msgSend(v2, "bestUserHomeLocation:", v25);
    v16 = v27[5];
    objc_msgSend(v3, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHomeMetroRegion:", v16);

    v18 = v33[5];
    objc_msgSend(v3, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHomeCountryCode:", v18);

    objc_msgSend(v2, "bestCurrentMetro");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && v27[5])
    {
      v22 = objc_msgSend(v20, "isEqualToString:");
      objc_msgSend(v3, "user");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIsTourist:", v22 ^ 1u);

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __29__GEOAPStateFactory_mapsUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)market
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v2, "setStateType:", 722);
    v3 = objc_alloc_init(MEMORY[0x24BE3CEB0]);
    objc_msgSend(v2, "setMarket:", v3);

    objc_msgSend(v1, "bestCurrentMetro");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "market");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMarket:", v4);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)photoSubmissionDetails
{
  void *v1;
  id v2;
  void *v3;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasPhotoSubmissionDetailsState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 726);
      objc_msgSend(v1, "photoSubmissionDetailsState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setArpPhotoSubmission:", v3);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)ratingSubmissionDetails
{
  void *v1;
  id v2;
  void *v3;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasRatingSubmissionDetailsState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 727);
      objc_msgSend(v1, "ratingSubmissionDetailsState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setArpRatingSubmission:", v3);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)ratingPhotoSubmissionDetails
{
  void *v1;
  id v2;
  void *v3;

  if (a1)
  {
    +[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasRatingPhotoSubmissionDetailsState"))
    {
      v2 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
      objc_msgSend(v2, "setStateType:", 728);
      objc_msgSend(v1, "ratingPhotoSubmissionDetailsState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setArpRatingPhotoSubmission:", v3);

    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)offline
{
  void *v2;
  void *v3;
  __int16 v4;
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v12;
  const char *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE3CFB0], "sharedNoCreate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2)
    {
      v5 = 0;
LABEL_26:

      return v5;
    }
    v4 = objc_msgSend(v2, "state");
    v5 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v5, "setStateType:", 713);
    v6 = objc_alloc_init(MEMORY[0x24BE3CEC8]);
    objc_msgSend(v5, "setOffline:", v6);

    if (v4 >= 3u)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        LODWORD(v28) = 67109120;
        HIDWORD(v28) = v4;
        _os_log_fault_impl(&dword_23CBB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v28, 8u);
      }
      v7 = 0;
    }
    else
    {
      v7 = (v4 & 7) == 2;
    }
    objc_msgSend(v5, "offline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsMapsInOfflineMode:", v7);

    objc_msgSend(v5, "offline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "isMapsInOfflineMode");

    if (!(_DWORD)v8)
      goto LABEL_26;
    if (v4 < 2u)
      goto LABEL_18;
    if (v4 == 2)
    {
      if (HIBYTE(v4) < 3u)
      {
        v10 = (v4 & 0x700) == 512;
LABEL_19:
        objc_msgSend(v5, "offline", v28, v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIsOnlyUseOffline:", v10);

        v15 = objc_msgSend(v3, "offlineRegionCount");
        if (v15 >= 2)
          v16 = 2;
        else
          v16 = v15;
        objc_msgSend(v5, "offline");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setNumberOfDownloadedRegions:", v16);

        objc_msgSend(MEMORY[0x24BE3CF90], "sharedNetworkObserver");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isNetworkReachable");
        objc_msgSend(v5, "offline");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setIsNetworkConnected:", v19);

        v21 = *(void **)(a1 + 48);
        if (v21)
        {
          v22 = objc_msgSend(v21, "unsignedLongLongValue");
          objc_msgSend(v5, "offline");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setSearchOdsVersion:", v22);

        }
        v24 = *(void **)(a1 + 56);
        if (v24)
        {
          v25 = objc_msgSend(v24, "unsignedLongLongValue");
          objc_msgSend(v5, "offline");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setRoutingOdsVersion:", v25);

        }
        goto LABEL_26;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
LABEL_18:
        v10 = 0;
        goto LABEL_19;
      }
      LODWORD(v28) = 67109120;
      HIDWORD(v28) = HIBYTE(v4);
      v12 = MEMORY[0x24BDACB70];
      v13 = "Unreachable reached: invalid offline reason value %x";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_18;
      LODWORD(v28) = 67109120;
      HIDWORD(v28) = v4;
      v12 = MEMORY[0x24BDACB70];
      v13 = "Unreachable reached: invalid offline mode value %x";
    }
    _os_log_fault_impl(&dword_23CBB4000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v28, 8u);
    goto LABEL_18;
  }
  return 0;
}

- (int)logMsgStateTypeForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x46)
    return 0;
  else
    return dword_23CC481BC[a3];
}

- (id)stateForType:(int64_t)a3
{
  void *v4;
  GEOAPStateFactory *v5;
  int v6;
  uint64_t v7;

  v4 = 0;
  switch(a3)
  {
    case 0:
      -[GEOAPStateFactory deviceIdentifier]((id *)&self->super.isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 1:
      -[GEOAPStateFactory deviceIndentifierInternal]((id *)&self->super.isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2:
    case 65:
      -[GEOAPStateFactory applicationIdentifier]((id *)&self->super.isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 3:
      -[GEOAPStateFactory deviceLocale]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 4:
      -[GEOAPStateFactory deviceLocaleLimited]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 5:
      -[GEOAPStateFactory carPlay]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 6:
      -[GEOAPStateFactory carPlayLimited]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 7:
      -[GEOAPStateFactory pairedDevice]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 8:
      -[GEOAPStateFactory extension]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 9:
      -[GEOAPStateFactory mapView]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 10:
      -[GEOAPStateFactory mapViewLocation]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 11:
      -[GEOAPStateFactory mapSettings]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 12:
      -[GEOAPStateFactory mapSettingsDetailed]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 13:
      -[GEOAPStateFactory mapUI]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 14:
      -[GEOAPStateFactory mapUIShown](self, "mapUIShown");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 15:
      v5 = self;
      v6 = 0;
      goto LABEL_19;
    case 16:
      v5 = self;
      v6 = 1;
LABEL_19:
      -[GEOAPStateFactory experimentsIncludingClientConfig:]((uint64_t)v5, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 17:
      -[GEOAPStateFactory placeCard]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 18:
      -[GEOAPStateFactory placeCardReveal](self, "placeCardReveal");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 19:
      -[GEOAPStateFactory route]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 20:
      -[GEOAPStateFactory mapsServer]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 21:
      -[GEOAPStateFactory tileSet]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 24:
      v7 = 503;
      goto LABEL_30;
    case 25:
      v7 = 708;
      goto LABEL_30;
    case 26:
      -[GEOAPStateFactory mapRestore]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 27:
      -[GEOAPStateFactory suggestions]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 28:
      v7 = 712;
LABEL_30:
      createStateWithType(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 29:
      -[GEOAPStateFactory deviceConnection](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 30:
      -[GEOAPStateFactory deviceConnectionLimited](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 31:
      -[GEOAPStateFactory lookAroundSummary]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      -[GEOAPStateFactory lookAroundView]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 33:
      -[GEOAPStateFactory muninResourceLog]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 34:
      -[GEOAPStateFactory deviceSettings_Min]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 35:
      -[GEOAPStateFactory deviceSettings_Short](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 36:
      -[GEOAPStateFactory deviceSettings_Long]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 37:
      -[GEOAPStateFactory deviceSettings_DailySettings]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 38:
      -[GEOAPStateFactory curatedCollection]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 39:
      -[GEOAPStateFactory curatedCollectionRedacted](self, "curatedCollectionRedacted");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 40:
      -[GEOAPStateFactory ugc]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 41:
      -[GEOAPStateFactory mapLaunch](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 42:
      -[GEOAPStateFactory market]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 43:
      -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 48:
      -[GEOAPStateFactory mapsUser](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 49:
      -[GEOAPStateFactory deviceIdentifierHardwareClass]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 54:
      -[GEOAPStateFactory searchResults](self, "searchResults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 56:
      -[GEOAPStateFactory impressionObject](self, "impressionObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 57:
      -[GEOAPStateFactory tapEvent]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 58:
      -[GEOAPStateFactory actionButtonDetails]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 60:
      -[GEOAPStateFactory photoSubmissionDetails]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 61:
      -[GEOAPStateFactory ratingSubmissionDetails]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 62:
      -[GEOAPStateFactory ratingPhotoSubmissionDetails]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 64:
      -[GEOAPStateFactory mapSettingsShort]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 66:
      -[GEOAPStateFactory pairedDeviceLong]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 67:
      -[GEOAPStateFactory placeCardRap](self, "placeCardRap");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 68:
      -[GEOAPStateFactory mapsPlaceIds](self, "mapsPlaceIds");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 70:
      -[GEOAPStateFactory offline]((uint64_t)self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_emptyUserSessionState
{
  id v1;
  id v2;

  if (a1)
  {
    v1 = objc_alloc_init(MEMORY[0x24BE3CDC8]);
    objc_msgSend(v1, "setStateType:", 601);
    v2 = objc_alloc_init(MEMORY[0x24BE3CF48]);
    objc_msgSend(v1, "setUserSession:", v2);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (void)sessionStateForType:(int)a3 callback:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v6 = (void (**)(id, void *, _QWORD))a4;
  -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = 0;
  v10 = v7;
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 19:
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_4;
      v13[3] = &unk_250DC05E8;
      v12 = v13;
      v13[4] = v7;
      v13[5] = &v17;
      objc_msgSend(v11, "fifteenMonthDeviceSessionValues:", v13);
      goto LABEL_6;
    case 5:
      objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke;
      v16[3] = &unk_250DC0570;
      v12 = v16;
      v16[4] = v7;
      v16[5] = &v17;
      objc_msgSend(v11, "shortSessionValues:", v16);
      goto LABEL_6;
    case 6:
    case 15:
      objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_2;
      v15[3] = &unk_250DC0598;
      v12 = v15;
      v15[4] = v7;
      v15[5] = &v17;
      objc_msgSend(v11, "shortAndNavSessionValues:", v15);
      goto LABEL_6;
    case 8:
    case 14:
      objc_msgSend(MEMORY[0x24BE3D008], "sharedManager", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_3;
      v14[3] = &unk_250DC05C0;
      v12 = v14;
      v14[4] = v7;
      objc_msgSend(v11, "referenceTimeResult:", v14);
LABEL_6:

      v10 = (void *)v12[4];
      v9 = v7;
LABEL_7:

      v8 = *((unsigned int *)v18 + 6);
      v7 = v9;
      break;
    default:
      break;
  }
  v6[2](v6, v7, v8);
  _Block_object_dispose(&v17, 8);

}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSessionId:", a2, a3);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRelativeTimestamp:", a7);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSequenceNumber:", a4);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CC10]), "initWithCFAbsoluteTime:", a5);
  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEventTime:", v17);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a6;
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSessionId:", a2, a3);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRelativeTimestamp:", a9);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSequenceNumber:", a4);

  if (a10 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNavSessionId:", a5, a6);

    objc_msgSend(*(id *)(a1 + 32), "userSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNavSessionRelativeTimestamp:", a10);

  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CC10]), "initWithCFAbsoluteTime:", a7);
  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEventTime:", v25);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a8;
}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_3(uint64_t a1, double a2)
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3CC10]), "initWithCFAbsoluteTime:", a2);
  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventTime:", v4);

}

void __50__GEOAPStateFactory_sessionStateForType_callback___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSessionId:", a3, a4);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSessionEpoch:", a2);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRelativeTimestamp:", a8);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CC10]), "initWithCFAbsoluteTime:", a6);
  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEventTime:", v19);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDidPreviouslyRotate:", a5);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a7;
}

- (void)sessionStateForType:(int)a3 onQueue:(id)a4 callback:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  GEOApplicationIdentifierOrProcessName();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAPStateFactory sessionStateForType:sessionAppId:onQueue:callback:](self, "sessionStateForType:sessionAppId:onQueue:callback:", v6, v10, v9, v8);

}

- (void)sessionStateForType:(int)a3 sessionAppId:(id)a4 onQueue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[GEOAPStateFactory _emptyUserSessionState]((uint64_t)self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 - 3) > 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_23CBB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Assertion failed: __objc_no", v15, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__GEOAPStateFactory_sessionStateForType_sessionAppId_onQueue_callback___block_invoke;
    v16[3] = &unk_250DC0610;
    v17 = v13;
    v18 = v12;
    objc_msgSend(v14, "longSessionValuesForAppId:completionQueue:completion:", v10, v11, v16);

  }
}

uint64_t __71__GEOAPStateFactory_sessionStateForType_sessionAppId_onQueue_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSessionId:", a2, a3);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CC10]), "initWithCFAbsoluteTime:", a4);
  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEventTime:", v14);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRelativeTimestamp:", floor(a6 / 300.0) * 300.0);

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAgeOfSessionIdInSeconds:", floor(a7));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deviceCountryChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE3C9F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GEOAPStateFactory setCountryCode:](self, "setCountryCode:", v4);

}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDirectionsODSVersion, 0);
  objc_storeStrong((id *)&self->_offlineSearchODSVersion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_applicationIdentifierState, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierInternalState, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierState, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
