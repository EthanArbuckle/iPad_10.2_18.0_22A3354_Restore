@implementation ACCTransportIOAccessoryManager

- (ACCTransportIOAccessoryManager)initWithIOService:(unsigned int)a3
{
  unsigned __int8 *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  io_service_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  io_registry_entry_t v33;
  const __CFAllocator *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *CFProperty;
  NSObject *v38;
  id v39;
  uint64_t v40;
  void *v41;
  int v42;
  NSObject *v43;
  id v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  dispatch_source_t v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  int v57;
  dispatch_source_t v58;
  void *v59;
  NSObject *v60;
  void *v62;
  _QWORD v63[4];
  id v64;
  _QWORD handler[4];
  unsigned __int8 *v66;
  id v67;
  unsigned int v68;
  io_registry_entry_t parent;
  objc_super v70;
  char cStr[48];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v70.receiver = self;
  v70.super_class = (Class)ACCTransportIOAccessoryManager;
  v4 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v70, sel_initWithIOAccessoryClass_ioService_, 0, *(_QWORD *)&a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v4 + 35);
    *((_QWORD *)v4 + 35) = v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v4 + 36);
    *((_QWORD *)v4 + 36) = v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v4 + 37);
    *((_QWORD *)v4 + 37) = v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v4 + 38);
    *((_QWORD *)v4 + 38) = v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v4 + 39);
    *((_QWORD *)v4 + 39) = v13;

    *((_DWORD *)v4 + 35) = 0;
    v4[113] = 0;
    v4[114] = 0;
    v4[115] = 0;
    v15 = (void *)*((_QWORD *)v4 + 41);
    *((_QWORD *)v4 + 41) = 0;

    v16 = (void *)*((_QWORD *)v4 + 42);
    *((_QWORD *)v4 + 42) = 0;

    v17 = (void *)*((_QWORD *)v4 + 43);
    *((_QWORD *)v4 + 43) = 0;

    v18 = (void *)*((_QWORD *)v4 + 44);
    *((_QWORD *)v4 + 44) = 0;

    v4[116] = 0;
    v4[117] = 0;
    v4[72] = 0;
    *((_QWORD *)v4 + 12) = 0;
    v4[104] = objc_msgSend(v4, "primaryPortNumber") == 257;
    v4[105] = 0;
    v4[106] = 0;
    v19 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = 0;

    v4[109] = 0;
    *((_DWORD *)v4 + 32) = 100;
    v4[118] = MGGetSInt32Answer() == 6;
    v20 = (IOAccessoryManagerGetType() & 0xF) == 5;
    v4[110] = v20;
    v4[110] = v4[118] | v20;
    *((_QWORD *)v4 + 40) = 0;
    *((_DWORD *)v4 + 33) = 0;
    v4[112] = 0;
    objc_msgSend(v4, "_clearAccessoryInfo");
    v4[107] = objc_msgSend(v4, "upstreamManagerService") == 0;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v21 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v21 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager initWithIOService:].cold.6((uint64_t)(v4 + 107), v21, v23, v24, v25, v26, v27, v28);

    v29 = objc_msgSend(v4, "ioService");
    if (IOServiceOpen(v29, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)v4 + 2))
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v30 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v30 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryManager initWithIOService:].cold.4();

    }
    else
    {
      objc_msgSend(v4, "_registerForIOAccessoryManagerInterestNotifications");
    }
    v32 = (void *)*((_QWORD *)v4 + 34);
    *((_QWORD *)v4 + 34) = 0;

    v33 = objc_msgSend(v4, "ioService");
    v34 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v35 = (const __CFString *)IORegistryEntrySearchCFProperty(v33, "IOService", CFSTR("IOProviderClass"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (v35)
    {
      v36 = v35;
      if (CFStringCompare(v35, CFSTR("AppleUVDMEndpoint"), 0))
      {
        v4[108] = 0;
      }
      else
      {
        v4[108] = 1;
        parent = 0;
        if (!IORegistryEntryGetParentEntry(objc_msgSend(v4, "ioService"), "IOAccessory", &parent))
        {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(parent, CFSTR("Description"), v34, 0);
          if (CFProperty
            || (v75 = 0u,
                v76 = 0u,
                v73 = 0u,
                v74 = 0u,
                v72 = 0u,
                memset(cStr, 0, sizeof(cStr)),
                !MEMORY[0x219A08A4C](parent, cStr))
            && (CFProperty = (void *)CFStringCreateWithCString(v34, cStr, 0x8000100u)) != 0)
          {
            v62 = CFProperty;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v38 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v38 = MEMORY[0x24BDACB70];
              v39 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v40 = *((_QWORD *)v4 + 34);
              *(_DWORD *)cStr = 136316162;
              *(_QWORD *)&cStr[4] = "-[ACCTransportIOAccessoryManager initWithIOService:]";
              *(_WORD *)&cStr[12] = 1024;
              *(_DWORD *)&cStr[14] = 977;
              *(_WORD *)&cStr[18] = 1024;
              *(_DWORD *)&cStr[20] = a3;
              *(_WORD *)&cStr[24] = 2112;
              *(_QWORD *)&cStr[26] = v40;
              *(_WORD *)&cStr[34] = 2112;
              *(_QWORD *)&cStr[36] = v62;
              _os_log_impl(&dword_21722C000, v38, OS_LOG_TYPE_DEFAULT, "%s:%d service %d, _managerParent %@ -> %@ ", (uint8_t *)cStr, 0x2Cu);
            }

            v41 = (void *)*((_QWORD *)v4 + 34);
            *((_QWORD *)v4 + 34) = v62;

          }
        }
      }
      CFRelease(v36);
    }
    else
    {
      v4[108] = 0;
    }
    v42 = objc_msgSend(v4, "_connectionTypeForPrimaryPort");
    *((_DWORD *)v4 + 31) = v42;
    v4[111] = v42 == 8;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v43 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v43 = MEMORY[0x24BDACB70];
      v44 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v45 = v4[107];
      v46 = v4[108];
      v47 = *((_DWORD *)v4 + 31);
      v48 = v4[110];
      v49 = v4[111];
      v50 = *((_QWORD *)v4 + 34);
      *(_DWORD *)cStr = 67110402;
      *(_DWORD *)&cStr[4] = v45;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v46;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v47;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v48;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v49;
      *(_WORD *)&cStr[32] = 2112;
      *(_QWORD *)&cStr[34] = v50;
      _os_log_impl(&dword_21722C000, v43, OS_LOG_TYPE_INFO, "IOAccessoryManager added,  isRootPort = %d, isAdapter = %d, _connectionType = %{coreacc:ACCConnection_Type_t}d, _bIsInductive = %d, _bIsInductivePowerToAccessory = %d, _managerParent = %@", (uint8_t *)cStr, 0x2Au);
    }

    v51 = MEMORY[0x24BDAC760];
    if (v4[110] && !v4[111])
      goto LABEL_52;
    v52 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v53 = (void *)*((_QWORD *)v4 + 18);
    *((_QWORD *)v4 + 18) = v52;

    *(_QWORD *)cStr = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)cStr, v4);
    v54 = *((_QWORD *)v4 + 18);
    handler[0] = v51;
    handler[1] = 3221225472;
    handler[2] = __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke;
    handler[3] = &unk_24D71A890;
    objc_copyWeak(&v67, (id *)cStr);
    v68 = a3;
    v66 = v4;
    dispatch_source_set_event_handler(v54, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v4 + 18), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v4 + 18));

    objc_destroyWeak(&v67);
    objc_destroyWeak((id *)cStr);
    if (v4[110])
    {
LABEL_52:
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v55 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v55 = MEMORY[0x24BDACB70];
        v56 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v4[110];
        *(_DWORD *)cStr = 136315394;
        *(_QWORD *)&cStr[4] = "-[ACCTransportIOAccessoryManager initWithIOService:]";
        *(_WORD *)&cStr[12] = 1024;
        *(_DWORD *)&cStr[14] = v57;
        _os_log_impl(&dword_21722C000, v55, OS_LOG_TYPE_DEFAULT, "%s: _bIsInductive %d, create uarpStagingStatusActivityTimer", (uint8_t *)cStr, 0x12u);
      }

      v58 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      v59 = (void *)*((_QWORD *)v4 + 11);
      *((_QWORD *)v4 + 11) = v58;

      *(_QWORD *)cStr = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)cStr, v4);
      v60 = *((_QWORD *)v4 + 11);
      v63[0] = v51;
      v63[1] = 3221225472;
      v63[2] = __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_31;
      v63[3] = &unk_24D71A8B8;
      objc_copyWeak(&v64, (id *)cStr);
      dispatch_source_set_event_handler(v60, v63);
      dispatch_source_set_timer(*((dispatch_source_t *)v4 + 11), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*((dispatch_object_t *)v4 + 11));
      objc_destroyWeak(&v64);
      objc_destroyWeak((id *)cStr);
    }
  }
  return (ACCTransportIOAccessoryManager *)v4;
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogObjects && gNumLogObjects >= 4)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(a1 + 48);
      v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 124);
      *(_DWORD *)buf = 67109376;
      v21 = v8;
      v22 = 1024;
      v23 = v9;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDBus auth timeout completed for IOAccMgr service:%d, connectionType:%{coreacc:ACCConnection_Type_t}d", buf, 0xEu);
    }

    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "setAuthenticationStatus:andCertificateData:authCTA:forConnectionWithUUID:", 3, 0, 0, v11);

    if ((v12 & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_cold_1();

    }
    v15 = objc_loadWeakRetained(v2);
    objc_msgSend(v15, "setFeaturesFromAuthStatus:authCert:certType:", 4, 0, 0xFFFFFFFFLL);

    v16 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 124);
    if (v16 != 1 && v16 != 8)
    {
      acc_userNotifications_accessoryNotSupported();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setGroupIdentifier:", v18);

      +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentNotification:completionHandler:", v17, 0);

    }
  }
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_31(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ACCTransportIOAccessoryManager initWithIOService:]_block_invoke";
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "%s: uarpStagingStatusActivityTimer fired!", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUartActivityTimeout");

}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSMutableSet *mutableioAccessoryChildPorts;
  NSMutableSet *mutableioAccessoryEAChildPorts;
  NSMutableSet *mutableioAccessoryAuthCPChildPorts;
  NSMutableSet *mutableioAccessoryOOBPairingChildPorts;
  NSMutableSet *mutableioAccessoryConfigStreamChildPorts;
  OS_dispatch_source *authTimerAccessory;
  NSObject *notificationUarpStagingStatusActivityTimer;
  OS_dispatch_source *v13;
  objc_super v14;
  uint8_t buf[4];
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "deallocating manager with service %d", buf, 8u);
  }

  -[NSMutableSet removeAllObjects](self->_mutableioAccessoryChildPorts, "removeAllObjects");
  mutableioAccessoryChildPorts = self->_mutableioAccessoryChildPorts;
  self->_mutableioAccessoryChildPorts = 0;

  -[NSMutableSet removeAllObjects](self->_mutableioAccessoryEAChildPorts, "removeAllObjects");
  mutableioAccessoryEAChildPorts = self->_mutableioAccessoryEAChildPorts;
  self->_mutableioAccessoryEAChildPorts = 0;

  -[NSMutableSet removeAllObjects](self->_mutableioAccessoryAuthCPChildPorts, "removeAllObjects");
  mutableioAccessoryAuthCPChildPorts = self->_mutableioAccessoryAuthCPChildPorts;
  self->_mutableioAccessoryAuthCPChildPorts = 0;

  -[NSMutableSet removeAllObjects](self->_mutableioAccessoryOOBPairingChildPorts, "removeAllObjects");
  mutableioAccessoryOOBPairingChildPorts = self->_mutableioAccessoryOOBPairingChildPorts;
  self->_mutableioAccessoryOOBPairingChildPorts = 0;

  -[NSMutableSet removeAllObjects](self->_mutableioAccessoryConfigStreamChildPorts, "removeAllObjects");
  mutableioAccessoryConfigStreamChildPorts = self->_mutableioAccessoryConfigStreamChildPorts;
  self->_mutableioAccessoryConfigStreamChildPorts = 0;

  if (self->_authTimerAccessory)
  {
    -[ACCTransportIOAccessoryManager _stopAuthTimer](self, "_stopAuthTimer");
    dispatch_source_cancel((dispatch_source_t)self->_authTimerAccessory);
    authTimerAccessory = self->_authTimerAccessory;
    self->_authTimerAccessory = 0;

  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer)
  {
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer);
    v13 = self->_notificationUarpStagingStatusActivityTimer;
    self->_notificationUarpStagingStatusActivityTimer = 0;

  }
  -[ACCTransportIOAccessoryManager setAccessoryPowerMode:](self, "setAccessoryPowerMode:", 1);
  v14.receiver = self;
  v14.super_class = (Class)ACCTransportIOAccessoryManager;
  -[ACCTransportIOAccessoryBase dealloc](&v14, sel_dealloc);
}

