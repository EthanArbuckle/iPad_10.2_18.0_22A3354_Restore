@implementation FBKDeviceManager

- (FBKDeviceManager)init
{
  FBKDeviceManager *v2;
  FBKDeviceManager *v3;
  uint64_t v4;
  NSMutableDictionary *tryPinBlocks;
  uint64_t v6;
  NSMutableDictionary *beginPairingBlocks;
  uint64_t v8;
  NSMutableDictionary *devicePinAttemptCount;
  uint64_t v10;
  NSMutableDictionary *notConfiguredDevicesMatchingPlatformCache;
  NSArray *notConfiguredDevicesCache;
  uint64_t v13;
  NSMutableArray *postScanTaskQueue;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FBKDeviceManager;
  v2 = -[FBKDeviceManager init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scanRequestCount = 0;
    *(_WORD *)&v2->_isScanning = 0;
    v2->_hidesNotConfiguredDevices = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    tryPinBlocks = v3->_tryPinBlocks;
    v3->_tryPinBlocks = (NSMutableDictionary *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    beginPairingBlocks = v3->_beginPairingBlocks;
    v3->_beginPairingBlocks = (NSMutableDictionary *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    devicePinAttemptCount = v3->_devicePinAttemptCount;
    v3->_devicePinAttemptCount = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    notConfiguredDevicesMatchingPlatformCache = v3->__notConfiguredDevicesMatchingPlatformCache;
    v3->__notConfiguredDevicesMatchingPlatformCache = (NSMutableDictionary *)v10;

    notConfiguredDevicesCache = v3->__notConfiguredDevicesCache;
    v3->__notConfiguredDevicesCache = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v13 = objc_claimAutoreleasedReturnValue();
    postScanTaskQueue = v3->_postScanTaskQueue;
    v3->_postScanTaskQueue = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__postDeviceChangeNotification, CFSTR("FBKDeviceStateDidChange"), 0);

  }
  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__FBKDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __34__FBKDeviceManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  dispatch_time_t v3;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  v2 = (id)objc_msgSend((id)sharedInstance_sharedInstance, "thisDevice");
  objc_msgSend((id)sharedInstance_sharedInstance, "beginScanning");
  v3 = dispatch_time(0, 20000000000);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], &__block_literal_global_5);
}

uint64_t __34__FBKDeviceManager_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)sharedInstance_sharedInstance, "stopScanning");
}

