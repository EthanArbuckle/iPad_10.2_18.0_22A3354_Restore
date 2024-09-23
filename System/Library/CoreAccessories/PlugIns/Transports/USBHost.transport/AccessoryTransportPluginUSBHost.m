@implementation AccessoryTransportPluginUSBHost

+ (__CFDictionary)_createVIDPIDMatchingDictionary
{
  __CFDictionary *Mutable;
  const __CFAllocator *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  int v7;
  int valuePtr;

  v7 = 10;
  valuePtr = 7563;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("idVendor"), v4);
  CFRelease(v4);
  v5 = CFNumberCreate(v3, kCFNumberSInt32Type, &v7);
  CFDictionarySetValue(Mutable, CFSTR("bInterfaceClass"), v5);
  CFRelease(v5);
  return Mutable;
}

- (NSString)pluginName
{
  return (NSString *)CFSTR("USB Host Transport PlugIn");
}

- (void)initPlugin
{
  objc_super v3;

  init_logging();
  v3.receiver = self;
  v3.super_class = (Class)AccessoryTransportPluginUSBHost;
  -[ACCTransportPlugin initPlugin](&v3, sel_initPlugin);
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_t v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  dispatch_source_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t v30[16];
  _QWORD handler[5];
  id v32;
  uint8_t buf[8];
  objc_super v34;

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Starting USB Host transport plugin...", buf, 2u);
  }

  v34.receiver = self;
  v34.super_class = (Class)AccessoryTransportPluginUSBHost;
  -[ACCTransportPlugin startPlugin](&v34, sel_startPlugin);
  +[AccessoryEAInterface initializeSessionClose](AccessoryEAInterface, "initializeSessionClose");
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AccessoryTransportPluginUSBHost setAccessoryConnections:](self, "setAccessoryConnections:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AccessoryTransportPluginUSBHost setAccessoryNativeUSBEndpoints:](self, "setAccessoryNativeUSBEndpoints:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AccessoryTransportPluginUSBHost setActiveEAInterfaces:](self, "setActiveEAInterfaces:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AccessoryTransportPluginUSBHost setActiveUSBCDCInterfaces:](self, "setActiveUSBCDCInterfaces:", v9);

  v10 = dispatch_queue_create("USBHostTransportPluginConnectionsLock", 0);
  -[AccessoryTransportPluginUSBHost setAccessoryConnectionsLock:](self, "setAccessoryConnectionsLock:", v10);

  v11 = dispatch_queue_create("USBHostTransportPluginActiveEAInterfacesLock", 0);
  -[AccessoryTransportPluginUSBHost setActiveEAInterfacesLock:](self, "setActiveEAInterfacesLock:", v11);

  v12 = dispatch_queue_create("USBHostTransportPluginNativeUSBEndpointsLock", 0);
  -[AccessoryTransportPluginUSBHost setAccessoryNativeUSBEndpointsLock:](self, "setAccessoryNativeUSBEndpointsLock:", v12);

  v13 = dispatch_queue_create("com.apple.accessoryd.usbhost.notificationQueue", 0);
  v14 = (void *)usbHostNotificationQ;
  usbHostNotificationQ = (uint64_t)v13;

  -[AccessoryTransportPluginUSBHost setAccessoryiAPIntefaceTrafficWaitListCount:](self, "setAccessoryiAPIntefaceTrafficWaitListCount:", 0);
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AccessoryTransportPluginUSBHost setAccessoryiAPIntefaceTrafficWaitList:](self, "setAccessoryiAPIntefaceTrafficWaitList:", v15);

  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v16);
  -[AccessoryTransportPluginUSBHost setAccessoryiAPIntefaceTrafficTimer:](self, "setAccessoryiAPIntefaceTrafficTimer:", v17);

  -[AccessoryTransportPluginUSBHost accessoryiAPIntefaceTrafficTimer](self, "accessoryiAPIntefaceTrafficTimer");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v18, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[AccessoryTransportPluginUSBHost accessoryiAPIntefaceTrafficTimer](self, "accessoryiAPIntefaceTrafficTimer");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke;
  handler[3] = &unk_24D706A08;
  handler[4] = self;
  objc_copyWeak(&v32, (id *)buf);
  dispatch_source_set_event_handler(v19, handler);

  -[AccessoryTransportPluginUSBHost accessoryiAPIntefaceTrafficTimer](self, "accessoryiAPIntefaceTrafficTimer");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v21);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__handleOpenSocketFromAccessoryToAppNotification_, *MEMORY[0x24BE1A0B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__handleOpenSocketFromAppToAccessoryNotification_, *MEMORY[0x24BE1A0B8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_startConfiguringIOKit, CFSTR("ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification"), 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v25 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_2171C1000, v25, OS_LOG_TYPE_DEFAULT, "Registered for USB Host notifications", v30, 2u);
  }

  -[AccessoryTransportPluginUSBHost setIsRunning:](self, "setIsRunning:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "postNotificationName:object:", CFSTR("ACCTransportIOAccessory_USBHostPluginArrivedNotification"), 0);

  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke_22;
  v28[3] = &unk_24D706A30;
  objc_copyWeak(&v29, (id *)buf);
  -[ACCTransportPlugin setHandler:forEndpointProperty:](self, "setHandler:forEndpointProperty:", v28, *MEMORY[0x24BE1A180]);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

void __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  unint64_t v30;
  id *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  dispatch_time_t v56;
  uint64_t v57;
  id v58;
  id obj;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  unint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v2 = 0x253E63000uLL;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Wait for iAP timer fired!", buf, 2u);
  }

  if (platform_systemInfo_supportsUSBC())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v72 = "-[AccessoryTransportPluginUSBHost startPlugin]_block_invoke";
      v73 = 1024;
      v74 = 186;
      v75 = 2112;
      v76 = v8;
      _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d trafficWaitList %@", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v57 = a1;
    v9 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "accessoryiAPIntefaceTrafficWaitList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
    if (v13)
    {
      v14 = v13;
      v60 = *(_QWORD *)v67;
      v15 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v67 != v60)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v18 = objc_loadWeakRetained(v9);
          objc_msgSend(v18, "accessoryiAPIntefaceTrafficWaitList");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "timeIntervalSince1970");
          v22 = v21;
          objc_msgSend(v20, "creationTime");
          v24 = v23;
          v25 = *(id **)(v2 + 1032);
          v26 = gNumLogObjects;
          if (v25 && gNumLogObjects >= 1)
          {
            v27 = *v25;
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v72 = (const char *)v25;
              v73 = 1024;
              v74 = v26;
              _os_log_error_impl(&dword_2171C1000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v28 = v15;
            v27 = v15;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v72 = "-[AccessoryTransportPluginUSBHost startPlugin]_block_invoke";
            v73 = 1024;
            v74 = 198;
            v75 = 2112;
            v76 = v17;
            v77 = 2112;
            v78 = v20;
            v79 = 2048;
            v80 = (unint64_t)((v22 - v24) * 1000.0);
            _os_log_impl(&dword_2171C1000, v27, OS_LOG_TYPE_DEFAULT, "%s:%d connectionUUID %@, iapInterface %@, timeSinceCreationMs %llu", buf, 0x30u);
          }

          v29 = acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("WaitForiAPTrafficDelayMS"));
          v30 = 1500;
          if (v29)
            v30 = v29;
          if (v30 < (unint64_t)((v22 - v24) * 1000.0))
          {
            v31 = *(id **)(v2 + 1032);
            v32 = gNumLogObjects;
            if (v31 && gNumLogObjects >= 1)
            {
              v33 = *v31;
            }
            else
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v72 = (const char *)v31;
                v73 = 1024;
                v74 = v32;
                _os_log_error_impl(&dword_2171C1000, v15, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v34 = v15;
              v33 = v15;
            }
            v2 = 0x253E63000;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v72 = (const char *)((v22 - v24) * 1000.0);
              _os_log_impl(&dword_2171C1000, v33, OS_LOG_TYPE_DEFAULT, "No iAP traffic for %llu msec!!!", buf, 0xCu);
            }

            objc_msgSend(v20, "unlockOtherInterfaces");
            objc_msgSend(v58, "addObject:", v17);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      }
      while (v14);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v35 = v58;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          v41 = objc_loadWeakRetained(v9);
          objc_msgSend(v41, "accessoryiAPIntefaceTrafficWaitList");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeObjectForKey:", v40);

          v43 = objc_loadWeakRetained(v9);
          objc_msgSend(v43, "accessoryiAPIntefaceTrafficWaitList");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");
          v46 = objc_loadWeakRetained(v9);
          objc_msgSend(v46, "setAccessoryiAPIntefaceTrafficWaitListCount:", v45);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v37);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v47 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v47 = MEMORY[0x24BDACB70];
      v48 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_loadWeakRetained(v9);
      objc_msgSend(v49, "accessoryiAPIntefaceTrafficWaitList");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "count");
      *(_DWORD *)buf = 134217984;
      v72 = (const char *)v51;
      _os_log_impl(&dword_2171C1000, v47, OS_LOG_TYPE_DEFAULT, "%lu more pending iAPInterfaceTrafficWait!!!", buf, 0xCu);

    }
    v52 = objc_loadWeakRetained(v9);
    objc_msgSend(v52, "accessoryiAPIntefaceTrafficWaitList");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54)
    {
      objc_msgSend(*(id *)(v57 + 32), "accessoryiAPIntefaceTrafficTimer");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = dispatch_time(0, 50000000);
      dispatch_source_set_timer(v55, v56, 0xFFFFFFFFFFFFFFFFLL, 0);

    }
  }
}

