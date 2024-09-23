@implementation BluetoothBridge

- (void)startLEScanning:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_block_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MGGetStringAnswer();
  if (v5 && (v6 = v5, v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("AudioAccessory")), CFRelease(v6), v7))
  {
    v8 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B151000, v8, OS_LOG_TYPE_INFO, "Can't start LE scans on HomePod", buf, 2u);
    }
  }
  else
  {
    v9 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 67109376;
      v20 = -[BluetoothBridge targetUserSession](self, "targetUserSession");
      v21 = 1024;
      v22 = v3;
      _os_log_impl(&dword_21B151000, v10, OS_LOG_TYPE_DEFAULT, "Starting LE scanning (%d) fast:%d", buf, 0xEu);

    }
    -[BluetoothBridge deviceDiscovery](self, "deviceDiscovery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscoveryFlags:", objc_msgSend(v11, "discoveryFlags") | 0x8000);

    -[BluetoothBridge deviceDiscovery](self, "deviceDiscovery");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBleRSSIThresholdHint:", 4294967221);

    if (v3)
    {
      -[BluetoothBridge deviceDiscovery](self, "deviceDiscovery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBleScanRate:", 50);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__BluetoothBridge_startLEScanning___block_invoke;
      block[3] = &unk_24DE51350;
      block[4] = self;
      v14 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS, block);
      -[BluetoothBridge setLowerScanRate:](self, "setLowerScanRate:", v14);

      v15 = dispatch_time(0, 10000000000);
      -[BluetoothBridge queue](self, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      -[BluetoothBridge lowerScanRate](self, "lowerScanRate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_after(v15, v16, v17);

    }
  }
}

- (CBDiscovery)deviceDiscovery
{
  return (CBDiscovery *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

void __31__BluetoothBridge_addListeners__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(void);
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_INFO, "Audio devices changed", buf, 2u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x24BDBB250], "devicesWithDiscoveryFlags:error:", 0x80000A08000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138412546;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(*(id *)(a1 + 32), "createDescriptionWithDevice:", v9, v16);
        if (v10)
        {
          v11 = (const void *)v10;
          v12 = BluetoothEndpointManagerLogComponent;
          if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            v23 = 2112;
            v24 = v9;
            _os_log_impl(&dword_21B151000, v12, OS_LOG_TYPE_INFO, "HAL: %@ %@", buf, 0x16u);
          }
          BluetoothEndpointManagerHandleUpdateEvent((uint64_t)v11, objc_msgSend(*(id *)(a1 + 32), "manager"));
          CFRelease(v11);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "activation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "activation");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();

  }
  else
  {
    v15 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B151000, v15, OS_LOG_TYPE_DEFAULT, "Activation block is nil", buf, 2u);
    }
  }
}

- (id)activation
{
  return objc_getProperty(self, a2, 64, 1);
}

+ (id)sharedBluetoothBridge
{
  if (sharedBluetoothBridge_sharedBridgeToken != -1)
    dispatch_once(&sharedBluetoothBridge_sharedBridgeToken, &__block_literal_global);
  return (id)sharedBluetoothBridge_sharedBluetoothBridge;
}

void __40__BluetoothBridge_sharedBluetoothBridge__block_invoke()
{
  BluetoothBridge *v0;
  void *v1;

  v0 = objc_alloc_init(BluetoothBridge);
  v1 = (void *)sharedBluetoothBridge_sharedBluetoothBridge;
  sharedBluetoothBridge_sharedBluetoothBridge = (uint64_t)v0;

}

- (BluetoothBridge)init
{
  BluetoothBridge *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  CUSystemMonitor *v6;
  CUSystemMonitor *systemMonitor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BluetoothBridge;
  v2 = -[BluetoothBridge init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("BluetoothBridge", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x24BE29840]);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v6;

    -[CUSystemMonitor setFirstUnlockHandler:](v2->_systemMonitor, "setFirstUnlockHandler:", &__block_literal_global_3);
    -[CUSystemMonitor activateWithCompletion:](v2->_systemMonitor, "activateWithCompletion:", 0);
  }
  return v2;
}