- (id)preferredTargetDevicesForFollowup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FBKDeviceManager configuredDevices](self, "configuredDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager _preferredTargetDevicesForFollowup:withConfiguredDevices:](self, "_preferredTargetDevicesForFollowup:withConfiguredDevices:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_preferredTargetDevicesForFollowup:(id)a3 withConfiguredDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  _DWORD v40[7];

  *(_QWORD *)&v40[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "targetPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKLog ffu](FBKLog, "ffu");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v40[0] = objc_msgSend(v10, "intValue");
    LOWORD(v40[1]) = 2114;
    *(_QWORD *)((char *)&v40[1] + 2) = v8;
    _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "target device for FFU [%i] with target platform [%{public}@]", buf, 0x12u);

  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE2CA18]))
  {
    +[FBKLog ffu](FBKLog, "ffu");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "target device for FFU: matched ios platform, picking current device", buf, 2u);
    }

    -[FBKDeviceManager thisDevice](self, "thisDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSend(v6, "bugSessionsFromOriginalFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (v14)
  {
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      +[FBKLog ffu](FBKLog, "ffu");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "valueForKeyPath:", CFSTR("identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v40 = v18;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "target device for FFU: FR has bug sessions [%{public}@]", buf, 0xCu);

      }
      objc_msgSend(v12, "valueForKeyPath:", CFSTR("deviceIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x24BDAC760];
      v34 = 3221225472;
      v35 = __77__FBKDeviceManager__preferredTargetDevicesForFollowup_withConfiguredDevices___block_invoke;
      v36 = &unk_24E156BD0;
      v20 = v19;
      v37 = v20;
      objc_msgSend(v7, "ded_selectItemsPassingTest:", &v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v13, "count", v33, v34, v35, v36);
      +[FBKLog ffu](FBKLog, "ffu");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          v24 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v40 = v24;
          v25 = "Preferred target device for FFU: found [%lu] devices through session";
          v26 = v22;
          v27 = 12;
LABEL_17:
          _os_log_impl(&dword_21D9A9000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
      else if (v23)
      {
        *(_WORD *)buf = 0;
        v25 = "Preferred target device for FFU: upload task session matched no devices";
        v26 = v22;
        v27 = 2;
        goto LABEL_17;
      }

      goto LABEL_19;
    }
  }
  v13 = (void *)MEMORY[0x24BDBD1A8];
LABEL_19:
  if (!objc_msgSend(v13, "count"))
  {
    +[FBKLog ffu](FBKLog, "ffu");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v40 = v8;
      _os_log_impl(&dword_21D9A9000, v28, OS_LOG_TYPE_DEFAULT, "target device for FFU: looking for configured device with platform [%{public}@]", buf, 0xCu);
    }

    -[FBKDeviceManager devicesMatchingPlatform:withDevices:](self, "devicesMatchingPlatform:withDevices:", v8, v7);
    v29 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v29;
  }
  +[FBKLog ffu](FBKLog, "ffu");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("identifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v40 = v31;
    _os_log_impl(&dword_21D9A9000, v30, OS_LOG_TYPE_DEFAULT, "target device for FFU: matched devices [%{public}@]", buf, 0xCu);

  }
LABEL_26:

  return v13;
}

uint64_t __77__FBKDeviceManager__preferredTargetDevicesForFollowup_withConfiguredDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)hasAnyConfiguredDevicesMatchingPlatform:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE2CA00]))
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Given platform is unspecified", buf, 2u);
    }
    v5 = 0;
  }
  else
  {
    +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject configuredDevices](v4, "configuredDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__FBKDeviceManager_hasAnyConfiguredDevicesMatchingPlatform___block_invoke;
    v9[3] = &unk_24E156BD0;
    v10 = v3;
    objc_msgSend(v6, "ded_findWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

uint64_t __60__FBKDeviceManager_hasAnyConfiguredDevicesMatchingPlatform___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)notConfiguredDevicesMatchingPlatform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (-[FBKDeviceManager hidesNotConfiguredDevices](self, "hidesNotConfiguredDevices"))
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[FBKDeviceManager _notConfiguredDevicesMatchingPlatformCache](self, "_notConfiguredDevicesMatchingPlatformCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FBKDeviceManager _notConfiguredDevicesMatchingPlatformCache](self, "_notConfiguredDevicesMatchingPlatformCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[FBKDeviceManager notConfiguredDevices](self, "notConfiguredDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __57__FBKDeviceManager_notConfiguredDevicesMatchingPlatform___block_invoke;
      v13[3] = &unk_24E156BD0;
      v10 = v4;
      v14 = v10;
      objc_msgSend(v9, "ded_selectItemsPassingTest:", v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKDeviceManager _notConfiguredDevicesMatchingPlatformCache](self, "_notConfiguredDevicesMatchingPlatformCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, v10);

    }
  }

  return v5;
}

uint64_t __57__FBKDeviceManager_notConfiguredDevicesMatchingPlatform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)notConfiguredDevices
{
  void *v3;
  void *v4;
  void *v5;

  if (-[FBKDeviceManager hidesNotConfiguredDevices](self, "hidesNotConfiguredDevices"))
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[FBKDeviceManager _notConfiguredDevicesCache](self, "_notConfiguredDevicesCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[FBKDeviceManager _notConfiguredDevicesCache](self, "_notConfiguredDevicesCache");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FBKDeviceManager availableDevices](self, "availableDevices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ded_rejectItemsPassingTest:", &__block_literal_global_31);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKDeviceManager set_notConfiguredDevicesCache:](self, "set_notConfiguredDevicesCache:", v3);
    }
  }
  return v3;
}

