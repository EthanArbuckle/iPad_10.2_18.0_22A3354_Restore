@implementation ACCTransportIOAccessoryAuthCP

- (ACCTransportIOAccessoryAuthCP)initWithDelegate:(id)a3 andIOService:(unsigned int)a4 connectionType:(int)a5
{
  uint64_t v6;
  id v8;
  ACCTransportIOAccessoryAuthCP *v9;
  ACCTransportIOAccessoryAuthCP *v10;
  ACCTransportIOAccessoryAuthCP *v11;
  NSData *pAuthCertificate;
  OS_dispatch_queue *authWorkQueue;
  OS_dispatch_source *authTimerSource;
  NSDictionary *certInfo;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *pairedSema;
  const __CFNumber *CFProperty;
  const __CFNumber *v19;
  unsigned int *p_authFlags;
  int Value;
  BOOL v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  io_service_t v50;
  NSObject *v51;
  const __CFString *v52;
  __CFString *MutableCopy;
  __CFString *v54;
  const char *CStringPtr;
  id v56;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  unsigned int UpstreamService;
  io_object_t v68;
  NSObject *v69;
  uint64_t v70;
  id v71;
  id v72;
  dispatch_queue_t v73;
  OS_dispatch_queue *v74;
  NSObject *v75;
  dispatch_source_t v76;
  OS_dispatch_source *v77;
  NSObject *v78;
  CFDataRef v79;
  NSObject *v80;
  NSObject *v81;
  id v82;
  id v83;
  CFDataRef cf;
  _QWORD handler[4];
  ACCTransportIOAccessoryAuthCP *v86;
  uint8_t v87[8];
  objc_super v88;
  _QWORD block[4];
  ACCTransportIOAccessoryAuthCP *v90;
  uint8_t buf[4];
  unsigned int v92;
  __int16 v93;
  unsigned int v94;
  uint64_t v95;

  v6 = *(_QWORD *)&a4;
  v95 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke;
  block[3] = &unk_24D719E68;
  v9 = self;
  v90 = v9;
  if (initWithDelegate_andIOService_connectionType__onceToken != -1)
    dispatch_once(&initWithDelegate_andIOService_connectionType__onceToken, block);
  v88.receiver = v9;
  v88.super_class = (Class)ACCTransportIOAccessoryAuthCP;
  v10 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v88, sel_initWithIOAccessoryClass_ioService_, 3, v6);
  if (!v10)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v11 = (ACCTransportIOAccessoryAuthCP *)*(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = (ACCTransportIOAccessoryAuthCP *)MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.1();
    goto LABEL_74;
  }
  v11 = v10;
  v10->_authStatus = 0;
  v10->_authTimedOut = 0;
  pAuthCertificate = v10->_pAuthCertificate;
  v10->_pAuthCertificate = 0;

  v11->_authType = 0;
  objc_storeWeak((id *)&v11->_delegate, v8);
  authWorkQueue = v11->_authWorkQueue;
  v11->_authWorkQueue = 0;

  authTimerSource = v11->_authTimerSource;
  v11->_authTimerSource = 0;

  v11->_forcedReAuthCount = 0;
  v11->_authErrorDescription = 30;
  v11->_softwareErrorRetry = 0;
  certInfo = v11->_certInfo;
  v11->_certInfo = 0;

  v11->_fdrValidationStatus = 0;
  v16 = dispatch_semaphore_create(0);
  pairedSema = v11->_pairedSema;
  v11->_pairedSema = (OS_dispatch_semaphore *)v16;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, CFSTR("flags"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v19 = CFProperty;
    p_authFlags = &v11->_authFlags;
    Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &v11->_authFlags);
    if (gLogObjects)
      v22 = gNumLogObjects <= 6;
    else
      v22 = 1;
    v23 = !v22;
    if (!Value)
    {
      if (v23)
      {
        v27 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v27 = MEMORY[0x24BDACB70];
        v41 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.16(v27, v42, v43, v44, v45, v46, v47, v48);

      v11->_representsInductiveTransport = 0;
      v11->_representsInternalModule = 0;
      *p_authFlags = 0;
      goto LABEL_52;
    }
    if (v23)
    {
      v24 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v29 = -[ACCTransportIOAccessoryBase ioService](v11, "ioService");
      v30 = *p_authFlags;
      *(_DWORD *)buf = 67109376;
      v92 = v29;
      v93 = 1024;
      v94 = v30;
      _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_INFO, "authCP service %d flags == 0x%x", buf, 0xEu);
    }

    v31 = *p_authFlags;
    v11->_representsInductiveTransport = *p_authFlags & 1;
    if ((v31 & 0xFF0000) == 0x30000)
    {
      v32 = 3;
    }
    else
    {
      if ((v31 & 0xFF0000) != 0x10000)
      {
        v11->_representsInternalModule = 0;
LABEL_52:
        CFRelease(v19);
        goto LABEL_53;
      }
      if ((v31 & 0xC) == 8)
        v32 = 2;
      else
        v32 = 1;
    }
    v11->_representsInternalModule = v32;
    goto LABEL_52;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v25 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v25 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.16(v25, v34, v35, v36, v37, v38, v39, v40);

  v11->_representsInductiveTransport = 0;
  v11->_representsInternalModule = 0;
  v11->_authFlags = 0;
LABEL_53:
  v11->_authVersionMajor = 0;
  v11->_deviceID = 0;
  v11->_pAuthCertCache = 0;
  v11->_ioServiceUpstream = 0;
  v11->_accConnectionType = a5;
  v11->super._ioConnect = 0;
  v11->_bIsShuttingDown = 0;
  v11->_certType = -1;
  if (v11->_representsInductiveTransport)
  {
    v11->_authTryMaximum = gAuthMaxTryCountInductive;
  }
  else
  {
    if (-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](v11, "_representsHardwareComponent"))
    {
      v49 = 3;
    }
    else if (v11->_accConnectionType == 3)
    {
      v49 = gAuthMaxTryCountAppleIDBusSmartConnector;
    }
    else
    {
      v49 = gAuthMaxTryCountAppleIDBusLightning;
    }
    v11->_authTryMaximum = v49;
  }
  v50 = -[ACCTransportIOAccessoryBase ioService](v11, "ioService");
  if (IOServiceOpen(v50, *MEMORY[0x24BDAEC58], 0, &v11->super._ioConnect))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v51 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v51 = MEMORY[0x24BDACB70];
      v56 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.14();

LABEL_74:
    v11 = 0;
    goto LABEL_75;
  }
  buf[0] = BYTE1(v11);
  HIBYTE(v92) = (_BYTE)v11;
  LOBYTE(v92) = BYTE2(v11);
  buf[1] = BYTE3(v11);
  BYTE2(v92) = BYTE4(v11);
  BYTE1(v92) = BYTE5(v11);
  buf[3] = BYTE6(v11);
  buf[2] = HIBYTE(v11);
  cf = CFDataCreate(0, buf, 8);
  v52 = (const __CFString *)MFAACreateSerialNumberStringFromData();
  if (v52)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("com.apple.accessoryd"));
    if (MutableCopy)
    {
      v54 = MutableCopy;
      CFStringAppend(MutableCopy, CFSTR(".AppleIDBus."));
      CFStringAppend(v54, v52);
      CStringPtr = CFStringGetCStringPtr(v54, 0x8000100u);
      goto LABEL_93;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v58 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v58 = MEMORY[0x24BDACB70];
      v66 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.12();
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
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
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.10((uint64_t)cf, v58, v60, v61, v62, v63, v64, v65);
  }

  v54 = 0;
  CStringPtr = 0;
LABEL_93:
  -[ACCTransportIOAccessoryBase ioService](v11, "ioService");
  UpstreamService = IOAccessoryManagerGetUpstreamService();
  v11->_ioServiceUpstream = UpstreamService;
  if (!UpstreamService)
  {
    v68 = -[ACCTransportIOAccessoryBase ioService](v11, "ioService");
    v11->_ioServiceUpstream = v68;
    IOObjectRetain(v68);
  }
  if (gbAppleIDAuthCertNotCached)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v69 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v69 = MEMORY[0x24BDACB70];
      v71 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_21722C000, v69, OS_LOG_TYPE_INFO, "Cert cache disabled, gbAppleIDAuthCertNotCached = 1", v87, 2u);
    }
  }
  else
  {
    v70 = MFAACreateCertificateCache();
    v11->_pAuthCertCache = (const void *)v70;
    if (v70)
      goto LABEL_114;
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v69 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v69 = MEMORY[0x24BDACB70];
      v72 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.7();
  }

LABEL_114:
  if (CStringPtr)
  {
    v73 = dispatch_queue_create(CStringPtr, 0);
    v74 = v11->_authWorkQueue;
    v11->_authWorkQueue = (OS_dispatch_queue *)v73;

    v75 = v11->_authWorkQueue;
    if (v75)
    {
      v76 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v75);
      v77 = v11->_authTimerSource;
      v11->_authTimerSource = (OS_dispatch_source *)v76;

      v78 = v11->_authTimerSource;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke_81;
      handler[3] = &unk_24D719E68;
      v86 = v11;
      dispatch_source_set_event_handler(v78, handler);
      dispatch_source_set_timer((dispatch_source_t)v11->_authTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume((dispatch_object_t)v11->_authTimerSource);

      v79 = cf;
      if (!cf)
        goto LABEL_138;
      goto LABEL_137;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v81 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v81 = MEMORY[0x24BDACB70];
      v83 = MEMORY[0x24BDACB70];
    }
    v79 = cf;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.5();

    IOAccessoryManagerRevokeFeatures();
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v80 = *(id *)(gLogObjects + 48);
      v79 = cf;
    }
    else
    {
      v79 = cf;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v80 = MEMORY[0x24BDACB70];
      v82 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:].cold.3();

  }
  v11->_bIsShuttingDown = 1;
  if (v79)
LABEL_137:
    CFRelease(v79);
LABEL_138:
  if (v52)
    CFRelease(v52);
  if (v54)
    CFRelease(v54);
LABEL_75:

  return v11;
}

uint64_t __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t result;
  NSObject *v10;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v12;
  __CFRunLoop *Main;
  IONotificationPort *v14;
  const __CFDictionary *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (+[BootArgs intForKey:](BootArgs, "intForKey:", CFSTR("no_prearm_devid")))
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 7;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryAuthCP: Ignore DeviceIdentity prearm", v16, 2u);
    }

  }
  else if (acc_policies_deviceNeedsPreArmDeviceIdentity())
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 7;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryAuthCP: Test DeviceIdentity need prearm", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setBatteryNotifyPortRef:", IONotificationPortCreate(*MEMORY[0x24BDD8B20]));
    RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(*(id *)(a1 + 32), "batteryNotifyPortRef"));
    if (RunLoopSource)
    {
      v12 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v12, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v14 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "batteryNotifyPortRef");
      v15 = IOServiceMatching("IOPMPowerSource");
      if (!IOServiceAddMatchingNotification(v14, "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)__powerBatteryMatch, (void *)(*(_QWORD *)(a1 + 32) + 184), (io_iterator_t *)(*(_QWORD *)(a1 + 32) + 108)))__powerBatteryMatch((IONotificationPort **)(*(_QWORD *)(a1 + 32) + 184), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108));
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  v7 = MFAAIsDevelopmentHW();
  v8 = MFAAIsDesenseBuild();
  result = MFAAIsInternalBuild();
  gbIsInternalBuild = result;
  if (v7 && result | v8)
  {
    gbAppleIDAuthAlwaysPasses = CFPreferencesGetAppBooleanValue(CFSTR("AppleIDAuthAlwaysPasses"), CFSTR("com.apple.accessoryd"), 0) != 0;
    gbAppleIDAuthForceDownstreamRevoke = CFPreferencesGetAppBooleanValue(CFSTR("AppleIDAuthForceDownstreamRevoke"), CFSTR("com.apple.accessoryd"), 0) != 0;
    gbAppleIDAuthCertNotCached = CFPreferencesGetAppBooleanValue(CFSTR("AppleIDAuthCertNotCached"), CFSTR("com.apple.accessoryd"), 0) != 0;
    result = CFPreferencesGetAppIntegerValue(CFSTR("AppleIDAuthMaxTryCount"), CFSTR("com.apple.accessoryd"), 0);
    if ((_BYTE)result)
    {
      gAuthMaxTryCountInductive = result;
      gAuthMaxTryCountAppleIDBusLightning = result;
      gAuthMaxTryCountAppleIDBusSmartConnector = result;
    }
  }
  return result;
}

uint64_t __78__ACCTransportIOAccessoryAuthCP_initWithDelegate_andIOService_connectionType___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthTimerTimeout");
}