void __23__BluetoothBridge_init__block_invoke()
{
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __23__BluetoothBridge_init__block_invoke_cold_1();
}

- (void)setManager:(OpaqueFigEndpointManager *)a3
{
  NSObject *v4;
  _QWORD block[5];

  self->_manager = a3;
  -[BluetoothBridge queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BluetoothBridge_setManager___block_invoke;
  block[3] = &unk_24DE51350;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __30__BluetoothBridge_setManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addListeners");
  return objc_msgSend(*(id *)(a1 + 32), "getHFPSupportStatus");
}

- (void)getHFPSupportStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Error getting controller info to determine HFP support", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __38__BluetoothBridge_getHFPSupportStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getHFPSupportStatus");
}

- (__CFDictionary)createDescriptionWithDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  char v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  unsigned __int8 v13;
  __CFDictionary *v14;
  int v16;
  void *v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  const __CFString *v41;
  void *v42;
  void *v43;
  float v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  float v50;
  void *v51;
  void *v52;
  float v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  unsigned int v57;
  unint64_t v58;
  _BOOL4 v59;
  unint64_t v60;
  _BOOL4 v61;

  v4 = a3;
  if (-[BluetoothBridge shouldRemoveDevice:](self, "shouldRemoveDevice:", v4)
    || !objc_msgSend(MEMORY[0x24BDBB2B8], "isDeviceSupportedWithType:VIDsrc:VID:PID:", objc_msgSend(v4, "deviceType"), objc_msgSend(v4, "vendorIDSource"), objc_msgSend(v4, "vendorID"), (unsigned __int16)objc_msgSend(v4, "productID")))
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v5 = -[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4);
  -[BluetoothBridge systemMonitor](self, "systemMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "firstUnlocked");

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      -[BluetoothBridge createDescriptionWithDevice:].cold.1();
    goto LABEL_8;
  }
  v8 = objc_msgSend(v4, "gapaFlags");
  if ((objc_msgSend(v4, "deviceFlags") & 0x1000000) != 0)
  {
    if ((objc_msgSend(v4, "deviceFlags") & 4) != 0)
      v16 = MGGetBoolAnswer();
    else
      v16 = 0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("WirelessSplitter"));

    v9 = v18 | v16;
    v57 = objc_msgSend(v4, "listeningMode");
    v19 = (objc_msgSend(v4, "deviceFlags") >> 26) & 2;
    v20 = v19 & 0xFFFFFFFE | (objc_msgSend(v4, "deviceFlags") >> 26) & 1;
    if (objc_msgSend(v4, "autoAncCapability") == 1)
      v10 = v20 | 4;
    else
      v10 = v20;
    v60 = ((unint64_t)objc_msgSend(v4, "deviceFlags") >> 40) & 1;
    v12 = objc_msgSend(v4, "smartRoutingMode") == 1;
    v58 = ((unint64_t)objc_msgSend(v4, "deviceFlags") >> 28) & 1;
    v11 = ((unint64_t)objc_msgSend(v4, "deviceFlags") >> 23) & 1;
    v13 = objc_msgSend(v4, "spatialAudioMode");
    objc_msgSend(v4, "deviceFlags");
    v59 = objc_msgSend(v4, "conversationDetectCapability") == 1;
    v61 = objc_msgSend(v4, "conversationDetectConfig") == 1;
  }
  else
  {
    v9 = 0;
    v57 = 0;
    v10 = 0;
    v11 = 0;
    v58 = 0;
    v60 = 0;
    v12 = 0;
    v59 = 0;
    v61 = 0;
    v13 = -1;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "supportedServices") & 0x10000) != 0)
  {
    v14 = 0;
  }
  else
  {
    v56 = (v8 & 2) == 0;
    -[BluetoothBridge addressFromDevice:](self, "addressFromDevice:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("DeviceID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("SupportedFormats"));

    -[BluetoothBridge nameFromDevice:](self, "nameFromDevice:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("Name"));

    v25 = -[BluetoothBridge isConnected:](self, "isConnected:", v4);
    v26 = *MEMORY[0x24BDBD270];
    v27 = *MEMORY[0x24BDBD268];
    if (v25)
      v28 = *MEMORY[0x24BDBD270];
    else
      v28 = *MEMORY[0x24BDBD268];
    objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("Connected"));
    if (v9)
      v29 = v26;
    else
      v29 = v27;
    objc_msgSend(v21, "setObject:forKey:", v29, CFSTR("Shareable"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v57);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v30, CFSTR("ListeningMode"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("SupportedListeningModes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v32, CFSTR("SupportsSpatialAudio"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v33, CFSTR("SpatialAudioMode"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v58);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v34, CFSTR("SpatialAudioEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v60);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v35, CFSTR("SupportsSmartRouting"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v36, CFSTR("SmartRoutingEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v59);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v37, CFSTR("SupportsConversationDetect"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v61);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v38, CFSTR("ConversationDetectEnable"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v56);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v39, CFSTR("IsGenuineAirPods"));

    v40 = objc_msgSend(v4, "appearanceValue");
    if ((v40 - 2112) >= 6)
    {
      if ((v40 - 2369) >= 2)
      {
        if (v40 == 2625)
          v41 = CFSTR("HearingAid");
        else
          v41 = CFSTR("Headphones");
      }
      else
      {
        v41 = CFSTR("Headset");
      }
    }
    else
    {
      v41 = CFSTR("Speaker");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BT%@%d,%d"), v41, objc_msgSend(v4, "vendorID"), objc_msgSend(v4, "productID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v42, CFSTR("ModelID"));

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "batteryLevelCase");
    if (v44 != 0.0)
    {
      v45 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "batteryLevelCase");
      objc_msgSend(v45, "numberWithFloat:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v46, *MEMORY[0x24BDC0E30]);

    }
    objc_msgSend(v4, "batteryLevelLeft");
    if (v47 != 0.0)
    {
      v48 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "batteryLevelLeft");
      objc_msgSend(v48, "numberWithFloat:");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v49, *MEMORY[0x24BDC0E38]);

    }
    objc_msgSend(v4, "batteryLevelRight");
    if (v50 != 0.0)
    {
      v51 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "batteryLevelRight");
      objc_msgSend(v51, "numberWithFloat:");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v52, *MEMORY[0x24BDC0E40]);

    }
    objc_msgSend(v4, "batteryLevelMain");
    if (v53 != 0.0)
    {
      v54 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "batteryLevelMain");
      objc_msgSend(v54, "numberWithFloat:");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v55, *MEMORY[0x24BDC0E48]);

    }
    objc_msgSend(v21, "setObject:forKey:", v43, CFSTR("BatteryLevels"));
    v14 = v21;

  }