uint64_t __40__FBKDeviceManager_notConfiguredDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFBKPaired");
}

- (id)configuredDevices
{
  void *v3;
  void *v4;

  -[FBKDeviceManager availableDevices](self, "availableDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager _configuredDevicesWithAvailableDevices:](self, "_configuredDevicesWithAvailableDevices:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_configuredDevicesWithAvailableDevices:(id)a3
{
  return (id)objc_msgSend(a3, "ded_selectItemsPassingTest:", &__block_literal_global_32);
}

uint64_t __59__FBKDeviceManager__configuredDevicesWithAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFBKPaired");
}

+ (id)supportedPlatforms
{
  if (supportedPlatforms_onceToken != -1)
    dispatch_once(&supportedPlatforms_onceToken, &__block_literal_global_33);
  return (id)supportedPlatforms_supportedPlatforms;
}

void __38__FBKDeviceManager_supportedPlatforms__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE2C9F8], *MEMORY[0x24BE2C9E8], *MEMORY[0x24BE2CA10], *MEMORY[0x24BE2C9F0], *MEMORY[0x24BE2CA18], *MEMORY[0x24BE2CA08], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedPlatforms_supportedPlatforms;
  supportedPlatforms_supportedPlatforms = v0;

}

- (id)availableDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "supportedPlatforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager _availableDevicesWithUserVisiblePlatforms:](self, "_availableDevicesWithUserVisiblePlatforms:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_availableDevicesWithUserVisiblePlatforms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[FBKDeviceManager allDevices](self, "allDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke;
  v13[3] = &unk_24E156BD0;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "ded_selectItemsPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager groupedDevicesSortDescriptors](self, "groupedDevicesSortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v5, "ded_selectItemsPassingTest:", &__block_literal_global_35);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