void __46__AccessoryTransportPluginUSBHost_startPlugin__block_invoke_22(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;

  v9 = a6;
  v10 = a2;
  LODWORD(a4) = objc_msgSend(a4, "BOOLValue");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if ((_DWORD)a4)
    objc_msgSend(WeakRetained, "_handleOpenEASessionNotificationForEndpoint:connection:", v10, v9);
  else
    objc_msgSend(WeakRetained, "_handleCloseEASessionNotificationForEndpoint:connection:", v10, v9);

}

- (void)stopPlugin
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE1A0B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE1A0B8], 0);

  -[AccessoryTransportPluginUSBHost tearDownIOKit](self, "tearDownIOKit");
  v8.receiver = self;
  v8.super_class = (Class)AccessoryTransportPluginUSBHost;
  -[ACCTransportPlugin stopPlugin](&v8, sel_stopPlugin);
  -[AccessoryTransportPluginUSBHost setIsRunning:](self, "setIsRunning:", 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "Stopped USB Host transport plugin!", v7, 2u);
  }

}

- (void)startConfiguringIOKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke;
  block[3] = &unk_24D706A58;
  block[4] = self;
  if (startConfiguringIOKit_onceToken != -1)
    dispatch_once(&startConfiguringIOKit_onceToken, block);
}

void __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2171C1000, v4, OS_LOG_TYPE_DEFAULT, "Start configuring IOKit", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke_26;
  block[3] = &unk_24D706A58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__AccessoryTransportPluginUSBHost_startConfiguringIOKit__block_invoke_26(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "configureIOKit");
  return objc_msgSend(*(id *)(a1 + 32), "configureIOKitVIDPID");
}

- (void)configureIOKit
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_2171C1000, v0, v1, "_attachiAPInterfaceUSBDevices: IOServiceMatching() failed", v2);
  OUTLINED_FUNCTION_7();
}