LABEL_9:

  return v14;
}

- (void)addListeners
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21B151000, a2, OS_LOG_TYPE_ERROR, "Failed to add AudioDevice listener %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void __31__BluetoothBridge_addListeners__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "discoveryFlags");
    CUPrintFlags64();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_21B151000, v5, OS_LOG_TYPE_DEFAULT, "Device found %@ with flags:%@", buf, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRemoveDevice:", v3))
  {
    v13 = CFSTR("DeviceID");
    objc_msgSend(*(id *)(a1 + 32), "uidFromDevice:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    BluetoothEndpointManagerHandleRemove(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), objc_msgSend(*(id *)(a1 + 32), "manager"));

    objc_msgSend(*(id *)(a1 + 32), "addressFromDevice:", v3, CFSTR("DeviceID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    BluetoothEndpointManagerHandleRemove(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), objc_msgSend(*(id *)(a1 + 32), "manager"));

  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "createDescriptionWithDevice:", v3);
    if (v9)
    {
      v10 = (const void *)v9;
      BluetoothEndpointManagerHandleUpdateEvent(v9, objc_msgSend(*(id *)(a1 + 32), "manager"));
      CFRelease(v10);
    }
  }

}

void __31__BluetoothBridge_addListeners__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_21B151000, v4, OS_LOG_TYPE_DEFAULT, "Device lost %@", buf, 0xCu);
  }
  if ((objc_msgSend(v3, "deviceFlags") & 0x4000) != 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "createDescriptionWithDevice:", v3);
    if (v7)
    {
      v8 = (const void *)v7;
      BluetoothEndpointManagerHandleUpdateEvent(v7, objc_msgSend(*(id *)(a1 + 32), "manager"));
      CFRelease(v8);
    }
  }
  else
  {
    v11 = CFSTR("DeviceID");
    objc_msgSend(*(id *)(a1 + 32), "uidFromDevice:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    BluetoothEndpointManagerHandleRemove(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), objc_msgSend(*(id *)(a1 + 32), "manager"));

    objc_msgSend(*(id *)(a1 + 32), "addressFromDevice:", v3, CFSTR("DeviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    BluetoothEndpointManagerHandleRemove(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1), objc_msgSend(*(id *)(a1 + 32), "manager"));

  }
}

void __31__BluetoothBridge_addListeners__block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  if (v2)
  {
    v3 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      __31__BluetoothBridge_addListeners__block_invoke_32_cold_1((uint64_t)v2, v3, v4);
  }

}

void __35__BluetoothBridge_startLEScanning___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_DEFAULT, "Dropping scan rate to low", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBleScanRate:", 30);

}