- (void)startShutdownProcess
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *authWorkQueue;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_bIsShuttingDown = 1;
  if (gLogObjects)
    v3 = gNumLogObjects < 7;
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
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Starting shutdown process for authCP service %d", buf, 8u);
  }

  if (self->_representsInductiveTransport)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissNotificationsWithGroupIdentifier:", v7);

  }
  authWorkQueue = self->_authWorkQueue;
  if (authWorkQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ACCTransportIOAccessoryAuthCP_startShutdownProcess__block_invoke;
    block[3] = &unk_24D719E68;
    block[4] = self;
    dispatch_async(authWorkQueue, block);
  }
}

void __53__ACCTransportIOAccessoryAuthCP_startShutdownProcess__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 152));
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  io_object_t ioServiceUpstream;
  NSData *pAuthCertificate;
  OS_dispatch_queue *authWorkQueue;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_storeWeak((id *)&self->_delegate, 0);
  if (gLogObjects)
    v3 = gNumLogObjects < 7;
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
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v14 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_INFO, "Deallocating authCP service %d", buf, 8u);
  }

  MFAADeallocCertificateCache();
  self->_pAuthCertCache = 0;
  ioServiceUpstream = self->_ioServiceUpstream;
  if (ioServiceUpstream)
    IOObjectRelease(ioServiceUpstream);
  pAuthCertificate = self->_pAuthCertificate;
  self->_pAuthCertificate = 0;

  authWorkQueue = self->_authWorkQueue;
  self->_authWorkQueue = 0;

  if (self->_representsInductiveTransport)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissNotificationsWithGroupIdentifier:", v10);

  }
  v12.receiver = self;
  v12.super_class = (Class)ACCTransportIOAccessoryAuthCP;
  -[ACCTransportIOAccessoryBase dealloc](&v12, sel_dealloc);
}

- (BOOL)requiresAuthenticationProcess
{
  _BOOL4 v3;
  io_registry_entry_t v4;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v6;
  int Value;
  NSObject *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  id v14;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (IOObjectConformsTo(-[ACCTransportIOAccessoryBase ioService](self, "ioService"), "AppleAuthCPDock"))
  {
LABEL_2:
    v3 = 0;
    goto LABEL_9;
  }
  if (-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
  {
    v4 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v4, CFSTR("AuthPassed"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      Value = CFBooleanGetValue(CFProperty);
      CFRelease(v6);
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v8 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = CFSTR("yes");
        if (!Value)
          v15 = CFSTR("no");
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_INFO, "For debug purposes: isAuthPassed = %@", (uint8_t *)&v16, 0xCu);
      }

      goto LABEL_2;
    }
  }
  v3 = 1;
LABEL_9:
  if (gLogObjects)
    v9 = gNumLogObjects < 7;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("no");
    if (v3)
      v12 = CFSTR("yes");
    v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "requiresAuth = %@", (uint8_t *)&v16, 0xCu);
  }

  return v3;
}

- (void)doPostAuthentication
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_bIsShuttingDown)
  {
    -[ACCTransportIOAccessoryAuthCP authWorkQueue](self, "authWorkQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ACCTransportIOAccessoryAuthCP_doPostAuthentication__block_invoke;
    block[3] = &unk_24D719E68;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

uint64_t __53__ACCTransportIOAccessoryAuthCP_doPostAuthentication__block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  _OWORD *v3;
  const __CFAllocator *v4;
  int v5;
  CFTypeRef CFProperty;
  CFTypeRef v7;
  CFTypeID v8;
  int v9;
  char v10;
  _BOOL4 v11;
  uint64_t result;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  int Value;

  v2 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 208);
  *v3 = 0u;
  v3[1] = 0u;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = 3;
  while (1)
  {
    CFProperty = IORegistryEntryCreateCFProperty(objc_msgSend(*(id *)(a1 + 32), "ioService"), CFSTR("AuthPassed"), v4, 0);
    v7 = IORegistryEntryCreateCFProperty(objc_msgSend(*(id *)(a1 + 32), "ioService"), CFSTR("authError"), v4, 0);
    if (!CFProperty)
    {
      v11 = 0;
      v9 = 1;
      goto LABEL_12;
    }
    v8 = CFGetTypeID(CFProperty);
    if (v8 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)CFProperty))
    {
      v2 = IORegistryEntryCreateCFProperty(objc_msgSend(*(id *)(a1 + 32), "ioService"), CFSTR("AccessoryCertificate"), v4, 0);
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
    v10 = (v2 != 0) & ~(_BYTE)v9;
    v11 = v7 != 0;
    if (!v7)
      v10 = 0;
    if ((v10 & 1) != 0)
      break;
LABEL_12:
    if ((v11 & v9 & 1) != 0)
      break;
    result = usleep(0xC350u);
    if (!--v5)
      return result;
  }
  v13 = CFGetTypeID(CFProperty);
  result = CFBooleanGetTypeID();
  if (v13 == result)
  {
    v14 = CFGetTypeID(v7);
    result = CFNumberGetTypeID();
    if (v14 == result)
    {
      if (!v2 || (v15 = CFGetTypeID(v2), result = CFDataGetTypeID(), v15 == result))
      {
        Value = CFBooleanGetValue((CFBooleanRef)CFProperty);
        CFNumberGetValue((CFNumberRef)v7, kCFNumberCharType, (void *)(*(_QWORD *)(a1 + 32) + 100));
        result = *(_QWORD *)(a1 + 32);
        if (*(_DWORD *)(result + 100) <= 0x1Du)
          return objc_msgSend((id)result, "_finishAuthentication:authCert:", Value != 0, v2);
      }
    }
  }
  return result;
}

- (BOOL)_authInternalModuleWithCert:(const __CFData *)a3 withError:(int *)a4
{
  BOOL v4;
  int *p_representsInternalModule;
  dispatch_semaphore_t v9;
  __int128 v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  int v31;
  int v32;
  NSObject *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  char *v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  _OWORD __buf[2];
  uint64_t v76;

  v4 = 0;
  v76 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    p_representsInternalModule = &self->_representsInternalModule;
    if (self->_representsInternalModule)
    {
      v65 = 0;
      v66 = &v65;
      v67 = 0x2020000000;
      v68 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v64 = 30;
      v55 = 0;
      v56 = &v55;
      v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__1;
      v59 = __Block_byref_object_dispose__1;
      v60 = 0;
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v9 = dispatch_semaphore_create(0);
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __buf[0] = v10;
      __buf[1] = v10;
      v11 = enhanced_apfs_enabled();
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v70) = v11;
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "eApfsEnabled:%d", buf, 8u);
      }

      if (v11)
      {
        v44 = (char *)systemInfo_copyProductVersion();
        +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringForKey:", CFSTR("ProductVersion"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (gLogObjects && gNumLogObjects >= 7)
        {
          v16 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v18 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v70 = v15;
          v71 = 2112;
          v72 = v44;
          _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "knownVersion:%@, osVersion:%@", buf, 0x16u);
        }

        v17 = 1800;
        if (v15 && v44)
        {
          if (-[__CFString isEqualToString:](v15, "isEqualToString:", v44))
            v17 = 0;
          else
            v17 = 1800;
        }

      }
      else
      {
        v17 = 0;
        v44 = 0;
      }
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __71__ACCTransportIOAccessoryAuthCP__authInternalModuleWithCert_withError___block_invoke;
      v45[3] = &unk_24D71AE30;
      v47 = &v65;
      v48 = &v61;
      v49 = &v55;
      v50 = &v51;
      v19 = v9;
      v46 = v19;
      v20 = (void *)MEMORY[0x219A09094](v45);
      arc4random_buf(__buf, 0x20uLL);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __buf, 32);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A0D0], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = *p_representsInternalModule;
      if (*p_representsInternalModule == 1)
      {
        if (!v17)
          v17 = 10;
        objc_msgSend(v21, "authenticateBatteryWithChallenge:completionHandler:", v43, v20);
      }
      else
      {
        if (v23 != 2)
        {
          if (v23 != 3)
          {
            if (gLogObjects && gNumLogObjects >= 7)
            {
              v27 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v27 = MEMORY[0x24BDACB70];
              v35 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:].cold.1((uint64_t)p_representsInternalModule, v27, v36, v37, v38, v39, v40, v41);
            v4 = 0;
            goto LABEL_82;
          }
          if (!v17)
            v17 = 10;
          objc_msgSend(v21, "authenticateTouchControllerWithChallenge:completionHandler:updateRegistry:", 0, v20, 0);
          v24 = CFSTR("Touch");
LABEL_42:
          v25 = dispatch_time(0, 1000000000 * v17);
          if (dispatch_semaphore_wait(v19, v25))
          {
            if (gLogObjects && gNumLogObjects >= 7)
            {
              v26 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v26 = MEMORY[0x24BDACB70];
              v28 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:].cold.5();

            *((_DWORD *)v62 + 6) = 15;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            v29 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v29 = MEMORY[0x24BDACB70];
            v30 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v31 = *((unsigned __int8 *)v66 + 24);
            *(_DWORD *)buf = 138543874;
            v70 = v24;
            v71 = 2080;
            v72 = "-[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:]";
            v73 = 1024;
            v74 = v31;
            _os_log_impl(&dword_21722C000, v29, OS_LOG_TYPE_DEFAULT, "(module:%{public}@) %s: authPassed:%d", buf, 0x1Cu);
          }

          if (*((_BYTE *)v52 + 24))
            v32 = 2;
          else
            v32 = 1;
          self->_fdrValidationStatus = v32;
          *a4 = *((_DWORD *)v62 + 6);
          *a3 = (const __CFData *)(id)v56[5];
          v4 = *((_BYTE *)v66 + 24) != 0;
          if (!v11)
            goto LABEL_83;
          if (gLogObjects && gNumLogObjects >= 7)
          {
            v33 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v33 = MEMORY[0x24BDACB70];
            v34 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21722C000, v33, OS_LOG_TYPE_INFO, "store OS version", buf, 2u);
          }

          +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
          v27 = objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKey:](v27, "setObject:forKey:", v44, CFSTR("ProductVersion"));
LABEL_82:

LABEL_83:
          _Block_object_dispose(&v51, 8);
          _Block_object_dispose(&v55, 8);

          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&v65, 8);
          return v4;
        }
        if (!v17)
          v17 = 40;
        objc_msgSend(v21, "authenticateVeridianWithChallenge:completionHandler:", v43, v20);
      }
      v24 = CFSTR("Battery");
      goto LABEL_42;
    }
    return 0;
  }
  return v4;
}