- (void)transportClassTerminated
{
  BOOL v3;
  id v4;
  NSObject *v5;
  OS_dispatch_source *authTimerAccessory;
  NSObject *notificationUarpStagingStatusActivityTimer;
  OS_dispatch_source *v8;
  objc_super v9;
  uint8_t buf[4];
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_authTimerAccessory)
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 4;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager canceling auth timer for service %d", buf, 8u);
    }

    -[ACCTransportIOAccessoryManager _stopAuthTimer](self, "_stopAuthTimer");
    dispatch_source_cancel((dispatch_source_t)self->_authTimerAccessory);
    authTimerAccessory = self->_authTimerAccessory;
    self->_authTimerAccessory = 0;

  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer)
  {
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_cancel((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer);
    v8 = self->_notificationUarpStagingStatusActivityTimer;
    self->_notificationUarpStagingStatusActivityTimer = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)ACCTransportIOAccessoryManager;
  -[ACCTransportIOAccessoryBase transportClassTerminated](&v9, sel_transportClassTerminated);
}

- (void)addIOAccessoryChildPort:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = (char *)MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = (char *)*(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager addIOAccessoryChildPort:].cold.1(v4, v7);

  -[ACCTransportIOAccessoryManager mutableioAccessoryChildPorts](self, "mutableioAccessoryChildPorts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  if (objc_msgSend(v4, "ioServiceClassType") == 2)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryEAChildPorts](self, "mutableioAccessoryEAChildPorts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v4);

  }
  if (objc_msgSend(v4, "ioServiceClassType") == 3)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryAuthCPChildPorts](self, "mutableioAccessoryAuthCPChildPorts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  if (objc_msgSend(v4, "ioServiceClassType") == 4)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryOOBPairingChildPorts](self, "mutableioAccessoryOOBPairingChildPorts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

  }
  if (objc_msgSend(v4, "ioServiceClassType") == 6)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryConfigStreamChildPorts](self, "mutableioAccessoryConfigStreamChildPorts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v4);

  }
  -[ACCTransportIOAccessoryManager _pokeResistorID](self, "_pokeResistorID");

}

- (void)removeIOAccessoryChildPort:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = (char *)MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = (char *)*(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager removeIOAccessoryChildPort:].cold.2(v4, v7);

  -[ACCTransportIOAccessoryManager mutableioAccessoryChildPorts](self, "mutableioAccessoryChildPorts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

  if (objc_msgSend(v4, "ioServiceClassType") == 2)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryEAChildPorts](self, "mutableioAccessoryEAChildPorts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v4);

  }
  if (objc_msgSend(v4, "ioServiceClassType") == 3)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryAuthCPChildPorts](self, "mutableioAccessoryAuthCPChildPorts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

    if (gLogObjects && gNumLogObjects >= 4)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Stop auth timer on AuthCP service removal, for IOAccessoryManager service %d", (uint8_t *)v15, 8u);
    }

    -[ACCTransportIOAccessoryManager _stopAuthTimer](self, "_stopAuthTimer");
  }
  if (objc_msgSend(v4, "ioServiceClassType") == 4)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryOOBPairingChildPorts](self, "mutableioAccessoryOOBPairingChildPorts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v4);

  }
  if (objc_msgSend(v4, "ioServiceClassType") == 6)
  {
    -[ACCTransportIOAccessoryManager mutableioAccessoryConfigStreamChildPorts](self, "mutableioAccessoryConfigStreamChildPorts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v4);

  }
}

- (BOOL)setFeaturesFromAuthStatus:(int)a3 authCert:(id)a4 certType:(int)a5
{
  id v7;
  io_registry_entry_t v8;
  const __CFNumber *CFProperty;
  const __CFNumber *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  NSObject *v15;
  id v16;
  unsigned int v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  int v22;
  unsigned int v23;
  _BOOL4 v24;
  _BOOL4 bIsInductivePowerToAccessory;
  _BOOL4 bIsInductive;
  char v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  int v36;
  id v37;
  int v38;
  _BOOL4 v39;
  NSObject *v40;
  id v41;
  id v42;
  int v43;
  unsigned int v44;
  NSObject *v45;
  id v46;
  const char *v47;
  int v48;
  unsigned int v49;
  io_service_t v50;
  kern_return_t v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  id v55;
  BOOL v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  const char *v63;
  int v64;
  unsigned int v65;
  int connectionType;
  int v67;
  int v68;
  int v69;
  BOOL v70;
  int v71;
  NSObject *v72;
  int v73;
  int v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  int v85;
  int v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v104;
  io_connect_t v105;
  unsigned int v106;
  int v107;
  NSObject *v108;
  int v109;
  int v110;
  NSObject *v111;
  NSObject *v112;
  int v113;
  id v114;
  int v115;
  int v116;
  int v117;
  id v118;
  BOOL v119;
  uint64_t v120;
  int v121;
  id v122;
  io_connect_t connect;
  int valuePtr;
  uint8_t buf[4];
  _BYTE v127[10];
  _BYTE v128[6];
  _BYTE v129[6];
  _BYTE v130[6];
  uint64_t v131;
  _BYTE v132[6];
  _BYTE v133[6];
  _BYTE v134[6];
  int v135;
  __int16 v136;
  int v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v8, CFSTR("IOAccessoryManagerInductiveFwMode"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 3;
  if (CFProperty)
  {
    v10 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v10);
  }
  if (self->_authTimerAccessory)
    -[ACCTransportIOAccessoryManager _stopAuthTimer](self, "_stopAuthTimer");
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v11 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = a5;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: certType %d", buf, 8u);
  }

  if (a5 == 3)
    v13 = MFAACreateDEVNCertCapsForCable();
  else
    v13 = MFAACreateCapsFromAuthCert();
  v14 = (uint64_t *)v13;
  v122 = v7;
  v121 = MFAACertificateAuthVersionNumber();
  if (v14)
  {
    v120 = *v14;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v127 = a5;
      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: certType %d, certCaps: NONE", buf, 8u);
    }

    v120 = 0;
  }
  v17 = MFAACanReceiveInductivePower();
  v18 = acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("OverrideCanReceiveInductivePowerOID"));
  v19 = acc_policies_supportInductivePowerTX(v18, v17);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v20 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    v23 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v24 = -[ACCTransportIOAccessoryManager bAccConnected](self, "bAccConnected");
    bIsInductivePowerToAccessory = self->_bIsInductivePowerToAccessory;
    bIsInductive = self->_bIsInductive;
    *(_DWORD *)buf = 67111680;
    *(_DWORD *)v127 = v22;
    *(_WORD *)&v127[4] = 1024;
    *(_DWORD *)&v127[6] = a3;
    *(_WORD *)v128 = 1024;
    *(_DWORD *)&v128[2] = a5;
    *(_WORD *)v129 = 1024;
    *(_DWORD *)&v129[2] = v23;
    *(_WORD *)v130 = 1024;
    *(_DWORD *)&v130[2] = v24;
    LOWORD(v131) = 1024;
    *(_DWORD *)((char *)&v131 + 2) = bIsInductivePowerToAccessory;
    HIWORD(v131) = 1024;
    *(_DWORD *)v132 = bIsInductive;
    *(_WORD *)&v132[4] = 1024;
    *(_DWORD *)v133 = valuePtr;
    *(_WORD *)&v133[4] = 1024;
    *(_DWORD *)v134 = v17;
    *(_WORD *)&v134[4] = 1024;
    v135 = v18;
    v136 = 1024;
    v137 = v19;
    _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: [%d] authStatus %d, certType %d, ioService %d, bAccConnected %d, _bIsInductivePowerToAccessory %d, _bIsInductive %d, inductiveFwMode %d, certAllowPowerOut %d, override %d, supportInductivePowerTX %d", buf, 0x44u);
  }

  if (self->_bIsInductive && valuePtr == 1)
    v28 = v19;
  else
    v28 = 1;
  if ((v28 & 1) != 0)
  {
    v29 = 0;
    v30 = 0xFFFF;
    v31 = 0x7FFFFFFF;
    v32 = 0x253E63000uLL;
    if (a3 == 1 || a3 == 4)
    {
      v36 = 0;
LABEL_77:
      v35 = v122;
      goto LABEL_78;
    }
    if (a3 == 2)
    {
      if (!-[ACCTransportIOAccessoryManager bAccConnected](self, "bAccConnected"))
      {
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v33 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v33 = MEMORY[0x24BDACB70];
          v42 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v43 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
          v44 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v127 = v43;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v44;
          _os_log_impl(&dword_21722C000, v33, OS_LOG_TYPE_DEFAULT, "[%d] bAccConnected for service %d is false, but auth has passed", buf, 0xEu);
        }

        -[ACCTransportIOAccessoryManager setBAccConnected:](self, "setBAccConnected:", 1);
        v32 = 0x253E63000uLL;
      }
      if (self->_bIsInductivePowerToAccessory)
      {
        v30 = 448;
        v36 = 65087;
LABEL_76:
        a3 = 2;
        v29 = 1;
        goto LABEL_77;
      }
      if (self->_bIsInductive)
      {
        if (a5 == 7 || (MFAACanChargeInductive() & 1) != 0)
        {
          v85 = 449;
          v86 = 65086;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v111 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v111 = MEMORY[0x24BDACB70];
            v118 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.17(self, v111);

          v85 = 465;
          v86 = 65070;
          v32 = 0x253E63000;
        }
        v119 = a5 == 2;
        if (a5 == 2)
          v36 = v86 | 0x100;
        else
          v36 = v86;
        if (v119)
          v30 = v85 & 0xD1;
        else
          v30 = v85;
        if (v19)
        {
          v30 &= 0x151u;
          v36 |= 0x80u;
        }
        goto LABEL_76;
      }
      if (v121 == 2)
      {
        v35 = v122;
        v107 = MFAACertificateAuthV2Class();
        if (v107 == 4)
        {
          logObjectForModule(3);
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            v109 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v127 = v109;
            _os_log_impl(&dword_21722C000, v108, OS_LOG_TYPE_DEFAULT, "[%d] V2.0 Class4, don't revoke nor allow AdvancedCharging !", buf, 8u);
          }

          v110 = 449;
          v31 = 4;
          v32 = 0x253E63000;
        }
        else
        {
          v31 = v107;
          v110 = 465;
        }
      }
      else
      {
        v110 = 465;
        v35 = v122;
      }
      if (MFAACanChargeHighVoltage())
      {
        if (gLogObjects && *(int *)(v32 + 2776) >= 4)
        {
          v112 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v112 = MEMORY[0x24BDACB70];
          v114 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          v115 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v127 = v115;
          _os_log_impl(&dword_21722C000, v112, OS_LOG_TYPE_DEFAULT, "[%d] HVC capable, allow AdvancedCharging !", buf, 8u);
        }
        v113 = 65086;
      }
      else
      {
        if ((acc_userDefaults_BOOLForKey((uint64_t)CFSTR("DisableIAPHVCFixForAuth")) & 1) != 0)
        {
          v113 = 65070;
LABEL_218:
          v117 = MFAACanUseAccPwrUHPM();
          v36 = v113 | v117;
          if (v117)
            v30 = v110 & 0x1FE;
          else
            v30 = v110;
          if (MFAACanUseAccPwrLoV())
          {
            v30 &= ~0x40u;
            v36 |= 0x40u;
          }
          a3 = 2;
          v29 = 1;
          goto LABEL_78;
        }
        logObjectForModule(3);
        v112 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          v116 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v127 = v116;
          _os_log_impl(&dword_21722C000, v112, OS_LOG_TYPE_DEFAULT, "[%d] override caps and don't revoke nor allow AdvancedCharging !", buf, 8u);
        }
        v113 = 65070;
      }

      v110 = 449;
      v32 = 0x253E63000;
      goto LABEL_218;
    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v40 = *(id *)(gLogObjects + 24);
      v35 = v122;
    }
    else
    {
      v35 = v122;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v40 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.14();

    v29 = 0;
    v36 = 0;
    v30 = 0;
  }
  else
  {
    v32 = 0x253E63000uLL;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v34 = *(id *)(gLogObjects + 24);
      v35 = v122;
    }
    else
    {
      v35 = v122;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v34 = MEMORY[0x24BDACB70];
      v37 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v38 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
      v39 = self->_bIsInductive;
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v127 = v38;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = v39;
      *(_WORD *)v128 = 1024;
      *(_DWORD *)&v128[2] = valuePtr;
      *(_WORD *)v129 = 1024;
      *(_DWORD *)&v129[2] = 1;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = 0;
      LOWORD(v131) = 1024;
      *(_DWORD *)((char *)&v131 + 2) = a3;
      HIWORD(v131) = 1024;
      *(_DWORD *)v132 = 1;
      _os_log_impl(&dword_21722C000, v34, OS_LOG_TYPE_DEFAULT, "setFeaturesFromAuthStatus: [%d] _bIsInductive %d, inductiveFwMode %d (TX %d), supportInductivePowerTX %d, force AuthStatus to Failed! %d -> %d", buf, 0x2Cu);
    }

    v29 = 0;
    v36 = 0;
    v30 = 0xFFFF;
    v31 = 0x7FFFFFFF;
    a3 = 1;
  }