- (void)stopLEScanning
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  intptr_t v9;
  void *v10;
  uint8_t v11[16];

  v3 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21B151000, v3, OS_LOG_TYPE_DEFAULT, "Stop LE scanning", v11, 2u);
  }
  -[BluetoothBridge deviceDiscovery](self, "deviceDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscoveryFlags:", objc_msgSend(v4, "discoveryFlags") & 0xFFFFFFFFFFFF7FFFLL);

  -[BluetoothBridge deviceDiscovery](self, "deviceDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBleScanRate:", 0);

  -[BluetoothBridge lowerScanRate](self, "lowerScanRate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[BluetoothBridge lowerScanRate](self, "lowerScanRate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dispatch_block_testcancel(v8);

    if (!v9)
    {
      -[BluetoothBridge lowerScanRate](self, "lowerScanRate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_block_cancel(v10);

    }
  }
}

- (BOOL)shouldRemoveDevice:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int16 v18;
  __int16 v19;
  __int16 v20;

  v4 = a3;
  if (!v4 || !-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4))
    goto LABEL_29;
  if ((objc_msgSend(v4, "deviceFlags") & 0x4000) != 0 || (objc_msgSend(v4, "deviceFlags") & 0x2000) != 0)
  {
    if (-[BluetoothBridge isConnected:](self, "isConnected:", v4) || (objc_msgSend(v4, "discoveryFlags") & 0x8000) != 0)
    {
      v8 = objc_msgSend(v4, "connectedServices");
      v9 = objc_msgSend(v4, "connectedServices");
      if ((v8 & 0x400000) == 0 || (v9 & 0x10000) != 0)
      {
        v10 = objc_msgSend(v4, "deviceFlags") & 0x1000000000;
        v11 = objc_msgSend(v4, "deviceFlags");
        v12 = objc_msgSend(v4, "deviceFlags");
        v13 = (v12 >> 37) & 1;
        if ((v12 & 0x2000000000) == 0 && v10)
          LODWORD(v13) = objc_msgSend(v4, "primaryPlacement") == 3
                      || objc_msgSend(v4, "primaryPlacement") == 0;
        v14 = objc_msgSend(v4, "deviceFlags");
        v15 = (v14 >> 38) & 1;
        if ((v14 & 0x4000000000) == 0 && v10)
          LODWORD(v15) = objc_msgSend(v4, "secondaryPlacement") == 3
                      || objc_msgSend(v4, "secondaryPlacement") == 0;
        if ((v11 & 0x800000000) == 0)
          LODWORD(v15) = 1;
        if ((v13 & v15) != 1)
        {
          v16 = 0;
          goto LABEL_30;
        }
        v5 = BluetoothEndpointManagerLogComponent;
        if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 0;
          v6 = "No device usable";
          v7 = (uint8_t *)&v18;
          goto LABEL_28;
        }
      }
    }
    else
    {
      v5 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v6 = "Disconnected with no nearby status";
        v7 = (uint8_t *)&v19;
        goto LABEL_28;
      }
    }
  }
  else
  {
    v5 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 0;
      v6 = "No longer paired";
      v7 = (uint8_t *)&v20;
LABEL_28:
      _os_log_impl(&dword_21B151000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
LABEL_29:
  v16 = 1;
LABEL_30:

  return v16;
}

- (BOOL)isHALPublished:(unsigned __int8)a3 device:(id)a4
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  unsigned int v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  AudioObjectID v16;
  int v17;
  NSObject *v18;
  const char *v19;
  UInt32 ioDataSize;
  CFTypeRef outData;
  uint64_t v22;
  uint64_t v23;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  -[BluetoothBridge addressFromDevice:](self, "addressFromDevice:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v6) = *(_DWORD *)"bolg";
  v23 = 0;
  outData = 0;
  v22 = 0;
  ioDataSize = 0;
  LODWORD(v6) = 1919186467;
  inAddress.mElement = 0;
  *(_QWORD *)&inAddress.mSelector = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-btaudio"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AudioObjectGetPropertyDataSize(1u, &inAddress, 0, 0, (UInt32 *)&v23 + 1))
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      -[BluetoothBridge isHALPublished:device:].cold.1();
    goto LABEL_4;
  }
  v10 = HIDWORD(v23);
  v11 = (char *)malloc_type_malloc(HIDWORD(v23), 0xF4EC74A5uLL);
  if (!v11)
  {
LABEL_4:
    v8 = 0;
    goto LABEL_5;
  }
  v12 = v11;
  if (AudioObjectGetPropertyData(1u, &inAddress, 0, 0, (UInt32 *)&v23 + 1, v11))
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      -[BluetoothBridge isHALPublished:device:].cold.1();
    free(v12);
    goto LABEL_4;
  }
  if (v10 < 4)
  {
LABEL_18:
    free(v12);
    v18 = BluetoothEndpointManagerLogComponent;
    v8 = 0;
    if (!os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v19 = "HFP";
    if (v4 == 1)
      v19 = "A2DP";
    *(_DWORD *)buf = 136315394;
    v26 = v19;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_21B151000, v18, OS_LOG_TYPE_DEFAULT, "%s is not published for %@", buf, 0x16u);
    goto LABEL_4;
  }
  v13 = 0;
  v14 = v10 >> 2;
  if (v10 >> 2 <= 1)
    v14 = 1;
  v15 = 4 * v14;
  while (1)
  {
    v16 = *(_DWORD *)&v12[v13];
    ioDataSize = 8;
    v22 = 0x676C6F6275696420;
    LODWORD(v23) = 0;
    if (!AudioObjectGetPropertyData(v16, (const AudioObjectPropertyAddress *)&v22, 0, 0, &ioDataSize, &outData))
    {
      v17 = objc_msgSend(v7, "isEqual:", outData);
      CFRelease(outData);
      if (v17)
        break;
    }
    v13 += 4;
    if (v15 == v13)
      goto LABEL_18;
  }
  free(v12);
  v8 = 1;