uint64_t __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  int v9;

  v3 = a2;
  objc_msgSend(v3, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inferredPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "needsPairing")
    || !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2CA00]))
  {
    v9 = objc_msgSend(v3, "isReady");
    v7 = v4;
    if (!v9)
      goto LABEL_4;
LABEL_6:
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2C9F8]);
  v7 = v5;
  if ((v6 & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v8 = 0;
LABEL_7:

  return v8;
}

uint64_t __62__FBKDeviceManager__availableDevicesWithUserVisiblePlatforms___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

- (id)_allDevicesFromDEDDevices:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  FBKGroupedDevice *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 20);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

        }
        objc_msgSend(v11, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v5, "allValues", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = -[FBKGroupedDevice initWithDevices:]([FBKGroupedDevice alloc], "initWithDevices:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        objc_msgSend(v4, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)allDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, void *);
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t (*v79)(uint64_t, void *);
  uint64_t v80;
  FBKGroupedDevice *v81;
  void *v82;
  FBKGroupedDevice *v83;
  id v84;
  __int128 v86;
  void *v87;
  FBKDeviceManager *v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  uint64_t v93;
  id v94;
  id obj;
  void *v96;
  _QWORD v97[5];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  uint8_t v119[128];
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  _BYTE v123[10];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  -[FBKDeviceManager ded](self, "ded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKnownDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = self;
  -[FBKDeviceManager dedDevicesSortDescriptors](self, "dedDevicesSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v115 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        if (objc_msgSend(v13, "isTemporaryDevice"))
          v14 = v4;
        else
          v14 = v3;
        objc_msgSend(v14, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count") + 5);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObjectsFromArray:", v3);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v3;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v111 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
        objc_msgSend(v20, "address");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setObject:forKeyedSubscript:", v20, v21);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "remoteTransport"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v22);

        }
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v26);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
    }
    while (v17);
  }

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v107;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v107 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
        objc_msgSend(v33, "address");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
    }
    while (v30);
  }
  v89 = v27;
  v87 = v28;

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  -[FBKDeviceManager devicesFromDefaults](v88, "devicesFromDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
  if (v36)
  {
    v38 = v36;
    v39 = *(_QWORD *)v103;
    *(_QWORD *)&v37 = 138543874;
    v86 = v37;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v103 != v39)
          objc_enumerationMutation(v35);
        v41 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v41, "remoteTransport", v86));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          objc_msgSend(v41, "address");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            +[FBKLog ded](FBKLog, "ded");
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v41, "hashingKey");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v121 = v49;
              _os_log_impl(&dword_21D9A9000, v48, OS_LOG_TYPE_INFO, "will not show temp cached device [%{public}@]", buf, 0xCu);

            }
            v50 = objc_msgSend(v47, "remoteTransport");
            if (v50 == objc_msgSend(v41, "remoteTransport") && (objc_msgSend(v47, "isTemporaryDevice") & 1) == 0)
            {
              +[FBKLog ded](FBKLog, "ded");
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v41, "hashingKey");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v121 = v52;
                _os_log_impl(&dword_21D9A9000, v51, OS_LOG_TYPE_DEFAULT, "removing temp device [%{public}@] from defaults", buf, 0xCu);

              }
              objc_msgSend(v41, "removeFBKPairing");
              if ((objc_msgSend(v47, "isFBKPaired") & 1) == 0)
              {
                +[FBKLog ded](FBKLog, "ded");
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v41, "hashingKey");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "hashingKey");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v121 = v54;
                  v122 = 2114;
                  *(_QWORD *)v123 = v55;
                  _os_log_impl(&dword_21D9A9000, v53, OS_LOG_TYPE_DEFAULT, "updating defaults of temp device [%{public}@] with ready device [%{public}@]", buf, 0x16u);

                }
                objc_msgSend(v47, "pairToFBK");
              }
            }
          }
          else
          {
            objc_msgSend(v41, "address");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "objectForKeyedSubscript:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              v58 = objc_msgSend(v57, "status");
              if (v58 != objc_msgSend(v41, "status"))
              {
                +[FBKLog ded](FBKLog, "ded");
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v41, "hashingKey");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = objc_msgSend(v41, "status");
                  v61 = objc_msgSend(v57, "status");
                  *(_DWORD *)buf = v86;
                  v121 = v60;
                  v122 = 1024;
                  *(_DWORD *)v123 = v91;
                  *(_WORD *)&v123[4] = 1024;
                  *(_DWORD *)&v123[6] = v61;
                  _os_log_debug_impl(&dword_21D9A9000, v59, OS_LOG_TYPE_DEBUG, "will update cached device [%{public}@] status %i -> %i", buf, 0x18u);

                }
                objc_msgSend(v41, "setStatus:", objc_msgSend(v57, "status"));
              }
            }
            objc_msgSend(v90, "addObject:", v41);

          }
        }
      }
      v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
    }
    while (v38);
  }

  v62 = v90;
  -[FBKDeviceManager _allDevicesFromDEDDevices:](v88, "_allDevicesFromDEDDevices:", v90);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v87;
  if (objc_msgSend(v87, "count"))
  {
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v63);
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v94 = v87;
    v65 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v99;
      v68 = MEMORY[0x24BDAC760];
      v69 = __30__FBKDeviceManager_allDevices__block_invoke;
      v70 = &unk_24E156BD0;
      do
      {
        v71 = 0;
        v93 = v66;
        do
        {
          if (*(_QWORD *)v99 != v67)
            objc_enumerationMutation(v94);
          v72 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v71);
          v97[0] = v68;
          v97[1] = 3221225472;
          v97[2] = v69;
          v97[3] = v70;
          v97[4] = v72;
          objc_msgSend(v63, "ded_findWithBlock:", v97);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v73;
          if (v73)
          {
            objc_msgSend(v73, "addDevice:", v72);
          }
          else
          {
            v75 = v67;
            v76 = v15;
            v77 = v63;
            v78 = v70;
            v79 = v69;
            v80 = v68;
            v81 = [FBKGroupedDevice alloc];
            v118 = v72;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = -[FBKGroupedDevice initWithDevices:](v81, "initWithDevices:", v82);

            objc_msgSend(v92, "addObject:", v83);
            v68 = v80;
            v69 = v79;
            v70 = v78;
            v63 = v77;
            v15 = v76;
            v67 = v75;
            v66 = v93;
          }

          ++v71;
        }
        while (v66 != v71);
        v66 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
      }
      while (v66);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v92);
    v84 = (id)objc_claimAutoreleasedReturnValue();

    v62 = v90;
    v64 = v87;
  }
  else
  {
    v84 = v63;
  }

  return v84;
}

