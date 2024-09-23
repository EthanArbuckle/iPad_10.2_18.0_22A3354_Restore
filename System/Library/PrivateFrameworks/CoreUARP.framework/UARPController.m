@implementation UARPController

- (UARPController)init
{
  UARPController *v2;
  uint64_t v3;
  NSMutableDictionary *accessories;
  NSCache *v5;
  NSCache *assetCache;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *delegateQueue;
  os_log_t v11;
  OS_os_log *xpcLog;
  os_log_t v13;
  OS_os_log *controllerLog;
  UARPControllerXPC *v15;
  UARPControllerInternalDelegate *internalDelegate;
  UARPPowerLogManager *v17;
  UARPPowerLogManager *powerLogManager;
  UARPAnalyticsUpdateFirmwareManager *v19;
  UARPAnalyticsUpdateFirmwareManager *updateFirmwareAnalytics;
  uint64_t v21;
  NSMutableDictionary *assetAvailabilityNotificationTokenDict;
  uint64_t v23;
  NSMutableDictionary *supplementalAssetAvailabilityNotificationTokenDict;
  uint64_t v25;
  NSMutableDictionary *assetAvailabilityUARPProductGroupNotificationTokenDict;
  uint64_t v27;
  NSMutableDictionary *attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  uint64_t v29;
  NSMutableDictionary *generalNotificationTokenDict;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)UARPController;
  v2 = -[UARPController init](&v32, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableDictionary *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    assetCache = v2->_assetCache;
    v2->_assetCache = v5;

    v7 = dispatch_queue_create("UARPController internal", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("UARPController delegate", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v9;

    v11 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v2->_xpcLog;
    v2->_xpcLog = (OS_os_log *)v11;

    v13 = os_log_create("com.apple.accessoryupdater.uarp", "uarpController");
    controllerLog = v2->_controllerLog;
    v2->_controllerLog = (OS_os_log *)v13;

    v15 = -[UARPControllerXPC initWithController:]([UARPControllerXPC alloc], "initWithController:", v2);
    internalDelegate = v2->_internalDelegate;
    v2->_internalDelegate = (UARPControllerInternalDelegate *)v15;

    v17 = objc_alloc_init(UARPPowerLogManager);
    powerLogManager = v2->_powerLogManager;
    v2->_powerLogManager = v17;

    v19 = -[UARPAnalyticsUpdateFirmwareManager initWithController:queue:]([UARPAnalyticsUpdateFirmwareManager alloc], "initWithController:queue:", v2, v2->_internalQueue);
    updateFirmwareAnalytics = v2->_updateFirmwareAnalytics;
    v2->_updateFirmwareAnalytics = v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    assetAvailabilityNotificationTokenDict = v2->_assetAvailabilityNotificationTokenDict;
    v2->_assetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    supplementalAssetAvailabilityNotificationTokenDict = v2->_supplementalAssetAvailabilityNotificationTokenDict;
    v2->_supplementalAssetAvailabilityNotificationTokenDict = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    assetAvailabilityUARPProductGroupNotificationTokenDict = v2->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    v2->_assetAvailabilityUARPProductGroupNotificationTokenDict = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    v2->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = (NSMutableDictionary *)v27;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    generalNotificationTokenDict = v2->_generalNotificationTokenDict;
    v2->_generalNotificationTokenDict = (NSMutableDictionary *)v29;

    v2->_isInternalBuild = MGGetBoolAnswer();
  }
  return v2;
}

- (void)setChipInfoDelegate:(id)a3
{
  UARPControllerChipInfoDelegate *v4;
  UARPControllerChipInfoDelegate *chipInfoDelegate;
  UARPController *obj;

  v4 = (UARPControllerChipInfoDelegate *)a3;
  obj = self;
  objc_sync_enter(obj);
  chipInfoDelegate = obj->_chipInfoDelegate;
  obj->_chipInfoDelegate = v4;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  objc_super v3;

  -[UARPController unregisterForAllAssetAvailabilityNotifications](self, "unregisterForAllAssetAvailabilityNotifications");
  -[UARPController unregisterForAllSupplementalAssetAvailabilityNotifications](self, "unregisterForAllSupplementalAssetAvailabilityNotifications");
  -[UARPController unregisterForAllGenericNotifications](self, "unregisterForAllGenericNotifications");
  -[UARPController unregisterForAllAttestationCertificatesAvailabilityNotifications](self, "unregisterForAllAttestationCertificatesAvailabilityNotifications");
  v3.receiver = self;
  v3.super_class = (Class)UARPController;
  -[UARPController dealloc](&v3, sel_dealloc);
}

- (BOOL)accessoryReachableInternal:(id)a3
{
  id v4;
  NSMutableDictionary *accessories;
  void *v6;
  void *v7;
  NSObject *controllerLog;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  UARPPowerLogManager *powerLogManager;
  void *v13;
  BOOL v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  accessories = self->_accessories;
  objc_msgSend(v4, "getID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSuppressAutomaticDynamicAssets:", objc_msgSend(v4, "suppressAutomaticDynamicAssets"));
  objc_msgSend(v7, "setSuppressInfoQueries:", objc_msgSend(v4, "suppressInfoQueries"));
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "Accessory reported as reachable %@", (uint8_t *)&v16, 0xCu);
  }
  if (!-[UARPController createUploader](self, "createUploader"))
    goto LABEL_12;
  if (v7)
  {
    v9 = objc_msgSend(v7, "reachable");
    v10 = self->_controllerLog;
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        v16 = 138412290;
        v17 = v7;
        _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Accessory is already reachable %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_11;
    }
    if (v11)
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Accessory is newly reachable %@", (uint8_t *)&v16, 0xCu);
    }
    objc_msgSend(v7, "setReachable:", 1);
    if (-[UARPUploader accessoryReachable:error:](self->_uploader, "accessoryReachable:error:", v4, 0))
      goto LABEL_11;
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
LABEL_11:
  powerLogManager = self->_powerLogManager;
  objc_msgSend(v4, "getID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager setAccessoryIDReachable:](powerLogManager, "setAccessoryIDReachable:", v13);

  v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)accessoryReachable:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__UARPController_accessoryReachable___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __37__UARPController_accessoryReachable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessoryReachableInternal:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)accessoryUnreachableInternal:(id)a3
{
  id v4;
  NSMutableDictionary *accessories;
  void *v6;
  void *v7;
  NSObject *controllerLog;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  BOOL v24;
  UARPAnalyticsUpdateFirmwareManager *updateFirmwareAnalytics;
  void *v26;
  UARPPowerLogManager *powerLogManager;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  accessories = self->_accessories;
  objc_msgSend(v4, "getID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v4;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "Accessory reported as unreachable %@", buf, 0xCu);
  }
  if (!v7)
    goto LABEL_20;
  v9 = objc_msgSend(v7, "reachable");
  v10 = self->_controllerLog;
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v36 = v7;
      v24 = 1;
      _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Accessory is already unreachable %@", buf, 0xCu);
    }
    else
    {
      v24 = 1;
    }
    goto LABEL_24;
  }
  if (v11)
  {
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Accessory is newly unreachable %@", buf, 0xCu);
  }
  if (!-[UARPUploader accessoryUnreachable:error:](self->_uploader, "accessoryUnreachable:error:", v4, 0))
  {
LABEL_20:
    v24 = 0;
    goto LABEL_24;
  }
  v30 = v4;
  objc_msgSend(v7, "setReachable:", 0);
  objc_msgSend(v7, "pendingAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v17, "id");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isStagingInProgressOnAccessoryID:", v19);

        if (v20)
        {
          v21 = self->_controllerLog;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v36 = v17;
            v37 = 2112;
            v38 = v7;
            _os_log_impl(&dword_212D08000, v21, OS_LOG_TYPE_DEFAULT, "Asset %@ not being staged anymore on %@", buf, 0x16u);
          }
          objc_msgSend(v17, "id");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "getID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stagingCompleteOnAccessoryID:", v23);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v14);
  }

  v24 = 1;
  v4 = v30;
LABEL_24:
  updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
  objc_msgSend(v4, "getID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAnalyticsUpdateFirmwareManager setAccessoryIDUnreachable:](updateFirmwareAnalytics, "setAccessoryIDUnreachable:", v26);

  powerLogManager = self->_powerLogManager;
  objc_msgSend(v4, "getID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager setAccessoryIDUnreachable:](powerLogManager, "setAccessoryIDUnreachable:", v28);

  return v24;
}

- (BOOL)accessoryUnreachable:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__UARPController_accessoryUnreachable___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_accessoryUnreachable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessoryUnreachableInternal:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSArray)accessoryList
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__UARPController_accessoryList__block_invoke;
  v5[3] = &unk_24CEA3CC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__UARPController_accessoryList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)stageFirmwareUpdateOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v11;
  UARPController *v12;
  BOOL v13;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke;
  block[3] = &unk_24CEA3CF0;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v8 = v6;
  dispatch_sync(internalQueue, block);

  return 1;
}