LABEL_78:
  MFAADeallocAuthCertCaps();
  if (gLogObjects && *(int *)(v32 + 2776) >= 4)
  {
    v45 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v45 = MEMORY[0x24BDACB70];
    v46 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    if (v29)
      v47 = "PASSED";
    else
      v47 = "FAILED";
    v48 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber", v120);
    v49 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)v127 = v47;
    v32 = 0x253E63000uLL;
    *(_WORD *)&v127[8] = 1024;
    *(_DWORD *)v128 = v48;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)v129 = v121;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)v130 = v31;
    *(_WORD *)&v130[4] = 2048;
    v131 = v120;
    *(_WORD *)v132 = 1024;
    *(_DWORD *)&v132[2] = v30;
    *(_WORD *)v133 = 1024;
    *(_DWORD *)&v133[2] = v36;
    *(_WORD *)v134 = 1024;
    *(_DWORD *)&v134[2] = v49;
    _os_log_impl(&dword_21722C000, v45, OS_LOG_TYPE_DEFAULT, "AUTH [%s], [%d] ver %d / %x, authCertCaps0:%08llX -> ioAccFeatMaskRevoke:%08X, ioAccFeatMaskAllow:%08X, self.ioService %d\n", buf, 0x3Au);
  }

  connect = 0;
  v50 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v51 = IOServiceOpen(v50, *MEMORY[0x24BDAEC58], 0, &connect);
  if (!v51 && connect)
  {
    if (v30 && IOAccessoryManagerRevokeFeatures())
    {
      if (gLogObjects && *(int *)(v32 + 2776) >= 7)
      {
        v52 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v52 = MEMORY[0x24BDACB70];
        v57 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.10();

      v54 = 0;
      if (!v36)
        goto LABEL_123;
    }
    else
    {
      v54 = 1;
      if (!v36)
      {
LABEL_123:
        IOServiceClose(connect);
        v56 = v54 != 0;
        goto LABEL_124;
      }
    }
    if (IOAccessoryManagerAllowFeatures())
    {
      if (gLogObjects && *(int *)(v32 + 2776) >= 7)
      {
        v58 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v58 = MEMORY[0x24BDACB70];
        v59 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.8();

      v54 = 0;
    }
    goto LABEL_123;
  }
  if (gLogObjects && *(int *)(v32 + 2776) >= 7)
  {
    v53 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v53 = MEMORY[0x24BDACB70];
    v55 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v104 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    v105 = connect;
    v106 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v127 = v104;
    *(_WORD *)&v127[4] = 1024;
    *(_DWORD *)&v127[6] = v51;
    *(_WORD *)v128 = 1024;
    *(_DWORD *)&v128[2] = v105;
    v32 = 0x253E63000;
    *(_WORD *)v129 = 1024;
    *(_DWORD *)&v129[2] = v106;
    _os_log_error_impl(&dword_21722C000, v53, OS_LOG_TYPE_ERROR, "[%d] IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d", buf, 0x1Au);
  }

  v56 = 0;
LABEL_124:
  if (self->_bIsInductivePowerToAccessory)
  {
    if (v29)
      v60 = 4;
    else
      v60 = 2;
    if (gLogObjects && *(int *)(v32 + 2776) >= 4)
    {
      v61 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v61 = MEMORY[0x24BDACB70];
      v62 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      if (v29)
        v63 = "PASSED";
      else
        v63 = "FAILED";
      v64 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber", v120);
      v65 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v127 = v63;
      v32 = 0x253E63000uLL;
      *(_WORD *)&v127[8] = 1024;
      *(_DWORD *)v128 = v64;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)v129 = v60;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)v130 = v65;
      _os_log_impl(&dword_21722C000, v61, OS_LOG_TYPE_DEFAULT, "AUTH [%s], for AWC [%d], setting power mode %d, self.ioService %d", buf, 0x1Eu);
    }

    -[ACCTransportIOAccessoryManager setAccessoryPowerMode:](self, "setAccessoryPowerMode:", v60);
  }
  connectionType = self->_connectionType;
  v67 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("PretendBatteryLevel"));
  if (!self->_bIsInductive || connectionType == 8)
    v68 = acc_userDefaults_BOOLForKey((uint64_t)CFSTR("AuthTTRForAllTransports"));
  else
    v68 = 1;
  if (-[ACCTransportIOAccessoryManager batteryChargeLevelPercent](self, "batteryChargeLevelPercent", v120) >= 0x50)
  {
    if (v67)
      v70 = v67 < 80;
    else
      v70 = 0;
    v69 = v70;
  }
  else
  {
    v69 = 1;
  }
  if ((v68 & v69) == 1)
  {
    if (a3 == 4)
    {
      v73 = acc_userDefaults_BOOLForKey((uint64_t)CFSTR("EnableAuthTimeoutTTR"));
      v74 = *(_DWORD *)(v32 + 2776);
      if (v73)
      {
        if (gLogObjects && v74 >= 4)
        {
          v75 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v75 = MEMORY[0x24BDACB70];
          v87 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.3(v75, v88, v89, v90, v91, v92, v93, v94);

        if (acc_userDefaults_BOOLForKey((uint64_t)CFSTR("SysdiagnoseInsteadOfAuthTTR")))
          acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose();
        else
          acc_tapToRadar_InitiateAuthTimeoutTTR();
      }
      else
      {
        if (gLogObjects && v74 >= 7)
        {
          v84 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v84 = MEMORY[0x24BDACB70];
          v95 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.5(v84, v96, v97, v98, v99, v100, v101, v102);

      }
    }
    else if (a3 == 1)
    {
      v71 = *(_DWORD *)(v32 + 2776);
      if (gLogObjects && v71 >= 4)
      {
        v72 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v72 = MEMORY[0x24BDACB70];
        v76 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessoryManager setFeaturesFromAuthStatus:authCert:certType:].cold.1(v72, v77, v78, v79, v80, v81, v82, v83);

      if (acc_userDefaults_BOOLForKey((uint64_t)CFSTR("SysdiagnoseInsteadOfAuthTTR")))
        acc_sysdiagnose_InitiateAuthFailureSysdiagnose();
      else
        acc_tapToRadar_InitiateAuthFailureTTR();
    }
  }

  return v56;
}

- (BOOL)setUSBMode:(int)a3
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  int v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:](self, "_IOAccUSBModeTypeForSetUSBMode:");
  v6 = IOAccessoryManagerConfigureUSBMode();
  v7 = v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 3;
  else
    v8 = 1;
  v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 67109632;
      v15 = a3;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = v7;
      _os_log_error_impl(&dword_21722C000, v10, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerConfigureUSBMode usbMode=%d usbModeType (IOAccessoryUSBModeType) %d failed 0x%X", (uint8_t *)&v14, 0x14u);
    }
  }
  else
  {
    if (v9)
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 67109632;
      v15 = a3;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_debug_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEBUG, "successfully set USB Mode %d (IOAccessoryUSBModeType %d) for service %d", (uint8_t *)&v14, 0x14u);
    }
  }

  return v7 == 0;
}

- (int)getUSBMode
{
  int USBConnectType;
  BOOL v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBConnectType = IOAccessoryManagerGetUSBConnectType();
  if (gLogObjects)
    v4 = gNumLogObjects <= 3;
  else
    v4 = 1;
  v5 = !v4;
  if (USBConnectType)
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager getUSBMode].cold.4();
  }
  else
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      v14 = -1;
      v15 = 1024;
      v16 = 0;
      v17 = 1024;
      v18 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_debug_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEBUG, "USB Connect %d, usbConnectActive %d, for service %d", buf, 0x14u);
    }
  }

  v9 = -[ACCTransportIOAccessoryManager _ACCPlatformUSBModeForIOAccessoryUSBConnectType:](self, "_ACCPlatformUSBModeForIOAccessoryUSBConnectType:", 0xFFFFFFFFLL);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager getUSBMode].cold.1();

  return v9;
}

- (BOOL)setUSBCurrentOffset:(int)a3
{
  int v3;
  int v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;

  v3 = IOAccessoryManagerSetUSBCurrentOffset();
  v4 = v3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 3;
  else
    v5 = 1;
  v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setUSBCurrentOffset:].cold.3();
  }
  else
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager setUSBCurrentOffset:].cold.1();
  }

  return v4 == 0;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forceResponse:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  unsigned int currentLimitBaseInmA;
  _BOOL4 currentLimitBaseInmAValid;
  _BOOL4 v18;
  dispatch_time_t v19;
  NSObject *notificationPortQueue;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = IOAccessoryManagerSetUSBCurrentLimitBase();
  v8 = v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 3;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setUSBCurrentLimitBase:forceResponse:].cold.4();
  }
  else
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager setUSBCurrentLimitBase:forceResponse:].cold.2();
  }

  if ((platform_systemInfo_isLightning() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v14 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      currentLimitBaseInmA = self->_currentLimitBaseInmA;
      currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
      *(_DWORD *)buf = 67110144;
      v24 = currentLimitBaseInmA;
      v25 = 1024;
      v26 = a3;
      v27 = 1024;
      v28 = currentLimitBaseInmAValid;
      v29 = 1024;
      v30 = 1;
      v31 = 1024;
      v32 = v4;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "setUSBCurrentLimitBase: not lightning device, currentLimitBaseInmA %d -> %d, valid %d -> %d, forceResponse %d", buf, 0x20u);
    }

    if (v4 || self->_currentLimitBaseInmA != a3)
    {
      self->_currentLimitBaseInmA = a3;
      self->_currentLimitBaseInmAValid = 1;
LABEL_36:
      v19 = dispatch_time(0, 10000000);
      notificationPortQueue = self->super._notificationPortQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__ACCTransportIOAccessoryManager_setUSBCurrentLimitBase_forceResponse___block_invoke;
      block[3] = &unk_24D719E68;
      block[4] = self;
      dispatch_after(v19, notificationPortQueue, block);
      return v8 == 0;
    }
    v18 = self->_currentLimitBaseInmAValid;
    self->_currentLimitBaseInmA = a3;
    self->_currentLimitBaseInmAValid = 1;
    if (!v18)
      goto LABEL_36;
  }
  return v8 == 0;
}