uint64_t __30__FBKDeviceManager_allDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLikeDEDDevice:", *(_QWORD *)(a1 + 32));
}

- (id)thisDevice
{
  if (thisDevice_onceToken != -1)
    dispatch_once(&thisDevice_onceToken, &__block_literal_global_38);
  return (id)thisDevice_device;
}

uint64_t __30__FBKDeviceManager_thisDevice__block_invoke()
{
  FBKGroupedDevice *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = [FBKGroupedDevice alloc];
  objc_msgSend(MEMORY[0x24BE2CA40], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FBKGroupedDevice initWithDevices:](v0, "initWithDevices:", v2);
  v4 = (void *)thisDevice_device;
  thisDevice_device = v3;

  result = objc_msgSend((id)thisDevice_device, "isFBKPaired");
  if ((result & 1) == 0)
    return objc_msgSend((id)thisDevice_device, "pairToFBK");
  return result;
}

- (id)groupedDeviceForDEDDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKDeviceManager availableDevices](self, "availableDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke;
  v19[3] = &unk_24E156BD0;
  v7 = v4;
  v20 = v7;
  objc_msgSend(v5, "ded_findWithBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "could not get grouped device with identifer [%{public}@]", buf, 0xCu);

    }
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_40;
    v17[3] = &unk_24E156BD0;
    v12 = v7;
    v18 = v12;
    objc_msgSend(v5, "ded_findWithBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_2;
      v15[3] = &unk_24E156BD0;
      v16 = v12;
      objc_msgSend(v5, "ded_findWithBlock:", v15);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_40(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "dedSharingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __46__FBKDeviceManager_groupedDeviceForDEDDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "dedIDSDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)groupedDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FBKDeviceManager availableDevices](self, "availableDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__FBKDeviceManager_groupedDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_24E156BD0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ded_findWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__FBKDeviceManager_groupedDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)promptPINForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog ded](FBKLog, "ded");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FBKDeviceManager promptPINForDevice:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = -[FBKDeviceManager _pinAttemptCountForDevice:](self, "_pinAttemptCountForDevice:", v4);
  +[FBKLog ded](FBKLog, "ded");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v4, "publicLogDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "will call pin pairing challenge block for device [%{public}@]", (uint8_t *)&v18, 0xCu);

    }
    -[FBKDeviceManager _failedPinChallengeForDevice:](self, "_failedPinChallengeForDevice:", v4);
  }
  else
  {
    if (v15)
    {
      objc_msgSend(v4, "publicLogDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "will show pin pairing UI for device [%{public}@]", (uint8_t *)&v18, 0xCu);

    }
    -[FBKDeviceManager _showPinChallengeForDevice:](self, "_showPinChallengeForDevice:", v4);
  }

}

- (void)successPINForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FBKGroupedDevice *v13;
  FBKGroupedDevice *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  FBKGroupedDevice *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog ded](FBKLog, "ded");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FBKDeviceManager successPINForDevice:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[FBKDeviceManager groupedDeviceForDEDDevice:](self, "groupedDeviceForDEDDevice:", v4);
  v13 = (FBKGroupedDevice *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    -[FBKGroupedDevice pairToFBK](v13, "pairToFBK");
    +[FBKLog ded](FBKLog, "ded");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[FBKGroupedDevice description](v14, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "did pair sharing grouped device [%{public}@]", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v4, "pairToFBK");
    +[FBKLog ded](FBKLog, "ded");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "could not find grouped device for DED device after pairing success with device [%{public}@]", buf, 0xCu);
    }
  }

  -[FBKDeviceManager _reportPinAttemptForDevice:success:](self, "_reportPinAttemptForDevice:success:", v4, 1);
  -[FBKDeviceManager devicePinAttemptCount](self, "devicePinAttemptCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v18);

  if (!v14)
  {
    v19 = [FBKGroupedDevice alloc];
    v22 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FBKGroupedDevice initWithDevices:](v19, "initWithDevices:", v20);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("FBKDeviceManagerDidPinPairWithDevice"), v14);

}