void __68__UARPController_stageFirmwareUpdateOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
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
  NSObject *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 32);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v3;
          _os_log_impl(&dword_212D08000, v4, OS_LOG_TYPE_INFO, "stage assets for accessory %@", buf, 0xCu);
        }
        objc_msgSend(v3, "pendingAssets");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "count"))
        {
          v29 = v5;
          v30 = i;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v32 = v5;
          v6 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v34;
            do
            {
              v9 = 0;
              v31 = v7;
              do
              {
                if (*(_QWORD *)v34 != v8)
                  objc_enumerationMutation(v32);
                v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
                objc_msgSend(v10, "id");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "getID");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v11, "isStagingInProgressOnAccessoryID:", v12);

                v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
                if (v13)
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    v43 = 2112;
                    v44 = v3;
                    _os_log_impl(&dword_212D08000, v14, OS_LOG_TYPE_DEFAULT, "Asset %@ already being staged on accessory %@", buf, 0x16u);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v42 = v10;
                    v43 = 2112;
                    v44 = v3;
                    _os_log_impl(&dword_212D08000, v14, OS_LOG_TYPE_INFO, "staging %@ for accessory %@", buf, 0x16u);
                  }
                  objc_msgSend(v3, "setFirmwareUpdateBytesTotal:", objc_msgSend(v10, "fileLength"));
                  objc_msgSend(v10, "id");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "getID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "stagingStartedOnAccessoryID:", v16);

                  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
                  objc_msgSend(v3, "getID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "id");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "stagingStartedForAccessoryID:assetID:userIntent:", v18, v19, *(unsigned __int8 *)(a1 + 48));

                  v20 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
                  objc_msgSend(v3, "getID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "id");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "assetVersion");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "firmwareVersion");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:", v21, v23, v24);

                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "offerAssetToAccessory:asset:error:", v3, v10, 0);
                  v7 = v31;
                }
                ++v9;
              }
              while (v7 != v9);
              v7 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
            }
            while (v7);
          }

          v5 = v29;
          i = v30;
        }
        else
        {
          v25 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v3;
            _os_log_impl(&dword_212D08000, v25, OS_LOG_TYPE_INFO, "no assets to stage for accessory %@", buf, 0xCu);
          }
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v28);
  }

}

- (BOOL)applyStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v9[4];
  id v10;
  UARPController *v11;

  v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_24CEA2488;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_sync(internalQueue, v9);

  return 1;
}

void __68__UARPController_applyStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "applyStagedAssetsForAccessory:error:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)rescindStagedFirmwareOnAccessoryList:(id)a3 withUserIntent:(BOOL)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v9[4];
  id v10;
  UARPController *v11;

  v5 = a3;
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke;
  v9[3] = &unk_24CEA2488;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_sync(internalQueue, v9);

  return 1;
}

void __70__UARPController_rescindStagedFirmwareOnAccessoryList_withUserIntent___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "rescindStagedAssetsForAccessory:error:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)cancelFirmwareUpdateOnAccessoryList:(id)a3
{
  return a3 != 0;
}

- (BOOL)cancelFirmwareStagingForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke;
  v12[3] = &unk_24CEA3D18;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "pendingAssetForAccessory:assetID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(v2 - 8);
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(v4 + 64), "cancelAssetStagingForAccessory:asset:", *(_QWORD *)(a1 + 40), v3);
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 32), OS_LOG_TYPE_ERROR))
  {
    __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1();
  }

}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  BOOL v11;
  NSObject *controllerLog;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "length"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    v26 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__UARPController_recvDataFromAccessory_data_error___block_invoke;
    block[3] = &unk_24CEA3D40;
    v19 = &v27;
    block[4] = self;
    v17 = v8;
    v18 = v9;
    v20 = &v21;
    dispatch_sync(internalQueue, block);
    if (a5)
      *a5 = objc_retainAutorelease((id)v22[5]);
    v11 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
      -[UARPController recvDataFromAccessory:data:error:].cold.1(controllerLog, v13, v14);
    v11 = 0;
  }

  return v11;
}

void __51__UARPController_recvDataFromAccessory_data_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 64);
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "recvDataFromAccessory:data:error:", v2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
  v7 = a1[6];
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    v8 = 0;
  else
    v8 = 11;
  v9 = (void *)a1[5];
  v10 = *(void **)(a1[4] + 96);
  objc_msgSend(v9, "getID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dump:accessoryID:uarpStatus:direction:", v7, v11, v8, 1);

}

- (BOOL)accessoryKnown:(id)a3
{
  NSMutableDictionary *accessories;
  void *v4;
  void *v5;

  accessories = self->_accessories;
  objc_msgSend(a3, "getID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](accessories, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(accessories) = v5 != 0;

  return (char)accessories;
}

- (BOOL)accessoryIDKnown:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessories, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)updatePendingAssetsForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *xpcLog;
  uint64_t v11;
  void *v12;
  UARPAsset *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "localURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || objc_msgSend(v7, "downloadStatus") != 1)
    goto LABEL_21;
  v9 = objc_msgSend(v7, "updateAvailabilityStatus");

  if (v9 == 3)
  {
    -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315394;
        v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
        v25 = 2112;
        v26 = (uint64_t)v7;
        _os_log_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_DEFAULT, "%s: AssetID %@ already present in accessory's pending list", (uint8_t *)&v23, 0x16u);
      }
      goto LABEL_21;
    }
    -[NSCache objectForKey:](self->_assetCache, "objectForKey:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[UARPControllerInternalDelegate getSandboxExtensionTokenForAssetID:](self->_internalDelegate, "getSandboxExtensionTokenForAssetID:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [UARPAsset alloc];
      if (v12)
        v14 = -[UARPAsset initWithID:sandboxToken:](v13, "initWithID:sandboxToken:", v7, v12);
      else
        v14 = -[UARPAsset initWithID:](v13, "initWithID:", v7);
      v11 = v14;
      if (!v14)
      {
        v22 = self->_xpcLog;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[UARPController updatePendingAssetsForAccessory:assetID:].cold.1(v22);
        goto LABEL_20;
      }
      -[NSCache setObject:forKey:](self->_assetCache, "setObject:forKey:", v14, v7);

    }
    v15 = self->_xpcLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v6, "pendingAssets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315650;
      v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      v25 = 2112;
      v26 = (uint64_t)v6;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_212D08000, v16, OS_LOG_TYPE_DEFAULT, "%s: Current PendingAssetList for %@: %@", (uint8_t *)&v23, 0x20u);

    }
    v18 = self->_xpcLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_212D08000, v18, OS_LOG_TYPE_DEFAULT, "%s: Adding Asset %@", (uint8_t *)&v23, 0x16u);
    }
    objc_msgSend(v6, "addPendingAsset:", v11);
    v19 = self->_xpcLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v6, "pendingAssets");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315650;
      v24 = "-[UARPController updatePendingAssetsForAccessory:assetID:]";
      v25 = 2112;
      v26 = (uint64_t)v6;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_212D08000, v20, OS_LOG_TYPE_DEFAULT, "%s: Updated PendingAssetList for %@: %@", (uint8_t *)&v23, 0x20u);

    }
    v12 = (void *)v11;
LABEL_20:

LABEL_21:
  }

}

- (id)pendingAssetForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *xpcLog;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_DEFAULT, "%s: Looking for matching asset on pending queue for asset %@", buf, 0x16u);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "pendingAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v9)
  {
    v10 = v9;
    v26 = v6;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "id");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firmwareHash");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firmwareHash");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        v18 = self->_xpcLog;
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            v23 = v18;
            objc_msgSend(v13, "id");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
            v34 = 2112;
            v35 = v24;
            v36 = 2112;
            v37 = v7;
            _os_log_impl(&dword_212D08000, v23, OS_LOG_TYPE_DEFAULT, "%s: Assets matched %@ and %@", buf, 0x20u);

          }
          v22 = v13;
          goto LABEL_17;
        }
        if (v19)
        {
          v20 = v18;
          objc_msgSend(v13, "id");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v33 = "-[UARPController pendingAssetForAccessory:assetID:]";
          v34 = 2112;
          v35 = v21;
          v36 = 2112;
          v37 = v7;
          _os_log_impl(&dword_212D08000, v20, OS_LOG_TYPE_DEFAULT, "%s: Assets NOT matched %@ and %@", buf, 0x20u);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v10)
        continue;
      break;
    }
    v22 = 0;