- (void)tearDownIOKit
{
  IONotificationPort *iokitNotifyPort;

  iokitNotifyPort = self->_iokitNotifyPort;
  if (iokitNotifyPort)
  {
    IONotificationPortDestroy(iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
  IOObjectRelease(self->_iokitAddedIterator);
  IOObjectRelease(self->_iokitRemovedIterator);
}

- (void)serviceAdded:(unsigned int)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id *v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  id *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id *v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  kern_return_t RegistryEntryID;
  id *v31;
  int v32;
  BOOL v33;
  int v34;
  kern_return_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  kern_return_t v39;
  kern_return_t v40;
  id *v41;
  int v42;
  BOOL v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  const __CFNumber *CFProperty;
  const __CFNumber *v49;
  id *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  __int16 v55;
  uint64_t v56;
  int v57;
  const __CFDictionary *v58;
  const __CFDictionary *v59;
  const __CFData *Value;
  void *v61;
  uint64_t v62;
  id *v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  id *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  id *v71;
  int v72;
  NSObject *v73;
  NSObject *v74;
  CFTypeID v75;
  id *v76;
  int v77;
  NSObject *v78;
  id *v79;
  int v80;
  NSObject *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  id *v86;
  int v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  io_object_t ParentOfClass;
  io_object_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  int v96;
  id *v97;
  int v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  AccessoryIAPInterface *v109;
  AccessoryTransportPluginUSBHost *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  id v115;
  AccessoryIAPInterface *v116;
  NSObject *v117;
  uint64_t v118;
  int v119;
  NSObject *v120;
  AccessoryTransportPluginUSBHost *v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  unsigned int v125;
  UInt8 v126;
  id *v127;
  int v128;
  NSObject *v129;
  NSObject *v130;
  int v131;
  unsigned int v132;
  id *v133;
  int v134;
  NSObject *v135;
  uint64_t v136;
  NSObject *v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  AccessoryTransportPluginUSBHost *v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  void *v149;
  const __CFDictionary *cf;
  const __CFAllocator *allocator;
  char v152;
  char v153[15];
  _QWORD block[5];
  AccessoryIAPInterface *v155;
  id v156;
  id v157;
  __int16 v158;
  __int16 v159;
  _QWORD v160[4];
  id v161;
  AccessoryTransportPluginUSBHost *v162;
  id v163;
  __int16 v164;
  __int16 v165;
  UInt8 buffer[4];
  __int16 v167;
  int valuePtr;
  CFMutableDictionaryRef properties;
  uint64_t entryID;
  char v171;
  char v172[15];
  _QWORD v173[2];
  _QWORD v174[2];
  uint64_t v175;
  void *v176;
  uint8_t buf[96];
  __int128 v178;
  __int128 v179;
  _QWORD v180[2];
  _QWORD v181[2];
  uint8_t v182[32];
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;
  CFRange v190;

  v189 = *MEMORY[0x24BDAC8D0];
  v4 = 0x253E63000uLL;
  v5 = 0x253E63000uLL;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AccessoryTransportPluginUSBHost serviceAdded:].cold.3();

  v9 = IOIteratorNext(a3);
  if ((_DWORD)v9)
  {
    v10 = v9;
    v11 = MEMORY[0x24BDACB70];
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v141 = *MEMORY[0x24BE1A150];
    v140 = *MEMORY[0x24BE1A148];
    v139 = *MEMORY[0x24BE1A170];
    v142 = *MEMORY[0x24BE1A128];
    v143 = *MEMORY[0x24BE1A140];
    v145 = self;
    do
    {
      v12 = *(id **)(v4 + 1032);
      v13 = *(_DWORD *)(v5 + 1040);
      if (v12)
        v14 = v13 < 1;
      else
        v14 = 1;
      if (v14)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v182 = 134218240;
          *(_QWORD *)&v182[4] = v12;
          *(_WORD *)&v182[12] = 1024;
          *(_DWORD *)&v182[14] = v13;
          _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v182, 0x12u);
        }
        v15 = v11;
        v16 = v11;
      }
      else
      {
        v16 = *v12;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[AccessoryTransportPluginUSBHost serviceAdded:].cold.2(&v171, v172);

      v17 = *(id **)(v4 + 1032);
      v18 = *(_DWORD *)(v5 + 1040);
      if (v17 && v18 >= 1)
      {
        v19 = *v17;
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v182 = 134218240;
          *(_QWORD *)&v182[4] = v17;
          *(_WORD *)&v182[12] = 1024;
          *(_DWORD *)&v182[14] = v18;
          _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v182, 0x12u);
        }
        v20 = v11;
        v19 = v11;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v182 = 67109120;
        *(_DWORD *)&v182[4] = v10;
        _os_log_debug_impl(&dword_2171C1000, v19, OS_LOG_TYPE_DEBUG, "io_service_t: %u", v182, 8u);
      }

      v187 = 0u;
      v188 = 0u;
      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      memset(v182, 0, sizeof(v182));
      properties = 0;
      entryID = 0;
      v21 = MEMORY[0x219A07508](v10, v182);
      v22 = *(id **)(v4 + 1032);
      v23 = *(_DWORD *)(v5 + 1040);
      if (v22)
        v24 = v23 <= 0;
      else
        v24 = 1;
      v25 = !v24;
      if (v21)
      {
        v26 = v21;
        if (v25)
        {
          v27 = *v22;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v23;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v28 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v26;
          _os_log_error_impl(&dword_2171C1000, v27, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v25)
        {
          v27 = *v22;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v23;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v29 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v182;
          _os_log_debug_impl(&dword_2171C1000, v27, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }
      }

      RegistryEntryID = IORegistryEntryGetRegistryEntryID(v10, &entryID);
      v31 = *(id **)(v4 + 1032);
      v32 = *(_DWORD *)(v5 + 1040);
      if (v31)
        v33 = v32 <= 0;
      else
        v33 = 1;
      v34 = !v33;
      if (RegistryEntryID)
      {
        v35 = RegistryEntryID;
        if (v34)
        {
          v36 = *v31;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v37 = v11;
          v36 = v11;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v35;
          _os_log_error_impl(&dword_2171C1000, v36, OS_LOG_TYPE_ERROR, "IORegistryEntryGetRegistryEntryID failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v34)
        {
          v36 = *v31;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v38 = v11;
          v36 = v11;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = entryID;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = entryID;
          _os_log_debug_impl(&dword_2171C1000, v36, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }
      }

      v39 = IORegistryEntryCreateCFProperties(v10, &properties, allocator, 0);
      v40 = v39;
      v41 = *(id **)(v4 + 1032);
      v42 = *(_DWORD *)(v5 + 1040);
      if (v41)
        v43 = v42 <= 0;
      else
        v43 = 1;
      v44 = !v43;
      if (v39 || !properties)
      {
        if (v44)
        {
          v45 = *v41;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v41;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v42;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v46 = v11;
          v45 = v11;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v40;
          _os_log_error_impl(&dword_2171C1000, v45, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v44)
        {
          v45 = *v41;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v41;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v42;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v47 = v11;
          v45 = v11;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = properties;
          _os_log_debug_impl(&dword_2171C1000, v45, OS_LOG_TYPE_DEBUG, "serviceProperties: %@", buf, 0xCu);
        }
      }

      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, CFSTR("idVendor"), allocator, 0);
      v49 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, CFSTR("idProduct"), allocator, 0);
      valuePtr = 0;
      if (CFProperty)
        CFNumberGetValue(CFProperty, kCFNumberSInt16Type, (char *)&valuePtr + 2);
      if (v49)
        CFNumberGetValue(v49, kCFNumberSInt16Type, &valuePtr);
      v50 = *(id **)(v4 + 1032);
      v51 = *(_DWORD *)(v5 + 1040);
      if (v50 && v51 >= 1)
      {
        v52 = *v50;
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v51;
          _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v53 = v11;
        v52 = v11;
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 387;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v10;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = v182;
        *(_WORD *)&buf[34] = 2048;
        *(_QWORD *)&buf[36] = entryID;
        *(_WORD *)&buf[44] = 2112;
        *(_QWORD *)&buf[46] = CFProperty;
        *(_WORD *)&buf[54] = 2112;
        *(_QWORD *)&buf[56] = v49;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = HIWORD(valuePtr);
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = (unsigned __int16)valuePtr;
        *(_WORD *)&buf[76] = 2112;
        *(_QWORD *)&buf[78] = properties;
        _os_log_impl(&dword_2171C1000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', regEntryID %llu, vid / pid = %@ / %@ (0x%x / 0x%x), serviceProperties: %@", buf, 0x56u);
      }

      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      if (CFProperty)
        CFRelease(CFProperty);
      if (v49)
        CFRelease(v49);
      v54 = HIWORD(valuePtr);
      v55 = valuePtr;
      if (MGGetBoolAnswer())
        v56 = 1;
      else
        v56 = 6;
      v57 = v55 & 0xFFFE | (v54 << 16);
      if (v57 == 95164176)
      {
        v58 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v10, "IOService", CFSTR("AID Info"), allocator, 3u);
        v59 = v58;
        cf = v58;
        if (v58)
        {
          Value = (const __CFData *)CFDictionaryGetValue(v58, CFSTR("Digital ID"));
          CFDictionaryGetValue(v59, CFSTR("Accessory Name"));
          CFDictionaryGetValue(v59, CFSTR("Accessory Manufacturer"));
          CFDictionaryGetValue(v59, CFSTR("Accessory Model"));
          v59 = (const __CFDictionary *)CFDictionaryGetValue(v59, CFSTR("MikeyBus Info"));
        }
        else
        {
          Value = 0;
        }
        v63 = *(id **)(v4 + 1032);
        v64 = *(_DWORD *)(v5 + 1040);
        if (v63 && v64 >= 1)
        {
          v65 = *v63;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v63;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v64;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v66 = v11;
          v65 = v11;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 437;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2080;
          *(_QWORD *)&buf[26] = v182;
          *(_WORD *)&buf[34] = 2112;
          *(_QWORD *)&buf[36] = Value;
          _os_log_impl(&dword_2171C1000, v65, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', digitalID %@", buf, 0x2Cu);
        }

        v67 = *(id **)(v4 + 1032);
        v68 = *(_DWORD *)(v5 + 1040);
        if (v67 && v68 >= 1)
        {
          v69 = *v67;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v70 = v11;
          v69 = v11;
        }
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 438;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2112;
          *(_QWORD *)&buf[26] = cf;
          _os_log_impl(&dword_2171C1000, v69, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, aidInfo %@", buf, 0x22u);
        }

        v71 = *(id **)(v4 + 1032);
        v72 = *(_DWORD *)(v5 + 1040);
        if (v71 && v72 >= 1)
        {
          v73 = *v71;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v71;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v72;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v74 = v11;
          v73 = v11;
        }
        self = v145;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 439;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          *(_WORD *)&buf[24] = 2112;
          *(_QWORD *)&buf[26] = v59;
          _os_log_impl(&dword_2171C1000, v73, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, mikeyBusInfo %@", buf, 0x22u);
        }

        if (Value && (v75 = CFGetTypeID(Value), v75 == CFDataGetTypeID()) && CFDataGetLength(Value) == 6)
        {
          v167 = 0;
          *(_DWORD *)buffer = 0;
          v190.location = 0;
          v190.length = 6;
          CFDataGetBytes(Value, v190, buffer);
          v76 = *(id **)(v4 + 1032);
          v77 = *(_DWORD *)(v5 + 1040);
          if (v76 && v77 >= 1)
          {
            v78 = *v76;
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v76;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v77;
              _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v124 = v11;
            v78 = v11;
          }
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136317186;
            *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 452;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v10;
            *(_WORD *)&buf[24] = 2080;
            *(_QWORD *)&buf[26] = v182;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = HIWORD(valuePtr);
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = (buffer[0] >> 2) & 1;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = buffer[0] & 3;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = buffer[2] & 1;
            _os_log_debug_impl(&dword_2171C1000, v78, OS_LOG_TYPE_DEBUG, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, _mb %x, _uart %x, _bd %x", buf, 0x40u);
          }

          v125 = buffer[0];
          v126 = buffer[2];
          v127 = *(id **)(v4 + 1032);
          v128 = *(_DWORD *)(v5 + 1040);
          if (v127 && v128 >= 1)
          {
            v129 = *v127;
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v127;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v128;
              _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v130 = v11;
            v129 = v11;
          }
          v131 = v126 & 1;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136317186;
            *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 460;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v10;
            *(_WORD *)&buf[24] = 2080;
            *(_QWORD *)&buf[26] = v182;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = HIWORD(valuePtr);
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = (v125 >> 2) & 1;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = (v125 & 3) != 0;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = v126 & 1;
            _os_log_impl(&dword_2171C1000, v129, OS_LOG_TYPE_INFO, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, _mb %d, _uart %d, _bd %d", buf, 0x40u);
          }

          if ((v125 & 3) != 0)
            v132 = 6;
          else
            v132 = 1;
          if ((v125 & 7) != 0)
            v62 = v132;
          else
            v62 = 7;
          if (v125 & 7 | v131)
          {
            v133 = *(id **)(v4 + 1032);
            v134 = *(_DWORD *)(v5 + 1040);
            self = v145;
            if (v133 && v134 >= 1)
            {
              v135 = *v133;
            }
            else
            {
              v136 = v62;
              v137 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v133;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v134;
                _os_log_error_impl(&dword_2171C1000, v137, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v138 = v137;
              v135 = v137;
              v62 = v136;
            }
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316930;
              *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 483;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v10;
              *(_WORD *)&buf[24] = 2080;
              *(_QWORD *)&buf[26] = v182;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&buf[48] = 8;
              *(_WORD *)&buf[52] = 1024;
              *(_DWORD *)&buf[54] = v62;
              _os_log_impl(&dword_2171C1000, v135, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override transportType %{coreacc:ACCEndpoint_TransportType_t}d -> %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x3Au);
            }

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%x,0x%x"), HIWORD(valuePtr), (unsigned __int16)valuePtr);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v61 = 0;
            v62 = 8;
            self = v145;
          }
        }
        else
        {
          v61 = 0;
          v62 = 8;
          if (HIWORD(valuePtr) == 1452 && (unsigned __int16)valuePtr == 5905)
          {
            v79 = *(id **)(v4 + 1032);
            v80 = *(_DWORD *)(v5 + 1040);
            if (v79 && v80 >= 1)
            {
              v11 = *v79;
            }
            else
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v79;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v80;
                _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v81 = v11;
            }
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316930;
              *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 496;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v10;
              *(_WORD *)&buf[24] = 2080;
              *(_QWORD *)&buf[26] = v182;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&buf[48] = 8;
              *(_WORD *)&buf[52] = 1024;
              *(_DWORD *)&buf[54] = 7;
              _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override transportType %{coreacc:ACCEndpoint_TransportType_t}d -> %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x3Au);
            }

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%x,0x%x"), HIWORD(valuePtr), (unsigned __int16)valuePtr);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 7;
          }
        }
      }
      else
      {
        v61 = 0;
        cf = 0;
        v62 = 8;
      }
      -[ACCTransportPlugin createConnectionWithType:andIdentifier:](self, "createConnectionWithType:andIdentifier:", v56, 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v61;
      if (v57 == 95164176)
      {
        v146 = v62;
        v83 = v10;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIWORD(valuePtr));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unsigned __int16)valuePtr);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v180[0] = v141;
        v180[1] = v140;
        v181[0] = v84;
        v181[1] = v85;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v181, v180, 2);
        v10 = objc_claimAutoreleasedReturnValue();
        v86 = *(id **)(v4 + 1032);
        v87 = *(_DWORD *)(v5 + 1040);
        if (v86 && v87 >= 1)
        {
          v88 = *v86;
        }
        else
        {
          v88 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v87;
            _os_log_error_impl(&dword_2171C1000, v88, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v89 = v88;
        }
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 530;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v83;
          *(_WORD *)&buf[24] = 2080;
          *(_QWORD *)&buf[26] = v182;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = HIWORD(valuePtr);
          *(_WORD *)&buf[40] = 1024;
          *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
          *(_WORD *)&buf[46] = 2112;
          *(_QWORD *)&buf[48] = v10;
          _os_log_impl(&dword_2171C1000, v88, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override adapterVID/PID, newProperties = %@", buf, 0x38u);
        }

        v90 = (void *)objc_msgSend((id)v10, "copy");
        -[ACCTransportPlugin setProperties:forConnectionWithUUID:](v145, "setProperties:forConnectionWithUUID:", v90, v82);

        LODWORD(v10) = v83;
        self = v145;
        v61 = v149;
        v62 = v146;
      }
      ParentOfClass = usbUtil_findParentOfClass(v10, "IOUSBHostDevice", "IOService");
      if (ParentOfClass)
      {
        v92 = ParentOfClass;
        v93 = usbUtil_findParentOfClass(ParentOfClass, "IOAccessoryManager", "IOPort");
        if ((_DWORD)v93)
        {
          v94 = v93;
          v95 = (void *)IORegistryEntryCreateCFProperty(v93, CFSTR("Description"), allocator, 0);
          if (v95
            || (v178 = 0u, v179 = 0u, memset(buf, 0, sizeof(buf)), !MEMORY[0x219A07508](v94, buf))
            && (v95 = (void *)CFStringCreateWithCString(allocator, (const char *)buf, 0x8000100u)) != 0)
          {
            v147 = v62;
            v96 = v10;
            v175 = v139;
            v176 = v95;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
            v10 = objc_claimAutoreleasedReturnValue();

            v97 = *(id **)(v4 + 1032);
            v98 = *(_DWORD *)(v5 + 1040);
            if (v97 && v98 >= 1)
            {
              v99 = *v97;
            }
            else
            {
              v99 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v97;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v98;
                _os_log_error_impl(&dword_2171C1000, v99, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v100 = v99;
            }
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = "-[AccessoryTransportPluginUSBHost serviceAdded:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 553;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v96;
              *(_WORD *)&buf[24] = 2080;
              *(_QWORD *)&buf[26] = v182;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = HIWORD(valuePtr);
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = (unsigned __int16)valuePtr;
              *(_WORD *)&buf[46] = 2112;
              *(_QWORD *)&buf[48] = v10;
              _os_log_impl(&dword_2171C1000, v99, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, name '%s', vid / pid = 0x%x / 0x%x, override managerParent, newProperties = %@", buf, 0x38u);
            }

            v101 = (void *)objc_msgSend((id)v10, "copy");
            -[ACCTransportPlugin setProperties:forConnectionWithUUID:](v145, "setProperties:forConnectionWithUUID:", v101, v82);

            LODWORD(v10) = v96;
            self = v145;
            v62 = v147;
          }
          IOObjectRelease(v92);
          v61 = v149;
        }
        else
        {
          LODWORD(v94) = v92;
        }
        IOObjectRelease(v94);
      }
      -[ACCTransportPlugin createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:](self, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", v62, 0, v61, v82, 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v102)
      {
        v148 = v10;
        v173[0] = v143;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIWORD(valuePtr));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v173[1] = v142;
        v174[0] = v103;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unsigned __int16)valuePtr);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v174[1] = v104;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        -[ACCTransportPlugin setAccessoryInfo:forEndpointWithUUID:](self, "setAccessoryInfo:forEndpointWithUUID:", v105, v102);
        if (cf)
        {
          v106 = objc_alloc(MEMORY[0x24BDBCE70]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "AID Info", 4);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)objc_msgSend(v106, "initWithObjectsAndKeys:", cf, v107, 0);

          -[ACCTransportPlugin setProperties:forConnectionWithUUID:](self, "setProperties:forConnectionWithUUID:", v108, v82);
        }
        -[ACCTransportPlugin publishConnectionWithUUID:](self, "publishConnectionWithUUID:", v82);
        v109 = [AccessoryIAPInterface alloc];
        v110 = self;
        v111 = HIWORD(valuePtr);
        v112 = (unsigned __int16)valuePtr;
        v113 = MEMORY[0x24BDAC760];
        v160[0] = MEMORY[0x24BDAC760];
        v160[1] = 3221225472;
        v160[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke;
        v160[3] = &unk_24D706AA8;
        v114 = v102;
        v161 = v114;
        v162 = v110;
        v115 = v82;
        v163 = v115;
        v164 = HIWORD(valuePtr);
        v165 = valuePtr;
        v116 = -[AccessoryIAPInterface initWithInterface:vid:pid:aidInfo:andDataInHandler:](v109, "initWithInterface:vid:pid:aidInfo:andDataInHandler:", v148, v111, v112, cf, v160);
        if (v116)
        {
          -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](v110, "accessoryConnectionsLock");
          v117 = objc_claimAutoreleasedReturnValue();
          block[0] = v113;
          block[1] = 3221225472;
          block[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_69;
          block[3] = &unk_24D706A80;
          block[4] = v110;
          v155 = v116;
          v156 = v115;
          v158 = HIWORD(valuePtr);
          v159 = valuePtr;
          v157 = v114;
          dispatch_sync(v117, block);

          self = v110;
          v4 = 0x253E63000;
          v5 = 0x253E63000;
        }
        else
        {
          v118 = gLogObjects;
          v119 = gNumLogObjects;
          self = v110;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v120 = *(id *)gLogObjects;
            v4 = 0x253E63000;
          }
          else
          {
            v121 = v110;
            v122 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v118;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v119;
              _os_log_error_impl(&dword_2171C1000, v122, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v123 = v122;
            v120 = v122;
            v4 = 0x253E63000;
            self = v121;
          }
          v5 = 0x253E63000;
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            -[AccessoryTransportPluginUSBHost serviceAdded:].cold.1(&v152, v153);

          -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:", v115);
        }

        LODWORD(v10) = v148;
        v61 = v149;
      }
      IOObjectRelease(v10);
      if (cf)
        CFRelease(cf);

      v10 = IOIteratorNext(a3);
      v11 = MEMORY[0x24BDACB70];
    }
    while ((_DWORD)v10);
  }
}