- (void)_showPinChallengeForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FBKDeviceManager beginPairingBlocks](self, "beginPairingBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
      -[FBKDeviceManager beginPairingBlocks](self, "beginPairingBlocks");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v9, "removeObjectForKey:", v10);

    }
    else
    {
      +[FBKLog ded](FBKLog, "ded");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBKDeviceManager _showPinChallengeForDevice:].cold.2();
    }

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      -[FBKDeviceManager _showPinChallengeForDevice:].cold.1();
  }

}

- (void)_failedPinChallengeForDevice:(id)a3
{
  id v4;

  v4 = a3;
  -[FBKDeviceManager _incrementPinChallengeAttemptForDevice:](self, "_incrementPinChallengeAttemptForDevice:", v4);
  -[FBKDeviceManager _reportPinAttemptForDevice:success:](self, "_reportPinAttemptForDevice:success:", v4, 0);

}

- (void)_reportPinAttemptForDevice:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a4;
  v6 = a3;
  -[FBKDeviceManager _postDeviceChangeNotification](self, "_postDeviceChangeNotification");
  -[FBKDeviceManager tryPinBlocks](self, "tryPinBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v9[2](v9, v4);
    -[FBKDeviceManager tryPinBlocks](self, "tryPinBlocks");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v10, "removeObjectForKey:", v11);

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "tried to report pin challenge outcome but found no completion block", v12, 2u);
    }
  }

}

- (unint64_t)_pinAttemptCountForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  -[FBKDeviceManager devicePinAttemptCount](self, "devicePinAttemptCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FBKDeviceManager devicePinAttemptCount](self, "devicePinAttemptCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_incrementPinChallengeAttemptForDevice:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[FBKDeviceManager _pinAttemptCountForDevice:](self, "_pinAttemptCountForDevice:", v4) + 1;
  +[FBKLog ded](FBKLog, "ded");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "publicLogDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Attempting pin challenge number [%lu] for device [%{public}@]", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager devicePinAttemptCount](self, "devicePinAttemptCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

}

- (void)beginPairingDevice:(id)a3 showUIBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a4;
  objc_msgSend(a3, "dedSharingDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "address");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(v6, "copy");
      v11 = _Block_copy(v10);
      -[FBKDeviceManager beginPairingBlocks](self, "beginPairingBlocks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v9);

      -[FBKDeviceManager ded](self, "ded");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject startPairSetupForDevice:](v13, "startPairSetupForDevice:", v8);
    }
    else
    {
      +[FBKLog ded](FBKLog, "ded");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FBKDeviceManager beginPairingDevice:showUIBlock:].cold.2();
    }

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FBKDeviceManager beginPairingDevice:showUIBlock:].cold.1();
  }

}

- (void)tryPairingDevice:(id)a3 withPin:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "dedSharingDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "address");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[FBKDeviceManager _incrementPinChallengeAttemptForDevice:](self, "_incrementPinChallengeAttemptForDevice:", v11);
      v13 = (void *)objc_msgSend(v9, "copy");
      v14 = _Block_copy(v13);
      -[FBKDeviceManager tryPinBlocks](self, "tryPinBlocks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v12);

      -[FBKDeviceManager ded](self, "ded");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject tryPIN:forDevice:](v16, "tryPIN:forDevice:", v8, v11);
    }
    else
    {
      +[FBKLog ded](FBKLog, "ded");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[FBKDeviceManager tryPairingDevice:withPin:completion:].cold.2();
    }

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBKDeviceManager beginPairingDevice:showUIBlock:].cold.1();
  }

}