void __71__ACCTransportIOAccessoryAuthCP__authInternalModuleWithCert_withError___block_invoke(uint64_t a1, int a2, void *a3, void *a4, int a5, int a6)
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  if (gLogObjects)
    v13 = gNumLogObjects < 7;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315906;
    v20 = "-[ACCTransportIOAccessoryAuthCP _authInternalModuleWithCert:withError:]_block_invoke";
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    v24 = a5;
    v25 = 1024;
    v26 = a6;
    _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "%s: authPassed:%d, fdrValidationStatus:%d, authError:0x%x", (uint8_t *)&v19, 0x1Eu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a6;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v11;
  v18 = v11;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_authWithAuthIC:(unsigned int)a3 withCert:(const __CFData *)a4 withError:(int *)a5
{
  _BOOL4 v5;
  BOOL v10;
  id v11;
  NSObject *v12;
  int authTryCurrent;
  int authTryMaximum;
  uint64_t DeviceInfo;
  int v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  int authVersionMajor;
  int deviceID;
  CFTypeRef v24;
  BOOL v25;
  int v26;
  const __CFData *v27;
  int *p_certType;
  _BOOL4 v29;
  NSObject *v30;
  id v31;
  unsigned __int8 v32;
  int v33;
  int v34;
  const __CFData *v35;
  const __CFData *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  id v41;
  int v42;
  id v43;
  NSObject *v45;
  CFTypeRef cf;
  const __CFData *v47;
  unsigned int v48;
  int v49;
  __int16 v50;
  __int16 v51;
  uint8_t buf[4];
  _BYTE v53[10];
  _BOOL4 v54;
  uint64_t v55;

  LOBYTE(v5) = 0;
  v55 = *MEMORY[0x24BDAC8D0];
  if (a4 && a5)
  {
    v51 = 0;
    v50 = 0;
    v48 = 0;
    v49 = 0;
    v47 = 0;
    if (gLogObjects)
      v10 = gNumLogObjects < 7;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      authTryCurrent = self->_authTryCurrent;
      authTryMaximum = self->_authTryMaximum;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v53 = authTryCurrent;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = authTryMaximum;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "Starting auth try:%02X of max:%02X", buf, 0xEu);
    }

    if (*a4)
      CFRelease(*a4);
    *a4 = 0;
    DeviceInfo = cpGetDeviceInfo(-[ACCTransportIOAccessoryBase ioService](self, "ioService"), (char *)&v51 + 1, &v51, (char *)&v50 + 1, &v50, &v49);
    if (!-[ACCTransportIOAccessoryAuthCP _handleAuthDeviceInfo:versionMajor:versionMinor:](self, "_handleAuthDeviceInfo:versionMajor:versionMinor:", DeviceInfo, HIBYTE(v50), v50))
    {
      LOBYTE(v5) = 0;
      if (-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
        v18 = 17;
      else
        v18 = 1;
      v48 = v18;
      goto LABEL_90;
    }
    v16 = acc_userDefaults_BOOLForKey((uint64_t)CFSTR("TreatAuthCPDEVNAsV3"));
    v17 = HIBYTE(v50);
    if (HIBYTE(v50) == 4)
    {
      if (!v16)
      {
        v19 = 5;
        goto LABEL_26;
      }
    }
    else if (HIBYTE(v50) != 3)
    {
LABEL_27:
      self->_authVersionMajor = v17;
      self->_deviceID = v49;
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v20 = *(id *)(gLogObjects + 48);
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
        authVersionMajor = self->_authVersionMajor;
        deviceID = self->_deviceID;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v53 = authVersionMajor;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = deviceID;
        _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, "authMajor:%02X deviceID:%04X", buf, 0xEu);
      }

      v24 = cpCopyCertificateSerialNumber(-[ACCTransportIOAccessoryBase ioService](self, "ioService"));
      if (-[ACCTransportIOAccessoryAuthCP _handleAuthCertSerialNumber:certData:](self, "_handleAuthCertSerialNumber:certData:", v24, &v47))
      {
        if (v47)
        {
          v25 = 1;
        }
        else
        {
          v27 = (const __CFData *)cpCopyCertificate(-[ACCTransportIOAccessoryBase ioService](self, "ioService"));
          v25 = 0;
          v47 = v27;
        }
        self->_certIsCached = v25;
        p_certType = &self->_certType;
        self->_certType = -1;
        v29 = -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:](self, "_handleAuthCertificate:serialNumber:authError:");
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v30 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v30 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.6(v29, &self->_certType, v30);

        if (!v29)
        {
          LOBYTE(v5) = 0;
LABEL_88:
          if (v24)
            CFRelease(v24);
LABEL_90:
          *a5 = v48;
          *a4 = v47;
          return v5;
        }
        v32 = 0;
        v33 = *p_certType;
        v34 = 0;
        if (*p_certType != 3 && v33 != 5)
        {
          v32 = MFAACertificateAuthVersionNumber();
          v34 = acc_userDefaults_BOOLForKey((uint64_t)CFSTR("TreatAuthCPDEVNAsV3"));
          v33 = *p_certType;
        }
        if (v33 == 3 || v33 == 5 || HIBYTE(v50) == v32 || v32 == 3 && HIBYTE(v50) == 4 && ((v34 ^ 1) & 1) == 0)
        {
          cf = 0;
          v35 = (const __CFData *)MFAACreateRandomNonce();
          if (v35)
          {
            v36 = v35;
            if (cpCreateSignature(a3, v35, (CFDataRef *)&cf))
            {
              if (gLogObjects && gNumLogObjects >= 7)
              {
                v37 = *(id *)(gLogObjects + 48);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
                v37 = MEMORY[0x24BDACB70];
                v41 = MEMORY[0x24BDACB70];
              }
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.3();

              LOBYTE(v5) = 0;
              v42 = 11;
            }
            else
            {
              if (-[ACCTransportIOAccessoryAuthCP _handleAuthSignature:certData:nonceData:](self, "_handleAuthSignature:certData:nonceData:", cf, v47, v36))
              {
                v5 = -[ACCTransportIOAccessoryAuthCP _validateCertCapsForCertificate:authError:](self, "_validateCertCapsForCertificate:authError:", v47, &v48);
                logObjectForModule_1(6);
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  if (v48 > 0x1D)
                    v40 = "UninitializedAuthError";
                  else
                    v40 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[v48];
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)v53 = v40;
                  *(_WORD *)&v53[8] = 1024;
                  v54 = v5;
                  _os_log_impl(&dword_21722C000, v39, OS_LOG_TYPE_INFO, "after validating cert caps, authError = %s, bAuthContinue = %d", buf, 0x12u);
                }

                goto LABEL_86;
              }
              LOBYTE(v5) = 0;
              v42 = 12;
            }
            v48 = v42;
LABEL_86:
            CFRelease(v36);
            if (cf)
              CFRelease(cf);
            goto LABEL_88;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            v38 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v38 = MEMORY[0x24BDACB70];
            v43 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.1();

          LOBYTE(v5) = 0;
          v26 = 10;
        }
        else
        {
          logObjectForModule_1(6);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:].cold.5((unsigned __int8 *)&v50 + 1, v32, v45);

          LOBYTE(v5) = 0;
          v26 = 9;
        }
      }
      else
      {
        LOBYTE(v5) = 0;
        v26 = 2;
      }
      v48 = v26;
      goto LABEL_88;
    }
    v19 = 1;
LABEL_26:
    self->_certType = v19;
    goto LABEL_27;
  }
  return v5;
}

- (void)startAuthenticationProcess
{
  ACCTransportIOAccessoryAuthCP *v2;
  ACCTransportIOAccessoryAuthCP *v3;
  NSObject *v4;
  const __CFString *CFProperty;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[6];
  io_registry_entry_t parent;
  _QWORD v10[5];
  ACCTransportIOAccessoryAuthCP *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_bIsShuttingDown)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__1;
    v10[4] = __Block_byref_object_dispose__1;
    v11 = (ACCTransportIOAccessoryAuthCP *)0xAAAAAAAAAAAAAAAALL;
    v2 = self;
    v3 = v2;
    v11 = v2;
    if (v2->_accConnectionType == 1)
    {
      LOWORD(v13) = 0;
      *(_DWORD *)buf = 0;
      -[ACCTransportIOAccessoryAuthCP ioServiceUpstream](v2, "ioServiceUpstream");
      if (!IOAccessoryManagerGetDigitalID() && (v13 & 0x10) != 0 && (buf[1] & 1) == 0)
      {
        parent = 0;
        if (IORegistryEntryGetParentEntry(-[ACCTransportIOAccessoryAuthCP ioServiceUpstream](v3, "ioServiceUpstream"), "IOAccessory", &parent))
        {
          CFProperty = 0;
        }
        else
        {
          CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(parent, CFSTR("IOAccessoryAccessoryModelNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        }
        v6 = acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("AuthCPStartDelayMs"));
        if (v6)
        {
          v7 = v6 & ~(v6 >> 63);
        }
        else if (CFProperty)
        {
          if (CFStringCompare(CFProperty, CFSTR("A1619"), 0))
            v7 = 100;
          else
            v7 = 500;
        }
        else
        {
          v7 = 100;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v13 = (uint64_t)CFProperty;
          v14 = 2048;
          v15 = v7;
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "parent %@, authCPStartDelayMs %ld \n", buf, 0x16u);
        }
        if (v7)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v13 = v7;
            _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Sleeping %ldms before starting auth. \n", buf, 0xCu);
          }
          usleep(1000 * v7);
        }
        if (parent)
          IOObjectRelease(parent);
        if (CFProperty)
          CFRelease(CFProperty);
      }
    }
    -[ACCTransportIOAccessoryAuthCP authWorkQueue](v3, "authWorkQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke;
    block[3] = &unk_24D71AE58;
    block[4] = v3;
    block[5] = v10;
    dispatch_async(v4, block);

    _Block_object_dispose(v10, 8);
  }
}