LABEL_17:
    v6 = v26;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  UARPAnalyticsUpdateFirmwareManager *updateFirmwareAnalytics;
  void *v13;
  UARPPowerLogManager *powerLogManager;
  void *v15;
  void *v16;
  void *v17;
  UARPControllerInternalDelegate *internalDelegate;
  void *v19;
  id WeakRetained;
  int v21;
  NSObject *delegateQueue;
  id v23;
  int v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  unint64_t v29;
  _QWORD block[5];
  id v31;
  id v32;
  unint64_t v33;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "getID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stagingCompleteOnAccessoryID:", v10);

  -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "removePendingAsset:", v11);
  if ((objc_msgSend(v9, "isDynamicAsset") & 1) == 0)
  {
    updateFirmwareAnalytics = self->_updateFirmwareAnalytics;
    objc_msgSend(v8, "getID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:](updateFirmwareAnalytics, "stagingCompleteForAccessoryID:assetID:status:", v13, v9, a5);

    powerLogManager = self->_powerLogManager;
    objc_msgSend(v8, "getID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firmwareVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:](powerLogManager, "setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:", v15, v16, v17, a5);

    if (self->_isInternalBuild)
    {
      internalDelegate = self->_internalDelegate;
      objc_msgSend(v8, "getID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPControllerInternalDelegate stagingCompleteForAccessoryID:assetID:status:](internalDelegate, "stagingCompleteForAccessoryID:assetID:status:", v19, v9, a5);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = objc_msgSend(v9, "reportProgressToDelegates");

    if (v21)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke;
      block[3] = &unk_24CEA3D68;
      block[4] = self;
      v31 = v8;
      v32 = v9;
      v33 = a5;
      dispatch_async(delegateQueue, block);

    }
  }
  else
  {

  }
  v23 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_msgSend(v9, "reportProgressToDelegates");

    if (v24)
    {
      v25 = self->_delegateQueue;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2;
      v26[3] = &unk_24CEA3D68;
      v26[4] = self;
      v27 = v8;
      v28 = v9;
      v29 = a5;
      dispatch_async(v25, v26);

    }
  }
  else
  {

  }
}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "firmwareUpdateComplete:assetID:withStatus:", a1[5], a1[6], a1[7]);

}

void __61__UARPController_firmwareStagingComplete_assetID_withStatus___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "firmwareStagingComplete:assetID:withStatus:", a1[5], a1[6], a1[7]);

}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  char v8;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke;
    block[3] = &unk_24CEA3930;
    block[4] = self;
    v11 = v6;
    v12 = a4;
    dispatch_async(delegateQueue, block);

  }
}

void __63__UARPController_stagedFirmwareApplicationComplete_withStatus___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "stagedFirmwareApplicationComplete:withStatus:", a1[5], a1[6]);

}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  char v8;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke;
    block[3] = &unk_24CEA3930;
    block[4] = self;
    v11 = v6;
    v12 = a4;
    dispatch_async(delegateQueue, block);

  }
}

void __59__UARPController_stagedFirmwareRescindComplete_withStatus___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "stagedFirmwareRescindComplete:withStatus:", a1[5], a1[6]);

}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return -[UARPControllerInternalDelegate personalizationVectorForAccessory:assetTag:outVector:](self->_internalDelegate, "personalizationVectorForAccessory:assetTag:outVector:", a3, *(_QWORD *)&a4, a5);
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
  -[UARPControllerInternalDelegate manifestPropertiesReceivedForAccessory:assetTag:properties:](self->_internalDelegate, "manifestPropertiesReceivedForAccessory:assetTag:properties:", a3, *(_QWORD *)&a4, a5);
}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  UARPPowerLogManager *powerLogManager;
  void *v13;
  UARPPowerLogManager *v14;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v9, "setManufacturer:", v8);
      goto LABEL_15;
    case 1uLL:
      objc_msgSend(v9, "setModelName:", v8);
      goto LABEL_15;
    case 2uLL:
      objc_msgSend(v9, "setSerialNumber:", v8);
      goto LABEL_15;
    case 3uLL:
      objc_msgSend(v9, "setHwRevision:", v8);
      goto LABEL_15;
    case 4uLL:
      objc_msgSend(v9, "setFirmwareVersion:", v8);
      powerLogManager = self->_powerLogManager;
      objc_msgSend(v10, "getID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPPowerLogManager setActiveFirmwareVersionForAccessoryID:activeFirmwareVersion:](powerLogManager, "setActiveFirmwareVersionForAccessoryID:activeFirmwareVersion:", v13, v8);
      goto LABEL_10;
    case 5uLL:
      objc_msgSend(v9, "setStagedFirmwareVersion:", v8);
      v14 = self->_powerLogManager;
      objc_msgSend(v10, "getID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPPowerLogManager setStagedFirmwareVersionForAccessoryID:stagedFirmwareVersion:](v14, "setStagedFirmwareVersionForAccessoryID:stagedFirmwareVersion:", v13, v8);
LABEL_10:

      goto LABEL_15;
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      goto LABEL_16;
    case 7uLL:
      objc_msgSend(v9, "setProductGroup:", v8);
      goto LABEL_15;
    case 8uLL:
      objc_msgSend(v9, "setProductNumber:", v8);
      goto LABEL_15;
    case 0xCuLL:
      objc_msgSend(v9, "setHwFusingType:", v8);
      goto LABEL_15;
    case 0xDuLL:
      objc_msgSend(v9, "setFriendlyName:", v8);
      goto LABEL_15;
    default:
      if (a3 != 35)
        goto LABEL_16;
LABEL_15:
      v11 = -[UARPControllerInternalDelegate updateProperty:value:forAccessory:](self->_internalDelegate, "updateProperty:value:forAccessory:", a3, v8, v10);
LABEL_16:

      return v11;
  }
}

- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__3;
  v12[4] = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v10 = v6;
  v11 = v12;
  v8 = v6;
  dispatch_async(delegateQueue, block);

  _Block_object_dispose(v12, 8);
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  __int128 v13;
  char v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  v3 = a1[5];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v15 = 0;
  v5 = objc_msgSend(WeakRetained, "sendMessageToAccessory:uarpMsg:error:", v3, v4, &v15);
  v6 = v15;

  if ((v5 & 1) == 0)
  {
    v7 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1();

  }
  v8 = a1[4];
  v9 = *(NSObject **)(v8 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24;
  block[3] = &unk_24CEA3D90;
  v14 = v5;
  block[4] = v8;
  v11 = *(_OWORD *)(a1 + 5);
  v10 = (id)v11;
  v13 = v11;
  dispatch_async(v9, block);

}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_24(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 56))
    v1 = 0;
  else
    v1 = 11;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dump:accessoryID:uarpStatus:direction:", v3, v4, v1, 0);

}

- (BOOL)startPacketCapture:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__UARPController_startPacketCapture___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __37__UARPController_startPacketCapture___block_invoke(_QWORD *a1)
{
  UARPPacketDumper *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(a1[4] + 96))
  {
    v2 = -[UARPPacketDumper initWithFileName:]([UARPPacketDumper alloc], "initWithFileName:", a1[5]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v2;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 96) != 0;
  }
}

- (void)stopPacketCapture
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__UARPController_stopPacketCapture__block_invoke;
  block[3] = &unk_24CEA38E0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __35__UARPController_stopPacketCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 96);
  *(_QWORD *)(v1 + 96) = 0;

}

- (BOOL)solicitDynamicAsset:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v7, "localURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__UARPController_solicitDynamicAsset_assetID___block_invoke;
    v12[3] = &unk_24CEA3D18;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    v15 = &v16;
    dispatch_sync(internalQueue, v12);
    v10 = *((_BYTE *)v17 + 24) != 0;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPController solicitDynamicAsset:assetID:].cold.1();
    v10 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  UARPAsset *v7;
  uint64_t v8;
  NSObject *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "solicitDynamicAssetForAccessory:asset:error:", *(_QWORD *)(a1 + 40), v6, 0);

      goto LABEL_6;
    }
    v7 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", *(_QWORD *)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v6 = v7;
      objc_msgSend(*(id *)(v8 + 16), "setObject:forKey:", v7, *v5);
      goto LABEL_5;
    }
    v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v9);
  }
LABEL_6:

}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  int v12;
  NSObject *delegateQueue;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  -[UARPController pendingAssetForAccessory:assetID:](self, "pendingAssetForAccessory:assetID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "removePendingAsset:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v9, "reportProgressToDelegates");

    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke;
      v14[3] = &unk_24CEA3D68;
      v14[4] = self;
      v15 = v8;
      v16 = v9;
      v17 = a5;
      dispatch_async(delegateQueue, v14);

    }
  }
  else
  {

  }
}

void __63__UARPController_assetSolicitationComplete_assetID_withStatus___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "assetSolicitationComplete:assetID:withStatus:", a1[5], a1[6], a1[7]);

}

- (BOOL)dynamicAssetAvailableForAccessory:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke;
  block[3] = &unk_24CEA3DB8;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v26;
  v19 = &v20;
  dispatch_sync(internalQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  UARPAsset *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  id obj;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v11 + 40);
      v12 = objc_msgSend(v10, "offerDynamicAssetToAccessory:asset:error:", v9, v6, &obj);
      objc_storeStrong((id *)(v11 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;

      goto LABEL_6;
    }
    v7 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", *(_QWORD *)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v6 = v7;
      objc_msgSend(*(id *)(v8 + 16), "setObject:forKey:", v7, *v5);
      goto LABEL_5;
    }
    v13 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1((uint64_t)v5, v13);
  }
LABEL_6:

}

- (BOOL)triggerUnsolicitedDynamicAsset:(id)a3 assetTag:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke;
  v12[3] = &unk_24CEA3DE0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __58__UARPController_triggerUnsolicitedDynamicAsset_assetTag___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "unsolicitedDynamicAssetForAccessory:assetTag:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