LABEL_5:

  return v8;
}

- (BOOL)isConnected:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      -[BluetoothBridge isConnected:].cold.1();
    goto LABEL_14;
  }
  if (!-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4))
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      -[BluetoothBridge isConnected:].cold.2();
    goto LABEL_14;
  }
  if ((-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4) & 4) != 0
    && !-[BluetoothBridge isHALPublished:device:](self, "isHALPublished:device:", 4, v4)
    || (-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4) & 1) != 0
    && !-[BluetoothBridge isHALPublished:device:](self, "isHALPublished:device:", 1, v4)
    || (-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v4) & 2) != 0
    && !-[BluetoothBridge isHALPublished:device:](self, "isHALPublished:device:", 2, v4))
  {
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = 1;
LABEL_15:

  return v5;
}

- (unsigned)supportedFormats:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  void *v9;
  NSObject *v10;
  unsigned __int8 v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (objc_msgSend(v4, "supportedServices") >> 4) & 1;
    v7 = v6 & 0xFFFFFFFD | (2 * (objc_msgSend(v5, "supportedServices") & 1));
    v8 = (objc_msgSend(v5, "supportedServices") >> 14) & 4 | v7;
    if (!v7 && v8 <= 3 && (objc_msgSend(v5, "deviceFlags") & 0x1000000) != 0)
    {
      v9 = (void *)BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
        -[BluetoothBridge supportedFormats:].cold.1(v9, self, v5);
      LOBYTE(v8) = 3;
    }
    if ((objc_msgSend(v5, "deviceFlags") & 0x20000000) != 0)
    {
      v10 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_21B151000, v10, OS_LOG_TYPE_DEFAULT, "%@ is guest not in contacts removing handsfree service", (uint8_t *)&v13, 0xCu);
      }
      LOBYTE(v8) = v8 & 0xFD;
    }
    if (-[BluetoothBridge noHFPSupport](self, "noHFPSupport"))
      v11 = v8 & 0xFD;
    else
      v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceFromIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBB240]);
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(MEMORY[0x24BDBB250], "devicesWithDiscoveryFlags:error:", 0x80000A08000, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEquivalentToCBDevice:compareFlags:", v4, 8, (_QWORD)v14) & 1) != 0)
        {
          v12 = v10;

          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_21B151000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find a paired device with identifier %@", buf, 0xCu);
  }
  v12 = v4;
LABEL_13:

  return v12;
}