- (void)beginScanning
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD block[5];
  uint8_t buf[16];

  +[FBKLog ded](FBKLog, "ded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "beginScanning", buf, 2u);
  }

  -[FBKDeviceManager incrementScanRequest](self, "incrementScanRequest");
  if (-[FBKDeviceManager isScanning](self, "isScanning"))
  {
    +[FBKLog ded](FBKLog, "ded");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "already scanning", buf, 2u);
    }

  }
  else
  {
    -[FBKDeviceManager setIsScanning:](self, "setIsScanning:", 1);
    +[FBKLog ded](FBKLog, "ded");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "will begin scanning for devices", buf, 2u);
    }

    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__FBKDeviceManager_beginScanning__block_invoke;
    block[3] = &unk_24E156D78;
    block[4] = self;
    if (beginScanning__onceToken != -1)
      dispatch_once(&beginScanning__onceToken, block);
    -[FBKDeviceManager ded](self, "ded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __33__FBKDeviceManager_beginScanning__block_invoke_2;
    v8[3] = &unk_24E156DA0;
    v8[4] = self;
    objc_msgSend(v7, "discoverDevicesWithCompletion:", v8);

  }
}

void __33__FBKDeviceManager_beginScanning__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurePairingDelegate:", *(_QWORD *)(a1 + 32));

}

void __33__FBKDeviceManager_beginScanning__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__FBKDeviceManager_beginScanning__block_invoke_3;
  block[3] = &unk_24E156D78;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __33__FBKDeviceManager_beginScanning__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postDeviceChangeNotification");
}

- (void)stopScanning
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int64_t v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[FBKLog ded](FBKLog, "ded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "stopScanning", (uint8_t *)&v9, 2u);
  }

  -[FBKDeviceManager decrementScanRequest](self, "decrementScanRequest");
  v4 = -[FBKDeviceManager canStopScan](self, "canStopScan");
  +[FBKLog ded](FBKLog, "ded");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "will stop scanning for devices", (uint8_t *)&v9, 2u);
    }

    -[FBKDeviceManager ded](self, "ded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopDiscovery");

    -[FBKDeviceManager setIsScanning:](self, "setIsScanning:", 0);
    -[FBKDeviceManager setHasScannedAtLeastOnce:](self, "setHasScannedAtLeastOnce:", 1);
    -[FBKDeviceManager _updateStoredDevices](self, "_updateStoredDevices");
    -[FBKDeviceManager _drainPostScanTaskQueue](self, "_drainPostScanTaskQueue");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = -[FBKDeviceManager scanRequestCount](self, "scanRequestCount");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "did not stop scan yet %ld", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)runAfterScan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (-[FBKDeviceManager hasScannedAtLeastOnce](self, "hasScannedAtLeastOnce"))
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }
  else
  {
    -[FBKDeviceManager postScanTaskQueue](self, "postScanTaskQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(v4);
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = dispatch_time(0, 0x12A05F214);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__FBKDeviceManager_runAfterScan___block_invoke;
  v9[3] = &unk_24E156DC8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], v9);

}

void __33__FBKDeviceManager_runAfterScan___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "postScanTaskQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    +[FBKLog ded](FBKLog, "ded");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __33__FBKDeviceManager_runAfterScan___block_invoke_cold_1();

    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "postScanTaskQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v6, "removeObject:", v7);

  }
}

- (void)_drainPostScanTaskQueue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FBKDeviceManager postScanTaskQueue](self, "postScanTaskQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = MEMORY[0x24BDAC9B8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        dispatch_async(v7, *(dispatch_block_t *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[FBKDeviceManager postScanTaskQueue](self, "postScanTaskQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (id)devicesFromDefaults
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA40], "FBKKnownDevices");
}

- (id)ded
{
  return (id)objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
}