- (void)setPowerLogStagingWindowPeriodSeconds:(unsigned int)a3
{
  -[UARPPowerLogManager setStagingWindowPeriodSeconds:](self->_powerLogManager, "setStagingWindowPeriodSeconds:", *(_QWORD *)&a3);
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *xpcLog;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  char v17;
  uint64_t v18;
  NSObject *delegateQueue;
  id v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  char *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[UARPController assetAvailablityUpdateForAccessory:assetID:]";
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }
  objc_msgSend(v7, "assetVersion");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  objc_msgSend(v6, "stagedFirmwareVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
  objc_msgSend(v6, "stagedFirmwareVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = uarpVersionCompareStrings((uint64_t)v12, v13);

  if (v14 != 1)
  {
    v23 = self->_xpcLog;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v7, "assetVersion");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stagedFirmwareVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_212D08000, v24, OS_LOG_TYPE_DEFAULT, "assetID assetVersion %@ is not greater than staged version %@ for accessory %@", buf, 0x20u);

    }
  }
  else
  {
LABEL_6:
    objc_msgSend(v7, "assetVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAvailableFirmwareVersion:", v15);

    -[UARPController updatePendingAssetsForAccessory:assetID:](self, "updatePendingAssetsForAccessory:assetID:", v6, v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    v18 = MEMORY[0x24BDAC760];
    if ((v17 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke;
      block[3] = &unk_24CEA3E08;
      block[4] = self;
      v31 = v6;
      v32 = v7;
      dispatch_async(delegateQueue, block);

    }
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = self->_delegateQueue;
      v27[0] = v18;
      v27[1] = 3221225472;
      v27[2] = __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2;
      v27[3] = &unk_24CEA3E08;
      v27[4] = self;
      v28 = v6;
      v29 = v7;
      dispatch_async(v22, v27);

    }
  }

}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "assetAvailablityUpdateForAccessory:assetID:", a1[5], a1[6]);

}

void __61__UARPController_assetAvailablityUpdateForAccessory_assetID___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "assetAvailablityUpdateForAccessoryID:assetID:", a1[5], a1[6]);

}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, block);

}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  os_log_t *v4;

  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    -[os_log_t assetAvailablityUpdateForAccessory:assetID:](v4, "assetAvailablityUpdateForAccessory:assetID:", v3, a1[6]);
  }
  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1();
  }

}

- (void)supplementalAssetAvailablityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  id v6;
  id v7;
  NSObject *xpcLog;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[UARPController supplementalAssetAvailablityUpdateForAccessory:assetName:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __75__UARPController_supplementalAssetAvailablityUpdateForAccessory_assetName___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 64), "supplementalAssetUpdated:assetName:error:", a1[5], a1[6], 0);
}

- (void)supplementalAssetAvailablityUpdateForAccessoryID:(id)a3 assetName:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, block);

}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  os_log_t *v4;

  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)*(v2 - 1);
  if (v3)
  {
    -[os_log_t supplementalAssetAvailablityUpdateForAccessory:assetName:](v4, "supplementalAssetAvailablityUpdateForAccessory:assetName:", v3, a1[6]);
  }
  else if (os_log_type_enabled(v4[3], OS_LOG_TYPE_ERROR))
  {
    __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1();
  }

}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *delegateQueue;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        -[UARPController createSupportedAccessory:accessoryMetadata:](self, "createSupportedAccessory:accessoryMetadata:", v9, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v10, "count"))
  {

    v10 = 0;
  }
  delegateQueue = self->_delegateQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke;
  v20[3] = &unk_24CEA3E30;
  v20[4] = self;
  v21 = v10;
  v22 = v9;
  v23 = a5;
  v18 = v9;
  v19 = v10;
  dispatch_async(delegateQueue, v20);

}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v10 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "supportedAccessories:forProductGroup:isComplete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
LABEL_5:

    return;
  }
  v5 = objc_opt_respondsToSelector();

  v6 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)(v6 + 168));
    objc_msgSend(v10, "supportedAccessories:forProductGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_5;
  }
  v7 = *(NSObject **)(v6 + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1(v7, v8, v9);
}

- (void)handleReceivedAttestationCertificates:(id)a3 forSubjectKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *delegateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(delegateQueue, block);

}

void __80__UARPController_handleReceivedAttestationCertificates_forSubjectKeyIdentifier___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "attestationCertificates:forSubjectKeyIdentifier:", a1[5], a1[6]);

}

- (id)createSupportedAccessory:(id)a3 accessoryMetadata:(id)a4
{
  id v4;
  UARPAccessoryHardwareCHIP *v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  UARPAccessoryHardwareCHIP *v9;
  UARPSupportedAccessory *v10;
  void *v11;
  void *v12;
  UARPSupportedAccessory *v13;

  v4 = a4;
  if (objc_msgSend(v4, "accessoryCapability") == 16)
  {
    v5 = [UARPAccessoryHardwareCHIP alloc];
    objc_msgSend(v4, "productGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "productNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UARPAccessoryHardwareCHIP initWithVendorID:productID:hardwareID:metadata:](v5, "initWithVendorID:productID:hardwareID:metadata:", v7, (unsigned __int16)objc_msgSend(v8, "integerValue"), 0, v4);

    v10 = [UARPSupportedAccessory alloc];
    objc_msgSend(v4, "productGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UARPSupportedAccessory initWithHardwareID:productGroup:productNumber:capabilities:](v10, "initWithHardwareID:productGroup:productNumber:capabilities:", v9, v11, v12, objc_msgSend(v4, "accessoryCapability"));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)queryFirmwareUpdateResultForAccessory:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke;
  v7[3] = &unk_24CEA2488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __56__UARPController_queryFirmwareUpdateResultForAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "queryFirmwareUpdateResultForAccessory:", *(_QWORD *)(a1 + 40));
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  int64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__UARPController_queryProperty_forAccessory___block_invoke;
  v11[3] = &unk_24CEA3E58;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(internalQueue, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __45__UARPController_queryProperty_forAccessory___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "queryPropertyInternal:forAccessory:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 40), "addPendingClientPropertyQuery:", *(_QWORD *)(a1 + 56));
  return result;
}

- (int64_t)queryPropertyInternal:(unint64_t)a3 forAccessory:(id)a4
{
  return -[UARPUploader queryProperty:forAccessory:](self->_uploader, "queryProperty:forAccessory:", a3, a4);
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke;
  v13[3] = &unk_24CEA3E80;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(delegateQueue, v13);

}

void __66__UARPController_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
    objc_msgSend(v4, "firmwareUpdateResult:vendorSpecificStatus:error:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 0, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 0, v15, v16, v17, v18, v19);

    }
  }

}

void __63__UARPController_queryCompleteForAccessory_manufacturer_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:manufacturer:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 1, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 1))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 1, v15, v16, v17, v18, v19);

    }
  }

}

void __60__UARPController_queryCompleteForAccessory_modelName_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:modelName:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 4, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 4, v15, v16, v17, v18, v19);

    }
  }

}

void __66__UARPController_queryCompleteForAccessory_firmwareVersion_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:firmwareVersion:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 5, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 5, v15, v16, v17, v18, v19);

    }
  }

}

void __72__UARPController_queryCompleteForAccessory_stagedFirmwareVersion_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:stagedFirmwareVersion:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 6, v15, v16, v17, v18, v19);

    }
  }

}

void __56__UARPController_queryCompleteForAccessory_stats_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:stats:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 3, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 3, v15, v16, v17, v18, v19);

    }
  }

}

void __66__UARPController_queryCompleteForAccessory_hardwareVersion_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:hardwareVersion:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 2, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 2))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 2, v15, v16, v17, v18, v19);

    }
  }

}

void __63__UARPController_queryCompleteForAccessory_serialNumber_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:serialNumber:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 11, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 11))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 11, v15, v16, v17, v18, v19);

    }
  }

}

void __67__UARPController_queryCompleteForAccessory_appleModelNumber_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:appleModelNumber:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  NSObject *xpcLog;
  id WeakRetained;
  char v19;
  NSObject *delegateQueue;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *);
  void *v25;
  UARPController *v26;
  id v27;
  __CFString *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  objc_msgSend(v8, "modelNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_isInternalBuild
    && -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("unfused"))
    && (objc_msgSend(v12, "fusingOverrideUnfused"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    objc_msgSend(v12, "fusingOverrideUnfused");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("dev"));

    if (v15)
      v16 = CFSTR("dev");
    else
      v16 = CFSTR("prod");
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_ERROR, "Overriding hw fusing for %{public}@, from %{public}@ to %{public}@", buf, 0x20u);
    }

  }
  else
  {
    v16 = v9;
  }
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 12, v16, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 12))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke;
      v25 = &unk_24CEA3EA8;
      v26 = self;
      v21 = v8;
      v27 = v21;
      v28 = v16;
      v29 = v10;
      dispatch_async(delegateQueue, &v22);
      objc_msgSend(v21, "removePendingClientPropertyQuery:", 12, v22, v23, v24, v25, v26);

    }
  }

}