- (id)addressFromDevice:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "btAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSDataAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nameFromDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[BluetoothBridge addressFromDevice:](self, "addressFromDevice:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)uidFromDevice:(id)a3
{
  return (id)objc_msgSend(a3, "identifier");
}

- (void)connectToAddress:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  dispatch_block_t v19;
  void (**v20)(void);
  dispatch_time_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  void (**v29)(id, _QWORD);
  BluetoothBridge *v30;
  _QWORD block[5];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[BluetoothBridge deviceFromIdentifier:](self, "deviceFromIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BluetoothBridge isConnected:](self, "isConnected:", v7))
  {
    v6[2](v6, 0);
  }
  else
  {
    v8 = (void *)BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[BluetoothBridge nameFromDevice:](self, "nameFromDevice:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v10;
      _os_log_impl(&dword_21B151000, v9, OS_LOG_TYPE_DEFAULT, "Connect to device %@", buf, 0xCu);

    }
    v11 = objc_alloc_init(MEMORY[0x24BDBB238]);
    v12 = objc_alloc_init(MEMORY[0x24BDBB230]);
    objc_msgSend(v12, "setPeerDevice:", v7);
    objc_msgSend(v12, "setServiceFlags:", 0xFFFFFFFFLL);
    if ((-[BluetoothBridge supportedFormats:](self, "supportedFormats:", v7) & 4) != 0)
      objc_msgSend(v12, "setConnectionFlags:", 256);
    if ((objc_msgSend(v7, "deviceFlags") & 0x20000000) != 0)
    {
      v13 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B151000, v13, OS_LOG_TYPE_DEFAULT, "Wireless Splitter this is a guest not in contacts blocking HFP & GATT services", buf, 2u);
      }
      objc_msgSend(v12, "setServiceFlags:", 524312);
    }
    v14 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke;
    v35[3] = &unk_24DE51408;
    v35[4] = self;
    v15 = v7;
    v36 = v15;
    objc_msgSend(v12, "activateWithCompletion:", v35);
    v16 = objc_alloc_init(MEMORY[0x24BDBB248]);
    objc_msgSend(v16, "setAudioRouteHidden:", 0);
    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_48;
    v33[3] = &unk_24DE51160;
    v34 = v11;
    v17 = v11;
    objc_msgSend(v17, "modifyDevice:settings:completion:", v15, v16, v33);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_49;
    block[3] = &unk_24DE51430;
    v18 = v6;
    block[4] = self;
    v32 = v18;
    v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    -[BluetoothBridge setActivationTimeoutBlock:](self, "setActivationTimeoutBlock:", v19);

    v24 = v14;
    v25 = 3221225472;
    v26 = __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_50;
    v27 = &unk_24DE51458;
    v30 = self;
    v28 = v15;
    v29 = v18;
    -[BluetoothBridge setActivation:](self, "setActivation:", &v24);
    -[BluetoothBridge activation](self, "activation", v24, v25, v26, v27);
    v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v20[2]();

    v21 = dispatch_time(0, 20000000000);
    -[BluetoothBridge queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    -[BluetoothBridge activationTimeoutBlock](self, "activationTimeoutBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v21, v22, v23);

  }
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BluetoothEndpointManagerLogComponent;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
      __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_cold_1(a1, v4);
  }
  else if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    objc_msgSend(v6, "nameFromDevice:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_21B151000, v7, OS_LOG_TYPE_DEFAULT, "Baseband connected to %@", (uint8_t *)&v9, 0xCu);

  }
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_48_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_49(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR))
    __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_49_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setActivation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setActivationTimeoutBlock:", 0);
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (objc_msgSend(*(id *)(a1 + 48), "isConnected:", *(_QWORD *)(a1 + 32)))
  {
    v2 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_DEFAULT, "Activated", v4, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "setActivation:", 0);
    objc_msgSend(*(id *)(a1 + 48), "activationTimeoutBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v3);

  }
}