uint64_t __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  int v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (gLogSignpostObjects)
    v7 = gNumLogSignpostObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogSignpostObjects + 24);
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "hash");
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v12 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v33 = v12;
      v34 = 2048;
      v35 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_2171C1000, v9, OS_SIGNPOST_EVENT, v11, "Endpoint RECV", "Received incoming data! %@, %lu bytes", buf, 0x16u);
    }
  }

  if (platform_systemInfo_supportsUSBC()
    && objc_msgSend(*(id *)(a1 + 40), "accessoryiAPIntefaceTrafficWaitListCount"))
  {
    objc_msgSend(*(id *)(a1 + 40), "accessoryConnectionsLock");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_65;
    block[3] = &unk_24D706A80;
    block[4] = *(_QWORD *)(a1 + 40);
    v28 = v5;
    v29 = *(id *)(a1 + 48);
    v30 = *(id *)(a1 + 32);
    v31 = *(_DWORD *)(a1 + 56);
    dispatch_sync(v13, block);

  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "hash");
  v15 = objc_msgSend(v6, "hash") ^ v14;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v16 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = *(const char **)(a1 + 32);
    v19 = objc_msgSend(v6, "length");
    *(_DWORD *)buf = 138412546;
    v33 = v18;
    v34 = 2048;
    v35 = v19;
    _os_signpost_emit_with_name_impl(&dword_2171C1000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Endpoint RECV", "Received incoming data! %@, %lu bytes", buf, 0x16u);
  }

  v20 = objc_msgSend(*(id *)(a1 + 40), "processIncomingData:forEndpointWithUUID:", v6, *(_QWORD *)(a1 + 32));
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if ((_DWORD)v20)
      v23 = "SUCCESS";
    else
      v23 = "ERROR";
    v24 = *(_QWORD *)(a1 + 32);
    v25 = objc_msgSend(v6, "length");
    *(_DWORD *)buf = 136315650;
    v33 = v23;
    v34 = 2112;
    v35 = v24;
    v36 = 2048;
    v37 = v25;
    _os_signpost_emit_with_name_impl(&dword_2171C1000, v21, OS_SIGNPOST_INTERVAL_END, v15, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", buf, 0x20u);
  }

  return v20;
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_65(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "creationTime");
    v8 = v7;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(unsigned __int16 *)(a1 + 64);
      v14 = *(unsigned __int16 *)(a1 + 66);
      objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136316930;
      v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
      v23 = 1024;
      v24 = 640;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2048;
      v30 = (unint64_t)((v6 - v8) * 1000.0);
      v31 = 1024;
      v32 = v13;
      v33 = 1024;
      v34 = v14;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d received data for %@ - %@, timeSinceCreation %llu, vid / pid = 0x%x / 0x%x, trafficWaitList %@", (uint8_t *)&v21, 0x46u);

    }
    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryiAPIntefaceTrafficWaitListCount:", objc_msgSend(v17, "count"));

  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (!v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficTimer");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v20, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_69(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[10];
  _BYTE v29[10];
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "registryEntryID");
    v7 = *(unsigned __int16 *)(a1 + 64);
    v8 = *(unsigned __int16 *)(a1 + 66);
    v9 = *(_QWORD *)(a1 + 40);
    v21 = 136316418;
    v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
    v23 = 1024;
    v24 = 682;
    v25 = 2048;
    v26 = v6;
    v27 = 1024;
    *(_DWORD *)v28 = v7;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = v8;
    *(_WORD *)v29 = 2112;
    *(_QWORD *)&v29[2] = v9;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d registryEntryID %llu, vid / pid = 0x%x / 0x%x, iapInterface %@", (uint8_t *)&v21, 0x32u);
  }

  if (platform_systemInfo_supportsUSBC())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(unsigned __int16 *)(a1 + 64);
      v15 = *(unsigned __int16 *)(a1 + 66);
      objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136316674;
      v22 = "-[AccessoryTransportPluginUSBHost serviceAdded:]_block_invoke";
      v23 = 1024;
      v24 = 687;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      *(_QWORD *)v28 = v13;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)v29 = v14;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v15;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d add to trafficWaitList for %@ - %@, vid / pid = 0x%x / 0x%x, trafficWaitList %@", (uint8_t *)&v21, 0x3Cu);

    }
    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficWaitList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessoryiAPIntefaceTrafficWaitListCount:", objc_msgSend(v18, "count"));

    objc_msgSend(*(id *)(a1 + 32), "accessoryiAPIntefaceTrafficTimer");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_time(0, 50000000);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