void __63__UARPController_queryCompleteForAccessory_hwFusingType_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:hwFusingType:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  NSObject *delegateQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  UARPController *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UARPController updateProperty:value:forAccessory:](self, "updateProperty:value:forAccessory:", 13, v9, v8);
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 13))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke;
      v18 = &unk_24CEA3EA8;
      v19 = self;
      v14 = v8;
      v20 = v14;
      v21 = v9;
      v22 = v10;
      dispatch_async(delegateQueue, &v15);
      objc_msgSend(v14, "removePendingClientPropertyQuery:", 13, v15, v16, v17, v18, v19);

    }
  }

}

void __63__UARPController_queryCompleteForAccessory_friendlyName_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "queryCompleteForAccessory:friendlyName:error:", a1[5], a1[6], a1[7]);

}

- (void)queryCompleteForAccessory:(id)a3 manifestPrefix:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *delegateQueue;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *);
  void *v16;
  UARPController *v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 14)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke;
    v16 = &unk_24CEA3EA8;
    v17 = self;
    v12 = v8;
    v18 = v12;
    v19 = v9;
    v20 = v10;
    dispatch_async(delegateQueue, &v13);
    objc_msgSend(v12, "removePendingClientPropertyQuery:", 14, v13, v14, v15, v16, v17);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_manifestPrefix_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:manifestPrefix:error:", a1[5], a1[6], a1[7]);
}

- (void)queryCompleteForAccessory:(id)a3 boardID:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 15)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 15, v12, v13, v14, v15, v16);

  }
}

uint64_t __58__UARPController_queryCompleteForAccessory_boardID_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:boardID:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 chipID:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 16)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 16, v12, v13, v14, v15, v16);

  }
}

uint64_t __57__UARPController_queryCompleteForAccessory_chipID_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:chipID:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 chipRevision:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 17)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 17, v12, v13, v14, v15, v16);

  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_chipRevision_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:chipRevision:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 ecid:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 18)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 18, v12, v13, v14, v15, v16);

  }
}

uint64_t __55__UARPController_queryCompleteForAccessory_ecid_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:ecid:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 securityDomain:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 19)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 19, v12, v13, v14, v15, v16);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_securityDomain_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:securityDomain:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 securityMode:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 20)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 20, v12, v13, v14, v15, v16);

  }
}

uint64_t __63__UARPController_queryCompleteForAccessory_securityMode_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:securityMode:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 productionMode:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 21)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 21, v12, v13, v14, v15, v16);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_productionMode_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:productionMode:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 epoch:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 22)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke;
    v15 = &unk_24CEA3D68;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 22, v12, v13, v14, v15, v16);

  }
}

uint64_t __56__UARPController_queryCompleteForAccessory_epoch_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "queryCompleteForAccessory:epoch:error:", a1[5], a1[7], a1[6]);
}

- (void)queryCompleteForAccessory:(id)a3 enableMixMatch:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 23)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke;
    v15 = &unk_24CEA3E30;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 23, v12, v13, v14, v15, v16);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_enableMixMatch_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "queryCompleteForAccessory:enableMixMatch:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)queryCompleteForAccessory:(id)a3 liveNonce:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 24)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke;
    v15 = &unk_24CEA3E30;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 24, v12, v13, v14, v15, v16);

  }
}

uint64_t __60__UARPController_queryCompleteForAccessory_liveNonce_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "queryCompleteForAccessory:liveNonce:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)queryCompleteForAccessory:(id)a3 prefixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 25)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke;
    v15 = &unk_24CEA3E30;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 25, v12, v13, v14, v15, v16);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_prefixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "queryCompleteForAccessory:prefixNeedsLUN:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)queryCompleteForAccessory:(id)a3 suffixNeedsLUN:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UARPController *v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "clientQueryPendingForProperty:", 26)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke;
    v15 = &unk_24CEA3E30;
    v16 = self;
    v11 = v8;
    v17 = v11;
    v19 = a4;
    v18 = v9;
    dispatch_async(delegateQueue, &v12);
    objc_msgSend(v11, "removePendingClientPropertyQuery:", 26, v12, v13, v14, v15, v16);

  }
}

uint64_t __65__UARPController_queryCompleteForAccessory_suffixNeedsLUN_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "queryCompleteForAccessory:suffixNeedsLUN:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7
{
  id v12;
  id v13;
  id WeakRetained;
  int v15;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;

  v12 = a3;
  v13 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = objc_msgSend(v13, "reportProgressToDelegates");

    if (v15)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke;
      block[3] = &unk_24CEA3ED0;
      block[4] = self;
      v18 = v12;
      v19 = v13;
      v20 = a5;
      v21 = a6;
      dispatch_async(delegateQueue, block);

    }
  }
  else
  {

  }
  if (!a7)
    -[UARPControllerInternalDelegate sendFirmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:](self->_internalDelegate, "sendFirmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:", v12, v13, a5, a6);

}

void __86__UARPController_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "firmwareStagingProgress:assetID:bytesSent:bytesTotal:", a1[5], a1[6], a1[7], a1[8]);

}

- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  UARPPowerLogManager *powerLogManager;
  id v9;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  powerLogManager = self->_powerLogManager;
  objc_msgSend(a3, "getID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager updateStagingProgressForAccessoryID:requestedOffset:requestedLength:](powerLogManager, "updateStagingProgressForAccessoryID:requestedOffset:requestedLength:", v9, v7, v6);

}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  id WeakRetained;
  int v13;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "reportProgressToDelegates");

    if (v13)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke;
      block[3] = &unk_24CEA3ED0;
      block[4] = self;
      v16 = v10;
      v17 = v11;
      v18 = a5;
      v19 = a6;
      dispatch_async(delegateQueue, block);

    }
  }
  else
  {

  }
}

void __77__UARPController_assetSolicitationProgress_assetID_bytesReceived_bytesTotal___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "assetSolicitationProgress:assetID:bytesReceived:bytesTotal:", a1[5], a1[6], a1[7], a1[8]);

}

- (id)unsolicitedDynamicAssetOffered:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke;
  v13[3] = &unk_24CEA3DE0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__UARPController_unsolicitedDynamicAssetOffered_assetID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  UARPAsset *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v9 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", *(_QWORD *)(a1 + 48));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v13 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        objc_msgSend(*(id *)(v13 + 16), "setObject:forKey:", v12, *v5);
      }
      else
      {
        v14 = *(NSObject **)(v13 + 24);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1((uint64_t)v5, v14);
      }
    }
  }

}

- (void)accessoryTransportNeeded:(id)a3 isNeeded:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
    -[UARPController accessoryTransportNeeded:isNeeded:].cold.1();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke;
  block[3] = &unk_24CEA3CF0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  char v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v9 = *(NSObject **)(v7 + 48);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2;
      block[3] = &unk_24CEA3CF0;
      block[4] = v7;
      v11 = v8;
      v12 = *(_BYTE *)(a1 + 48);
      dispatch_async(v9, block);

    }
  }

}

void __52__UARPController_accessoryTransportNeeded_isNeeded___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(WeakRetained, "accessoryTransportNeeded:isNeeded:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__UARPController_addAccessory_assetID___block_invoke;
  v12[3] = &unk_24CEA3EF8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __39__UARPController_addAccessory_assetID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addAccessory:assetID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v2, "getID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "useAssetAvailabilityNotifications"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "registerForAssetAvailabilityNotification:", *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 32), "removeAccessory:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "registerForSupplementalAssetAvailabilityNotification:", *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 32), "removeAccessory:", *(_QWORD *)(a1 + 40));
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "bsdNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v18;
      *(_QWORD *)&v7 = 138412290;
      v16 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_debug_impl(&dword_212D08000, v12, OS_LOG_TYPE_DEBUG, "registering bsd notification; %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "registerForGenericNotification:notificationName:", *(_QWORD *)(a1 + 40), v11, v16);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v8);
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v13 = *(void **)(a1 + 40);
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
      objc_msgSend(v13, "getID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAccessoryID:", v15);

    }
  }
}

- (BOOL)removeAccessory:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__UARPController_removeAccessory___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __34__UARPController_removeAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAccessory:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryUnreachableInternal:", *(_QWORD *)(a1 + 40));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "getID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", v3);

    objc_msgSend(*(id *)(a1 + 32), "unregisterForAssetAvailabilityNotification:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "unregisterForSupplementalAssetAvailabilityNotification:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    objc_msgSend(v4, "getID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAccessoryID:", v6);

  }
}

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__UARPController_changeAssetLocation_assetID___block_invoke;
  v12[3] = &unk_24CEA3EF8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __46__UARPController_changeAssetLocation_assetID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "changeAssetLocation:assetID:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)requestConsent:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__UARPController_requestConsent___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_requestConsent___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "requestConsent:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__UARPController_revokeConsentRequest___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __39__UARPController_revokeConsentRequest___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "revokeConsentRequest:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UARPController_pauseAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __50__UARPController_pauseAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "assetTransfersPaused") & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_6:
      v4 = v5;
      goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "pauseAssetTransfersForAccessory:", *(_QWORD *)(a1 + 40));
    v4 = v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v5, "setAssetTransfersPaused:", 1);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UARPController_resumeAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __51__UARPController_resumeAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "getID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "assetTransfersPaused"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_6;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "resumeAssetTransfersForAccessory:", *(_QWORD *)(a1 + 40));
    v4 = v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v5, "setAssetTransfersPaused:", 0);