- (void)_postDeviceChangeNotification
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[FBKDeviceManager _invalidateCaches](self, "_invalidateCaches");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("configured");
  -[FBKDeviceManager configuredDevices](self, "configuredDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("FBKDeviceListDidChange"), 0, v5);

}

- (void)_updateStoredDevices
{
  id v3;

  -[FBKDeviceManager configuredDevices](self, "configuredDevices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceManager _updateStoredDevicesWithConfiguredDevices:](self, "_updateStoredDevicesWithConfiguredDevices:", v3);

}

- (void)_updateStoredDevicesWithConfiguredDevices:(id)a3
{
  id v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateStoredCopyIfNeeded");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_invalidateCaches
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[FBKDeviceManager set_notConfiguredDevicesCache:](self, "set_notConfiguredDevicesCache:", 0);
  -[FBKDeviceManager _notConfiguredDevicesMatchingPlatformCache](self, "_notConfiguredDevicesMatchingPlatformCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    -[FBKDeviceManager set_notConfiguredDevicesMatchingPlatformCache:](self, "set_notConfiguredDevicesMatchingPlatformCache:", v6);

  }
}

- (BOOL)canStopScan
{
  return -[FBKDeviceManager scanRequestCount](self, "scanRequestCount") == 0;
}

- (void)incrementScanRequest
{
  -[FBKDeviceManager setScanRequestCount:](self, "setScanRequestCount:", -[FBKDeviceManager scanRequestCount](self, "scanRequestCount") + 1);
}

- (void)decrementScanRequest
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_DEBUG, "imbalanced calls to stopScanning found", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)devicesMatchingPlatform:(id)a3 withDevices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__FBKDeviceManager_devicesMatchingPlatform_withDevices___block_invoke;
  v9[3] = &unk_24E156DF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "ded_selectItemsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__FBKDeviceManager_devicesMatchingPlatform_withDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)dedDevicesSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("isCurrentDevice"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("status"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)groupedDevicesSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("isCurrentDevice"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("platform"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("isReady"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("needsPairing"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)_notConfiguredDevicesMatchingPlatformCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_notConfiguredDevicesMatchingPlatformCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)_notConfiguredDevicesCache
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_notConfiguredDevicesCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)scanRequestCount
{
  return self->_scanRequestCount;
}

- (void)setScanRequestCount:(int64_t)a3
{
  self->_scanRequestCount = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (BOOL)hasScannedAtLeastOnce
{
  return self->_hasScannedAtLeastOnce;
}

- (void)setHasScannedAtLeastOnce:(BOOL)a3
{
  self->_hasScannedAtLeastOnce = a3;
}

- (NSMutableArray)postScanTaskQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostScanTaskQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)beginPairingBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBeginPairingBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)tryPinBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTryPinBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)devicePinAttemptCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDevicePinAttemptCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)hidesNotConfiguredDevices
{
  return self->_hidesNotConfiguredDevices;
}

- (void)setHidesNotConfiguredDevices:(BOOL)a3
{
  self->_hidesNotConfiguredDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePinAttemptCount, 0);
  objc_storeStrong((id *)&self->_tryPinBlocks, 0);
  objc_storeStrong((id *)&self->_beginPairingBlocks, 0);
  objc_storeStrong((id *)&self->_postScanTaskQueue, 0);
  objc_storeStrong((id *)&self->__notConfiguredDevicesCache, 0);
  objc_storeStrong((id *)&self->__notConfiguredDevicesMatchingPlatformCache, 0);
}

- (void)promptPINForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21D9A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
}

- (void)successPINForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21D9A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
}

- (void)_showPinChallengeForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "device identifier is nil, cannot show pin challenge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_showPinChallengeForDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "no show UI for pin challenge block found, cannot proceed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginPairingDevice:showUIBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "cannot begin pairing with nil sharing device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginPairingDevice:showUIBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "device has no identifier, cannot begin pairing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tryPairingDevice:withPin:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "device has no identifier, cannot try pin pairing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __33__FBKDeviceManager_runAfterScan___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Run After Scan timed out. Calling completion block now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