- (void)serviceRemoved:(unsigned int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  kern_return_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t entryID;
  uint8_t buf[4];
  _OWORD *v34;
  __int16 v35;
  uint64_t v36;
  _OWORD v37[8];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AccessoryTransportPluginUSBHost serviceRemoved:].cold.1();

  v8 = IOIteratorNext(a3);
  if ((_DWORD)v8)
  {
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDAC760];
    do
    {
      memset(v37, 0, sizeof(v37));
      v31 = 0;
      entryID = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      if (!MEMORY[0x219A07508](v8, v37))
      {
        v11 = gLogObjects;
        v12 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v13 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v34 = (_OWORD *)v11;
            v35 = 1024;
            LODWORD(v36) = v12;
            _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v14 = v9;
          v13 = v9;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v34 = v37;
          _os_log_debug_impl(&dword_2171C1000, v13, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }

      }
      if (!IORegistryEntryGetRegistryEntryID(v8, &entryID))
      {
        v15 = gLogObjects;
        v16 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v34 = (_OWORD *)v15;
            v35 = 1024;
            LODWORD(v36) = v16;
            _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v18 = v9;
          v17 = v9;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v34 = (_OWORD *)entryID;
          v35 = 2048;
          v36 = entryID;
          _os_log_debug_impl(&dword_2171C1000, v17, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }

      }
      -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke;
      block[3] = &unk_24D706AD0;
      block[4] = self;
      block[5] = &v26;
      block[6] = entryID;
      dispatch_sync(v19, block);

      if (v27[5])
      {
        -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:");
        -[AccessoryTransportPluginUSBHost accessoryNativeUSBEndpointsLock](self, "accessoryNativeUSBEndpointsLock");
        v20 = objc_claimAutoreleasedReturnValue();
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_2;
        v24[3] = &unk_24D706A58;
        v24[4] = self;
        dispatch_sync(v20, v24);

        -[AccessoryTransportPluginUSBHost activeEAInterfacesLock](self, "activeEAInterfacesLock");
        v21 = objc_claimAutoreleasedReturnValue();
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_3;
        v23[3] = &unk_24D706A58;
        v23[4] = self;
        dispatch_sync(v21, v23);

      }
      v22 = IOObjectRelease(v8);
      if (v22)
        printf("Couldn’t release raw device object: %08x\n", v22);
      _Block_object_dispose(&v26, 8);

      v8 = IOIteratorNext(a3);
    }
    while ((_DWORD)v8);
  }
}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    v8 = v5;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*((_QWORD *)&v13 + 1) + 8 * v7));
      objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        if (objc_msgSend(v5, "registryEntryID") == *(_QWORD *)(a1 + 48))
          break;
      }
      ++v7;
      v8 = v5;
      if (v4 == v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v5 = 0;
LABEL_12:
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "accessoryNativeUSBEndpoints");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __50__AccessoryTransportPluginUSBHost_serviceRemoved___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "shuttingDownSession");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)_handleOpenEASessionNotificationForEndpoint:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_DEFAULT, "Opening EA USB Session Notification for endpoint %@", buf, 0xCu);
  }

  -[ACCTransportPlugin identifierForEndpointWithUUID:](self, "identifierForEndpointWithUUID:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportPlugin propertiesForEndpointWithUUID:](self, "propertiesForEndpointWithUUID:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE1A188]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "EA sessionUUID is %@", buf, 0xCu);
  }

  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke;
  block[3] = &unk_24D706B20;
  block[4] = self;
  v22 = v7;
  v23 = v11;
  v24 = v6;
  v25 = v13;
  v17 = v13;
  v18 = v6;
  v19 = v11;
  v20 = v7;
  dispatch_sync(v16, block);

}

void __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "activeEAInterfacesLock");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_2;
    block[3] = &unk_24D706B20;
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = v3;
    v6 = *(id *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 32);
    v17 = v6;
    v18 = v7;
    dispatch_sync(v5, block);

  }
  else
  {
    objc_msgSend(v4, "activeUSBCDCInterfaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_DEFAULT, "Opening EA USB CDC Session", v12, 2u);
      }

      objc_msgSend(v9, "openCDCInterface");
    }

  }
}

void __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  AccessoryEAInterface *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2171C1000, v4, OS_LOG_TYPE_DEFAULT, "Creating EA Native USB Session", buf, 2u);
  }

  v5 = -[AccessoryEAInterface initWithProtocol:endpointUUID:vid:pid:eaSessionUUID:USBDeviceID:]([AccessoryEAInterface alloc], "initWithProtocol:endpointUUID:vid:pid:eaSessionUUID:USBDeviceID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "vid"), objc_msgSend(*(id *)(a1 + 48), "pid"), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 48), "parentDeviceRegistryEntryID"));
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 64), "activeEAInterfaces");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "vidpid") == 95164176)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_71;
    v9[3] = &unk_24D706AF8;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 64);
    v10 = v7;
    v11 = v8;
    -[AccessoryEAInterface setDataInHandler:](v5, "setDataInHandler:", v9);

  }
}

uint64_t __90__AccessoryTransportPluginUSBHost__handleOpenEASessionNotificationForEndpoint_connection___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v13 = 138412802;
    v14 = v10;
    v15 = 2048;
    v16 = objc_msgSend(v6, "length");
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_INFO, "EAInterface: endpointUUID %@, received %lu bytes, %@", (uint8_t *)&v13, 0x20u);
  }

  v11 = objc_msgSend(*(id *)(a1 + 40), "processIncomingData:forEndpointWithUUID:", v6, *(_QWORD *)(a1 + 32));
  return v11;
}

- (void)_handleCloseEASessionNotificationForEndpoint:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_DEFAULT, "Closing EA USB Session Notification for endpoint %@", buf, 0xCu);
  }

  -[AccessoryTransportPluginUSBHost activeEAInterfacesLock](self, "activeEAInterfacesLock");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__AccessoryTransportPluginUSBHost__handleCloseEASessionNotificationForEndpoint_connection___block_invoke;
  block[3] = &unk_24D706B48;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_sync(v11, block);

}

void __91__AccessoryTransportPluginUSBHost__handleCloseEASessionNotificationForEndpoint_connection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v9[16];

  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "shuttingDownSession");
    objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v7 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "Closing EA USB CDC Session", v9, 2u);
      }

      objc_msgSend(v6, "closeCDCInterface");
    }

  }
}

- (void)_handleOpenSocketFromAccessoryToAppNotification:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "OpenSocket From Accessory To App Native EA USB Session Notification, userInfo %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE1A0A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessoryTransportPluginUSBHost activeEAInterfacesLock](self, "activeEAInterfacesLock");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAccessoryToAppNotification___block_invoke;
  v11[3] = &unk_24D706B70;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, v11);

}

void __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAccessoryToAppNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "openPipeToApp");
    v3 = v4;
  }

}