LABEL_6:
      v4 = v5;
    }
  }

}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke;
  block[3] = &unk_24CEA3F20;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

uint64_t __73__UARPController_downloadAvailableFirmwareUpdate_assetID_withUserIntent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "downloadAvailableFirmwareUpdate:assetID:withUserIntent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__UARPController_downloadReleaseNotes_assetID___block_invoke;
  v12[3] = &unk_24CEA3EF8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

uint64_t __47__UARPController_downloadReleaseNotes_assetID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "downloadReleaseNotes:assetID:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_24CEA3ED0;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_sync(internalQueue, block);

}

uint64_t __86__UARPController_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "sendFirmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:", a1[5], a1[6], a1[7], a1[8]);
}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_24CEA3F48;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_sync(internalQueue, block);

}

uint64_t __80__UARPController_sendFirmwareUpdateProgressForUARPConsent_bytesSent_bytesTotal___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "sendFirmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:", a1[5], a1[6], a1[7]);
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_24CEA3F48;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_sync(internalQueue, block);

}

uint64_t __62__UARPController_progressForUARPConsent_bytesSent_bytesTotal___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "progressForUARPConsent:bytesSent:bytesTotal:", a1[5], a1[6], a1[7]);
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_24CEA3F48;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_sync(internalQueue, block);

}

uint64_t __74__UARPController_progressForUARPConsentInPostLogout_bytesSent_bytesTotal___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "progressForUARPConsentInPostLogout:bytesSent:bytesTotal:", a1[5], a1[6], a1[7]);
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __66__UARPController_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "enableTRMSystemAuthenticationForRegistryEntryID:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __67__UARPController_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "disableTRMSystemAuthenticationForRegistryEntryID:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)checkForUpdate:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__UARPController_checkForUpdate___block_invoke;
  block[3] = &unk_24CEA3CA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __33__UARPController_checkForUpdate___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "checkForUpdate:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  -[UARPControllerInternalDelegate sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:](self->_internalDelegate, "sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:", a3, a4, a5);
}

- (BOOL)getSupportedAccessoriesInternal:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke;
  block[3] = &unk_24CEA3F20;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)internalQueue;
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "getSupportedAccessories:assetID:batchRequest:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "useAssetAvailabilityNotifications"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "registerForSupportedAccessoriesAvailability:", *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 32), OS_LOG_TYPE_ERROR))
      {
        __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)getSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6;
  UARPAssetID *v7;

  v6 = a3;
  v7 = -[UARPAssetID initWithLocationType:remoteURL:]([UARPAssetID alloc], "initWithLocationType:remoteURL:", a4, 0);
  LOBYTE(self) = -[UARPController getSupportedAccessoriesInternal:assetID:batchRequest:](self, "getSupportedAccessoriesInternal:assetID:batchRequest:", v6, v7, 0);

  return (char)self;
}

- (BOOL)getBatchedSupportedAccessories:(id)a3 assetLocationType:(int64_t)a4
{
  id v6;
  UARPAssetID *v7;

  v6 = a3;
  v7 = -[UARPAssetID initWithLocationType:remoteURL:]([UARPAssetID alloc], "initWithLocationType:remoteURL:", a4, 0);
  LOBYTE(self) = -[UARPController getSupportedAccessoriesInternal:assetID:batchRequest:](self, "getSupportedAccessoriesInternal:assetID:batchRequest:", v6, v7, 1);

  return (char)self;
}

- (BOOL)getAttestationCertificatesInternal:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke;
  v12[3] = &unk_24CEA3EF8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = a1 + 40;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 16) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "getAttestationCertificates:assetID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 16) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "useAssetAvailabilityNotifications"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "registerForAttestationCertificatesAvailability:", *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 32), OS_LOG_TYPE_ERROR))
      {
        __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)getAttestationCertificates:(id)a3 assetLocationType:(int64_t)a4
{
  id v6;
  UARPAssetID *v7;

  v6 = a3;
  v7 = -[UARPAssetID initWithLocationType:remoteURL:]([UARPAssetID alloc], "initWithLocationType:remoteURL:", a4, 0);
  LOBYTE(self) = -[UARPController getAttestationCertificatesInternal:assetID:](self, "getAttestationCertificatesInternal:assetID:", v6, v7);

  return (char)self;
}

- (void)assetAvailabilityNotificationPosted:(int)a3
{
  NSMutableDictionary *assetAvailabilityNotificationTokenDict;
  void *v5;
  void *v6;
  NSObject *controllerLog;
  UARPControllerInternalDelegate *internalDelegate;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](assetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[UARPController assetAvailabilityNotificationPosted:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: Asset availability notification for %@", (uint8_t *)&v11, 0x16u);
    }
    internalDelegate = self->_internalDelegate;
    objc_msgSend(v6, "getID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPControllerInternalDelegate getAssetIDForAccessoryID:](internalDelegate, "getAssetIDForAccessoryID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UARPController assetAvailablityUpdateForAccessory:assetID:](self, "assetAvailablityUpdateForAccessory:assetID:", v6, v10);
    }
    else if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController assetAvailabilityNotificationPosted:].cold.2();
    }

  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController assetAvailabilityNotificationPosted:].cold.1();
  }

}

- (BOOL)registerForAssetAvailabilityNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  NSObject *internalQueue;
  uint32_t v8;
  NSMutableDictionary *assetAvailabilityNotificationTokenDict;
  void *v10;
  _QWORD handler[4];
  id v13;
  id location;
  int out_token;

  v4 = a3;
  out_token = -1;
  objc_msgSend(v4, "getID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)objc_msgSend(v5, "assetAvailabilityUpdateNotification");

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __59__UARPController_registerForAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_24CEA3F70;
  objc_copyWeak(&v13, &location);
  v8 = notify_register_dispatch(v6, &out_token, internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
      -[UARPController registerForAssetAvailabilityNotification:].cold.1();
  }
  else
  {
    assetAvailabilityNotificationTokenDict = self->_assetAvailabilityNotificationTokenDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](assetAvailabilityNotificationTokenDict, "setObject:forKeyedSubscript:", v4, v10);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __59__UARPController_registerForAssetAvailabilityNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "assetAvailabilityNotificationPosted:", a2);

}

- (void)availabilityNotificationForSupportedAccessoriesPosted:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *assetAvailabilityUARPProductGroupNotificationTokenDict;
  void *v6;
  void *v7;
  NSObject *controllerLog;
  void *v9;
  UARPControllerInternalDelegate *internalDelegate;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](assetAvailabilityUARPProductGroupNotificationTokenDict, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[UARPController availabilityNotificationForSupportedAccessoriesPosted:]";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: availability notification for supported accessories for productGroup %@", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  internalDelegate = self->_internalDelegate;
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPControllerInternalDelegate getSupportedAccessories:forProductGroup:](internalDelegate, "getSupportedAccessories:forProductGroup:", v9, v11);

  -[UARPController supportedAccessories:forProductGroup:isComplete:](self, "supportedAccessories:forProductGroup:isComplete:", v9, v7, v12);
  if ((_DWORD)v12)
    -[UARPController unregisterForSupportedAccessoriesAvailability:](self, "unregisterForSupportedAccessoriesAvailability:", v3);

}

- (BOOL)registerForSupportedAccessoriesAvailability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *internalQueue;
  uint32_t v12;
  NSMutableDictionary *assetAvailabilityUARPProductGroupNotificationTokenDict;
  void *v14;
  _QWORD handler[4];
  id v17;
  id location;
  int out_token;

  v4 = a3;
  out_token = -1;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("com.apple.accessoryUpdater.uarp.supportedAccessoriesMetadataAvailable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke;
  handler[3] = &unk_24CEA3F70;
  objc_copyWeak(&v17, &location);
  v12 = notify_register_dispatch(v10, &out_token, internalQueue, handler);
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
  }
  else if (v4)
  {
    assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](assetAvailabilityUARPProductGroupNotificationTokenDict, "setObject:forKeyedSubscript:", v4, v14);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12 == 0;
}

void __62__UARPController_registerForSupportedAccessoriesAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "availabilityNotificationForSupportedAccessoriesPosted:", a2);

}

- (id)assetAvailabilityTokenForAccessory:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_assetAvailabilityNotificationTokenDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqual:", v12))
        {
          v13 = v11;

          v8 = v13;
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unregisterForAssetAvailabilityNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *controllerLog;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UARPController assetAvailabilityTokenForAccessory:](self, "assetAvailabilityTokenForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    notify_cancel(objc_msgSend(v5, "intValue"));
    -[NSMutableDictionary removeObjectForKey:](self->_assetAvailabilityNotificationTokenDict, "removeObjectForKey:", v6);
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[UARPController unregisterForAssetAvailabilityNotification:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)unregisterForSupportedAccessoriesAvailability:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *assetAvailabilityUARPProductGroupNotificationTokenDict;
  void *v6;
  NSObject *controllerLog;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  notify_cancel(a3);
  assetAvailabilityUARPProductGroupNotificationTokenDict = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](assetAvailabilityUARPProductGroupNotificationTokenDict, "removeObjectForKey:", v6);

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[UARPController unregisterForSupportedAccessoriesAvailability:]";
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_DEFAULT, "%s: unregistered for SupportedAccessoriesAvailability", (uint8_t *)&v8, 0xCu);
  }
}