void __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke(uint64_t a1)
{
  id *v1;
  io_object_t v2;
  _BYTE *v3;
  io_object_t v4;
  void *v5;
  _OWORD *v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  _DWORD *v14;
  NSObject *v15;
  id v16;
  int v17;
  int v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  _DWORD *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  id v29;
  id v30;
  int v31;
  NSObject *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _DWORD *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  CFTypeRef CFProperty;
  const void *v42;
  CFTypeID v43;
  CFTypeRef v44;
  const void *v45;
  uint64_t v46;
  NSObject *v47;
  _DWORD *v48;
  id v49;
  int v50;
  int v51;
  unsigned __int8 *v52;
  unsigned int v53;
  int v54;
  const __CFAllocator *allocator;
  io_object_t object;
  int v58;
  CFTypeRef cf;
  uint8_t buf[4];
  _BYTE v61[10];
  _BYTE v62[6];
  _BYTE v63[6];
  __int16 v64;
  int v65;
  uint8_t v66[4];
  int v67[3];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "ioService");
  v3 = *v1;
  v4 = *((_DWORD *)*v1 + 2);
  cf = 0;
  v3[58] = 1;
  *((_DWORD *)*v1 + 25) = 30;
  *((_DWORD *)*v1 + 17) = 0;
  *((_BYTE *)*v1 + 56) = 0;
  v5 = (void *)*((_QWORD *)*v1 + 15);
  *((_QWORD *)*v1 + 15) = 0;

  *((_BYTE *)*v1 + 60) = 0;
  *((_WORD *)*v1 + 33) = 0;
  v6 = (char *)*v1 + 208;
  *v6 = 0u;
  v6[1] = 0u;
  *((_DWORD *)*v1 + 24) = 0;
  object = v2;
  IOObjectRetain(v2);
  IOObjectRetain(v4);
  if (*((_BYTE *)*v1 + 57))
    v7 = 250000000000;
  else
    v7 = 30000000000;
  v8 = 0x253E63000uLL;
  v9 = 0x253E63000uLL;
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v10 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(*v1, "ioService");
    v13 = *((unsigned __int8 *)*v1 + 59);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v61 = v12;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v13;
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "startAuthenticationProcess Starting auth process for AuthCP service:%4d, authTryMaximum:%02X", buf, 0xEu);
  }

  v14 = *v1;
  if (!*((_BYTE *)*v1 + 61))
  {
    *((_QWORD *)*v1 + 22) = systemInfo_getCurrentUnixTimeMS();
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
      v17 = objc_msgSend(*v1, "ioService");
      v18 = *((_DWORD *)*v1 + 19);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v61 = (unint64_t)(((unint64_t)v7 * (unsigned __int128)0x112E0BE827uLL) >> 64) >> 2;
      *(_WORD *)&v61[8] = 1024;
      *(_DWORD *)v62 = v17;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)v63 = v18;
      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "Starting AppleAuthCP auth timer timeout secs:[%02lld] for AuthCP service:%4d, connectionType:%{coreacc:ACCConnection_Type_t}d", buf, 0x18u);
    }

    v19 = *((_QWORD *)*v1 + 19);
    v20 = dispatch_time(0, v7);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14 = *v1;
  }
  if (v14[19] != 8
    || (+[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v22 = objc_msgSend(v21, "shouldEnableDirectAWCAuth"), v21, v22))
  {
    if ((acc_userDefaults_BOOLForKey((uint64_t)CFSTR("ForceAuthTimeout")) & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v23 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v23 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_msgSend(*v1, "ioService");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v61 = v31;
        _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, "startAuthenticationProcess: ForceAuthTimeout: don't actually auth for AuthCP service:%4d, allow timeout to occur, if any", buf, 8u);
      }
LABEL_51:

      return;
    }
    v24 = *v1;
    if (*((_BYTE *)*v1 + 61))
    {
      v25 = 0;
      LODWORD(v26) = v4;
LABEL_30:
      v27 = *(_QWORD *)(v8 + 2768);
      if (v27)
        v28 = *(_DWORD *)(v9 + 2776) < 7;
      else
        v28 = 1;
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v32 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      else
      {
        v32 = *(id *)(v27 + 48);
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = objc_msgSend(*v1, "ioService");
        v34 = *((unsigned __int8 *)*v1 + 58);
        v35 = *((unsigned __int8 *)*v1 + 59);
        v36 = *((unsigned __int8 *)*v1 + 61);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v61 = v33;
        *(_WORD *)&v61[4] = 1024;
        *(_DWORD *)&v61[6] = v34;
        *(_WORD *)v62 = 1024;
        *(_DWORD *)&v62[2] = v35;
        *(_WORD *)v63 = 1024;
        *(_DWORD *)&v63[2] = v25 & 1;
        v64 = 1024;
        v65 = v36;
        _os_log_impl(&dword_21722C000, v32, OS_LOG_TYPE_INFO, "AuthCP service:%4d: Auth process concluded on try:%02X of max:%02X, bAuthContinue:%d, bIsShuttingDown:%d", buf, 0x20u);
      }

      objc_msgSend(*v1, "_finishAuthentication:authCert:", v25 & 1, cf);
      v37 = *v1;
      if ((*((_BYTE *)*v1 + 92) & 2) != 0 && v37[17] == 2)
        objc_msgSend(v37, "_validateDownstreamCertSerialNumber");
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      IOObjectRelease(object);
      IOObjectRelease(v26);
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v23 = *(NSObject **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = 0;
      goto LABEL_51;
    }
    v25 = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v26 = v4;
    while (1)
    {
      if ((v25 & 1) != 0 || *((unsigned __int8 *)v24 + 58) > *((unsigned __int8 *)v24 + 59))
        goto LABEL_30;
      if (v24[17])
      {
        v25 = 0;
        goto LABEL_30;
      }
      v58 = 30;
      if (v24[18])
      {
        v39 = v8;
        v40 = v9;
        CFProperty = IORegistryEntryCreateCFProperty(object, CFSTR("isTrusted"), allocator, 0);
        if (CFProperty)
        {
          v42 = CFProperty;
          v43 = CFGetTypeID(CFProperty);
          if (v43 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue((CFBooleanRef)v42))
            {
              v44 = cpCopyCertificate(object);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)(v39 + 2768);
                if (v46 && *(int *)(v40 + 2776) >= 7)
                {
                  v47 = *(id *)(v46 + 48);
                }
                else
                {
                  v54 = *(_DWORD *)(v40 + 2776);
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v61 = v46;
                    *(_WORD *)&v61[8] = 1024;
                    *(_DWORD *)v62 = v54;
                    _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v47 = MEMORY[0x24BDACB70];
                  v49 = MEMORY[0x24BDACB70];
                }
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke_cold_3(v66, v1, v67, v47);

                *((_DWORD *)*v1 + 24) = 2;
                v58 = 0;
                cf = v45;
                CFRelease(v42);
                v25 = 1;
                v26 = v4;
                v9 = v40;
                v8 = v39;
                goto LABEL_88;
              }
            }
          }
          CFRelease(v42);
        }
        v9 = v40;
        v8 = v39;
        if ((objc_msgSend(*v1, "_authInternalModuleWithCert:withError:", &cf, &v58) & 1) == 0)
        {
LABEL_66:
          v48 = *v1;
          if (!*((_DWORD *)*v1 + 17) && *((unsigned __int8 *)v48 + 58) == *((unsigned __int8 *)v48 + 59))
          {
            if (v58 && v48[25] == 30)
            {
              v48[25] = v58;
              v48 = *v1;
            }
            v50 = v48[25] - 19;
            if (v50 > 4)
              v51 = 1;
            else
              v51 = dword_21728F3A0[v50];
            v48[17] = v51;
          }
          v52 = (unsigned __int8 *)*v1;
          if (!*((_DWORD *)*v1 + 17))
          {
            v53 = v52[58];
            if (v53 < v52[59])
            {
              v52[58] = v53 + 1;
              v52 = (unsigned __int8 *)*v1;
            }
          }
          objc_msgSend(v52, "ioService");
          IOServiceGetState();
          v25 = 0;
          goto LABEL_88;
        }
      }
      else if ((objc_msgSend(v24, "_authWithAuthIC:withCert:withError:", v26, &cf, &v58) & 1) == 0)
      {
        goto LABEL_66;
      }
      v25 = 1;
LABEL_88:
      v24 = *v1;
      if (*((_BYTE *)*v1 + 61))
        goto LABEL_30;
    }
  }
}

- (void)_validateDownstreamCertSerialNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "Failed to retrieve downstream cert serial number ioretStatus:%02X", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (BOOL)_handleAuthDeviceInfo:(int)a3 versionMajor:(unsigned __int8)a4 versionMinor:(unsigned __int8)a5
{
  int v5;
  int v6;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v14;
  id v16;
  id v17;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v5 = a5;
  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v9 = gNumLogObjects < 7;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109632;
    v18[1] = a3;
    v19 = 1024;
    v20 = v6;
    v21 = 1024;
    v22 = v5;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "_handleAuthDeviceInfo: ioretStatus %02X, authVerMajor:%02X, authVerMinor:%02X", (uint8_t *)v18, 0x14u);
  }

  if (!self->_bIsShuttingDown && !self->_authStatus)
  {
    if (a3)
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _handleAuthDeviceInfo:versionMajor:versionMinor:].cold.3();
    }
    else
    {
      v14 = v6 == 4 || (v6 & 0xFE) == 2;
      if (!v5 && v14)
        return 1;
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v12 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _handleAuthDeviceInfo:versionMajor:versionMinor:].cold.1();
    }

  }
  return 0;
}

- (BOOL)_handleAuthCertSerialNumber:(__CFString *)a3 certData:(const __CFData *)a4
{
  const __CFData *v6;

  if (self->_bIsShuttingDown || self->_authStatus)
    return 0;
  if (a3)
    v6 = (const __CFData *)MFAACreateCertDataFromSerialNumber();
  else
    v6 = 0;
  *a4 = v6;
  return 1;
}

- (BOOL)_copyCertificateAttribute:(__CFData *)a3 forAttributeKey:(__CFNumber *)a4 withAttributeValue:(const __CFData *)a5
{
  void *v8;
  NSObject *v9;
  const __CFData *v10;
  SecCertificateRef v11;
  SecCertificateRef v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFData *Value;
  BOOL v16;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a3 || !a4 || !a5)
  {
    logObjectForModule_1(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      v18 = "%s: bad arguments";
LABEL_16:
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0xCu);
    }
LABEL_20:
    v16 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyParsedCertificateChainInfo:", a3);

  if (!v9)
  {
    logObjectForModule_1(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      v18 = "%s: !certInfo";
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  -[NSObject objectForKey:](v9, "objectForKey:", CFSTR("LeafCertData"));
  v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v11 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v10);
  if (!v11)
  {
    logObjectForModule_1(6);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_DEFAULT, "%s: !certRef", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_20;
  }
  v12 = v11;
  v13 = (const __CFDictionary *)SecCertificateCopyComponentAttributes();
  if (v13)
  {
    v14 = v13;
    Value = (const __CFData *)CFDictionaryGetValue(v13, a4);
    v16 = Value != 0;
    if (Value)
    {
      *a5 = Value;
      CFRetain(Value);
    }
    else
    {
      logObjectForModule_1(6);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315138;
        v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
        _os_log_impl(&dword_21722C000, v21, OS_LOG_TYPE_DEFAULT, "%s: !oidTemp", (uint8_t *)&v22, 0xCu);
      }

    }
    CFRelease(v14);
  }
  else
  {
    logObjectForModule_1(6);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[ACCTransportIOAccessoryAuthCP _copyCertificateAttribute:forAttributeKey:withAttributeValue:]";
      _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, "%s: !componentAttributesRef", (uint8_t *)&v22, 0xCu);
    }

    v16 = 0;
  }
  CFRelease(v12);

LABEL_11:
  return v16;
}