- (OS_dispatch_semaphore)connectedSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectedSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OpaqueFigEndpointManager)manager
{
  return self->_manager;
}

- (void)setDeviceDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return (CUSystemMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)lowerScanRate
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setLowerScanRate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setActivation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)activationTimeoutBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setActivationTimeoutBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)noHFPSupport
{
  return self->_noHFPSupport;
}

- (void)setNoHFPSupport:(BOOL)a3
{
  self->_noHFPSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activationTimeoutBlock, 0);
  objc_storeStrong(&self->_activation, 0);
  objc_storeStrong(&self->_lowerScanRate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_connectedSemaphore, 0);
}

void __23__BluetoothBridge_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "First unlock handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createDescriptionWithDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Can't get PID/VID before first unlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __31__BluetoothBridge_addListeners__block_invoke_32_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_21B151000, a2, a3, "Starting Discovery error %@", (uint8_t *)&v3);
}

- (void)isHALPublished:device:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Couldn't get audio objects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isConnected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "No device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isConnected:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Device doesn't support audio?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)supportedFormats:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "nameFromDevice:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 1024;
  v10 = objc_msgSend(a3, "supportedServices");
  _os_log_error_impl(&dword_21B151000, v5, OS_LOG_TYPE_ERROR, "Error Service Mask isn't right %@ has service mask 0x%X", (uint8_t *)&v7, 0x12u);

  OUTLINED_FUNCTION_3();
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "nameFromDevice:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_4(&dword_21B151000, v4, v6, "Error connecting to %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3();
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Failed to set audio route hidden to no", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__BluetoothBridge_connectToAddress_completionHandler___block_invoke_49_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B151000, v0, v1, "Activate Timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