- (void)unregisterForAllAssetAvailabilityNotifications
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_assetAvailabilityNotificationTokenDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "intValue"));
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_assetAvailabilityNotificationTokenDict, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_assetAvailabilityUARPProductGroupNotificationTokenDict;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "intValue", (_QWORD)v13));
      }
      while (v10 != v12);
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeAllObjects](self->_assetAvailabilityUARPProductGroupNotificationTokenDict, "removeAllObjects");
}

- (void)supplementalAssetAvailabilityNotificationPosted:(int)a3
{
  NSMutableDictionary *supplementalAssetAvailabilityNotificationTokenDict;
  void *v5;
  void *v6;
  NSObject *controllerLog;
  UARPControllerInternalDelegate *internalDelegate;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](supplementalAssetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[UARPController supplementalAssetAvailabilityNotificationPosted:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: Supplemental Asset availability notification for %@", (uint8_t *)&v11, 0x16u);
    }
    internalDelegate = self->_internalDelegate;
    objc_msgSend(v6, "getID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPControllerInternalDelegate getSupplementalAssetNameForAccessoryID:](internalDelegate, "getSupplementalAssetNameForAccessoryID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UARPController supplementalAssetAvailablityUpdateForAccessory:assetName:](self, "supplementalAssetAvailablityUpdateForAccessory:assetName:", v6, v10);
    }
    else if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
    {
      -[UARPController supplementalAssetAvailabilityNotificationPosted:].cold.2();
    }

  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController supplementalAssetAvailabilityNotificationPosted:].cold.1();
  }

}

- (BOOL)registerForSupplementalAssetAvailabilityNotification:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  NSObject *internalQueue;
  uint32_t v8;
  NSMutableDictionary *supplementalAssetAvailabilityNotificationTokenDict;
  void *v10;
  _QWORD handler[4];
  id v13;
  id location;
  int out_token;

  v4 = a3;
  out_token = -1;
  objc_msgSend(v4, "getID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)objc_msgSend(v5, "supplementalAssetAvailabilityUpdateNotification");

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke;
  handler[3] = &unk_24CEA3F70;
  objc_copyWeak(&v13, &location);
  v8 = notify_register_dispatch(v6, &out_token, internalQueue, handler);
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
      -[UARPController registerForAssetAvailabilityNotification:].cold.1();
  }
  else
  {
    supplementalAssetAvailabilityNotificationTokenDict = self->_supplementalAssetAvailabilityNotificationTokenDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](supplementalAssetAvailabilityNotificationTokenDict, "setObject:forKeyedSubscript:", v4, v10);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8 == 0;
}

void __71__UARPController_registerForSupplementalAssetAvailabilityNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "supplementalAssetAvailabilityNotificationPosted:", a2);

}

- (id)supplementalAssetAvailabilityTokenForAccessory:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_supplementalAssetAvailabilityNotificationTokenDict, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqual:", v12))
        {
          v13 = v11;

          v8 = v13;
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unregisterForSupplementalAssetAvailabilityNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *controllerLog;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UARPController supplementalAssetAvailabilityTokenForAccessory:](self, "supplementalAssetAvailabilityTokenForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    notify_cancel(objc_msgSend(v5, "intValue"));
    -[NSMutableDictionary removeObjectForKey:](self->_supplementalAssetAvailabilityNotificationTokenDict, "removeObjectForKey:", v6);
    controllerLog = self->_controllerLog;
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[UARPController unregisterForSupplementalAssetAvailabilityNotification:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: unregistered %@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)unregisterForAllSupplementalAssetAvailabilityNotifications
{
  NSMutableDictionary *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_supplementalAssetAvailabilityNotificationTokenDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "intValue", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_supplementalAssetAvailabilityNotificationTokenDict, "removeAllObjects");
}

- (void)availabilityNotificationForAttestationCertificatesPosted:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  void *v6;
  void *v7;
  NSObject *controllerLog;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x24BDAC8D0];
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[UARPController availabilityNotificationForAttestationCertificatesPosted:]";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: availability notification for attestation certificates for subjectKeyIdentifier %@", (uint8_t *)&v10, 0x16u);
  }
  -[UARPControllerInternalDelegate getAttestationCertificates:](self->_internalDelegate, "getAttestationCertificates:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPController handleReceivedAttestationCertificates:forSubjectKeyIdentifier:](self, "handleReceivedAttestationCertificates:forSubjectKeyIdentifier:", v9, v7);
  -[UARPController unregisterForAttestationCertificatesAvailability:](self, "unregisterForAttestationCertificatesAvailability:", v3);

}

- (BOOL)registerForAttestationCertificatesAvailability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *internalQueue;
  uint32_t v9;
  NSMutableDictionary *attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  void *v11;
  uint64_t v13;
  _QWORD handler[4];
  id v15;
  id location;
  int out_token;

  v4 = a3;
  out_token = -1;
  if (v4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable"), v4);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), CFSTR("com.apple.accessoryUpdater.uarp.attestationCertificatesAvailable"), v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke;
  handler[3] = &unk_24CEA3F70;
  objc_copyWeak(&v15, &location);
  v9 = notify_register_dispatch(v7, &out_token, internalQueue, handler);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_controllerLog, OS_LOG_TYPE_ERROR))
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
  }
  else if (v4)
  {
    attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, "setObject:forKeyedSubscript:", v4, v11);

  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9 == 0;
}

void __65__UARPController_registerForAttestationCertificatesAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "availabilityNotificationForAttestationCertificatesPosted:", a2);

}

- (void)unregisterForAttestationCertificatesAvailability:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  void *v6;
  NSObject *controllerLog;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  notify_cancel(a3);
  attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, "removeObjectForKey:", v6);

  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[UARPController unregisterForAttestationCertificatesAvailability:]";
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_DEFAULT, "%s: unregistered for AttestationCertificatesAvailability", (uint8_t *)&v8, 0xCu);
  }
}

- (void)unregisterForAllAttestationCertificatesAvailabilityNotifications
{
  NSMutableDictionary *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "intValue", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, "removeAllObjects");
}

- (BOOL)registerForGenericNotification:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  NSObject *controllerLog;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  const char *v14;
  NSObject *internalQueue;
  uint32_t v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSMutableDictionary *generalNotificationTokenDict;
  void *v21;
  _QWORD handler[4];
  id v24;
  id location;
  int out_token;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v7;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "Registering for BSD notification %@", buf, 0xCu);
  }
  -[NSMutableDictionary allValues](self->_generalNotificationTokenDict, "allValues");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "isEqualToString:", v7))
        {
          v19 = self->_controllerLog;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v7;
            _os_log_impl(&dword_212D08000, v19, OS_LOG_TYPE_INFO, "Already registered for notification %@", buf, 0xCu);
          }

          v17 = 1;
          goto LABEL_21;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
  }

  out_token = -1;
  objc_initWeak(&location, self);
  v13 = objc_retainAutorelease(v7);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  internalQueue = self->_internalQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __66__UARPController_registerForGenericNotification_notificationName___block_invoke;
  handler[3] = &unk_24CEA3F70;
  objc_copyWeak(&v24, &location);
  v16 = notify_register_dispatch(v14, &out_token, internalQueue, handler);
  v17 = v16 == 0;
  v18 = self->_controllerLog;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[UARPController registerForSupportedAccessoriesAvailability:].cold.1();
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_212D08000, v18, OS_LOG_TYPE_INFO, "Registered for BSD notification %@", buf, 0xCu);
    }
    generalNotificationTokenDict = self->_generalNotificationTokenDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", out_token);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](generalNotificationTokenDict, "setObject:forKeyedSubscript:", v13, v21);

  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_21:

  return v17;
}

void __66__UARPController_registerForGenericNotification_notificationName___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "genericNotificationPosted:", a2);

}

- (void)genericNotificationPosted:(int)a3
{
  NSMutableDictionary *generalNotificationTokenDict;
  void *v5;
  void *v6;
  NSObject *controllerLog;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  generalNotificationTokenDict = self->_generalNotificationTokenDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](generalNotificationTokenDict, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  controllerLog = self->_controllerLog;
  if (v6)
  {
    if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[UARPController genericNotificationPosted:]";
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: Notification posted %@", buf, 0x16u);
    }
    -[NSMutableDictionary allValues](self->_accessories, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "bsdNotifications", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v6);

          if (v17)
            -[UARPUploader genericNotification:notificationName:error:](self->_uploader, "genericNotification:notificationName:error:", v15, v6, 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  else if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPController genericNotificationPosted:].cold.1();
  }

}

- (void)unregisterForAllGenericNotifications
{
  NSMutableDictionary *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_generalNotificationTokenDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "intValue", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_generalNotificationTokenDict, "removeAllObjects");
}