- (void)_handleOpenSocketFromAppToAccessoryNotification:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "OpenSocket From App To Accessory Native EA USB Session Notification, userInfo %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE1A0A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessoryTransportPluginUSBHost activeEAInterfacesLock](self, "activeEAInterfacesLock");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAppToAccessoryNotification___block_invoke;
  v11[3] = &unk_24D706B70;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, v11);

}

void __83__AccessoryTransportPluginUSBHost__handleOpenSocketFromAppToAccessoryNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "openPipeFromApp");
    v3 = v4;
  }

}

- (BOOL)unlockUSBHostInterfacesForConnectionUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  void *v23;
  AccessoryTransportPluginUSBHost *v24;
  void (*v25)(uint64_t);
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  BOOL v37;
  void *v39;
  id obj;
  unsigned int v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _BOOL4 v45;
  _QWORD v46[6];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[5];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  _BOOL4 v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = (uint64_t)v4;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_INFO, "Unlocking USB interfaces for connection %@...", buf, 0xCu);
  }

  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_24D706B98;
  block[4] = self;
  v43 = v4;
  v53 = v43;
  v54 = &v70;
  v55 = &v66;
  v56 = &v62;
  v57 = &v58;
  dispatch_sync(v7, block);

  +[AccessoryEAInterface findNativeEAInterfacesForRegistryID:](AccessoryEAInterface, "findNativeEAInterfacesForRegistryID:", v67[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v88, 16);
    v39 = v9;
    v11 = 0;
    if (v10)
    {
      v42 = *(_QWORD *)v49;
      v12 = __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke_77;
      v13 = &unk_24D706B48;
      do
      {
        v44 = v10;
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v49 != v42)
            objc_enumerationMutation(obj);
          if (*((_WORD *)v59 + 12) == 5904)
          {
            v45 = *((unsigned __int16 *)v63 + 12) == 1452;
            if (*((_WORD *)v63 + 12) == 1452)
              v15 = 5;
            else
              v15 = 6;
            if (*((_WORD *)v63 + 12) == 1452)
              v16 = 5;
            else
              v16 = 8;
          }
          else
          {
            v45 = 0;
            v16 = 8;
            v15 = 6;
          }
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v18 = gLogObjects;
          v19 = gNumLogObjects;
          if (gLogObjects)
            v20 = gNumLogObjects < 1;
          else
            v20 = 1;
          if (v20)
          {
            v41 = v15;
            v21 = v16;
            v22 = v11;
            v23 = v13;
            v24 = self;
            v25 = v12;
            v26 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v77 = v18;
              v78 = 1024;
              v79 = v19;
              _os_log_error_impl(&dword_2171C1000, v26, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v27 = v26;
            v28 = v26;
            v12 = v25;
            self = v24;
            v13 = v23;
            v11 = v22;
            v16 = v21;
            v15 = v41;
          }
          else
          {
            v28 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *((unsigned __int16 *)v63 + 12);
            v30 = *((unsigned __int16 *)v59 + 12);
            *(_DWORD *)buf = 138413570;
            v77 = (uint64_t)v17;
            v78 = 1024;
            v79 = v29;
            v80 = 1024;
            v81 = v30;
            v82 = 1024;
            v83 = v45;
            v84 = 1024;
            v85 = v15;
            v86 = 1024;
            v87 = v16;
            _os_log_impl(&dword_2171C1000, v28, OS_LOG_TYPE_DEFAULT, "unlockOtherInterfaces nativeEAProtocolString '%@', vid / pid = (0x%x / 0x%x), useEAService %d, protocol %{coreacc:ACCEndpoint_Protocol_t}d, transportType %{coreacc:ACCEndpoint_TransportType_t}d", buf, 0x2Au);
          }

          -[ACCTransportPlugin createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:](self, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", v16, v15, v17, v43, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[AccessoryTransportPluginUSBHost accessoryNativeUSBEndpointsLock](self, "accessoryNativeUSBEndpointsLock");
          v32 = objc_claimAutoreleasedReturnValue();
          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = v12;
          v46[3] = v13;
          v46[4] = self;
          v46[5] = v17;
          v11 = v31;
          v47 = v11;
          dispatch_sync(v32, v46);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v88, 16);
      }
      while (v10);
    }

    v74[0] = *MEMORY[0x24BE1A140];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned __int16 *)v63 + 12));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = *MEMORY[0x24BE1A128];
    v75[0] = v33;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned __int16 *)v59 + 12));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportPlugin setAccessoryInfo:forEndpointWithUUID:](self, "setAccessoryInfo:forEndpointWithUUID:", v35, v11);
    v36 = -[ACCTransportPlugin publishConnectionWithUUID:](self, "publishConnectionWithUUID:", v43);
    *((_BYTE *)v71 + 24) = v36;

    v9 = v39;
  }
  else
  {
    v11 = 0;
  }
  v37 = *((_BYTE *)v71 + 24) != 0;

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  return v37;
}

void __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "unlockOtherInterfaces");
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v7 = CFSTR("yes");
    else
      v7 = CFSTR("no");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "unlockOtherInterfaces succeeded? %@. Ignoring result anyways", (uint8_t *)&v8, 0xCu);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "parentDeviceRegistryEntryID");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "vid");
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "pid");

}

void __76__AccessoryTransportPluginUSBHost_unlockUSBHostInterfacesForConnectionUUID___block_invoke_77(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "accessoryNativeUSBEndpoints");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)lockUSBHostInterfacesForConnectionUUID:(id)a3
{
  id v4;
  NSObject *v5;
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
  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__AccessoryTransportPluginUSBHost_lockUSBHostInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_24D706BC0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __74__AccessoryTransportPluginUSBHost_lockUSBHostInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "lockOtherInterfaces");
}

- (void)configureIOKitVIDPID
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_2171C1000, v0, v1, "configureIOKitVIDPID: IOServiceMatching() failed", v2);
  OUTLINED_FUNCTION_7();
}

- (void)tearDownIOKitVIDPID
{
  IONotificationPort *iokitVIDPIDNotifyPort;

  iokitVIDPIDNotifyPort = self->_iokitVIDPIDNotifyPort;
  if (iokitVIDPIDNotifyPort)
  {
    IONotificationPortDestroy(iokitVIDPIDNotifyPort);
    self->_iokitVIDPIDNotifyPort = 0;
  }
  IOObjectRelease(self->_iokitVIDPIDAddedIterator);
  IOObjectRelease(self->_iokitVIDPIDRemovedIterator);
}