uint64_t __71__ACCTransportIOAccessoryManager_setUSBCurrentLimitBase_forceResponse___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "setUSBCurrentLimitBase: auto generate kIOAccessoryManagerMessageUSBCurrentLimitChange", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handleUSBCurrentLimitNotification");
}

- (unsigned)USBCurrentLimitInmA
{
  int USBCurrentLimit;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  unsigned int currentLimitBaseInmA;
  NSObject *v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  _BOOL4 currentLimitBaseInmAValid;
  void *v19;
  unsigned int v20;
  uint8_t buf[4];
  _BYTE v22[10];
  _BYTE v23[10];
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBCurrentLimit = IOAccessoryManagerGetUSBCurrentLimit();
  if (USBCurrentLimit)
  {
    v20 = 0;
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v22 = v20;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = USBCurrentLimit;
      *(_WORD *)v23 = 2112;
      *(_QWORD *)&v23[2] = v19;
      v24 = 1024;
      v25 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_error_impl(&dword_21722C000, v8, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerGetUSBCurrentLimit currentLimitBaseInmA=%d failed 0x%X for connectionUUID %@, self.ioService %d", buf, 0x1Eu);

    }
    if ((platform_systemInfo_isLightning() & 1) == 0 && self->_currentLimitBaseInmAValid)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v9 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        currentLimitBaseInmA = self->_currentLimitBaseInmA;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v22 = v20;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = currentLimitBaseInmA;
        _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "USBCurrentLimitInmA: not lightning device and _currentLimitBaseInmAValid, usbCurrentLimitInmA %d -> %d", buf, 0xEu);
      }

      v20 = self->_currentLimitBaseInmA;
    }
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 4;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager USBCurrentLimitInmA].cold.2((uint64_t)&v20, self);

    platform_systemInfo_isLightning();
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v20;
    v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v22 = "-[ACCTransportIOAccessoryManager USBCurrentLimitInmA]";
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)v23 = USBCurrentLimit;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v15;
    v24 = 1024;
    v25 = v16;
    v26 = 1024;
    v27 = currentLimitBaseInmAValid;
    _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimit -> %d for service %d, _currentLimitBaseInmAValid %d", buf, 0x24u);
  }

  return v20;
}

- (unsigned)USBCurrentLimitBaseInmA
{
  int USBCurrentLimitBase;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  unsigned int currentLimitBaseInmA;
  NSObject *v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  _BOOL4 currentLimitBaseInmAValid;
  void *v19;
  unsigned int v20;
  uint8_t buf[4];
  _BYTE v22[10];
  _BYTE v23[10];
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase();
  if (USBCurrentLimitBase)
  {
    v20 = 0;
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v22 = v20;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = USBCurrentLimitBase;
      *(_WORD *)v23 = 2112;
      *(_QWORD *)&v23[2] = v19;
      v24 = 1024;
      v25 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_error_impl(&dword_21722C000, v8, OS_LOG_TYPE_ERROR, "ERROR - IOAccessoryManagerGetUSBCurrentLimitBase currentLimitBaseInmA=%d failed 0x%X for connectionUUID %@, self.ioService %d", buf, 0x1Eu);

    }
    if ((platform_systemInfo_isLightning() & 1) == 0 && self->_currentLimitBaseInmAValid)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v9 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        currentLimitBaseInmA = self->_currentLimitBaseInmA;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v22 = v20;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = currentLimitBaseInmA;
        _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "USBCurrentLimitBaseInmA: not lightning device and _currentLimitBaseInmAValid, usbCurrentLimitBaseInmA %d -> %d", buf, 0xEu);
      }

      v20 = self->_currentLimitBaseInmA;
    }
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 4;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager USBCurrentLimitBaseInmA].cold.2((uint64_t)&v20, self);

    platform_systemInfo_isLightning();
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v20;
    v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    currentLimitBaseInmAValid = self->_currentLimitBaseInmAValid;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v22 = "-[ACCTransportIOAccessoryManager USBCurrentLimitBaseInmA]";
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)v23 = USBCurrentLimitBase;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v15;
    v24 = 1024;
    v25 = v16;
    v26 = 1024;
    v27 = currentLimitBaseInmAValid;
    _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimitBase -> %d for service %d, _currentLimitBaseInmAValid %d", buf, 0x24u);
  }

  return v20;
}

- (int)USBCurrentLimitOffsetInmA
{
  int USBCurrentLimitOffset;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  unsigned int v12;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBCurrentLimitOffset = IOAccessoryManagerGetUSBCurrentLimitOffset();
  if (USBCurrentLimitOffset)
  {
    v14 = 0;
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager USBCurrentLimitOffsetInmA].cold.4();
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 4;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager USBCurrentLimitOffsetInmA].cold.2((uint64_t)&v14, self);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v14;
    v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    *(_DWORD *)buf = 136315906;
    v16 = "-[ACCTransportIOAccessoryManager USBCurrentLimitOffsetInmA]";
    v17 = 1024;
    v18 = USBCurrentLimitOffset;
    v19 = 1024;
    v20 = v11;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBCurrentLimitOffset -> %d for service %d", buf, 0x1Eu);
  }

  return v14;
}

- (unsigned)USBChargingVoltageInmV
{
  int USBChargingVoltage;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBChargingVoltage = IOAccessoryManagerGetUSBChargingVoltage();
  if (USBChargingVoltage)
  {
    v14 = 0;
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager USBChargingVoltageInmV].cold.4();
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 4;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager USBChargingVoltageInmV].cold.2((uint64_t)&v14, self);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v14;
    v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    *(_DWORD *)buf = 136315906;
    v16 = "-[ACCTransportIOAccessoryManager USBChargingVoltageInmV]";
    v17 = 1024;
    v18 = USBChargingVoltage;
    v19 = 1024;
    v20 = v11;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "%s: status %x, IOAccessoryManagerGetUSBChargingVoltage -> %d for service %d", buf, 0x1Eu);
  }

  return v14;
}

- (int)cableType
{
  int USBConnectType;
  BOOL v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = -1;
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  USBConnectType = IOAccessoryManagerGetUSBConnectType();
  if (gLogObjects)
    v4 = gNumLogObjects <= 3;
  else
    v4 = 1;
  v5 = !v4;
  if (USBConnectType)
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager getUSBMode].cold.4();
  }
  else
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      v20 = v18;
      v21 = 1024;
      v22 = 0;
      v23 = 1024;
      v24 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_debug_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEBUG, "CableType: %d, usbConnectActive %d, for service %d", buf, 0x14u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager cableType].cold.1((uint64_t)&v18, v9, v11, v12, v13, v14, v15, v16);

  return v18;
}

- (unsigned)sleepPowerCurrentLimitInmA
{
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  return IOAccessoryManagerGetSleepPowerCurrentLimit();
}

- (BOOL)isPowerDuringSleepSupported
{
  int IsSupported;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  IsSupported = IOAccessoryManagerPowerDuringSleepIsSupported();
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 67109120;
    LODWORD(v12) = IsSupported != 0;
    _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_INFO, "powerDuringSleepIsSupported = %d", (uint8_t *)&v11, 8u);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v11 = 136315650;
    v12 = "-[ACCTransportIOAccessoryManager isPowerDuringSleepSupported]";
    v13 = 1024;
    v14 = IsSupported != 0;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: IOAccessoryManagerPowerDuringSleepIsSupported -> %d for service %d", (uint8_t *)&v11, 0x18u);
  }

  return IsSupported != 0;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  _DWORD v13[2];
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = IOAccessoryManagerSetPowerDuringSleep();
  v6 = v5;
  if (gLogObjects)
    v7 = gNumLogObjects <= 3;
  else
    v7 = 1;
  v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setPowerDuringSleepEnabled:].cold.2();
  }
  else
  {
    if (v8)
    {
      v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109376;
      v13[1] = v3;
      v14 = 1024;
      v15 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "successfully set IOAccessoryManagerSetPowerDuringSleep enabled %d for service %d", (uint8_t *)v13, 0xEu);
    }
  }

  return v6 == 0;
}

- (BOOL)isPowerDuringSleepEnabled
{
  int PowerDuringSleep;
  BOOL v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  PowerDuringSleep = IOAccessoryManagerGetPowerDuringSleep();
  if (gLogObjects)
    v3 = gNumLogObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = PowerDuringSleep != 0;
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_INFO, "powerDuringSleepIsEnabled = %d", (uint8_t *)v7, 8u);
  }

  return PowerDuringSleep != 0;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forceResponse:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _BOOL4 batteryPackModeEnabled;
  _BOOL4 batteryPackModeEnabledValid;
  _BOOL4 v18;
  dispatch_time_t v19;
  NSObject *notificationPortQueue;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v4 = a4;
  v5 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = IOAccessoryManagerSetBatteryPackMode();
  v8 = v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 3;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setBatteryPackMode:forceResponse:].cold.4();
  }
  else
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager setBatteryPackMode:forceResponse:].cold.2(v5, self);
  }

  if ((platform_systemInfo_isLightning() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v14 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      batteryPackModeEnabled = self->_batteryPackModeEnabled;
      batteryPackModeEnabledValid = self->_batteryPackModeEnabledValid;
      *(_DWORD *)buf = 67110144;
      v24 = batteryPackModeEnabled;
      v25 = 1024;
      v26 = v5;
      v27 = 1024;
      v28 = batteryPackModeEnabledValid;
      v29 = 1024;
      v30 = 1;
      v31 = 1024;
      v32 = v4;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "setBatteryPackMode: not lightning device, batteryPackModeEnabled %d -> %d, valid %d -> %d, forceResponse %d", buf, 0x20u);
    }

    if (v4 || self->_batteryPackModeEnabled != v5)
    {
      self->_batteryPackModeEnabled = v5;
      self->_batteryPackModeEnabledValid = 1;
LABEL_36:
      v19 = dispatch_time(0, 10000000);
      notificationPortQueue = self->super._notificationPortQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__ACCTransportIOAccessoryManager_setBatteryPackMode_forceResponse___block_invoke;
      block[3] = &unk_24D719E68;
      block[4] = self;
      dispatch_after(v19, notificationPortQueue, block);
      return v8 == 0;
    }
    v18 = self->_batteryPackModeEnabledValid;
    self->_batteryPackModeEnabled = v5;
    self->_batteryPackModeEnabledValid = 1;
    if (!v18)
      goto LABEL_36;
  }
  return v8 == 0;
}

uint64_t __67__ACCTransportIOAccessoryManager_setBatteryPackMode_forceResponse___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "setBatteryPackMode: auto generate kIOAccessoryManagerMessageUSBBatteryPackChange", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handleBatteryPackNotification");
}

- (BOOL)isBatteryPackModeEnabled
{
  int BatteryPackMode;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  _BOOL4 batteryPackModeEnabled;
  BOOL v8;
  id v9;
  NSObject *v10;
  _BOOL4 batteryPackModeEnabledValid;
  int v13;
  _BYTE v14[10];
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  BatteryPackMode = IOAccessoryManagerGetBatteryPackMode();
  v4 = BatteryPackMode != 0;
  if ((platform_systemInfo_isLightning() & 1) == 0 && self->_batteryPackModeEnabledValid)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      batteryPackModeEnabled = self->_batteryPackModeEnabled;
      v13 = 67109376;
      *(_DWORD *)v14 = BatteryPackMode != 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = batteryPackModeEnabled;
      _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_INFO, "setBatteryPackMode: not lightning device and batteryPackModeEnabledValid, batteryPackModeEnabled %d -> %d", (uint8_t *)&v13, 0xEu);
    }

    v4 = self->_batteryPackModeEnabled;
  }
  if (gLogObjects)
    v8 = gNumLogObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    batteryPackModeEnabledValid = self->_batteryPackModeEnabledValid;
    v13 = 136315650;
    *(_QWORD *)v14 = "-[ACCTransportIOAccessoryManager isBatteryPackModeEnabled]";
    *(_WORD *)&v14[8] = 1024;
    v15 = v4;
    v16 = 1024;
    v17 = batteryPackModeEnabledValid;
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "%s: batteryPackModeIsEnabled = %d, _batteryPackModeEnabledValid %d", (uint8_t *)&v13, 0x18u);
  }

  return v4;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3
{
  int v3;
  int v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;

  v3 = IOAccessoryManagerSetAccessoryRequestedCurrent();
  v4 = v3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 3;
  else
    v5 = 1;
  v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setAccessoryRequestedCurrent:].cold.3();
  }
  else
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager setAccessoryRequestedCurrent:].cold.1();
  }

  return v4 == 0;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3
{
  int v3;
  int v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;

  v3 = IOAccessoryManagerSetAccessoryUsedCurrent();
  v4 = v3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 3;
  else
    v5 = 1;
  v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setAccessoryUsedCurrent:].cold.3();
  }
  else
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager setAccessoryUsedCurrent:].cold.1();
  }

  return v4 == 0;
}