- (BOOL)_handleAuthCertificate:(__CFData *)a3 serialNumber:(__CFString *)a4 authError:(int *)a5
{
  BOOL result;
  unint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  const void *v38;
  NSObject *v39;
  const __CFString *v40;
  const __CFString *v41;
  CFComparisonResult v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  id v52;
  __CFArray *Mutable;
  __CFArray *v54;
  void *v55;
  int v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  int certType;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint8_t buf[4];
  _BYTE v80[10];
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  result = 0;
  v88 = *MEMORY[0x24BDAC8D0];
  self->_certType = -1;
  *a5 = 0;
  if (!self->_bIsShuttingDown)
  {
    if (self->_authStatus)
      return 0;
    v9 = 0x253E63000uLL;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copyParsedCertificateChainInfo:", a3);

      if (v12)
      {
        objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copyEvaluatedCertificateChainInfo:", v12);

        v15 = v12;
        if (v14)
        {
          v16 = v14;

          v17 = objc_msgSend(MEMORY[0x24BE61578], "isMFi2_3CertInfo:", v16);
          v77 = v17;
          if (objc_msgSend(MEMORY[0x24BE61578], "isComponentCertInfo:", v16))
          {
            self->_certType = 5;
            objc_storeStrong((id *)&self->_certInfo, v14);
            v18 = 1;
          }
          else
          {
            v18 = v17;
          }
          v15 = v16;
        }
        else
        {
          v77 = 0;
          v18 = 0;
        }

        v9 = 0x253E63000;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v21 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v21 = MEMORY[0x24BDACB70];
          v30 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
          *(_WORD *)&v80[8] = 1024;
          v81 = 1998;
          _os_log_impl(&dword_21722C000, v21, OS_LOG_TYPE_DEFAULT, "%s:%d: !certInfo", buf, 0x12u);
        }

        v77 = 0;
        v18 = 0;
        v15 = 0;
      }
      v31 = *(_QWORD *)(v9 + 2768);
      if (v31 && gNumLogObjects >= 7)
      {
        v32 = *(id *)(v31 + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v32 = MEMORY[0x24BDACB70];
        v33 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        certType = self->_certType;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
        *(_WORD *)&v80[8] = 1024;
        v81 = 2037;
        v82 = 1024;
        v83 = v18;
        v84 = 1024;
        v85 = certType;
        v86 = 2112;
        v87 = v15;
        _os_log_debug_impl(&dword_21722C000, v32, OS_LOG_TYPE_DEBUG, "%s:%d bAuthContinue %d, certType %d, certInfo %@", buf, 0x28u);
      }

      if (v18)
        v34 = v77;
      else
        v34 = 0;
      if (v34 == 1)
      {
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "verifyCertificateChainInfoSerialNumber:", v15);

          if ((v36 & 1) != 0)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (const void *)objc_msgSend(v37, "copyLeafCertificateSerialNumber:", v15);

              goto LABEL_59;
            }
LABEL_88:
            logObjectForModule_1(6);
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)v80 = "-[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:]";
              _os_log_impl(&dword_21722C000, v59, OS_LOG_TYPE_DEFAULT, "%s createCertificateSerialNumber no cert serial, skip", buf, 0xCu);
            }

            goto LABEL_91;
          }
        }
        else if (MFAAVerifyCertificateSerialNumber())
        {
          if (a4)
          {
            v38 = (const void *)MFAACreateCertificateSerialNumber();
LABEL_59:
            if (v38)
            {
              v40 = (const __CFString *)MFAACreateSerialNumberStringFromData();
              if (v40)
              {
                v41 = v40;
                v18 = 1;
                v42 = CFStringCompare(a4, v40, 1uLL);
                if (v42)
                {
                  v43 = v42;
                  logObjectForModule_1(6);
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.5(v43, v44, v45, v46, v47, v48, v49, v50);

                  v18 = 0;
                  *a5 = 8;
                }
                CFRelease(v41);
              }
              else
              {
                logObjectForModule_1(6);
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                  -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.4(v69, v70, v71, v72, v73, v74, v75, v76);

                v18 = 0;
                *a5 = 7;
              }
              CFRelease(v38);
            }
            else
            {
              logObjectForModule_1(6);
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.3(v61, v62, v63, v64, v65, v66, v67, v68);

              v18 = 0;
              *a5 = 6;
            }
            goto LABEL_92;
          }
          goto LABEL_88;
        }
        v18 = 0;
        v51 = 5;
      }
      else
      {
        if (v18 && v15 && objc_msgSend(MEMORY[0x24BE61578], "isComponentCertInfo:", v15))
        {
          self->_certType = 5;
          objc_storeStrong((id *)&self->_certInfo, v15);
LABEL_91:
          v18 = 1;
          goto LABEL_92;
        }
        v78 = v18;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v39 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v39 = MEMORY[0x24BDACB70];
          v52 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v39, OS_LOG_TYPE_DEFAULT, "Check if certificate verifies against DEVN cert", buf, 2u);
        }

        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
        if (Mutable)
        {
          v54 = Mutable;
          CFArrayAppendValue(Mutable, a3);
          objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "validateCertificateChain:type:realtime:error:", v54, 3, 1, 0);

          if (v56 == 1 && acc_userDefaults_BOOLForKey((uint64_t)CFSTR("EnableDEVNCertSupport")))
          {
            self->_certType = 3;
            v78 = 1;
          }
          if (gLogObjects && gNumLogObjects >= 7)
          {
            v57 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v57 = MEMORY[0x24BDACB70];
            v58 = MEMORY[0x24BDACB70];
          }
          v18 = v78;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v80 = v56;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = v78;
            _os_log_impl(&dword_21722C000, v57, OS_LOG_TYPE_DEFAULT, "CertStatus = %d, bAuthContinue = %d", buf, 0xEu);
          }

          CFRelease(v54);
        }
        if (v18)
          goto LABEL_91;
        v51 = 4;
      }
      *a5 = v51;
LABEL_92:

      return v18 != 0;
    }
    if (gLogObjects)
      v19 = gNumLogObjects < 7;
    else
      v19 = 1;
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    else
    {
      v22 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _handleAuthCertificate:serialNumber:authError:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    result = 0;
    *a5 = 3;
  }
  return result;
}

- (BOOL)_handleAuthSignature:(__CFData *)a3 certData:(__CFData *)a4 nonceData:(__CFData *)a5
{
  unsigned __int16 v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_bIsShuttingDown && !self->_authStatus)
  {
    v5 = (unsigned __int16)a5;
    v6 = (unsigned __int16)a4;
    v7 = (unsigned __int16)a3;
    if (a4 && a3 && a5)
    {
      if ((acc_userDefaults_BOOLForKey((uint64_t)CFSTR("ForceAuthFail")) & 1) == 0)
        return MFAAVerifyNonceSignature();
    }
    else
    {
      if (gLogObjects)
        v9 = gNumLogObjects < 7;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      else
      {
        v11 = *(id *)(gLogObjects + 48);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 134218496;
        v13 = v7;
        v14 = 2048;
        v15 = v5;
        v16 = 2048;
        v17 = v6;
        _os_log_error_impl(&dword_21722C000, v11, OS_LOG_TYPE_ERROR, "Parameter fail pkNonceSignature:%04lX, pkNonceData:%04lX, pCFCertData:%04lX", (uint8_t *)&v12, 0x20u);
      }

    }
  }
  return 0;
}

- (void)_resetAfterAuthCompletion
{
  self->_authTimerStartTimestamp = 0;
  self->_authTryCurrent = 0;
}

- (void)_handleAuthTimerTimeout
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "AppleAuthCP:%s timeout TTR disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_finishAuthentication:(BOOL)a3 authCert:(__CFData *)a4
{
  unint64_t v5;
  _BOOL4 v7;
  int *p_authStatus;
  int v9;
  NSObject *v10;
  id v11;
  int certType;
  _OWORD *v13;
  __int128 v14;
  NSObject *v15;
  id v16;
  uint64_t authErrorDescription;
  const char *v18;
  const __CFString *v19;
  const __CFString *v20;
  int v21;
  NSObject *v22;
  id v23;
  const char *v24;
  int authVersionMajor;
  int deviceID;
  NSObject *v27;
  id v28;
  kern_return_t v29;
  int v30;
  NSObject *v31;
  id v32;
  int v33;
  _BOOL8 v34;
  dispatch_time_t v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  const void *v40;
  const void *v41;
  int v42;
  NSObject *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  char v48;
  int v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  id v63;
  NSObject *v64;
  id v65;
  _BOOL4 notificationsAvailable;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  _BOOL4 v71;
  __int16 v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = 0x253E63000uLL;
  if (!self->_bIsShuttingDown)
  {
    v7 = a3;
    dispatch_source_set_timer((dispatch_source_t)self->_authTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    p_authStatus = &self->_authStatus;
    if (!self->_authStatus)
    {
      v9 = v7 ? 2 : 1;
      *p_authStatus = v9;
      if (v7)
        self->_authErrorDescription = 0;
    }
    if (gbAppleIDAuthAlwaysPasses && *p_authStatus != 2)
    {
      *p_authStatus = 2;
      if (a4
        && !(self->_authCertCaps.authCertCaps0 | self->_authCertCaps.authCertCaps1 | self->_authCertCaps.authCertCaps2 | self->_authCertCaps.authCertCaps3))
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v10 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v10 = MEMORY[0x24BDACB70];
          v11 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          certType = self->_certType;
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = certType;
          _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "finishAuthentication: _certType %d", buf, 8u);
        }

        if (self->_certType == 3)
          v13 = (_OWORD *)MFAACreateDEVNCertCapsForCable();
        else
          v13 = (_OWORD *)MFAACreateCapsFromAuthCert();
        if (v13)
        {
          v14 = v13[1];
          *(_OWORD *)&self->_authCertCaps.authCertCaps0 = *v13;
          *(_OWORD *)&self->_authCertCaps.authCertCaps2 = v14;
          MFAADeallocAuthCertCaps();
        }
      }
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
      v5 = 0x253E63000uLL;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.11((uint64_t)&self->_authStatus, (uint64_t)self, v15);

    }
    cpSetAuthError(self->super._ioConnect, LOBYTE(self->_authErrorDescription));
    authErrorDescription = self->_authErrorDescription;
    if (authErrorDescription > 0x1D)
      v18 = "UninitializedAuthError";
    else
      v18 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[authErrorDescription];
    v19 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v18, 0x8000100u);
    if (v19)
    {
      v20 = v19;
      cpSetAuthErrorDescription(self->super._ioConnect, v19);
      CFRelease(v20);
    }
    v21 = *p_authStatus;
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v22 = *(id *)(gLogObjects + 48);
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
      v24 = "FAILED";
      authVersionMajor = self->_authVersionMajor;
      deviceID = self->_deviceID;
      if (v21 == 2)
        v24 = "PASSED";
      *(_DWORD *)buf = 136315650;
      v69 = v24;
      v70 = 1024;
      v71 = authVersionMajor;
      v72 = 1024;
      v73 = deviceID;
      _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEFAULT, "AID Authentication final state:[%s], authVersionMajor:%02X, deviceID:%04x", buf, 0x18u);
    }

    if (cpSetAuthStatus(self->super._ioConnect, v21 == 2))
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v27 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v27 = MEMORY[0x24BDACB70];
        v28 = MEMORY[0x24BDACB70];
      }
      v5 = 0x253E63000uLL;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.8();

    }
    if (!self->super._ioNotificationObject)
    {
      v29 = IOServiceAddInterestNotification(self->super._ioNotificationPort, -[ACCTransportIOAccessoryBase ioService](self, "ioService"), "IOGeneralInterest", (IOServiceInterestCallback)AuthCPNotifyEvent, self, &self->super._ioNotificationObject);
      if (v29)
      {
        v30 = v29;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v31 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v31 = MEMORY[0x24BDACB70];
          v32 = MEMORY[0x24BDACB70];
        }
        v5 = 0x253E63000;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.6(self, v30, v31);

      }
    }
    if (-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
    {
      -[ACCTransportIOAccessoryAuthCP _validateAuthCPFlagsForCertificate](self, "_validateAuthCPFlagsForCertificate");
      v33 = -[ACCTransportIOAccessoryAuthCP authStatus](self, "authStatus");
      v34 = v21 == 2 && self->_fdrValidationStatus == 2;
      if (v33 == 3 && self->_softwareErrorRetry <= 2u)
      {
        v35 = dispatch_time(0, 60000000000);
        v36 = MEMORY[0x24BDAC9B8];
        v37 = MEMORY[0x24BDAC9B8];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __64__ACCTransportIOAccessoryAuthCP__finishAuthentication_authCert___block_invoke;
        block[3] = &unk_24D719E68;
        block[4] = self;
        dispatch_after(v35, v36, block);

        v38 = 0;
      }
      else
      {
        v38 = 1;
      }
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:](self, "_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:", v21 == 2, self->_fdrValidationStatus, v34, v38, self->super._ioConnect);
      -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:](self, "_publishAuthStats:fdrStatus:", v21 == 2, self->_fdrValidationStatus);
      v5 = 0x253E63000uLL;
    }
    if (v21 == 2)
    {
      if (a4)
      {
        CFRetain(a4);
        objc_storeStrong((id *)&self->_pAuthCertificate, a4);
        if ((MFAAAddCertDataEntryToCache() & 1) == 0)
        {
          if (gLogObjects && *(int *)(v5 + 2776) >= 7)
          {
            v39 = *(id *)(gLogObjects + 48);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v39 = MEMORY[0x24BDACB70];
            v44 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21722C000, v39, OS_LOG_TYPE_INFO, "Auth cert cache add failed", buf, 2u);
          }

        }
      }
    }
    else if (a4)
    {
      v40 = (const void *)MFAACreateCertificateSerialNumber();
      v41 = (const void *)MFAACreateSerialNumberStringFromData();
      if ((MFAARemoveCertDataEntryFromCache() & 1) == 0)
      {
        v42 = *(_DWORD *)(v5 + 2776);
        if (gLogObjects && v42 >= 7)
        {
          v43 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v43 = MEMORY[0x24BDACB70];
          v45 = MEMORY[0x24BDACB70];
        }
        v5 = 0x253E63000uLL;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v43, OS_LOG_TYPE_INFO, "Auth cert cache remove failed", buf, 2u);
        }

      }
      if (v40)
        CFRelease(v40);
      if (v41)
        CFRelease(v41);
    }
    -[ACCTransportIOAccessoryAuthCP delegate](self, "delegate");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      -[ACCTransportIOAccessoryAuthCP delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) != 0)
      {
        if (-[ACCTransportIOAccessoryAuthCP authStatus](self, "authStatus") == 2)
        {
          LOWORD(v69) = 0;
          *(_DWORD *)buf = 0;
          -[ACCTransportIOAccessoryAuthCP ioServiceUpstream](self, "ioServiceUpstream");
          v46 = (IOAccessoryManagerGetDigitalID() == 0) & buf[2];
        }
        else
        {
          v46 = 0;
        }
        v49 = 1;
      }
      else
      {
        v49 = 0;
        v46 = 0;
      }
    }
    else
    {
      v49 = 0;
    }
    if ((self->_representsInductiveTransport
       || acc_userDefaults_BOOLForKey((uint64_t)CFSTR("AuthTTRForAllTransports")))
      && !self->_bIsShuttingDown
      && v21 != 2)
    {
      if (gbIsInternalBuild
        && (platform_systemInfo_isWatch() & 1) == 0
        && (acc_userDefaults_BOOLForKey((uint64_t)CFSTR("EnableAuthTimeoutTTR")) & 1) != 0)
      {
        if (gLogObjects && *(int *)(v5 + 2776) >= 7)
        {
          v50 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v50 = MEMORY[0x24BDACB70];
          v65 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          notificationsAvailable = self->_notificationsAvailable;
          *(_DWORD *)buf = 136315394;
          v69 = "-[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:]";
          v70 = 1024;
          v71 = notificationsAvailable;
          _os_log_impl(&dword_21722C000, v50, OS_LOG_TYPE_DEFAULT, "AppleAuthCP:%s failure TTR: _notificationsAvailable:%d", buf, 0x12u);
        }

        if (self->_notificationsAvailable)
        {
          if (acc_userDefaults_BOOLForKey((uint64_t)CFSTR("SysdiagnoseInsteadOfAuthTTR")))
            acc_sysdiagnose_InitiateAuthFailureSysdiagnose();
          else
            acc_tapToRadar_InitiateAuthFailureTTR();
        }
      }
      else if (self->_representsInductiveTransport)
      {
        acc_userNotifications_chargingNotSupported();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setGroupIdentifier:", v53);

        v5 = 0x253E63000;
        +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "presentNotification:completionHandler:", v51, 0);

      }
    }
    -[ACCTransportIOAccessoryAuthCP _logToAnalytics](self, "_logToAnalytics");
    -[ACCTransportIOAccessoryAuthCP _resetAfterAuthCompletion](self, "_resetAfterAuthCompletion");
    if (v49)
    {
      -[ACCTransportIOAccessoryAuthCP delegate](self, "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = -[ACCTransportIOAccessoryAuthCP authStatus](self, "authStatus");
      v57 = -[ACCTransportIOAccessoryAuthCP authType](self, "authType");
      -[ACCTransportIOAccessoryAuthCP pAuthCertificate](self, "pAuthCertificate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[ACCTransportIOAccessoryAuthCP certType](self, "certType");
      v60 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      v61 = v57;
      v5 = 0x253E63000uLL;
      objc_msgSend(v55, "IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:", v56, v61, v58, v59, v46, v60);

    }
  }
  if (cpSetAuthFullPass(self->super._ioConnect, 1u))
  {
    if (gLogObjects)
      v62 = *(_DWORD *)(v5 + 2776) < 7;
    else
      v62 = 1;
    if (v62)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v64 = MEMORY[0x24BDACB70];
      v63 = MEMORY[0x24BDACB70];
    }
    else
    {
      v64 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _finishAuthentication:authCert:].cold.1();

  }
}