- (void)VIDPIDServiceAdded:(unsigned int)a3
{
  unint64_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  kern_return_t RegistryEntryID;
  uint64_t v22;
  int v23;
  BOOL v24;
  int v25;
  kern_return_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  kern_return_t v30;
  kern_return_t v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  AccessoryUSBCDCInterface *v41;
  id v42;
  int v43;
  AccessoryUSBCDCInterface *v44;
  NSObject *v45;
  AccessoryUSBCDCInterface *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _OWORD *v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  AccessoryTransportPluginUSBHost *v70;
  unsigned int v71;
  id v72;
  AccessoryUSBCDCInterface *v73;
  void *v74;
  const __CFAllocator *allocator;
  int v76;
  char v77;
  char v78[7];
  _QWORD block[5];
  AccessoryUSBCDCInterface *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, void *, void *);
  void *v85;
  id v86;
  AccessoryTransportPluginUSBHost *v87;
  CFMutableDictionaryRef properties;
  uint64_t entryID;
  _QWORD v90[6];
  _QWORD v91[6];
  uint8_t buf[4];
  _OWORD *v93;
  __int16 v94;
  uint64_t v95;
  _OWORD v96[8];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = 0x253E63000uLL;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AccessoryTransportPluginUSBHost VIDPIDServiceAdded:].cold.2();

  v9 = (void *)IOIteratorNext(a3);
  if ((_DWORD)v9)
  {
    v10 = v9;
    v11 = MEMORY[0x24BDACB70];
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v69 = *MEMORY[0x24BE1A118];
    v68 = *MEMORY[0x24BE1A108];
    v66 = *MEMORY[0x24BE1A110];
    v67 = *MEMORY[0x24BE1A138];
    v64 = *MEMORY[0x24BE1A100];
    v65 = *MEMORY[0x24BE1A0F8];
    v71 = a3;
    v70 = self;
    do
    {
      memset(v96, 0, sizeof(v96));
      properties = 0;
      entryID = 0;
      v12 = MEMORY[0x219A07508](v10, v96);
      v13 = gLogObjects;
      v14 = *(_DWORD *)(v5 + 1040);
      if (gLogObjects)
        v15 = v14 <= 0;
      else
        v15 = 1;
      v16 = !v15;
      if (v12)
      {
        v17 = v12;
        if (v16)
        {
          v18 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v13;
            v94 = 1024;
            LODWORD(v95) = v14;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v19 = v11;
          v18 = v11;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v93) = v17;
          _os_log_error_impl(&dword_2171C1000, v18, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v16)
        {
          v18 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v13;
            v94 = 1024;
            LODWORD(v95) = v14;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v20 = v11;
          v18 = v11;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v93 = v96;
          _os_log_debug_impl(&dword_2171C1000, v18, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }
      }

      RegistryEntryID = IORegistryEntryGetRegistryEntryID((io_registry_entry_t)v10, &entryID);
      v22 = gLogObjects;
      v23 = *(_DWORD *)(v5 + 1040);
      if (gLogObjects)
        v24 = v23 <= 0;
      else
        v24 = 1;
      v25 = !v24;
      if (RegistryEntryID)
      {
        v26 = RegistryEntryID;
        if (v25)
        {
          v27 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v22;
            v94 = 1024;
            LODWORD(v95) = v23;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v28 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v93) = v26;
          _os_log_error_impl(&dword_2171C1000, v27, OS_LOG_TYPE_ERROR, "IORegistryEntryGetRegistryEntryID failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v25)
        {
          v27 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v22;
            v94 = 1024;
            LODWORD(v95) = v23;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v29 = v11;
          v27 = v11;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v93 = (_OWORD *)entryID;
          v94 = 2048;
          v95 = entryID;
          _os_log_debug_impl(&dword_2171C1000, v27, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }
      }

      v30 = IORegistryEntryCreateCFProperties((io_registry_entry_t)v10, &properties, allocator, 0);
      v31 = v30;
      v32 = gLogObjects;
      v33 = *(_DWORD *)(v5 + 1040);
      if (gLogObjects)
        v34 = v33 <= 0;
      else
        v34 = 1;
      v35 = !v34;
      if (v30 || !properties)
      {
        if (v35)
        {
          v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v32;
            v94 = 1024;
            LODWORD(v95) = v33;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v36 = v11;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v93) = v31;
          _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failed: %08x", buf, 8u);
        }
      }
      else
      {
        if (v35)
        {
          v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v93 = (_OWORD *)v32;
            v94 = 1024;
            LODWORD(v95) = v33;
            _os_log_error_impl(&dword_2171C1000, v11, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v37 = v11;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v93 = properties;
          _os_log_debug_impl(&dword_2171C1000, v11, OS_LOG_TYPE_DEBUG, "serviceProperties: %@", buf, 0xCu);
        }
      }

      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      -[ACCTransportPlugin createConnectionWithType:andIdentifier:](self, "createConnectionWithType:andIdentifier:", 6, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCTransportPlugin createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:](self, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 8, 5, CFSTR("com.medtronic.cdc.protocol"), v38, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x24BDAC760];
      if (v39)
      {
        v41 = [AccessoryUSBCDCInterface alloc];
        v82 = v40;
        v83 = 3221225472;
        v84 = __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke;
        v85 = &unk_24D706BE8;
        v42 = v39;
        v43 = (int)v10;
        v10 = v42;
        v86 = v42;
        v87 = self;
        v76 = v43;
        v44 = -[AccessoryUSBCDCInterface initWithInterface:protocol:endpointUUID:andDataInHandler:](v41, "initWithInterface:protocol:endpointUUID:andDataInHandler:");
        if (v44)
        {
          -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
          v45 = objc_claimAutoreleasedReturnValue();
          block[0] = v40;
          block[1] = 3221225472;
          block[2] = __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke_83;
          block[3] = &unk_24D706B48;
          block[4] = self;
          v73 = v44;
          v46 = v44;
          v80 = v46;
          v74 = v38;
          v72 = v38;
          v81 = v72;
          dispatch_sync(v45, block);

          v90[0] = v69;
          -[AccessoryUSBCDCInterface ioregProperties](v46, "ioregProperties");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", CFSTR("USB Product Name"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = v48;
          v90[1] = v68;
          -[AccessoryUSBCDCInterface ioregProperties](v46, "ioregProperties");
          v49 = v5;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKey:", CFSTR("USB Vendor Name"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v91[1] = v51;
          v90[2] = v67;
          -[AccessoryUSBCDCInterface ioregProperties](v46, "ioregProperties");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKey:", CFSTR("USB Serial Number"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v91[2] = v53;
          v91[3] = CFSTR("Unknown");
          v90[3] = v66;
          v90[4] = v65;
          v90[5] = v64;
          v91[4] = CFSTR("Unknown");
          v91[5] = CFSTR("Unknown");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 6);
          v54 = (_OWORD *)objc_claimAutoreleasedReturnValue();

          v5 = v49;
          v55 = gLogObjects;
          v56 = *(_DWORD *)(v49 + 1040);
          if (gLogObjects && v56 >= 1)
          {
            v57 = *(id *)gLogObjects;
          }
          else
          {
            v57 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v93 = (_OWORD *)v55;
              v94 = 1024;
              LODWORD(v95) = v56;
              _os_log_error_impl(&dword_2171C1000, v57, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v61 = v57;
          }
          self = v70;
          v38 = v74;
          v44 = v73;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v93 = v54;
            _os_log_impl(&dword_2171C1000, v57, OS_LOG_TYPE_INFO, "accInfoDictionary = %@", buf, 0xCu);
          }

          -[ACCTransportPlugin setAccessoryInfo:forEndpointWithUUID:](v70, "setAccessoryInfo:forEndpointWithUUID:", v54, v10);
          -[ACCTransportPlugin publishConnectionWithUUID:](v70, "publishConnectionWithUUID:", v72);

          a3 = v71;
          LODWORD(v10) = v76;
        }
        else
        {
          v58 = gLogObjects;
          v59 = *(_DWORD *)(v5 + 1040);
          if (gLogObjects && v59 >= 1)
          {
            v60 = *(id *)gLogObjects;
            LODWORD(v10) = v76;
          }
          else
          {
            v62 = MEMORY[0x24BDACB70];
            LODWORD(v10) = v76;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v93 = (_OWORD *)v58;
              v94 = 1024;
              LODWORD(v95) = v59;
              _os_log_error_impl(&dword_2171C1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v63 = v62;
            v60 = v62;
            v44 = 0;
            a3 = v71;
          }
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            -[AccessoryTransportPluginUSBHost VIDPIDServiceAdded:].cold.1(&v77, v78);

          -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:", v38);
        }

      }
      IOObjectRelease((io_object_t)v10);

      v10 = (id)IOIteratorNext(a3);
      v11 = MEMORY[0x24BDACB70];
    }
    while ((_DWORD)v10);
  }
}

uint64_t __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  const char *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (gLogSignpostObjects)
    v7 = gNumLogSignpostObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogSignpostObjects + 24);
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "hash");
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      v12 = *(const char **)(a1 + 32);
      v26 = 138412546;
      v27 = v12;
      v28 = 2048;
      v29 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_2171C1000, v9, OS_SIGNPOST_EVENT, v11, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  v13 = objc_msgSend(*(id *)(a1 + 32), "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = *(const char **)(a1 + 32);
    v18 = objc_msgSend(v6, "length");
    v26 = 138412546;
    v27 = v17;
    v28 = 2048;
    v29 = v18;
    _os_signpost_emit_with_name_impl(&dword_2171C1000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  v19 = objc_msgSend(*(id *)(a1 + 40), "processIncomingData:forEndpointWithUUID:", v6, *(_QWORD *)(a1 + 32));
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v20 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    if ((_DWORD)v19)
      v22 = "SUCCESS";
    else
      v22 = "ERROR";
    v23 = *(_QWORD *)(a1 + 32);
    v24 = objc_msgSend(v6, "length");
    v26 = 136315650;
    v27 = v22;
    v28 = 2112;
    v29 = v23;
    v30 = 2048;
    v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_2171C1000, v20, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v19;
}

void __54__AccessoryTransportPluginUSBHost_VIDPIDServiceAdded___block_invoke_83(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)VIDPIDServiceRemoved:(unsigned int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  kern_return_t v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t entryID;
  uint8_t buf[4];
  _BYTE *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[136];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AccessoryTransportPluginUSBHost VIDPIDServiceRemoved:].cold.1();

  v8 = IOIteratorNext(a3);
  if ((_DWORD)v8)
  {
    v9 = MEMORY[0x24BDACB70];
    do
    {
      memset(v32, 0, 128);
      v26 = 0;
      entryID = 0;
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy_;
      v25 = __Block_byref_object_dispose_;
      if (!MEMORY[0x219A07508](v8, v32))
      {
        v10 = gLogObjects;
        v11 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v12 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v29 = (_BYTE *)v10;
            v30 = 1024;
            LODWORD(v31) = v11;
            _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v13 = v9;
          v12 = v9;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v29 = v32;
          _os_log_debug_impl(&dword_2171C1000, v12, OS_LOG_TYPE_DEBUG, "Registry entry name: %s", buf, 0xCu);
        }

      }
      if (!IORegistryEntryGetRegistryEntryID(v8, &entryID))
      {
        v14 = gLogObjects;
        v15 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v29 = (_BYTE *)v14;
            v30 = 1024;
            LODWORD(v31) = v15;
            _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v17 = v9;
          v16 = v9;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v29 = (_BYTE *)entryID;
          v30 = 2048;
          v31 = entryID;
          _os_log_debug_impl(&dword_2171C1000, v16, OS_LOG_TYPE_DEBUG, "Registry entry ID: %llu 0x%llX", buf, 0x16u);
        }

      }
      -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__AccessoryTransportPluginUSBHost_VIDPIDServiceRemoved___block_invoke;
      block[3] = &unk_24D706C10;
      block[4] = self;
      block[5] = &v21;
      dispatch_sync(v18, block);

      if (v22[5])
        -[ACCTransportPlugin destroyConnectionWithUUID:](self, "destroyConnectionWithUUID:");
      v19 = IOObjectRelease(v8);
      if (v19)
        printf("Couldn’t release raw device object: %08x\n", v19);
      _Block_object_dispose(&v21, 8);

      v8 = IOIteratorNext(a3);
    }
    while ((_DWORD)v8);
  }
}