- (BOOL)resetAccessoryBaseCurrent
{
  int v3;
  int v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;

  v3 = IOAccessoryManagerRestoreUSBCurrentLimitBase();
  v4 = v3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 3;
  else
    v5 = 1;
  v6 = !v5;
  if (v3)
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager resetAccessoryBaseCurrent].cold.3();
  }
  else
  {
    if (v6)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager resetAccessoryBaseCurrent].cold.1(self);
  }

  return v4 == 0;
}

- (unsigned)accessoryChargingCurrentInmA
{
  uint64_t ActivePowerMode;
  unsigned int v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  ActivePowerMode = IOAccessoryManagerGetActivePowerMode();
  v4 = -[ACCTransportIOAccessoryManager accessoryPowerModeCurrentLimitInmA:](self, "accessoryPowerModeCurrentLimitInmA:", ActivePowerMode);
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 67109632;
    v9[1] = v4;
    v10 = 1024;
    v11 = ActivePowerMode;
    v12 = 1024;
    v13 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_debug_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEBUG, "successfully get accessoryChargingCurrentInmA %d with IOAccessoryPowerMode %d for service %d", (uint8_t *)v9, 0x14u);
  }

  return v4;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3
{
  unsigned int v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v5 = IOAccessoryManagerPowerModeCurrentLimit();
  if (gLogObjects)
    v6 = gNumLogObjects < 4;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109632;
    v10[1] = v5;
    v11 = 1024;
    v12 = a3;
    v13 = 1024;
    v14 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_debug_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEBUG, "successfully get IOAccessoryManagerPowerModeCurrentLimit %d with ACCPlatform_Power_Mode_t %d for service %d", (uint8_t *)v10, 0x14u);
  }

  return v5;
}

- (BOOL)supervisedTransportsRestricted
{
  io_registry_entry_t v3;
  CFTypeRef CFProperty;
  _BOOL8 v5;
  BOOL v6;
  id v7;
  NSObject *v8;

  if (-[ACCTransportIOAccessoryBase ioService](self, "ioService")
    && (v3 = -[ACCTransportIOAccessoryBase ioService](self, "ioService"),
        (CFProperty = IORegistryEntryCreateCFProperty(v3, CFSTR("SupervisedTransportsRestricted"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0)) != 0))
  {
    v5 = CFProperty != (CFTypeRef)*MEMORY[0x24BDBD268];
    CFRelease(CFProperty);
  }
  else
  {
    v5 = 1;
  }
  if (gLogObjects)
    v6 = gNumLogObjects < 4;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager supervisedTransportsRestricted].cold.1(v5, self);

  return v5;
}

- (void)_registerForIOAccessoryManagerInterestNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "error 0X%X  IOServiceAddInterestNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_registerForBatteryNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "error 0X%X  IOServiceAddMatchingNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (int)_IOAccUSBModeTypeForSetUSBMode:(int)a3
{
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  NSObject *v9;

  if (a3 >= 3)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:].cold.3();

    v3 = 0;
  }
  else
  {
    v3 = dword_21728F2AC[a3];
  }
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager _IOAccUSBModeTypeForSetUSBMode:].cold.1();

  return v3;
}

- (int)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:(int)a3
{
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  NSObject *v9;

  if (a3 >= 6)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager _ACCPlatformUSBModeForIOAccessoryUSBConnectType:].cold.3();

    v3 = -1;
  }
  else
  {
    v3 = dword_21728F2B8[a3];
  }
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager _ACCPlatformUSBModeForIOAccessoryUSBConnectType:].cold.1();

  return v3;
}

- (int)_connectionTypeForPrimaryPort
{
  int v3;
  int Type;
  int v6;
  NSObject *v7;
  id v8;

  if (-[ACCTransportIOAccessoryManager bIsInductive](self, "bIsInductive"))
    v3 = 4;
  else
    v3 = 1;
  -[ACCTransportIOAccessoryBase upstreamManagerService](self, "upstreamManagerService");
  Type = IOAccessoryManagerGetType();
  if (Type == 6 || Type == 3)
    v3 = 6;
  v6 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
  switch(v6)
  {
    case 512:
      v3 = 4;
      break;
    case 257:
      v3 = 8;
      break;
    case 256:
      v3 = 3;
      break;
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryManager _connectionTypeForPrimaryPort].cold.1();

  return v3;
}

- (id)_connectionUUIDsForNotification
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  void *v16;
  int v17;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  _BYTE v35[14];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  if (-[ACCTransportIOAccessoryManager isRootPort](self, "isRootPort")
    && -[ACCTransportIOAccessoryManager _connectionTypeForPrimaryPort](self, "_connectionTypeForPrimaryPort") != 3)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager _connectionUUIDsForNotification].cold.3();

    v27 = v4;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager _connectionUUIDsForNotification].cold.1();

    +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startSafeConnectionTransaction");
    objc_msgSend(v10, "allEndpointsUUIDs");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      v14 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(v10, "connectionUUIDForEndpointWithUUID:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v10, "connectionTypeForConnectionWithUUID:", v16);
          if (v17 == 6 || v17 == 1)
          {
            v19 = v17;
            v20 = v3;
            v21 = gLogObjects;
            v22 = gNumLogObjects;
            if (gLogObjects)
              v23 = gNumLogObjects < 4;
            else
              v23 = 1;
            if (v23)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v35 = v21;
                *(_WORD *)&v35[8] = 1024;
                *(_DWORD *)&v35[10] = v22;
                _os_log_error_impl(&dword_21722C000, v14, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v24 = v14;
              v25 = v14;
            }
            else
            {
              v25 = *(id *)(gLogObjects + 24);
            }
            v3 = v20;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v35 = v19;
              *(_WORD *)&v35[4] = 2112;
              *(_QWORD *)&v35[6] = v16;
              _os_log_impl(&dword_21722C000, v25, OS_LOG_TYPE_DEFAULT, "Found %{coreacc:ACCConnection_Type_t}d connectionType, need to send notification for connectionUUID %@", buf, 0x12u);
            }

            objc_msgSend(v20, "addObject:", v16);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }
    objc_msgSend(v10, "stopSafeConnectionTransaction");

    v4 = v27;
  }

  return v3;
}

- (void)_handleBatteryPackNotification
{
  -[ACCTransportIOAccessoryManager _sendNotification:](self, "_sendNotification:", *MEMORY[0x24BE1A060]);
}

- (void)_handleUSBCurrentLimitNotification
{
  -[ACCTransportIOAccessoryManager _sendNotification:](self, "_sendNotification:", *MEMORY[0x24BE1A078]);
}

- (void)_handlePowerChangeNotification
{
  -[ACCTransportIOAccessoryManager _sendNotification:](self, "_sendNotification:", *MEMORY[0x24BE1A070]);
}

- (void)_handleResistorIDChangeNotification:(int)a3
{
  uint64_t v3;
  BOOL v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  int v30;
  _QWORD block[5];
  int v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  const __CFString *v39;
  _QWORD v40[4];

  v3 = *(_QWORD *)&a3;
  v40[1] = *MEMORY[0x24BDAC8D0];
  if (-[ACCTransportIOAccessoryManager resistorID](self, "resistorID") == a3)
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 4;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager _handleResistorIDChangeNotification:].cold.1();

    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v3 != 100 && !v10)
    {
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke_53;
      v29[3] = &unk_24D71A8E0;
      v30 = v3;
      v29[4] = self;
      v13 = v29;
LABEL_41:
      dispatch_async(v11, v13);

    }
  }
  else
  {
    -[ACCTransportIOAccessoryManager setResistorID:](self, "setResistorID:", v3);
    if (gLogObjects)
      v7 = gNumLogObjects < 4;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = -[ACCTransportIOAccessoryManager resistorID](self, "resistorID");
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "Manager: New resistorID value %d", buf, 8u);
    }

    if ((_DWORD)v3 != 100)
    {
      v15 = (void *)MEMORY[0x24BDBCED8];
      v39 = CFSTR("resistorID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ACCTransportIOAccessoryManager resistorID](self, "resistorID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryWithDictionary:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (gLogObjects && gNumLogObjects >= 4)
      {
        v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = CFSTR("com.apple.accessories.resistor.idChanged");
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", buf, 0x16u);
      }

      AnalyticsSendEvent();
    }
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      if ((_DWORD)v3 == 100)
        return;
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke;
      block[3] = &unk_24D71A8E0;
      v32 = v3;
      block[4] = self;
      v13 = block;
      goto LABEL_41;
    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v22 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v24;
      _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEFAULT, "Manager: Have a connection UUID %@, sending resistorID notification", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x24BE1A028];
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = *MEMORY[0x24BE1A040];
    v34[0] = v26;
    v34[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:userInfo:", *MEMORY[0x24BE1A048], 0, v27);

  }
}

void __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "Manager: Have no connection UUID for valid resistorID %d on resistor ID change notification. Tell shared Manager", (uint8_t *)v7, 8u);
  }

  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "IOAccessoryManagerResistorIDChanged:forManager:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __70__ACCTransportIOAccessoryManager__handleResistorIDChangeNotification___block_invoke_53(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "Manager: Still have no connection UUID for a valid resistorID %d that should have a connectionUUID. Tell shared Manager", (uint8_t *)v7, 8u);
  }

  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "IOAccessoryManagerResistorIDChanged:forManager:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_sendNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockAccessoryPorts");

  -[ACCTransportIOAccessoryManager _connectionUUIDsForNotification](self, "_connectionUUIDsForNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryManager _sendNotification:].cold.1((uint64_t)v4, (uint64_t)v6, v7);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v12 = *MEMORY[0x24BE1A068];
      v13 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v34 = v12;
          v35 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = gLogObjects;
          v18 = gNumLogObjects;
          if (gLogObjects)
            v19 = gNumLogObjects < 4;
          else
            v19 = 1;
          if (v19)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v31 = v17;
              v32 = 1024;
              LODWORD(v33) = v18;
              _os_log_error_impl(&dword_21722C000, v13, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v20 = v13;
            v21 = v13;
          }
          else
          {
            v21 = *(id *)(gLogObjects + 24);
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v31 = (uint64_t)v4;
            v32 = 2112;
            v33 = v16;
            _os_log_debug_impl(&dword_21722C000, v21, OS_LOG_TYPE_DEBUG, "Sending %@ notification, notificationDict=%@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "postNotificationName:object:userInfo:", v4, 0, v16);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      }
      while (v10);
    }

    v6 = v24;
  }
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlockAccessoryPorts");

}

- (void)_processAccessoryInfo
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "primaryPortNumber");
  objc_msgSend(a1, "ioService");
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x28u);
  OUTLINED_FUNCTION_30();
}