uint64_t __64__ACCTransportIOAccessoryAuthCP__finishAuthentication_authCert___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 61))
  {
    ++*(_BYTE *)(v1 + 63);
    return objc_msgSend(*(id *)(result + 32), "startAuthenticationProcess");
  }
  return result;
}

- (BOOL)_validateCertCapsForCertificate:(__CFData *)a3 authError:(int *)a4
{
  BOOL v6;
  id v7;
  NSObject *v8;
  int certType;
  int v10;
  uint64_t v11;
  BOOL result;
  _OWORD *v13;
  char v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  int v20;
  id v21;
  id v22;
  id v23;
  int representsInternalModule;
  NSObject *v25;
  id v26;
  id v27;
  __int128 v28;
  _DWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v6 = gNumLogObjects < 7;
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
    v8 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    certType = self->_certType;
    v29[0] = 67109120;
    v29[1] = certType;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "validateCertCapsForCertificate: _certType %d", (uint8_t *)v29, 8u);
  }

  v10 = self->_certType;
  if (v10 == 5)
    return 1;
  if (v10 == 3)
    v11 = MFAACreateDEVNCertCapsForCable();
  else
    v11 = MFAACreateCapsFromAuthCert();
  v13 = (_OWORD *)v11;
  if (v11)
  {
    if (self->_representsInductiveTransport)
    {
      v14 = MFAACanChargeInductive();
      if (gLogObjects)
        v15 = gNumLogObjects <= 6;
      else
        v15 = 1;
      v16 = !v15;
      if ((v14 & 1) != 0)
      {
        if (v16)
        {
          v17 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v17 = MEMORY[0x24BDACB70];
          v22 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, "Auth cert capability bCanChargeInductive passed!", (uint8_t *)v29, 2u);
        }
        v19 = 0;
        v20 = 1;
      }
      else
      {
        if (v16)
        {
          v17 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v17 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryAuthCP _validateCertCapsForCertificate:authError:].cold.6();
        v20 = 0;
        v19 = 14;
      }

    }
    else
    {
      v19 = 0;
      v20 = 1;
    }
    if (!-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
    {
LABEL_76:
      v28 = v13[1];
      *(_OWORD *)&self->_authCertCaps.authCertCaps0 = *v13;
      *(_OWORD *)&self->_authCertCaps.authCertCaps2 = v28;
      MFAADeallocAuthCertCaps();
      result = v20 != 0;
      if (!a4)
        return result;
      goto LABEL_77;
    }
    representsInternalModule = self->_representsInternalModule;
    if (representsInternalModule == 1)
    {
      if (MFAAIsAppleBatteryModule())
      {
LABEL_57:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v25 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v25 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_21722C000, v25, OS_LOG_TYPE_DEFAULT, "Success: validated cert caps", (uint8_t *)v29, 2u);
        }
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (representsInternalModule == 3 && (MFAAIsAppleTouchControllerModule() & 1) != 0)
    {
      goto LABEL_57;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v25 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_21722C000, v25, OS_LOG_TYPE_DEFAULT, "Failure: validated cert caps, but auth flags contain module bit and certificate does not contain module bit", (uint8_t *)v29, 2u);
    }
    v20 = 0;
    v19 = 16;
    goto LABEL_75;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v18 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessoryAuthCP _validateCertCapsForCertificate:authError:].cold.1();

  result = 0;
  v19 = 13;
  if (a4)
LABEL_77:
    *a4 = v19;
  return result;
}

- (int)_fdrCertCheck
{
  const __CFData *v3;
  void *v4;
  int representsInternalModule;
  const __CFData *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  const UInt8 *BytePtr;
  const UInt8 *v16;
  size_t Length;
  CFIndex v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  const char *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  CFTypeRef cf;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const UInt8 *v48;
  __int16 v49;
  const UInt8 *v50;
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v3 = (const __CFData *)cpCopyCertificate(-[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  v51 = CFSTR("CopyAllowUnsealed");
  v52[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  representsInternalModule = self->_representsInternalModule;
  if (representsInternalModule == 1 || (v6 = 0, representsInternalModule == 3))
    v6 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  if (!v3 || !v6)
  {
    if (v6)
    {
      if (v3)
      {
LABEL_24:
        v24 = 0;
        goto LABEL_78;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v30 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v30 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.9();

      if (v3)
        goto LABEL_24;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v32 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v32 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.7();

    v24 = 0;
    if (v6)
      goto LABEL_79;
    goto LABEL_80;
  }
  objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    logObjectForModule_1(6);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v38 = "error getting MFAACertificateManager";
LABEL_85:
      _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
    }
LABEL_86:
    v10 = 0;
LABEL_87:
    v12 = 0;
    goto LABEL_69;
  }
  v9 = objc_msgSend(v7, "copyParsedCertificateChainInfo:", v3);
  if (!v9)
  {
    logObjectForModule_1(6);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v38 = "error parsing certificate";
      goto LABEL_85;
    }
    goto LABEL_86;
  }
  v10 = (void *)v9;
  v11 = objc_msgSend(v8, "copyEvaluatedCertificateChainInfo:", v9);
  if (!v11)
  {
    logObjectForModule_1(6);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, "error evaluating certificate", buf, 2u);
    }
    goto LABEL_87;
  }
  v12 = (void *)v11;
  v13 = objc_msgSend(MEMORY[0x24BE61578], "isMFi2_3CertInfo:", v11);
  v14 = objc_msgSend(MEMORY[0x24BE61578], "isComponentCertInfo:", v12);
  if (v13)
  {
    v40 = v4;
    v41 = v10;
    BytePtr = CFDataGetBytePtr(v3);
    v16 = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(v3);
    v18 = CFDataGetLength(v6);
    v19 = v18;
    if (BytePtr && v16 && Length == v18)
    {
      v20 = memcmp(BytePtr, v16, Length);
      if (gLogObjects)
        v21 = gNumLogObjects <= 6;
      else
        v21 = 1;
      v22 = !v21;
      if (!v20)
      {
        v4 = v40;
        v10 = v41;
        if (v22)
        {
          v23 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v23 = MEMORY[0x24BDACB70];
          v36 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v24 = 2;
          _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, "AuthIC cert == FDR cert", buf, 2u);
        }
        else
        {
          v24 = 2;
        }
        goto LABEL_76;
      }
      v4 = v40;
      v10 = v41;
      if (v22)
      {
        v23 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v23 = MEMORY[0x24BDACB70];
        v35 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.2();
      goto LABEL_69;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v23 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v23 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v44 = v19;
      v45 = 1024;
      v46 = Length;
      v47 = 2048;
      v48 = BytePtr;
      v49 = 2048;
      v50 = v16;
      _os_log_error_impl(&dword_21722C000, v23, OS_LOG_TYPE_ERROR, "AuthIC/FDR cert comparison precondition failure. FDR cert len = %d  authIC cert len = %d pAuthChipCertDataBytes=0x%p pFdrCertDataBytes=0x%p", buf, 0x22u);
    }
    v24 = 1;
    v4 = v40;
LABEL_61:
    v10 = v41;
LABEL_76:

    goto LABEL_77;
  }
  if (v14)
  {
    v23 = objc_msgSend(v8, "copyParsedCertificateChainInfo:", v6);
    if (v23)
    {
      v41 = v10;
      v25 = (void *)objc_msgSend(v8, "copyEvaluatedCertificateChainInfo:", v23);
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v25, "objectForKey:", CFSTR("LeafCertData"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("LeafCertData"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "isEqualToData:", v28);

        if (v29)
          v24 = 2;
        else
          v24 = 1;

        goto LABEL_61;
      }
      logObjectForModule_1(6);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.6();
    }
    else
    {
      logObjectForModule_1(6);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _fdrCertCheck].cold.5();
    }

LABEL_69:
    v24 = 1;
    goto LABEL_76;
  }
  v24 = 0;
LABEL_77:

LABEL_78:
  CFRelease(v3);
  if (v6)
LABEL_79:
    CFRelease(v6);
LABEL_80:

  return v24;
}

- (void)_incrementAuthStat:(const __CFString *)a3 dict:(__CFDictionary *)a4
{
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFNumberRef v8;
  NSObject *v9;
  NSObject *v10;
  int valuePtr;

  valuePtr = -1431655766;
  Value = (const __CFNumber *)CFDictionaryGetValue(a4, a3);
  if (Value)
  {
    v7 = Value;
    if (!CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      logObjectForModule_1(6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:].cold.2();

      goto LABEL_5;
    }
    ++valuePtr;
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v8)
    {
      v7 = v8;
      CFDictionarySetValue(a4, a3, v8);
LABEL_5:
      CFRelease(v7);
      return;
    }
    logObjectForModule_1(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:].cold.3();
  }
  else
  {
    logObjectForModule_1(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:].cold.1();
  }

}