void __56__AccessoryTransportPluginUSBHost_VIDPIDServiceRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*((_QWORD *)&v12 + 1) + 8 * v6));
      objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v8 = 0;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v8, "closeCDCInterface");
    objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4 forConnectionUUID:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unsigned int v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__AccessoryTransportPluginUSBHost_setUSBHostHIDInterface_withHIDFunction_forConnectionUUID___block_invoke;
  v13[3] = &unk_24D706C38;
  v13[4] = self;
  v14 = v8;
  v15 = &v18;
  v17 = a3;
  v16 = a4;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __92__AccessoryTransportPluginUSBHost_setUSBHostHIDInterface_withHIDFunction_forConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "setUSBHostHIDInterface:withHIDFunction:", *(unsigned __int8 *)(a1 + 60), *(unsigned int *)(a1 + 56));
}

- (BOOL)clearUSBHostHIDInterfacesForConnectionUUID:(id)a3
{
  id v4;
  NSObject *v5;
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
  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__AccessoryTransportPluginUSBHost_clearUSBHostHIDInterfacesForConnectionUUID___block_invoke;
  block[3] = &unk_24D706BC0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __78__AccessoryTransportPluginUSBHost_clearUSBHostHIDInterfacesForConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "clearUSBHostHIDInterfaces");
}

- (BOOL)configureUSBHostNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4 forConnectionUUID:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unsigned __int8 v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__AccessoryTransportPluginUSBHost_configureUSBHostNCMInterface_asCarPlay_forConnectionUUID___block_invoke;
  v13[3] = &unk_24D706C60;
  v13[4] = self;
  v14 = v8;
  v15 = &v18;
  v16 = a3;
  v17 = a4;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __92__AccessoryTransportPluginUSBHost_configureUSBHostNCMInterface_asCarPlay_forConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "configureNCMInterface:asCarPlay:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
}

- (BOOL)setNeedOutZLP:(BOOL)a3 maxOutLength:(unsigned int)a4 forConnectionUUID:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__AccessoryTransportPluginUSBHost_setNeedOutZLP_maxOutLength_forConnectionUUID___block_invoke;
  v13[3] = &unk_24D706C38;
  v13[4] = self;
  v14 = v8;
  v17 = a3;
  v16 = a4;
  v15 = &v18;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __80__AccessoryTransportPluginUSBHost_setNeedOutZLP_maxOutLength_forConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "setNeedOutZLP:", *(unsigned __int8 *)(a1 + 60));
    objc_msgSend(v3, "setMaxOutLength:", *(unsigned int *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint64_t *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _BYTE buf[24];
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (acc_userDefaultsLogging_BOOLForKey((uint64_t)CFSTR("TransportSignpost")))
  {
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v11 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    v13 = objc_msgSend(v9, "hash");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v14 = objc_msgSend(v8, "length");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      _os_signpost_emit_with_name_impl(&dword_2171C1000, v11, OS_SIGNPOST_EVENT, v13, "Endpoint SEND", "Send outgoing data! %@, %lu bytes", buf, 0x16u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v36 = 0;
  -[AccessoryTransportPluginUSBHost activeEAInterfacesLock](self, "activeEAInterfacesLock");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke;
  block[3] = &unk_24D706C88;
  block[4] = self;
  v17 = v9;
  v27 = v17;
  v29 = &v31;
  v18 = v8;
  v28 = v18;
  v30 = buf;
  dispatch_sync(v15, block);

  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[AccessoryTransportPluginUSBHost accessoryConnectionsLock](self, "accessoryConnectionsLock");
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke_2;
    v22[3] = &unk_24D706CB0;
    v22[4] = self;
    v23 = v10;
    v25 = &v31;
    v24 = v18;
    dispatch_sync(v19, v22);

  }
  v20 = *((_BYTE *)v32 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

void __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeEAInterfaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "writeData:", *(_QWORD *)(a1 + 48));
    v3 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

}

void __87__AccessoryTransportPluginUSBHost_sendOutgoingData_forEndpointWithUUID_connectionUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accessoryConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "writeData:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeUSBCDCInterfaces");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "writeData:", *(_QWORD *)(a1 + 48)) != 0;

  }
}

- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  +[AccessoryUSBBillboardDeviceManager sharedManager](AccessoryUSBBillboardDeviceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "startDetectUSBBillboardDeviceWithVID:PID:", v5, v4);

  return v4;
}

- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  +[AccessoryUSBBillboardDeviceManager sharedManager](AccessoryUSBBillboardDeviceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "stopDetectUSBBillboardDeviceWithVID:PID:", v5, v4);

  return v4;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)accessoryConnections
{
  return self->_accessoryConnections;
}

- (void)setAccessoryConnections:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryConnections, a3);
}

- (NSMutableDictionary)accessoryNativeUSBEndpoints
{
  return self->_accessoryNativeUSBEndpoints;
}

- (void)setAccessoryNativeUSBEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpoints, a3);
}

- (NSMutableDictionary)activeEAInterfaces
{
  return self->_activeEAInterfaces;
}

- (void)setActiveEAInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_activeEAInterfaces, a3);
}

- (NSMutableDictionary)activeUSBCDCInterfaces
{
  return self->_activeUSBCDCInterfaces;
}

- (void)setActiveUSBCDCInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_activeUSBCDCInterfaces, a3);
}

- (OS_dispatch_queue)accessoryConnectionsLock
{
  return self->_accessoryConnectionsLock;
}

- (void)setAccessoryConnectionsLock:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryConnectionsLock, a3);
}

- (OS_dispatch_queue)activeEAInterfacesLock
{
  return self->_activeEAInterfacesLock;
}

- (void)setActiveEAInterfacesLock:(id)a3
{
  objc_storeStrong((id *)&self->_activeEAInterfacesLock, a3);
}

- (OS_dispatch_queue)accessoryNativeUSBEndpointsLock
{
  return self->_accessoryNativeUSBEndpointsLock;
}

- (void)setAccessoryNativeUSBEndpointsLock:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpointsLock, a3);
}

- (int64_t)accessoryiAPIntefaceTrafficWaitListCount
{
  return self->_accessoryiAPIntefaceTrafficWaitListCount;
}

- (void)setAccessoryiAPIntefaceTrafficWaitListCount:(int64_t)a3
{
  self->_accessoryiAPIntefaceTrafficWaitListCount = a3;
}

- (NSMutableDictionary)accessoryiAPIntefaceTrafficWaitList
{
  return self->_accessoryiAPIntefaceTrafficWaitList;
}

- (void)setAccessoryiAPIntefaceTrafficWaitList:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficWaitList, a3);
}

- (OS_dispatch_source)accessoryiAPIntefaceTrafficTimer
{
  return self->_accessoryiAPIntefaceTrafficTimer;
}

- (void)setAccessoryiAPIntefaceTrafficTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficTimer, 0);
  objc_storeStrong((id *)&self->_accessoryiAPIntefaceTrafficWaitList, 0);
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpointsLock, 0);
  objc_storeStrong((id *)&self->_activeEAInterfacesLock, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionsLock, 0);
  objc_storeStrong((id *)&self->_activeUSBCDCInterfaces, 0);
  objc_storeStrong((id *)&self->_activeEAInterfaces, 0);
  objc_storeStrong((id *)&self->_accessoryNativeUSBEndpoints, 0);
  objc_storeStrong((id *)&self->_accessoryConnections, 0);
}

- (void)serviceAdded:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_6(&dword_2171C1000, v2, (uint64_t)v2, "Unable to create iapInterface, destroying USB Host connection", v3);
}

- (void)serviceAdded:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  _os_log_debug_impl(&dword_2171C1000, v2, OS_LOG_TYPE_DEBUG, "Found matching service!", v3, 2u);
}

- (void)serviceAdded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "IOService Added Callback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __48__AccessoryTransportPluginUSBHost_serviceAdded___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2171C1000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)serviceRemoved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "IOService Removed Callback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)VIDPIDServiceAdded:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_6(&dword_2171C1000, v2, (uint64_t)v2, "Unable to create cdc Interface, destroying USB Host connection", v3);
}

- (void)VIDPIDServiceAdded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "VIDPIDServiceAdded Callback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)VIDPIDServiceRemoved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "VIDPIDServiceRemoved Callback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