- (void)_clearAccessoryInfo
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[ACCTransportIOAccessoryManager bIsInductive](self, "bIsInductive"))
  {
    -[ACCTransportIOAccessoryManager deviceModelNumber](self, "deviceModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ACCTransportIOAccessoryManager deviceModelNumber](self, "deviceModelNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCTransportIOAccessoryManager _unregisterForUarpActivityForModel:](self, "_unregisterForUarpActivityForModel:", v4);

    }
  }
  if (self->_allAccessoryInfoFieldsAreValid)
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 4;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "Clearing accessory info for manager %d", (uint8_t *)v8, 8u);
    }

    self->_allAccessoryInfoFieldsAreValid = 0;
    -[ACCTransportIOAccessoryManager setDeviceModelNumber:](self, "setDeviceModelNumber:", 0);
    -[ACCTransportIOAccessoryManager setDeviceName:](self, "setDeviceName:", 0);
    -[ACCTransportIOAccessoryManager setDeviceVendorName:](self, "setDeviceVendorName:", 0);
    -[ACCTransportIOAccessoryManager setDeviceSerialNumber:](self, "setDeviceSerialNumber:", 0);
    -[ACCTransportIOAccessoryManager setDeviceHardwareRevision:](self, "setDeviceHardwareRevision:", 0);
    -[ACCTransportIOAccessoryManager setDeviceFirmwareRevision:](self, "setDeviceFirmwareRevision:", 0);
    -[ACCTransportIOAccessoryManager setDigitalID:](self, "setDigitalID:", 0);
    -[ACCTransportIOAccessoryManager setRegionCode:](self, "setRegionCode:", 0);
    -[ACCTransportIOAccessoryManager setInductiveDeviceType:](self, "setInductiveDeviceType:", 0);
    -[ACCTransportIOAccessoryManager setInductiveDeviceID:](self, "setInductiveDeviceID:", 0);
    -[ACCTransportIOAccessoryManager setInductiveLocalDeviceID:](self, "setInductiveLocalDeviceID:", 0);
  }
}

- (void)_pokeResistorID
{
  id v4;
  NSObject *v5;
  uint64_t AccessoryID;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  unsigned int v12;
  id v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[ACCTransportIOAccessoryManager resistorID](self, "resistorID") == 100
    && -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber") != 1)
  {
    if (!gLogObjects || gNumLogObjects < 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Poking resistorID for service (%d) for rear-port IOAccessoryManager", (uint8_t *)&v15, 8u);
    }

    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    AccessoryID = IOAccessoryManagerGetAccessoryID();
    if (AccessoryID <= 0xF)
    {
      v7 = AccessoryID;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v8 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
        v15 = 67109376;
        v16 = v7;
        v17 = 1024;
        v18 = v14;
        _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "Have a resistorID to update from poke, %d, from service %d", (uint8_t *)&v15, 0xEu);
      }

LABEL_34:
      -[ACCTransportIOAccessoryManager _handleResistorIDChangeNotification:](self, "_handleResistorIDChangeNotification:", v7);
      return;
    }
  }
  if ((-[ACCTransportIOAccessoryManager resistorID](self, "resistorID") & 0x80000000) == 0
    && -[ACCTransportIOAccessoryManager resistorID](self, "resistorID") <= 15)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[ACCTransportIOAccessoryManager resistorID](self, "resistorID");
      v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      v15 = 67109376;
      v16 = v11;
      v17 = 1024;
      v18 = v12;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "Already have a resistorID to update from poke, %d, from service %d. Checking if we need to advertise connection", (uint8_t *)&v15, 0xEu);
    }

    v7 = -[ACCTransportIOAccessoryManager resistorID](self, "resistorID");
    goto LABEL_34;
  }
}

- (void)_stopAuthTimer
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *authTimerAccessory;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 4;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_INFO, "Stopping auth timer for service %d", (uint8_t *)v7, 8u);
  }

  authTimerAccessory = self->_authTimerAccessory;
  if (authTimerAccessory)
    dispatch_source_set_timer(authTimerAccessory, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  self->_isAuthTimedOut = 0;
}

- (void)_handleRegisterationForUarpActivityForModel:(id)a3 shouldRegister:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  ACCTransportIOAccessoryManager *v12;
  NSObject *v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  int v17;
  __CFString *v18;
  uint64_t v19;
  NSString *notificationUarpStartUpdateName;
  uint64_t v21;
  NSString *notificationUarpEndUpdateName;
  uint64_t v23;
  NSString *notificationUarpStagingStatusName;
  uint64_t v25;
  NSString *notificationUarpStagingStatusName2;
  NSObject *v27;
  id v28;
  int v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  __CFNotificationCenter *v38;
  __CFString *v39;
  __CFNotificationCenter *v40;
  __CFString *v41;
  __CFNotificationCenter *v42;
  __CFString *v43;
  __CFNotificationCenter *v44;
  __CFString *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  id v50;
  int v51;
  void *v52;
  id v53;
  int v54;
  void *v55;
  NSString *v56;
  NSString *v57;
  NSString *v58;
  NSString *v59;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v61;
  __CFNotificationCenter *v62;
  __CFString *v63;
  __CFNotificationCenter *v64;
  __CFString *v65;
  __CFNotificationCenter *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  int v80;
  __int16 v81;
  NSString *v82;
  __int16 v83;
  NSString *v84;
  __int16 v85;
  NSString *v86;
  __int16 v87;
  NSString *v88;
  uint64_t v89;

  v4 = a4;
  v89 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
    v73 = 1024;
    v74 = v10;
    v75 = 2112;
    v76 = v11;
    v77 = 2112;
    v78 = v6;
    v79 = 1024;
    v80 = v4;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@, shouldRegister %d", buf, 0x2Cu);

  }
  v12 = self;
  objc_sync_enter(v12);
  if (v4)
  {
    if (v12->_notificationUarpRegistered)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v28 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v29 = -[ACCTransportIOAccessoryBase primaryPortNumber](v12, "primaryPortNumber");
        -[ACCTransportIOAccessoryManager connectionUUID](v12, "connectionUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
        v73 = 1024;
        v74 = v29;
        v75 = 2112;
        v76 = v30;
        v77 = 2112;
        v78 = v6;
        v79 = 1024;
        v80 = 1;
        _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Already registered!!!", buf, 0x2Cu);

      }
LABEL_39:

      goto LABEL_64;
    }
    v17 = objc_msgSend(v6, "isEqualToString:", CFSTR("A3250"));
    v18 = CFSTR("A2580");
    if (!v17)
      v18 = 0;
    v70 = v18;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.uarp.startupdate."), v6);
    v19 = objc_claimAutoreleasedReturnValue();
    notificationUarpStartUpdateName = v12->_notificationUarpStartUpdateName;
    v12->_notificationUarpStartUpdateName = (NSString *)v19;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.uarp.endupdate."), v6);
    v21 = objc_claimAutoreleasedReturnValue();
    notificationUarpEndUpdateName = v12->_notificationUarpEndUpdateName;
    v12->_notificationUarpEndUpdateName = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.uarp.stagingstatus."), v6);
    v23 = objc_claimAutoreleasedReturnValue();
    notificationUarpStagingStatusName = v12->_notificationUarpStagingStatusName;
    v12->_notificationUarpStagingStatusName = (NSString *)v23;

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.uarp.stagingstatus."), CFSTR("A2580"));
      v25 = objc_claimAutoreleasedReturnValue();
      notificationUarpStagingStatusName2 = v12->_notificationUarpStagingStatusName2;
      v12->_notificationUarpStagingStatusName2 = (NSString *)v25;

    }
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v27 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v27 = MEMORY[0x24BDACB70];
      v53 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v54 = -[ACCTransportIOAccessoryBase primaryPortNumber](v12, "primaryPortNumber");
      -[ACCTransportIOAccessoryManager connectionUUID](v12, "connectionUUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v12->_notificationUarpStartUpdateName;
      v57 = v12->_notificationUarpEndUpdateName;
      v58 = v12->_notificationUarpStagingStatusName;
      v59 = v12->_notificationUarpStagingStatusName2;
      *(_DWORD *)buf = 136317186;
      v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
      v73 = 1024;
      v74 = v54;
      v75 = 2112;
      v76 = v55;
      v77 = 2112;
      v78 = v6;
      v79 = 1024;
      v80 = 1;
      v81 = 2112;
      v82 = v56;
      v83 = 2112;
      v84 = v57;
      v85 = 2112;
      v86 = v58;
      v87 = 2112;
      v88 = v59;
      _os_log_impl(&dword_21722C000, v27, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Register %@ / %@ / %@ / %@", buf, 0x54u);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpStartUpdateName](v12, "notificationUarpStartUpdateName");
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)__handleNotificationUarpStartUpdate, v61, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v62 = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpEndUpdateName](v12, "notificationUarpEndUpdateName");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v62, v12, (CFNotificationCallback)__handleNotificationUarpEndUpdate, v63, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v64 = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName](v12, "notificationUarpStagingStatusName");
    v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v64, v12, (CFNotificationCallback)__handleNotificationUarpStagingStatus, v65, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    if (v12->_notificationUarpStagingStatusName2)
    {
      v66 = CFNotificationCenterGetDarwinNotifyCenter();
      -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName2](v12, "notificationUarpStagingStatusName2");
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterAddObserver(v66, v12, (CFNotificationCallback)__handleNotificationUarpStagingStatus, v67, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    }
    CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName](v12, "notificationUarpStagingStatusName");
    v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
    __handleNotificationUarpStagingStatus((uint64_t)v68, v12, v68);

    if (v12->_notificationUarpStagingStatusName2)
    {
      CFNotificationCenterGetDarwinNotifyCenter();
      -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName2](v12, "notificationUarpStagingStatusName2");
      v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __handleNotificationUarpStagingStatus((uint64_t)v69, v12, v69);

    }
    v12->_notificationUarpRegistered = 1;

  }
  else
  {
    if (gLogObjects)
      v14 = gNumLogObjects <= 3;
    else
      v14 = 1;
    v15 = !v14;
    if (!v12->_notificationUarpRegistered)
    {
      if (v15)
      {
        v13 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v50 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v51 = -[ACCTransportIOAccessoryBase primaryPortNumber](v12, "primaryPortNumber");
        -[ACCTransportIOAccessoryManager connectionUUID](v12, "connectionUUID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
        v73 = 1024;
        v74 = v51;
        v75 = 2112;
        v76 = v52;
        v77 = 2112;
        v78 = v6;
        v79 = 1024;
        v80 = 0;
        _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Already unregistered!!!", buf, 0x2Cu);

      }
      goto LABEL_39;
    }
    if (v15)
    {
      v16 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v32 = -[ACCTransportIOAccessoryBase primaryPortNumber](v12, "primaryPortNumber");
      -[ACCTransportIOAccessoryManager connectionUUID](v12, "connectionUUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v12->_notificationUarpStartUpdateName;
      v35 = v12->_notificationUarpEndUpdateName;
      v36 = v12->_notificationUarpStagingStatusName;
      v37 = v12->_notificationUarpStagingStatusName2;
      *(_DWORD *)buf = 136317186;
      v72 = "-[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:]";
      v73 = 1024;
      v74 = v32;
      v75 = 2112;
      v76 = v33;
      v77 = 2112;
      v78 = v6;
      v79 = 1024;
      v80 = 0;
      v81 = 2112;
      v82 = v34;
      v83 = 2112;
      v84 = v35;
      v85 = 2112;
      v86 = v36;
      v87 = 2112;
      v88 = v37;
      _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', shouldRegister=%d, Unregister %@ / %@ / %@ / %@", buf, 0x54u);

    }
    -[ACCTransportIOAccessoryManager _stopTimerForUarpActivityForModel:](v12, "_stopTimerForUarpActivityForModel:", v6);
    v38 = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpStartUpdateName](v12, "notificationUarpStartUpdateName");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(v38, v12, v39, 0);

    v40 = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpEndUpdateName](v12, "notificationUarpEndUpdateName");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(v40, v12, v41, 0);

    v42 = CFNotificationCenterGetDarwinNotifyCenter();
    -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName](v12, "notificationUarpStagingStatusName");
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(v42, v12, v43, 0);

    if (v12->_notificationUarpStagingStatusName2)
    {
      v44 = CFNotificationCenterGetDarwinNotifyCenter();
      -[ACCTransportIOAccessoryManager notificationUarpStagingStatusName2](v12, "notificationUarpStagingStatusName2");
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterRemoveObserver(v44, v12, v45, 0);

    }
    v46 = v12->_notificationUarpStartUpdateName;
    v12->_notificationUarpStartUpdateName = 0;

    v47 = v12->_notificationUarpEndUpdateName;
    v12->_notificationUarpEndUpdateName = 0;

    v48 = v12->_notificationUarpStagingStatusName;
    v12->_notificationUarpStagingStatusName = 0;

    v49 = v12->_notificationUarpStagingStatusName2;
    v12->_notificationUarpStagingStatusName2 = 0;

    v12->_notificationUarpRegistered = 0;
  }