- (void)_validateAuthCPFlagsForCertificate
{
  if (!self->_fdrValidationStatus)
    self->_fdrValidationStatus = -[ACCTransportIOAccessoryAuthCP _fdrCertCheck](self, "_fdrCertCheck");
}

- (void)_publishAuth:(BOOL)a3 fdrStatus:(int)a4 trusted:(BOOL)a5 publishToUI:(BOOL)a6 ioconnect:(unsigned int)a7
{
  _BOOL4 v8;
  unsigned int v9;
  BOOL v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v8 = a6;
  v9 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  if (cpSetFdrValidationStatus(a7, a4))
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 7;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v13 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:].cold.7();

  }
  if (gLogObjects)
    v14 = gNumLogObjects < 7;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "no";
    if (a4 == 2)
      v17 = "yes";
    v24 = 67109378;
    v25 = a4;
    v26 = 2080;
    v27 = v17;
    _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "authFlags need FDRValidation, FDRValidationStatus = %d, pass = %s", (uint8_t *)&v24, 0x12u);
  }

  if (cpSetTrustStatus(a7, v9))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v18 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:].cold.4();

  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v20 = *(id *)(gLogObjects + 48);
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
    v24 = 67109376;
    v25 = v8;
    v26 = 1024;
    LODWORD(v27) = v9;
    _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, "publishToUI=%d, cpSetTrustStatusForUI=%d", (uint8_t *)&v24, 0xEu);
  }

  if (v8 && cpSetTrustStatusForUI(a7, v9))
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v22 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _publishAuth:fdrStatus:trusted:publishToUI:ioconnect:].cold.1();

  }
}

- (__CFDictionary)_copyOrCreateStatsSubDict:(__CFDictionary *)a3 forSerialNumber:(__CFString *)a4
{
  const __CFDictionary *Value;
  __CFDictionary *MutableCopy;
  NSObject *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int valuePtr;

  if (!-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
    return 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, a4);
  if (Value)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
    if (!MutableCopy)
    {
      logObjectForModule_1(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:].cold.3();

      return 0;
    }
  }
  else
  {
    valuePtr = 0;
    MutableCopy = CFDictionaryCreateMutable(0, 0, 0, 0);
    if (MutableCopy)
    {
      v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
      if (v10)
      {
        v11 = v10;
        CFDictionarySetValue(MutableCopy, CFSTR("AuthPassedCount"), v10);
        CFDictionarySetValue(MutableCopy, CFSTR("AuthFailedCount"), v11);
        CFDictionarySetValue(MutableCopy, CFSTR("FDRPassedCount"), v11);
        CFDictionarySetValue(MutableCopy, CFSTR("FDRFailedCount"), v11);
        CFDictionarySetValue(MutableCopy, CFSTR("FDRUnknownCount"), v11);
        CFRelease(v11);
        v12 = self->_representsInternalModule - 1;
        if (v12 <= 2)
          CFDictionarySetValue(MutableCopy, CFSTR("AccessoryType"), off_24D71AE78[v12]);
        v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
        -[NSObject setDateFormat:](v13, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm:ss Z"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate:](v13, "stringFromDate:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          CFDictionarySetValue(MutableCopy, CFSTR("FirstAuthTimestamp"), v15);

      }
      else
      {
        logObjectForModule_1(6);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:].cold.2();
      }
    }
    else
    {
      logObjectForModule_1(6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:].cold.1();
    }

  }
  return MutableCopy;
}

- (void)_publishAuthStats:(BOOL)a3 fdrStatus:(int)a4
{
  _BOOL4 v5;
  const __CFDictionary *v7;
  __CFDictionary *MutableCopy;
  NSObject *v9;
  const __CFDictionary *v10;
  const void *Copy;
  __CFDictionary *v12;
  const __CFString *v13;
  int representsInternalModule;
  const __CFString *v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  id v19;
  const void **v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t buf[16];

  v5 = a3;
  if (!-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
    return;
  v7 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("AuthStats"), CFSTR("com.apple.accessoryd"));
  if (v7)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    if (!MutableCopy)
    {
      logObjectForModule_1(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.6();

      v10 = v7;
      goto LABEL_54;
    }
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 0, 0, 0);
    if (!MutableCopy)
    {
      logObjectForModule_1(6);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.1();

      return;
    }
  }
  if (self->_representsInternalModule == 2)
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("N/A"));
  }
  else
  {
    Copy = cpCopyCertificateSerialNumber(-[ACCTransportIOAccessoryBase ioService](self, "ioService"));
    if (!Copy)
    {
      logObjectForModule_1(6);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.5();

      v12 = 0;
      goto LABEL_50;
    }
  }
  v12 = -[ACCTransportIOAccessoryAuthCP _copyOrCreateStatsSubDict:forSerialNumber:](self, "_copyOrCreateStatsSubDict:forSerialNumber:", MutableCopy, Copy);
  if (!v12)
  {
    logObjectForModule_1(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryAuthCP _publishAuthStats:fdrStatus:].cold.2();

    if (Copy)
      goto LABEL_49;
    goto LABEL_50;
  }
  if (v5)
    v13 = CFSTR("AuthPassedCount");
  else
    v13 = CFSTR("AuthFailedCount");
  -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:](self, "_incrementAuthStat:dict:", v13, v12);
  representsInternalModule = self->_representsInternalModule;
  switch(representsInternalModule)
  {
    case 1:
      v15 = CFSTR("CertificateSupportsBattery");
      if (MFAAIsAppleBatteryModule())
      {
LABEL_19:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v16 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v21 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "Success for auth stats: Cert caps show Internal Module, and certificate contains module bit", buf, 2u);
        }

        v20 = (const void **)MEMORY[0x24BDBD270];
        goto LABEL_42;
      }
      break;
    case 2:
      v17 = 0;
      v15 = CFSTR("CertificateSupportsVeridian");
      goto LABEL_26;
    case 3:
      v15 = CFSTR("CertificateSupportsTouchController");
      if ((MFAAIsAppleTouchControllerModule() & 1) != 0)
        goto LABEL_19;
      break;
    default:
      v15 = 0;
      v17 = 1;
      goto LABEL_26;
  }
  v17 = 0;
LABEL_26:
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v18 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_21722C000, v18, OS_LOG_TYPE_DEFAULT, "Failure for auth stats: Cert caps show Internal Module, but certificate does not contain module bit", v27, 2u);
  }

  if ((v17 & 1) == 0)
  {
    v20 = (const void **)MEMORY[0x24BDBD268];
LABEL_42:
    CFDictionarySetValue(v12, v15, *v20);
  }
  v22 = CFSTR("FDRUnknownCount");
  if (a4 == 2)
    v22 = CFSTR("FDRPassedCount");
  if (a4 == 1)
    v23 = CFSTR("FDRFailedCount");
  else
    v23 = v22;
  -[ACCTransportIOAccessoryAuthCP _incrementAuthStat:dict:](self, "_incrementAuthStat:dict:", v23, v12);
  CFDictionarySetValue(MutableCopy, Copy, v12);
  CFPreferencesSetValue(CFSTR("AuthStats"), MutableCopy, CFSTR("com.apple.accessoryd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (Copy)
LABEL_49:
    CFRelease(Copy);
LABEL_50:
  if (v7)
    CFRelease(v7);
  CFRelease(MutableCopy);
  if (v12)
  {
    v10 = v12;
LABEL_54:
    CFRelease(v10);
  }
}

- (void)_logToAnalytics
{
  _BOOL8 v3;
  unint64_t authTimerStartTimestamp;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t authErrorDescription;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  CFNumberRef BucketizedInductiveAuthDuration;
  const __CFString *v19;
  unsigned int representsInternalModule;
  void *v21;
  void *v22;
  unsigned int v23;
  const char *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
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
  NSObject *v43;
  id v44;
  void *v45;
  unint64_t CurrentUnixTimeMS;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[6];
  _QWORD v52[8];

  v52[6] = *MEMORY[0x24BDAC8D0];
  v3 = -[ACCTransportIOAccessoryBase primaryPortNumber](self, "primaryPortNumber") == 512
    && self->_representsInductiveTransport;
  CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
  authTimerStartTimestamp = self->_authTimerStartTimestamp;
  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = CFSTR("Failed");
  if (!self->_authErrorDescription)
    v6 = CFSTR("Passed");
  v52[0] = v6;
  v51[0] = CFSTR("authState");
  v51[1] = CFSTR("authTries");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_authTryCurrent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v7;
  v51[2] = CFSTR("authErrorDescription");
  authErrorDescription = self->_authErrorDescription;
  if (authErrorDescription > 0x1D)
    v9 = "UninitializedAuthError";
  else
    v9 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[authErrorDescription];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v10;
  v51[3] = CFSTR("authCertCached");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_certIsCached);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v11;
  v51[4] = CFSTR("isInductive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v12;
  v51[5] = CFSTR("isPeriodic");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (systemInfo_isInternalBuild() && self->_forcedReAuthCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("forcedReAuthCount"));

  }
  v17 = CurrentUnixTimeMS - authTimerStartTimestamp;
  if (v3)
  {
    BucketizedInductiveAuthDuration = acc_analytics_createBucketizedInductiveAuthDuration(v17 / 0x3E8);
    v19 = CFSTR("inductiveAuthDuration");
  }
  else
  {
    BucketizedInductiveAuthDuration = acc_analytics_createBucketizedWiredAuthDuration(v17);
    v19 = CFSTR("wiredAuthDuration");
  }
  objc_msgSend(v15, "setObject:forKey:", BucketizedInductiveAuthDuration, v19);

  if (-[ACCTransportIOAccessoryAuthCP _representsHardwareComponent](self, "_representsHardwareComponent"))
  {
    representsInternalModule = self->_representsInternalModule;
    if (representsInternalModule - 2 >= 2)
    {
      if (representsInternalModule != 1)
      {
LABEL_20:
        v22 = (void *)MEMORY[0x24BDD17C8];
        v23 = -[ACCTransportIOAccessoryAuthCP fdrValidationStatus](self, "fdrValidationStatus");
        if (v23 > 2)
          v24 = "AuthSuccess";
        else
          v24 = kACCTransport_IOAccessoryAuthCP_FDRStatus_Strings[v23];
        objc_msgSend(v22, "stringWithUTF8String:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v25, CFSTR("FDRStatus"));

        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "systemUptime");
        v28 = v27;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v29, CFSTR("Uptime"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _checkSpringBoardStarted());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v30, CFSTR("SpringBoardStarted"));

        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("isBatteryModule"));

      representsInternalModule = self->_representsInternalModule;
    }
    objc_msgSend(v15, "setObject:forKey:", *((_QWORD *)&kACCTransportIOAccessoryAuthCPInternalModule_Strings + representsInternalModule), CFSTR("internalModuleType"));
    goto LABEL_20;
  }
LABEL_24:
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "managerForIOAccessoryManagerService:", -[ACCTransportIOAccessoryBase upstreamManagerService](self, "upstreamManagerService"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v32, "deviceName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v32, "deviceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v34, CFSTR("accessoryName"));

    }
    objc_msgSend(v32, "deviceVendorName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v32, "deviceVendorName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v36, CFSTR("accessoryManufacturer"));

    }
    objc_msgSend(v32, "deviceModelNumber");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v32, "deviceModelNumber");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v38, CFSTR("accessoryModel"));

    }
    objc_msgSend(v32, "deviceHardwareRevision");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v32, "deviceHardwareRevision");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v40, CFSTR("accessoryHardwareVersion"));

    }
    objc_msgSend(v32, "deviceFirmwareRevision");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v32, "deviceFirmwareRevision");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v42, CFSTR("accessoryFirmwareVersionActive"));

    }
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    v43 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v43 = MEMORY[0x24BDACB70];
    v44 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = CFSTR("com.apple.accessories.authCPEvent");
    v49 = 2112;
    v50 = v15;
    _os_log_impl(&dword_21722C000, v43, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", buf, 0x16u);
  }

  AnalyticsSendEvent();
  +[ACCAnalytics loggerForUser:](ACCAnalytics, "loggerForUser:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "logACCAnalyticsForEventNamed:withAttributes:", CFSTR("accessoryAuthCPEvent"), v15);

}