- (BOOL)createUploader
{
  UARPControllerDelegateProtocol **p_delegate;
  id WeakRetained;
  char v5;
  void *v6;
  UARPUploader *v7;
  UARPUploader *uploader;
  UARPUploaderUARP *v9;
  _BOOL4 v10;
  NSObject *controllerLog;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_uploader)
    goto LABEL_6;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = (UARPUploader *)objc_msgSend(v6, "newUploader");
    uploader = self->_uploader;
    self->_uploader = v7;

  }
  else
  {
    v9 = objc_alloc_init(UARPUploaderUARP);
    v6 = self->_uploader;
    self->_uploader = &v9->super;
  }

  if (-[UARPUploader setController:](self->_uploader, "setController:", self))
  {
LABEL_6:
    LOBYTE(v10) = 1;
  }
  else
  {
    controllerLog = self->_controllerLog;
    v10 = os_log_type_enabled(controllerLog, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      -[UARPController createUploader].cold.1(controllerLog, v12, v13, v14, v15, v16, v17, v18);
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (BOOL)startTapToRadar:(id)a3
{
  id v4;
  NSObject *internalQueue;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  if (-[UARPController createUploader](self, "createUploader"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__UARPController_startTapToRadar___block_invoke;
    block[3] = &unk_24CEA3F98;
    block[4] = self;
    v10 = &v11;
    v9 = v4;
    dispatch_async(internalQueue, block);
    v6 = *((_BYTE *)v12 + 24) != 0;

  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__UARPController_startTapToRadar___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v2 = *(NSObject **)(a1[4] + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "start TTR called.", v13, 2u);
  }
  v3 = a1[4];
  v4 = *(void **)(v3 + 64);
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "startTapToRadar:", a1[5]);
  }
  else
  {
    v5 = *(NSObject **)(v3 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __34__UARPController_startTapToRadar___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)stopTapToRadar
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__UARPController_stopTapToRadar__block_invoke;
  block[3] = &unk_24CEA38E0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __32__UARPController_stopTapToRadar__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "stop TTR called.", v4, 2u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopTapToRadar");
}

- (void)startPersonalizationHelperService:(id)a3 entitlement:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *personalizationQueue;
  UARPPersonalizationManager *v10;
  UARPPersonalizationManager *personalizationManager;

  v6 = a4;
  v7 = a3;
  v8 = (OS_dispatch_queue *)dispatch_queue_create("UARPController personalization", 0);
  personalizationQueue = self->_personalizationQueue;
  self->_personalizationQueue = v8;

  v10 = -[UARPPersonalizationManager initWithMachServiceName:entitlement:delegate:queue:]([UARPPersonalizationManager alloc], "initWithMachServiceName:entitlement:delegate:queue:", v7, v6, self, self->_personalizationQueue);
  personalizationManager = self->_personalizationManager;
  self->_personalizationManager = v10;

}

- (id)pendingTatsuRequests
{
  NSObject *controllerLog;
  NSObject *internalQueue;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = (id)objc_opt_new();
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[UARPController pendingTatsuRequests]";
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__UARPController_pendingTatsuRequests__block_invoke;
  v9[3] = &unk_24CEA3800;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(internalQueue, v9);
  v5 = self->_controllerLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v11[5];
    *(_DWORD *)buf = 136315394;
    v17 = "-[UARPController pendingTatsuRequests]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_212D08000, v5, OS_LOG_TYPE_INFO, "%s: Pending Tatsu Requests %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __38__UARPController_pendingTatsuRequests__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPController pendingTatsuRequests]_block_invoke";
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "pendingTssRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v3);

}

- (void)tssResponse:(id)a3
{
  id v4;
  NSObject *controllerLog;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  controllerLog = self->_controllerLog;
  if (os_log_type_enabled(controllerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[UARPController tssResponse:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212D08000, controllerLog, OS_LOG_TYPE_INFO, "%s: Tatsu Response, %@", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__UARPController_tssResponse___block_invoke;
  v8[3] = &unk_24CEA2488;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(internalQueue, v8);

}

uint64_t __30__UARPController_tssResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[UARPController tssResponse:]_block_invoke";
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "%s: on queue", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "tssResponse:", *(_QWORD *)(a1 + 40));
}

- (void)assetStagingPause:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *delegateQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__UARPController_assetStagingPause___block_invoke;
    v8[3] = &unk_24CEA2488;
    v8[4] = self;
    v9 = v4;
    dispatch_async(delegateQueue, v8);

  }
}

void __36__UARPController_assetStagingPause___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(WeakRetained, "assetStagingPause:", *(_QWORD *)(a1 + 40));

}

- (void)assetStagingResume:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  NSObject *delegateQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__UARPController_assetStagingResume___block_invoke;
    v8[3] = &unk_24CEA2488;
    v8[4] = self;
    v9 = v4;
    dispatch_async(delegateQueue, v8);

  }
}

void __37__UARPController_assetStagingResume___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(WeakRetained, "assetStagingResume:", *(_QWORD *)(a1 + 40));

}

- (UARPControllerDelegateProtocol)delegate
{
  return (UARPControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalizationManager, 0);
  objc_storeStrong((id *)&self->_powerLogManager, 0);
  objc_storeStrong((id *)&self->_generalNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_attestationCertificatesAvailabilitySubjectKeyIdentifierNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityUARPProductGroupNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_supplementalAssetAvailabilityNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityNotificationTokenDict, 0);
  objc_storeStrong((id *)&self->_packetDumper, 0);
  objc_storeStrong((id *)&self->_updateFirmwareAnalytics, 0);
  objc_storeStrong((id *)&self->_chipInfoDelegate, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_personalizationQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_controllerLog, 0);
  objc_storeStrong((id *)&self->_xpcLog, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

void __60__UARPController_cancelFirmwareStagingForAccessory_assetID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_212D08000, v0, v1, "%s: Unable to find pending asset for %@ with ID %@", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)recvDataFromAccessory:(NSObject *)a1 data:(uint64_t)a2 error:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[UARPController recvDataFromAccessory:data:error:]";
  OUTLINED_FUNCTION_1_1(&dword_212D08000, a1, a3, "%s: Zero Length Message from Transport", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)updatePendingAssetsForAccessory:(void *)a1 assetID:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_212D08000, v1, v4, "Unable to initialize asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __49__UARPController_sendMessageToAccessory_uarpMsg___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, (uint64_t)v0, "Failed to send message to %@ (%@)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)solicitDynamicAsset:assetID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_212D08000, v0, v1, "Attempting to solicit a dynamic asset without a valid URL; %@", v2);
  OUTLINED_FUNCTION_1();
}

void __46__UARPController_solicitDynamicAsset_assetID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_10_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_212D08000, v2, v4, "Unable to initialize asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __66__UARPController_dynamicAssetAvailableForAccessory_assetID_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_10_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "localPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_212D08000, v2, v4, "Unable to initialize dynamic asset at %@", v5);

  OUTLINED_FUNCTION_3_1();
}

void __63__UARPController_assetAvailablityUpdateForAccessoryID_assetID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%{public}s: Unrecognized accessory %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __77__UARPController_supplementalAssetAvailablityUpdateForAccessoryID_assetName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%{public}s: Unrecognized accessory %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __66__UARPController_supportedAccessories_forProductGroup_isComplete___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[UARPController supportedAccessories:forProductGroup:isComplete:]_block_invoke";
  OUTLINED_FUNCTION_1_1(&dword_212D08000, a1, a3, "%{public}s: Delegate doesn't implement a supportedAccessories:forProductGroup:(isComplete:) callback", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryTransportNeeded:isNeeded:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, (uint64_t)v0, "Accessory busy state %@ for %@", v1);
  OUTLINED_FUNCTION_1();
}

void __71__UARPController_getSupportedAccessoriesInternal_assetID_batchRequest___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_212D08000, v0, v1, "%s: Unable to register for Supported Accessories Availability for productGroup %@, assetID %@", v2);
  OUTLINED_FUNCTION_3_1();
}

void __61__UARPController_getAttestationCertificatesInternal_assetID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_212D08000, v0, v1, "%s: Unable to register for Attestation Certificates Availability for subjectKeyIdentifier %@, assetID %@", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)assetAvailabilityNotificationPosted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_212D08000, v0, v1, "%s: Unable to locate accessory for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)assetAvailabilityNotificationPosted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%s: Unable to retrieve asset ID for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)registerForAssetAvailabilityNotification:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_5(&dword_212D08000, v0, v1, "notify_register_dispatch failed for %s (%u)", v2, v3);
  OUTLINED_FUNCTION_1();
}

- (void)registerForSupportedAccessoriesAvailability:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_5(&dword_212D08000, v0, v1, "notify_register_dispatch failed for %@ (%u)");
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_212D08000, v0, v1, "%s: Unable to locate accessory for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetAvailabilityNotificationPosted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%s: Unable to retrieve asset Name for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)genericNotificationPosted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_3(&dword_212D08000, v0, v1, "%s: Unable to locate notification name for token %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)createUploader
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Unable to create Uploader.", a5, a6, a7, a8, 0);
}

void __34__UARPController_startTapToRadar___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Cannot Start TTR Mode - no accessories connected.", a5, a6, a7, a8, 0);
}

@end