LABEL_64:
  objc_sync_exit(v12);

}

- (void)_registerForUarpActivityForModel:(id)a3
{
  -[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:](self, "_handleRegisterationForUarpActivityForModel:shouldRegister:", a3, 1);
}

- (void)_unregisterForUarpActivityForModel:(id)a3
{
  -[ACCTransportIOAccessoryManager _handleRegisterationForUarpActivityForModel:shouldRegister:](self, "_handleRegisterationForUarpActivityForModel:shouldRegister:", a3, 0);
}

- (void)_kickTimerForUarpActivityForModel:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  NSObject *notificationUarpStagingStatusActivityTimer;
  dispatch_time_t v20;
  void *v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_notificationUarpStagingStatusActivityTimer != 0;
    v23 = 136316162;
    v24 = "-[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:]";
    v25 = 1024;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v4;
    v31 = 1024;
    LODWORD(v32) = v10;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', (timer exist %d)", (uint8_t *)&v23, 0x2Cu);

  }
  if (self->_notificationUarpStagingStatusActivityTimer)
  {
    v11 = acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("UARPActivityTimerS"));
    if (v11)
      v12 = v11;
    else
      v12 = 600;
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v15 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:].cold.2(self);

      dispatch_source_set_timer((dispatch_source_t)self->_notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      if (v12 >= 0x78)
        v13 = 30;
      else
        v13 = v12 >> 2;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v14 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
        -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136316418;
        v24 = "-[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:]";
        v25 = 1024;
        v26 = v17;
        v27 = 2112;
        v28 = v18;
        v29 = 2112;
        v30 = v4;
        v31 = 2048;
        v32 = v12;
        v33 = 2048;
        v34 = v13;
        _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', start check timer. (%ld / %llu)", (uint8_t *)&v23, 0x3Au);

      }
      notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
      v20 = dispatch_time(0, 1000000000 * v12);
      dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, v20, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v13);
      __copyModelFromUarpNotificationName(self->_notificationUarpStagingStatusName2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self->_notificationUarpStagingStatusAlternateActive = objc_msgSend(v21, "isEqualToString:", v4);

    }
  }

}

- (void)_stopTimerForUarpActivityForModel:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *notificationUarpStagingStatusActivityTimer;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_notificationUarpStagingStatusActivityTimer != 0;
    v12 = 136316162;
    v13 = "-[ACCTransportIOAccessoryManager _stopTimerForUarpActivityForModel:]";
    v14 = 1024;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v4;
    v20 = 1024;
    v21 = v10;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel '%@', stop check timer. (timer exist %d)", (uint8_t *)&v12, 0x2Cu);

  }
  notificationUarpStagingStatusActivityTimer = self->_notificationUarpStagingStatusActivityTimer;
  if (notificationUarpStagingStatusActivityTimer)
    dispatch_source_set_timer(notificationUarpStagingStatusActivityTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_handleNotificationUarpStartUpdateForModel:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpStartUpdateForModel:]";
    v12 = 1024;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@", (uint8_t *)&v10, 0x26u);

  }
  -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:](self, "notifyDriverOfInductiveActivity:paused:", 1, 0);

}

- (void)_handleNotificationUarpEndUpdateForModel:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpEndUpdateForModel:]";
    v12 = 1024;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@", (uint8_t *)&v10, 0x26u);

  }
  -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:](self, "notifyDriverOfInductiveActivity:paused:", 0, 0);

}

- (void)_handleNotificationUarpStagingStatusForModel:(id)a3 state:(unint64_t)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  unint64_t notificationUarpStagingStatus;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    notificationUarpStagingStatus = self->_notificationUarpStagingStatus;
    v13 = 136316418;
    v14 = "-[ACCTransportIOAccessoryManager _handleNotificationUarpStagingStatusForModel:state:]";
    v15 = 1024;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = notificationUarpStagingStatus;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, accessoryModel %@, state %llu -> %llu", (uint8_t *)&v13, 0x3Au);

  }
  if (self->_notificationUarpStagingStatus != a4)
  {
    self->_notificationUarpStagingStatus = a4;
    -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:](self, "notifyDriverOfInductiveActivity:paused:", a4 != 0, a4 == 2);
    a4 = self->_notificationUarpStagingStatus;
  }
  if (a4 == 1)
    -[ACCTransportIOAccessoryManager _kickTimerForUarpActivityForModel:](self, "_kickTimerForUarpActivityForModel:", v6);
  else
    -[ACCTransportIOAccessoryManager _stopTimerForUarpActivityForModel:](self, "_stopTimerForUarpActivityForModel:", v6);

}

- (void)_handleUartActivityTimeout
{
  void **p_notificationUarpStagingStatusName2;
  NSObject *v4;
  id v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_deviceModelNumber)
  {
    self->_notificationUarpStagingActivityTimedOut = 1;
    p_notificationUarpStagingStatusName2 = (void **)&self->_notificationUarpStagingStatusName2;
    if (self->_notificationUarpStagingStatusName2 && self->_notificationUarpStagingStatusAlternateActive)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v4 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v6 = *p_notificationUarpStagingStatusName2;
      v11 = 136315394;
      v12 = "-[ACCTransportIOAccessoryManager _handleUartActivityTimeout]";
      v13 = 2112;
      v14 = v6;
      v7 = "%s: uarpStagingStatusTimer, handle alternate %@, force Inactive";
    }
    else
    {
      p_notificationUarpStagingStatusName2 = (void **)&self->_notificationUarpStagingStatusName;
      if (!self->_notificationUarpStagingStatusName)
        return;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v4 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v9 = *p_notificationUarpStagingStatusName2;
      v11 = 136315394;
      v12 = "-[ACCTransportIOAccessoryManager _handleUartActivityTimeout]";
      v13 = 2112;
      v14 = v9;
      v7 = "%s: uarpStagingStatusTimer, handle %@, force Inactive";
    }
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0x16u);
LABEL_22:

    __copyModelFromUarpNotificationName(*p_notificationUarpStagingStatusName2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCTransportIOAccessoryManager _handleNotificationUarpStagingStatusForModel:state:](self, "_handleNotificationUarpStagingStatusForModel:state:", v10, 0);

  }
}

- (void)notifyDriverOfInductiveActivity:(BOOL)a3 paused:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  io_service_t v12;
  kern_return_t v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  io_connect_t v23;
  unsigned int v24;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v4 = a4;
  v5 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    -[ACCTransportIOAccessoryManager connectionUUID](self, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v27 = "-[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]";
    v28 = 1024;
    v29 = v10;
    v30 = 2112;
    *(_QWORD *)v31 = v11;
    *(_WORD *)&v31[8] = 1024;
    v32 = v5;
    v33 = 1024;
    v34 = v4;
    v35 = 1024;
    v36 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "%s: [%d] %@, active %d, paused %d, service %d", buf, 0x2Eu);

  }
  connect = 0;
  v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v13 = IOServiceOpen(v12, *MEMORY[0x24BDAEC58], 0, &connect);
  if (v13)
    v14 = 1;
  else
    v14 = connect == 0;
  if (v14)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v15 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = connect;
      v24 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      *(_DWORD *)buf = 136315906;
      v27 = "-[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:]";
      v28 = 1024;
      v29 = v13;
      v30 = 1024;
      *(_DWORD *)v31 = v23;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v24;
      _os_log_error_impl(&dword_21722C000, v15, OS_LOG_TYPE_ERROR, "%s: IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d", buf, 0x1Eu);
    }

  }
  else
  {
    if (v5)
      v16 = 0x400000;
    else
      v16 = 0;
    if (v4)
      v17 = v16 | 0x800000;
    else
      v17 = v16;
    if ((!v5 || !v4) && IOAccessoryManagerRevokeFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v18 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v18 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:].cold.3();

    }
    if (v17 && IOAccessoryManagerAllowFeatures())
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v21 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryManager notifyDriverOfInductiveActivity:paused:].cold.1();

    }
    IOServiceClose(connect);
  }
}

- (NSSet)ioAccessoryChildPorts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[ACCTransportIOAccessoryManager mutableioAccessoryChildPorts](self, "mutableioAccessoryChildPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)eaProtocolChildPorts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[ACCTransportIOAccessoryManager mutableioAccessoryEAChildPorts](self, "mutableioAccessoryEAChildPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)authCPChildPorts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[ACCTransportIOAccessoryManager mutableioAccessoryAuthCPChildPorts](self, "mutableioAccessoryAuthCPChildPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)oobPairingChildPorts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[ACCTransportIOAccessoryManager mutableioAccessoryOOBPairingChildPorts](self, "mutableioAccessoryOOBPairingChildPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)configStreamChildPorts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[ACCTransportIOAccessoryManager mutableioAccessoryConfigStreamChildPorts](self, "mutableioAccessoryConfigStreamChildPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)connectionUUID
{
  ACCTransportIOAccessoryManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connectionUUID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setAccessoryPowerMode:(int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109632;
    v14 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber");
    v15 = 1024;
    v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v17 = 1024;
    v18 = a3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "setAccessoryPowerMode: primaryPort %d, ioService %d, accessoryPowerMode: %d", (uint8_t *)&v13, 0x14u);
  }

  if (IOAccessoryManagerConfigurePower())
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryManager setAccessoryPowerMode:].cold.2();
  }
  else
  {
    self->_accessoryPowerMode = a3;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[ACCTransportIOAccessoryManager accessoryPowerMode](self, "accessoryPowerMode");
      v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      v13 = 67109376;
      v14 = v11;
      v15 = 1024;
      v16 = v12;
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set acc. power mode to %u for service %u", (uint8_t *)&v13, 0xEu);
    }
  }

}

- (void)setConnectionUUID:(id)a3
{
  ACCTransportIOAccessoryManager *v4;
  uint64_t v5;
  NSString *connectionUUID;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  connectionUUID = v4->_connectionUUID;
  v4->_connectionUUID = (NSString *)v5;

  objc_sync_exit(v4);
}

- (int)accessoryPowerMode
{
  return self->_accessoryPowerMode;
}

- (BOOL)needsOOBPairing
{
  return self->_needsOOBPairing;
}

- (void)setNeedsOOBPairing:(BOOL)a3
{
  self->_needsOOBPairing = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)isAuthTimedOut
{
  return self->_isAuthTimedOut;
}

- (void)setIsAuthTimedOut:(BOOL)a3
{
  self->_isAuthTimedOut = a3;
}

- (BOOL)isRootPort
{
  return self->_isRootPort;
}

- (BOOL)isAdapter
{
  return self->_isAdapter;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (BOOL)bAccConnected
{
  return self->_bAccConnected;
}

- (void)setBAccConnected:(BOOL)a3
{
  self->_bAccConnected = a3;
}

- (int)resistorID
{
  return self->_resistorID;
}

- (void)setResistorID:(int)a3
{
  self->_resistorID = a3;
}

- (OS_dispatch_source)authTimerAccessory
{
  return self->_authTimerAccessory;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceVendorName
{
  return self->_deviceVendorName;
}

- (void)setDeviceVendorName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVendorName, a3);
}

- (NSString)deviceModelNumber
{
  return self->_deviceModelNumber;
}

- (void)setDeviceModelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelNumber, a3);
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSerialNumber, a3);
}

- (NSString)deviceHardwareRevision
{
  return self->_deviceHardwareRevision;
}

- (void)setDeviceHardwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareRevision, a3);
}

- (NSString)deviceFirmwareRevision
{
  return self->_deviceFirmwareRevision;
}

- (void)setDeviceFirmwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, a3);
}