- (BOOL)_representsHardwareComponent
{
  return (self->_representsInternalModule - 1) < 3;
}

- (ACCTransportIOAccessoryAuthCPProtocol)delegate
{
  return (ACCTransportIOAccessoryAuthCPProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)authStatus
{
  return self->_authStatus;
}

- (BOOL)authTimedOut
{
  return self->_authTimedOut;
}

- (NSData)pAuthCertificate
{
  return self->_pAuthCertificate;
}

- (BOOL)representsInductiveTransport
{
  return self->_representsInductiveTransport;
}

- (void)setRepresentsInductiveTransport:(BOOL)a3
{
  self->_representsInductiveTransport = a3;
}

- (int)representsInternalModule
{
  return self->_representsInternalModule;
}

- (void)setRepresentsInternalModule:(int)a3
{
  self->_representsInternalModule = a3;
}

- (int)accConnectionType
{
  return self->_accConnectionType;
}

- (void)setAccConnectionType:(int)a3
{
  self->_accConnectionType = a3;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (int)authType
{
  return self->_authType;
}

- (OS_dispatch_queue)authWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAuthWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OS_dispatch_source)authTimerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAuthTimerSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (unsigned)authTryCurrent
{
  return self->_authTryCurrent;
}

- (void)setAuthTryCurrent:(unsigned __int8)a3
{
  self->_authTryCurrent = a3;
}

- (unsigned)authTryMaximum
{
  return self->_authTryMaximum;
}

- (void)setAuthTryMaximum:(unsigned __int8)a3
{
  self->_authTryMaximum = a3;
}

- (unsigned)authVersionMajor
{
  return self->_authVersionMajor;
}

- (void)setAuthVersionMajor:(unsigned __int8)a3
{
  self->_authVersionMajor = a3;
}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unsigned __int16)a3
{
  self->_deviceID = a3;
}

- (_AuthCertCapsInt_t)authCertCaps
{
  _AuthCertCapsInt_t *result;

  objc_copyStruct(retstr, &self->_authCertCaps, 32, 1, 0);
  return result;
}

- (void)setAuthCertCaps:(_AuthCertCapsInt_t *)a3
{
  objc_copyStruct(&self->_authCertCaps, a3, 32, 1, 0);
}

- (const)pAuthCertCache
{
  return self->_pAuthCertCache;
}

- (void)setPAuthCertCache:(const void *)a3
{
  self->_pAuthCertCache = a3;
}

- (unsigned)ioServiceUpstream
{
  return self->_ioServiceUpstream;
}

- (void)setIoServiceUpstream:(unsigned int)a3
{
  self->_ioServiceUpstream = a3;
}

- (BOOL)bIsShuttingDown
{
  return self->_bIsShuttingDown;
}

- (void)setBIsShuttingDown:(BOOL)a3
{
  self->_bIsShuttingDown = a3;
}

- (int)certType
{
  return self->_certType;
}

- (void)setCertType:(int)a3
{
  self->_certType = a3;
}

- (NSDictionary)certInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCertInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (unsigned)authFlags
{
  return self->_authFlags;
}

- (void)setAuthFlags:(unsigned int)a3
{
  self->_authFlags = a3;
}

- (unint64_t)authTimerStartTimestamp
{
  return self->_authTimerStartTimestamp;
}

- (void)setAuthTimerStartTimestamp:(unint64_t)a3
{
  self->_authTimerStartTimestamp = a3;
}

- (int)fdrValidationStatus
{
  return self->_fdrValidationStatus;
}

- (void)setFdrValidationStatus:(int)a3
{
  self->_fdrValidationStatus = a3;
}

- (int)authErrorDescription
{
  return self->_authErrorDescription;
}

- (void)setAuthErrorDescription:(int)a3
{
  self->_authErrorDescription = a3;
}

- (unsigned)forcedReAuthCount
{
  return self->_forcedReAuthCount;
}

- (void)setForcedReAuthCount:(unsigned int)a3
{
  self->_forcedReAuthCount = a3;
}

- (BOOL)certIsCached
{
  return self->_certIsCached;
}

- (void)setCertIsCached:(BOOL)a3
{
  self->_certIsCached = a3;
}

- (unsigned)softwareErrorRetry
{
  return self->_softwareErrorRetry;
}

- (void)setSoftwareErrorRetry:(unsigned __int8)a3
{
  self->_softwareErrorRetry = a3;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)battery_iter
{
  return self->_battery_iter;
}

- (void)setBattery_iter:(unsigned int)a3
{
  self->_battery_iter = a3;
}

- (IONotificationPort)transportNotifyPortRef
{
  return self->_transportNotifyPortRef;
}

- (void)setTransportNotifyPortRef:(IONotificationPort *)a3
{
  self->_transportNotifyPortRef = a3;
}

- (OS_dispatch_semaphore)pairedSema
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPairedSema:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)notificationsAvailable
{
  return self->_notificationsAvailable;
}

- (void)setNotificationsAvailable:(BOOL)a3
{
  self->_notificationsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSema, 0);
  objc_storeStrong((id *)&self->_certInfo, 0);
  objc_storeStrong((id *)&self->_authTimerSource, 0);
  objc_storeStrong((id *)&self->_authWorkQueue, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_pAuthCertificate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:andIOService:connectionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "super initWithIOAccessoryClass:NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:andIOService:connectionType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "CFStringGetCStringPtr pkStrWorkQueueName:NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:andIOService:connectionType:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "dispatch_queue_create _authWorkQueue:NULL, revoking all features", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:andIOService:connectionType:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "createCertificateCache pAuthCertCache:NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 connectionType:(uint64_t)a5 .cold.10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_1(&dword_21722C000, a2, a3, "createSerialNumberStringFromData pCFDataQueueID:%04lX, pCFStrQueueID:%04lX", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDelegate:andIOService:connectionType:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "CFStringCreateMutableCopy pCFStrWorkQueueName:NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:andIOService:connectionType:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "IOServiceOpen failed %#x, cannot create ACCTransportIOAccessoryAuthCP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 connectionType:(uint64_t)a5 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_4(&dword_21722C000, a1, a3, "authCP failed to lookup property %s ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_authInternalModuleWithCert:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21722C000, a2, a3, "%s: unknown module type: %d", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_authInternalModuleWithCert:withError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_1(&dword_21722C000, v0, v1, "(module:%{public}@) %s: timed_out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_authWithAuthIC:withCert:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "createRandomNonce pkNonceData = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_authWithAuthIC:withCert:withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "cpCreateSignature fail ioretStatus:%02X", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_authWithAuthIC:(unsigned __int8 *)a1 withCert:(int)a2 withError:(NSObject *)a3 .cold.5(unsigned __int8 *a1, int a2, NSObject *a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_21722C000, a3, (uint64_t)a3, "Auth version mismatch certAuthVerMajor:%02X != authCPVerMajor:%02X", (uint8_t *)v4);
  OUTLINED_FUNCTION_2();
}

- (void)_authWithAuthIC:(char)a1 withCert:(int *)a2 withError:(os_log_t)log .cold.6(char a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 136315906;
  v5 = "-[ACCTransportIOAccessoryAuthCP _authWithAuthIC:withCert:withError:]";
  v6 = 1024;
  v7 = 1181;
  v8 = 1024;
  v9 = a1 & 1;
  v10 = 1024;
  v11 = v3;
  _os_log_debug_impl(&dword_21722C000, log, OS_LOG_TYPE_DEBUG, "%s:%d bAuthContinue = %d, _certType = %d", (uint8_t *)&v4, 0x1Eu);
}

void __59__ACCTransportIOAccessoryAuthCP_startAuthenticationProcess__block_invoke_cold_3(uint8_t *a1, id *a2, _DWORD *a3, NSObject *a4)
{
  int v7;

  v7 = objc_msgSend(*a2, "ioService");
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_error_impl(&dword_21722C000, a4, OS_LOG_TYPE_ERROR, "AuthCP service:%4d: Skip auth since auth already passed", a1, 8u);
}

- (void)_handleAuthDeviceInfo:versionMajor:versionMinor:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315650;
  OUTLINED_FUNCTION_14();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_26(&dword_21722C000, v1, v2, "%s Invalid auth version authVerMajor:%02X, authVerMinor:%02X", v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAuthDeviceInfo:versionMajor:versionMinor:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1(&dword_21722C000, v0, v1, "%s Auth device info read failed ioretStatus:%02X", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_4(&dword_21722C000, a1, a3, "%s pCFCertData = NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_4(&dword_21722C000, a1, a3, "%s createCertificateSerialNumber returned pCFDataSerNum:NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_4(&dword_21722C000, a1, a3, "%s createSerialNumberStringFromData returned pCFStrSerNumFromCert:NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAuthCertificate:(uint64_t)a3 serialNumber:(uint64_t)a4 authError:(uint64_t)a5 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_1(&dword_21722C000, a2, a3, "%s Cert serial number mismatch serNumCompare:%02lX failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_finishAuthentication:authCert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, " cpSetAuthFullPass() failed (ret=0x%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_finishAuthentication:(NSObject *)a3 authCert:.cold.6(void *a1, int a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[8];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ioService");
  OUTLINED_FUNCTION_11();
  v7 = 1024;
  v8 = a2;
  OUTLINED_FUNCTION_10(&dword_21722C000, a3, v5, "ERROR: Failed to register for notifactions from AppleAuthCP ioService:%04X, fail status:%04X\n", v6);
}

- (void)_finishAuthentication:authCert:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, " cpSetAuthStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_finishAuthentication:(NSObject *)a3 authCert:.cold.11(uint64_t a1, uint64_t a2, NSObject *a3)
{
  OUTLINED_FUNCTION_26(&dword_21722C000, a2, a3, "OVERRIDE: gbAppleIDAuthAlwaysPasses authStatus:%02X -> %02X (PASS), authCertCaps0:%08llX", 67109632, 132096, *(_QWORD *)(a2 + 208));
  OUTLINED_FUNCTION_2();
}

- (void)_validateCertCapsForCertificate:authError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "createCapsFromAuthCert pkAuthCertCaps:NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_validateCertCapsForCertificate:authError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "Auth cert capability bCanChargeInductive:0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_fdrCertCheck
{
  OUTLINED_FUNCTION_5_4(&dword_21722C000, a2, a3, "AMFDRSealingMapCopyLocalDataForClass returned error = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_incrementAuthStat:dict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_4(&dword_21722C000, v0, v1, "_incrementAuthStat: Failed to find key %@ in AuthStats dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_incrementAuthStat:dict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_4(&dword_21722C000, v0, v1, "_incrementAuthStat: CFNumberGetValue() failed for key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_incrementAuthStat:dict:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_4(&dword_21722C000, v0, v1, "_incrementAuthStat: CFNumberCreate() failed for key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, " cpSetTrustStatusForUI() failed (ret=0x%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, " cpSetTrustStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuth:fdrStatus:trusted:publishToUI:ioconnect:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, " cpSetFdrValidationStatus() failed (ret=0x%x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_5_4(&dword_21722C000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create sub-dictionary associated with certSn = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create valueObj", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_copyOrCreateStatsSubDict:forSerialNumber:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_copyOrCreateStatsSubDict: Failed to create a mutable copy of pStatsSubDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuthStats:fdrStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_publishAuthStats: Failed to create AuthStats dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuthStats:fdrStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_publishAuthStats: pStatsSubDictMutable == NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuthStats:fdrStatus:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_publishAuthStats: pCFStrSerNum == NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishAuthStats:fdrStatus:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "_publishAuthStats: Failed to create a mutable copy of pAuthStatsDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