- (NSString)ppid
{
  return self->_ppid;
}

- (void)setPpid:(id)a3
{
  objc_storeStrong((id *)&self->_ppid, a3);
}

- (NSData)digitalID
{
  return self->_digitalID;
}

- (void)setDigitalID:(id)a3
{
  objc_storeStrong((id *)&self->_digitalID, a3);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_regionCode, a3);
}

- (NSNumber)inductiveDeviceType
{
  return self->_inductiveDeviceType;
}

- (void)setInductiveDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_inductiveDeviceType, a3);
}

- (NSNumber)inductiveDeviceID
{
  return self->_inductiveDeviceID;
}

- (void)setInductiveDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_inductiveDeviceID, a3);
}

- (NSString)inductiveDeviceUID
{
  return self->_inductiveDeviceUID;
}

- (void)setInductiveDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_inductiveDeviceUID, a3);
}

- (NSNumber)inductiveLocalDeviceID
{
  return self->_inductiveLocalDeviceID;
}

- (void)setInductiveLocalDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_inductiveLocalDeviceID, a3);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_vendorID, a3);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (NSString)managerParent
{
  return self->_managerParent;
}

- (NSMutableSet)mutableioAccessoryChildPorts
{
  return self->_mutableioAccessoryChildPorts;
}

- (void)setMutableioAccessoryChildPorts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableioAccessoryChildPorts, a3);
}

- (NSMutableSet)mutableioAccessoryEAChildPorts
{
  return self->_mutableioAccessoryEAChildPorts;
}

- (void)setMutableioAccessoryEAChildPorts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableioAccessoryEAChildPorts, a3);
}

- (NSMutableSet)mutableioAccessoryAuthCPChildPorts
{
  return self->_mutableioAccessoryAuthCPChildPorts;
}

- (void)setMutableioAccessoryAuthCPChildPorts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableioAccessoryAuthCPChildPorts, a3);
}

- (NSMutableSet)mutableioAccessoryOOBPairingChildPorts
{
  return self->_mutableioAccessoryOOBPairingChildPorts;
}

- (void)setMutableioAccessoryOOBPairingChildPorts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableioAccessoryOOBPairingChildPorts, a3);
}

- (NSMutableSet)mutableioAccessoryConfigStreamChildPorts
{
  return self->_mutableioAccessoryConfigStreamChildPorts;
}

- (void)setMutableioAccessoryConfigStreamChildPorts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableioAccessoryConfigStreamChildPorts, a3);
}

- (BOOL)bIsInductive
{
  return self->_bIsInductive;
}

- (BOOL)bIsInductivePowerToAccessory
{
  return self->_bIsInductivePowerToAccessory;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)batteryIterator
{
  return self->_batteryIterator;
}

- (void)setBatteryIterator:(unsigned int)a3
{
  self->_batteryIterator = a3;
}

- (unsigned)batteryChargeLevelPercent
{
  return self->_batteryChargeLevelPercent;
}

- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3
{
  self->_batteryChargeLevelPercent = a3;
}

- (unsigned)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(unsigned int)a3
{
  self->_notificationRef = a3;
}

- (unsigned)currentLimitBaseInmA
{
  return self->_currentLimitBaseInmA;
}

- (void)setCurrentLimitBaseInmA:(unsigned int)a3
{
  self->_currentLimitBaseInmA = a3;
}

- (BOOL)currentLimitBaseInmAValid
{
  return self->_currentLimitBaseInmAValid;
}

- (void)setCurrentLimitBaseInmAValid:(BOOL)a3
{
  self->_currentLimitBaseInmAValid = a3;
}

- (BOOL)batteryPackModeEnabled
{
  return self->_batteryPackModeEnabled;
}

- (void)setBatteryPackModeEnabled:(BOOL)a3
{
  self->_batteryPackModeEnabled = a3;
}

- (BOOL)batteryPackModeEnabledValid
{
  return self->_batteryPackModeEnabledValid;
}

- (void)setBatteryPackModeEnabledValid:(BOOL)a3
{
  self->_batteryPackModeEnabledValid = a3;
}

- (NSString)notificationUarpStartUpdateName
{
  return self->_notificationUarpStartUpdateName;
}

- (NSString)notificationUarpEndUpdateName
{
  return self->_notificationUarpEndUpdateName;
}

- (NSString)notificationUarpStagingStatusName
{
  return self->_notificationUarpStagingStatusName;
}

- (NSString)notificationUarpStagingStatusName2
{
  return self->_notificationUarpStagingStatusName2;
}

- (BOOL)notificationUarpStagingStatusAlternateActive
{
  return self->_notificationUarpStagingStatusAlternateActive;
}

- (BOOL)notificationUarpStagingActivityTimedOut
{
  return self->_notificationUarpStagingActivityTimedOut;
}

- (BOOL)bIsWatch
{
  return self->_bIsWatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusName2, 0);
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusName, 0);
  objc_storeStrong((id *)&self->_notificationUarpEndUpdateName, 0);
  objc_storeStrong((id *)&self->_notificationUarpStartUpdateName, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryConfigStreamChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryOOBPairingChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryAuthCPChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryEAChildPorts, 0);
  objc_storeStrong((id *)&self->_mutableioAccessoryChildPorts, 0);
  objc_storeStrong((id *)&self->_managerParent, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_inductiveLocalDeviceID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceUID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceID, 0);
  objc_storeStrong((id *)&self->_inductiveDeviceType, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_digitalID, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_authTimerAccessory, 0);
  objc_storeStrong((id *)&self->_notificationUarpStagingStatusActivityTimer, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
}

- (void)initWithIOService:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "IOServiceOpen failed %#x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithIOService:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_21722C000, a2, a3, "IOAccessoryManager added, isRootPort = %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __52__ACCTransportIOAccessoryManager_initWithIOService___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_21();
  _os_log_error_impl(&dword_21722C000, v0, OS_LOG_TYPE_ERROR, "Auth timeout setAuthenticationStatus: failed!", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)addIOAccessoryChildPort:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_18(a1, a2);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_25(&dword_21722C000, v2, v3, "adding child port %@ with service %d and class type %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)removeIOAccessoryChildPort:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_18(a1, a2);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_25(&dword_21722C000, v2, v3, "removing child port %@ with service %d and type %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s failure TTR", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s timeout TTR", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setFeaturesFromAuthStatus:(uint64_t)a3 authCert:(uint64_t)a4 certType:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s timeout TTR disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.8()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_27(v1, v2);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10(&dword_21722C000, v0, v3, "[%d] IOAccMgrAllowFeatures fail kernStatus:%02X", v4);
  OUTLINED_FUNCTION_6_1();
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.10()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_27(v1, v2);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10(&dword_21722C000, v0, v3, "[%d] IOAccMgrRevokeFeatures fail kernStatus:%02X", v4);
  OUTLINED_FUNCTION_6_1();
}

- (void)setFeaturesFromAuthStatus:authCert:certType:.cold.14()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  __int16 v3;
  uint8_t v4[14];
  __int16 v5;
  int v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_27(v1, v2);
  OUTLINED_FUNCTION_15();
  v5 = v3;
  v6 = 2;
  _os_log_error_impl(&dword_21722C000, v0, OS_LOG_TYPE_ERROR, "[%d] Unsupported authStatus:%02X (Passed:%02X)", v4, 0x14u);
  OUTLINED_FUNCTION_6_1();
}

- (void)setFeaturesFromAuthStatus:(void *)a1 authCert:(NSObject *)a2 certType:.cold.17(void *a1, NSObject *a2)
{
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "primaryPortNumber");
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_21722C000, a2, OS_LOG_TYPE_ERROR, "[%d] AdvancedCharging is disabled for this device !", v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)getUSBMode
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v1, v2);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10(&dword_21722C000, v0, v3, "ERROR, failed to getUSBConnect for service %d, status 0x%X", v4);
  OUTLINED_FUNCTION_6_1();
}

- (void)setUSBCurrentOffset:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully set IOAccessoryManagerSetUSBCurrentOffset %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)setUSBCurrentOffset:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetUSBCurrentOffset currentOffsetInmA=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)setUSBCurrentLimitBase:forceResponse:.cold.2()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully set IOAccessoryManagerSetUSBCurrentLimitBase %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)setUSBCurrentLimitBase:forceResponse:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetUSBCurrentLimitBase currentLimitBaseInmA=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)USBCurrentLimitInmA
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully get IOAccessoryManagerGetUSBCurrentLimit %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)USBCurrentLimitBaseInmA
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully get IOAccessoryManagerGetUSBCurrentLimitBase %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)USBCurrentLimitOffsetInmA
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerGetUSBCurrentLimitOffset usbCurrentLimitOffsetInmA=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)USBChargingVoltageInmV
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerGetUSBChargingVoltage usbChargingVoltageInmV=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)cableType
{
  OUTLINED_FUNCTION_4_0(&dword_21722C000, a2, a3, "return cableType %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)setPowerDuringSleepEnabled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetPowerDuringSleep failed 0x%X", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)setBatteryPackMode:(uint64_t)a1 forceResponse:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a2, "ioService");
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully set IOAccessoryManagerSetBatteryPackMode enabled %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)setBatteryPackMode:forceResponse:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetBatteryPackMode failed 0x%X", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)setAccessoryRequestedCurrent:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully set IOAccessoryManagerSetAccessoryRequestedCurrent %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)setAccessoryRequestedCurrent:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetAccessoryRequestedCurrent accessoryRequestedCurrentInmA=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)setAccessoryUsedCurrent:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "successfully set IOAccessoryManagerSetAccessoryUsedCurrent %d for service %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)setAccessoryUsedCurrent:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerSetAccessoryUsedCurrent accessoryUsedCurrentInmA=%d failed 0x%X", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)resetAccessoryBaseCurrent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ERROR - IOAccessoryManagerRestoreUSBCurrentLimitBase  failed 0x%X", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)supervisedTransportsRestricted
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "connectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_3();
}

- (void)_IOAccUSBModeTypeForSetUSBMode:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&dword_21722C000, v0, OS_LOG_TYPE_DEBUG, "returning %d for IOAccessoryUSBModeType, ACCPlatform_USB_ModeSet_t %d", v1, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)_IOAccUSBModeTypeForSetUSBMode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "invalid ACCPlatform_USB_ModeSet_t usbMode %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "returning %d for ACCPlatform_USB_Mode_t", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ACCPlatformUSBModeForIOAccessoryUSBConnectType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "invalid IOAccessoryUSBConnectType usbConnect %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_connectionTypeForPrimaryPort
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_27(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_3_1(&dword_21722C000, v2, v3, "%{coreacc:ACCConnection_Type_t}d connection type for primary port IOAccessoryManager instance primaryPortNumber (Accessory Port Number ID in IOAccessoryManager) %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

- (void)_connectionUUIDsForNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "received IOAccessoryManager notification for main root primary port (not Orion)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleResistorIDChangeNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "New resistorID %d is the same as the current resistorID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_sendNotification:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_24(&dword_21722C000, a3, (uint64_t)a3, "Sending %@ notification for ConnectionUUIDs %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_kickTimerForUarpActivityForModel:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(a1, "primaryPortNumber");
  objc_msgSend(a1, "connectionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x26u);

  OUTLINED_FUNCTION_30();
}

- (void)notifyDriverOfInductiveActivity:paused:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_26(&dword_21722C000, v0, v1, "%s: IOAccMgrAllowFeatures 0x%x fail kernStatus:%02X", v2, v3, v4);
  OUTLINED_FUNCTION_2();
}

- (void)notifyDriverOfInductiveActivity:paused:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_26(&dword_21722C000, v0, v1, "%s: IOAccMgrRevokeFeatures 0x%x fail kernStatus:%02X", v2, v3, v4);
  OUTLINED_FUNCTION_2();
}

- (void)setAccessoryPowerMode:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_21722C000, v0, v1, "IOAccessoryManagerConfigurePower failed 0x%X, didn't set powerMode(%d)", v2, v3);
  OUTLINED_FUNCTION_2();
}

@end
