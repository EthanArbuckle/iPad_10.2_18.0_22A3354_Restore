@implementation APAdvertiserBTLEManager

- (APAdvertiserBTLEManager)initWithEventContext:(void *)a3
{
  APAdvertiserBTLEManager *v3;
  APAdvertiserBTLEManager *v5;
  uint64_t v6;
  dispatch_queue_t v7;
  dispatch_queue_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  int v11;
  uint64_t v12;
  NSObject *internalQueue;
  uint32_t v14;
  NSObject *v15;
  uint64_t *v17;
  int v18;
  _QWORD block[6];
  _QWORD handler[5];
  objc_super v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v3 = self;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (!a3)
  {
    APSLogErrorAt();
    v17 = v23;
    v18 = -6705;
LABEL_19:
    *((_DWORD *)v17 + 6) = v18;
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)APAdvertiserBTLEManager;
  v5 = -[APAdvertiserBTLEManager init](&v21, sel_init);
  v3 = v5;
  if (!v5)
    goto LABEL_10;
  v5->_eventContext = a3;
  v6 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  v3->_weakSelf = (OpaqueFigCFWeakReferenceHolder *)v6;
  if (!v6)
    goto LABEL_18;
  v7 = dispatch_queue_create("APAdvertiserBTLEManagerInternalQueue", 0);
  v3->_internalQueue = (OS_dispatch_queue *)v7;
  if (!v7
    || (v8 = dispatch_queue_create("APAdvertiserBTLEManagerEventQueue", 0),
        (v3->_eventQueue = (OS_dispatch_queue *)v8) == 0)
    || (v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]), (v3->_soloDevices = v9) == 0)
    || (v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]), (v3->_pendingLostLegacyDevices = v10) == 0))
  {
LABEL_18:
    APSLogErrorAt();
    v17 = v23;
    v18 = -72312;
    goto LABEL_19;
  }
  v11 = -[APAdvertiserBTLEManager setupEventHandlerState](v3, "setupEventHandlerState");
  *((_DWORD *)v23 + 6) = v11;
  if (v11)
  {
    APSLogErrorAt();
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    internalQueue = v3->_internalQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke;
    handler[3] = &unk_24E21FCF0;
    handler[4] = v3;
    v14 = notify_register_dispatch("com.apple.TouchRemote.deviceSetupActive", &v3->_touchSetupActiveNotifyToken, internalQueue, handler);
    *((_DWORD *)v23 + 6) = v14;
    v15 = v3->_internalQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke_2;
    block[3] = &unk_24E21FCC8;
    block[4] = v3;
    block[5] = &v22;
    dispatch_sync(v15, block);
  }
LABEL_10:
  if (*((_DWORD *)v23 + 6))
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v3 = 0;
  }
  _Block_object_dispose(&v22, 8);
  return v3;
}

- (void)dealloc
{
  NSObject *internalQueue;
  NSObject *eventQueue;
  OpaqueFigCFWeakReferenceHolder *weakSelf;
  int touchSetupActiveNotifyToken;
  objc_super v7;

  self->_eventContext = 0;
  -[APAdvertiserBTLEManager cleanupEventHandlerState](self, "cleanupEventHandlerState");

  self->_btleAdvertiser = 0;
  self->_btleDiscoverer = 0;

  self->_soloDevices = 0;
  self->_pendingLostLegacyDevices = 0;
  internalQueue = self->_internalQueue;
  if (internalQueue)
  {
    dispatch_release(internalQueue);
    self->_internalQueue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  weakSelf = self->_weakSelf;
  if (weakSelf)
  {
    CFRelease(weakSelf);
    self->_weakSelf = 0;
  }
  touchSetupActiveNotifyToken = self->_touchSetupActiveNotifyToken;
  if (touchSetupActiveNotifyToken != -1)
  {
    notify_cancel(touchSetupActiveNotifyToken);
    self->_touchSetupActiveNotifyToken = -1;
  }
  v7.receiver = self;
  v7.super_class = (Class)APAdvertiserBTLEManager;
  -[APAdvertiserBTLEManager dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  NSObject *p2pSoloQueryTimer;

  if (!-[APAdvertiserBTLEManager isInvalidated](self, "isInvalidated"))
  {
    -[APAdvertiserBTLEManager setIsInvalidated:](self, "setIsInvalidated:", 1);
    -[APAdvertiserBTLEManager stop](self, "stop");
    -[CBAdvertiser invalidate](self->_btleAdvertiser, "invalidate");
    -[CBDiscovery invalidate](self->_btleDiscoverer, "invalidate");
    -[APAdvertiserBTLEManager setEventHandler:withContext:](self, "setEventHandler:withContext:", 0, 0);
    p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
    if (p2pSoloQueryTimer)
    {
      dispatch_release(p2pSoloQueryTimer);
      self->_p2pSoloQueryTimer = 0;
    }
  }
}

- (id)createBTLEAdvertiser
{
  id v3;
  uint64_t v4;
  CUNetInterfaceMonitor *v5;
  __int128 v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBB218]);
  if (!v3)
  {
    APSLogErrorAt();
    return v3;
  }
  objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
  v4 = -[APAdvertiserBTLEManager seed](self, "seed");
  -[APAdvertiserBTLEManager setSeed:](self, "setSeed:", (v4 + 1));
  objc_msgSend(v3, "setAirplayTargetConfigSeed:", v4);
  objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 2);
  if (self->_p2pSolo)
    objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 1);
  v5 = -[APAdvertiserBTLEManager netInterfaceMonitor](self, "netInterfaceMonitor");
  if (v5)
    -[CUNetInterfaceMonitor primaryIPv4Addr](v5, "primaryIPv4Addr");
  else
    v7 = 0uLL;
  if (BYTE1(v7) != 2)
  {
LABEL_18:
    objc_msgSend(v3, "invalidate");

    return 0;
  }
  objc_msgSend(v3, "setAirplayTargetIPv4:", bswap32(DWORD1(v7)));
  if (self->_receiverPort)
  {
    objc_msgSend(v3, "setAirplayTargetPort:");
    objc_msgSend(v3, "setAirplayTargetFlags:", objc_msgSend(v3, "airplayTargetFlags") | 0x10);
  }
  if (!objc_msgSend(v3, "airplayTargetFlags"))
  {
    APSLogErrorAt();
    goto LABEL_18;
  }
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v3, "airplayTargetFlags");
    objc_msgSend(v3, "airplayTargetConfigSeed");
    objc_msgSend(v3, "airplayTargetPort");
    LogPrintF();
  }
  return v3;
}

- (id)createBTLEDiscoverer
{
  id v3;
  const char *v4;
  APAdvertiserBTLEManager *v5;
  uint64_t v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;

  v13 = -75;
  v3 = objc_alloc_init(MEMORY[0x24BDBB250]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
    objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x5000000000);
    if (-[APAdvertiserBTLEManager shouldScanForSourceWithScreenOff](self, "shouldScanForSourceWithScreenOff"))
    {
      objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x2000000);
      objc_msgSend(v3, "setBleScanRateScreenOff:", 20);
    }
    v4 = "no";
    if (IsAppleInternalBuild() && APSSettingsGetInt64IfPresent())
      v4 = "yes";
    if (gLogCategory_APAdvertiserBTLEManager <= 30
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      v8 = v13;
      v9 = v4;
      LogPrintF();
    }
    objc_msgSend(v3, "setBleRSSIThresholdHint:", (char)v13, v8, v9);
    v5 = self;
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke;
    v12[3] = &unk_24E21FD18;
    v12[4] = v5;
    objc_msgSend(v3, "setDeviceFoundHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_2;
    v11[3] = &unk_24E21FD18;
    v11[4] = v5;
    objc_msgSend(v3, "setDeviceLostHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_3;
    v10[3] = &unk_24E21FC00;
    v10[4] = v5;
    objc_msgSend(v3, "setInvalidationHandler:", v10);
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

- (int)start
{
  APAdvertiserBTLEManager *v4;

  if (self->_btleMode == 1)
  {
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      v4 = self;
      LogPrintF();
    }
    self->_btleMode = 1;
    -[APAdvertiserBTLEManager startMonitoringForNetworkChanges](self, "startMonitoringForNetworkChanges", v4);
    -[APAdvertiserBTLEManager update](self, "update");
  }
  return 0;
}

- (int)stop
{
  int v3;
  int v4;

  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_btleMode)
    return 0;
  self->_btleMode = 0;
  v3 = -[APAdvertiserBTLEManager stopMonitoringForNetworkChanges](self, "stopMonitoringForNetworkChanges");
  if (v3)
  {
    v4 = v3;
    goto LABEL_11;
  }
  v4 = -[APAdvertiserBTLEManager update](self, "update");
  if (v4)
LABEL_11:
    APSLogErrorAt();
  return v4;
}

- (int)startP2PSoloQueryTimer
{
  OS_dispatch_source *v3;
  uint64_t v4;
  NSObject *p2pSoloQueryTimer;
  NSObject *v6;
  dispatch_time_t v7;
  int result;
  _QWORD v9[5];
  _QWORD handler[5];

  if (self->_p2pSoloQueried || self->_p2pSoloQueryTimer)
    return 0;
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_internalQueue);
  self->_p2pSoloQueryTimer = v3;
  if (!v3)
  {
    APSLogErrorAt();
    return -72312;
  }
  v4 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke;
  handler[3] = &unk_24E21FC00;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke_2;
  v9[3] = &unk_24E21FC00;
  v9[4] = self;
  dispatch_source_set_cancel_handler(p2pSoloQueryTimer, v9);
  v6 = self->_p2pSoloQueryTimer;
  v7 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v6, v7, 0x1DCD6500uLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_p2pSoloQueryTimer);
  if (gLogCategory_APAdvertiserBTLEManager > 40)
    return 0;
  if (gLogCategory_APAdvertiserBTLEManager != -1 || (result = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    return 0;
  }
  return result;
}

- (void)handleP2PSoloQueryTimerFired
{
  NSObject *p2pSoloQueryTimer;

  if (!-[APAdvertiserBTLEManager updateSupportsSoloAndForceReadFromPrefs:](self, "updateSupportsSoloAndForceReadFromPrefs:", 0))
  {
    p2pSoloQueryTimer = self->_p2pSoloQueryTimer;
    if (p2pSoloQueryTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_p2pSoloQueryTimer);
      dispatch_release(p2pSoloQueryTimer);
      self->_p2pSoloQueryTimer = 0;
    }
  }
}

- (void)handleP2PSoloQueryTimerCancelled
{
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)canAdvertise
{
  return !self->_requireAltBrowser;
}

- (int)update
{
  const char *v3;
  const char *v5;
  uint64_t btleMode;
  id v7;

  if (gLogCategory_APAdvertiserBTLEManager <= 20
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    if (-[APAdvertiserBTLEManager isEnabled](self, "isEnabled"))
      v3 = "yes";
    else
      v3 = "no";
    btleMode = self->_btleMode;
    v7 = +[APAdvertiserBTLEManager stringForBTLEState:](APAdvertiserBTLEManager, "stringForBTLEState:", -[APAdvertiserBTLEManager btleManagerState](self, "btleManagerState"));
    v5 = v3;
    LogPrintF();
  }
  if (!-[APAdvertiserBTLEManager isEnabled](self, "isEnabled", v5, btleMode, v7) || !self->_btleMode)
  {
    if (-[APAdvertiserBTLEManager isAdvertising](self, "isAdvertising"))
      -[APAdvertiserBTLEManager stopAdvertising](self, "stopAdvertising");
    goto LABEL_17;
  }
  if (-[APAdvertiserBTLEManager isEnabled](self, "isEnabled") && self->_btleMode == 1)
  {
    -[APAdvertiserBTLEManager startAdvertising](self, "startAdvertising");
    if (self->_p2pSolo)
    {
      if (self->_isP2PAllowed)
      {
        -[APAdvertiserBTLEManager startScanning](self, "startScanning");
        return 0;
      }
    }
    else if (self->_isP2PAllowed)
    {
      return 0;
    }
LABEL_17:
    -[APAdvertiserBTLEManager stopScanning](self, "stopScanning");
  }
  return 0;
}

- (int)updatePreferences
{
  uint64_t v3;
  uint64_t Int64;
  BOOL v5;
  int result;
  uint64_t v7;
  int v8;

  v8 = 0;
  v7 = 0;
  notify_get_state(-[APAdvertiserBTLEManager touchSetupActiveNotifyToken](self, "touchSetupActiveNotifyToken"), &v7);
  v3 = 0;
  if (!v7)
  {
    Int64 = APSSettingsGetInt64();
    if (v8)
      v5 = 0;
    else
      v5 = Int64 == 0;
    v3 = !v5;
  }
  -[APAdvertiserBTLEManager setIsEnabled:](self, "setIsEnabled:", v3);
  v8 = -[APAdvertiserBTLEManager updateSupportsSoloAndForceReadFromPrefs:](self, "updateSupportsSoloAndForceReadFromPrefs:", 1);
  result = -[APAdvertiserBTLEManager update](self, "update");
  v8 = result;
  if (result)
  {
    APSLogErrorAt();
    return v8;
  }
  return result;
}

- (int)updateSupportsSoloAndForceReadFromPrefs:(BOOL)a3
{
  int result;
  _BOOL4 v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  result = 0;
  if (!self->_p2pSoloQueried || a3)
  {
    v6 = APSSettingsGetInt64() != 0;
    if (self->_p2pSolo == v6)
    {
      result = 0;
    }
    else
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 40
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        v7 = "yes";
        if (v6)
          v8 = "no";
        else
          v8 = "yes";
        if (!v6)
          v7 = "no";
        v9 = v8;
        v10 = v7;
        LogPrintF();
      }
      self->_p2pSolo = v6;
      -[APAdvertiserBTLEManager update](self, "update", v9, v10);
      result = 0;
    }
    self->_p2pSoloQueried = 1;
  }
  return result;
}

- (int)supportsSolo:(BOOL *)a3
{
  int result;
  BOOL p2pSolo;

  if (self->_p2pSoloQueried)
  {
    result = 0;
    p2pSolo = self->_p2pSolo;
  }
  else
  {
    p2pSolo = 0;
    result = -72310;
  }
  *a3 = p2pSolo;
  return result;
}

- (BOOL)shouldScanForSourceWithScreenOff
{
  int v2;

  v2 = IsAppleInternalBuild();
  if (v2)
  {
    if (APSSettingsGetIntWithDefault())
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (int64_t)btleManagerState
{
  int64_t result;

  if (-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"))
  {
    result = -[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser");
    if (!result)
      return result;
    return objc_msgSend((id)result, "bluetoothState");
  }
  result = -[APAdvertiserBTLEManager btleDiscoverer](self, "btleDiscoverer");
  if (result)
    return objc_msgSend((id)result, "bluetoothState");
  return result;
}

- (int)setBTLEMode:(unsigned __int16)a3
{
  uint64_t v3;
  int v5;

  v3 = a3;
  if (self->_btleMode == a3)
    return 0;
  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    +[APAdvertiserBTLEManager stringForBTLEMode:](APAdvertiserBTLEManager, "stringForBTLEMode:");
    +[APAdvertiserBTLEManager stringForBTLEMode:](APAdvertiserBTLEManager, "stringForBTLEMode:", v3);
    LogPrintF();
  }
  if ((_DWORD)v3 == 1)
  {
    v5 = -[APAdvertiserBTLEManager start](self, "start");
    if (v5)
LABEL_11:
      APSLogErrorAt();
  }
  else if ((_DWORD)v3)
  {
    v5 = -72313;
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v5 = -[APAdvertiserBTLEManager stop](self, "stop");
    if (v5)
      goto LABEL_11;
  }
  return v5;
}

- (int)getBTLEMode:(unsigned __int16 *)a3
{
  *a3 = self->_btleMode;
  return 0;
}

- (int)setIsP2PAllowed:(BOOL)a3
{
  _BOOL4 isP2PAllowed;
  _BOOL4 v4;
  const char *v6;
  const char *v7;
  int v8;
  const char *v10;
  const char *v11;

  isP2PAllowed = self->_isP2PAllowed;
  if (isP2PAllowed == a3)
    return 0;
  v4 = a3;
  if (gLogCategory_APAdvertiserBTLEManager <= 50)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1)
    {
LABEL_4:
      v6 = "YES";
      if (isP2PAllowed)
        v7 = "YES";
      else
        v7 = "NO";
      if (!v4)
        v6 = "NO";
      v10 = v7;
      v11 = v6;
      LogPrintF();
      goto LABEL_11;
    }
    if (_LogCategory_Initialize())
    {
      isP2PAllowed = self->_isP2PAllowed;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->_isP2PAllowed = v4;
  v8 = -[APAdvertiserBTLEManager update](self, "update", v10, v11);
  if (v8)
    APSLogErrorAt();
  return v8;
}

- (int)setRequireAltBrowser:(BOOL)a3
{
  int v3;
  int requireAltBrowser;
  const char *v6;
  const char *v7;
  const char *v9;
  const char *v10;

  v3 = a3;
  if (!-[APAdvertiserBTLEManager isAdvertising](self, "isAdvertising"))
  {
    requireAltBrowser = self->_requireAltBrowser;
    if (requireAltBrowser == v3)
      return 0;
    if (gLogCategory_APAdvertiserBTLEManager <= 40)
    {
      if (gLogCategory_APAdvertiserBTLEManager != -1)
      {
LABEL_5:
        v6 = "YES";
        if (requireAltBrowser)
          v7 = "YES";
        else
          v7 = "NO";
        if (!v3)
          v6 = "NO";
        v9 = v7;
        v10 = v6;
        LogPrintF();
        goto LABEL_12;
      }
      if (_LogCategory_Initialize())
      {
        requireAltBrowser = self->_requireAltBrowser;
        goto LABEL_5;
      }
    }
LABEL_12:
    self->_requireAltBrowser = v3;
    -[APAdvertiserBTLEManager update](self, "update", v9, v10);
    return 0;
  }
  APSLogErrorAt();
  return -72314;
}

- (int)setReceiverPort:(unsigned __int16)a3
{
  unsigned int receiverPort;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  receiverPort = self->_receiverPort;
  if (receiverPort != a3)
  {
    v4 = a3;
    if (gLogCategory_APAdvertiserBTLEManager <= 50)
    {
      if (gLogCategory_APAdvertiserBTLEManager == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_6;
        receiverPort = self->_receiverPort;
      }
      v7 = receiverPort;
      v8 = v4;
      LogPrintF();
    }
LABEL_6:
    self->_receiverPort = v4;
    -[APAdvertiserBTLEManager restartAdvertisingIfNecessary](self, "restartAdvertisingIfNecessary", v7, v8);
  }
  return 0;
}

- (int)setAccessControlType:(unsigned int)a3
{
  uint64_t accessControlType;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;

  accessControlType = self->_accessControlType;
  if ((_DWORD)accessControlType != a3)
  {
    v4 = *(_QWORD *)&a3;
    if (gLogCategory_APAdvertiserBTLEManager <= 50)
    {
      if (gLogCategory_APAdvertiserBTLEManager == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_6;
        accessControlType = self->_accessControlType;
      }
      v7 = accessControlType;
      v8 = v4;
      LogPrintF();
    }
LABEL_6:
    self->_accessControlType = v4;
    -[APAdvertiserBTLEManager stopScanning](self, "stopScanning", v7, v8);
    -[APAdvertiserBTLEManager update](self, "update");
  }
  return 0;
}

- (int)setProperty:(id)a3 withValue:(id)a4
{
  int v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("isP2PAllowed")))
  {
    v7 = -[APAdvertiserBTLEManager setIsP2PAllowed:](self, "setIsP2PAllowed:", objc_msgSend(a4, "BOOLValueSafe"));
    if (v7)
LABEL_12:
      APSLogErrorAt();
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("requireAltBrowser")))
  {
    v7 = -[APAdvertiserBTLEManager setRequireAltBrowser:](self, "setRequireAltBrowser:", objc_msgSend(a4, "BOOLValueSafe"));
    if (v7)
      goto LABEL_12;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("receiverPort")))
  {
    v7 = -[APAdvertiserBTLEManager setReceiverPort:](self, "setReceiverPort:", (unsigned __int16)objc_msgSend(a4, "int64ValueSafe"));
    if (v7)
      goto LABEL_12;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("accessControlType")))
      return -72311;
    v7 = -[APAdvertiserBTLEManager setAccessControlType:](self, "setAccessControlType:", objc_msgSend(a4, "int64ValueSafe"));
    if (v7)
      goto LABEL_12;
  }
  return v7;
}

- (int)setupEventHandlerState
{
  OpaqueFigSimpleMutex *v3;

  v3 = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  self->_eventHandlerState.mutex = v3;
  if (v3)
    return 0;
  APSLogErrorAt();
  return -72312;
}

- (int)setEventHandler:(void *)a3 withContext:(void *)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  ++self->_eventHandlerState.seed;
  self->_eventHandlerState.func = a3;
  self->_eventHandlerState.context = a4;
  pthread_mutex_unlock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  return 0;
}

- (void)cleanupEventHandlerState
{
  -[APAdvertiserBTLEManager setEventHandler:withContext:](self, "setEventHandler:withContext:", 0, 0);
  if (self->_eventHandlerState.mutex)
  {
    FigSimpleMutexDestroy();
    self->_eventHandlerState.mutex = 0;
  }
}

- (int)startMonitoringForNetworkChanges
{
  id v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[6];

  if (-[APAdvertiserBTLEManager netInterfaceMonitor](self, "netInterfaceMonitor"))
  {
    APSLogErrorAt();
    return -6709;
  }
  else
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init(MEMORY[0x24BE297F8]);
    objc_msgSend(v3, "setDispatchQueue:", -[APAdvertiserBTLEManager internalQueue](self, "internalQueue"));
    objc_msgSend(v3, "setControlFlags:", 12);
    v4 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke;
    v8[3] = &unk_24E21FD40;
    v8[4] = self;
    v8[5] = v3;
    objc_msgSend(v3, "setPrimaryIPChangedHandler:", v8);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_2;
    v7[3] = &unk_24E21FC00;
    v7[4] = self;
    objc_msgSend(v3, "setInvalidationHandler:", v7);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_3;
    v6[3] = &unk_24E21FD40;
    v6[4] = self;
    v6[5] = v3;
    objc_msgSend(v3, "activateWithCompletion:", v6);
    -[APAdvertiserBTLEManager setNetInterfaceMonitor:](self, "setNetInterfaceMonitor:", v3);
    return 0;
  }
}

- (int)stopMonitoringForNetworkChanges
{
  -[CUNetInterfaceMonitor invalidate](-[APAdvertiserBTLEManager netInterfaceMonitor](self, "netInterfaceMonitor"), "invalidate");

  self->_netInterfaceMonitor = 0;
  return 0;
}

- (void)startAdvertising
{
  APAdvertiserBTLEManager *v3;
  CBAdvertiser *v4;
  uint64_t v5;
  CBAdvertiser *v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];
  int v10;

  if (!-[APAdvertiserBTLEManager isAdvertising](self, "isAdvertising")
    && -[APAdvertiserBTLEManager canAdvertise](self, "canAdvertise"))
  {
    -[APAdvertiserBTLEManager setBtleAdvertiser:](self, "setBtleAdvertiser:", -[APAdvertiserBTLEManager createBTLEAdvertiser](self, "createBTLEAdvertiser"));
    if (-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"))
    {
      -[APAdvertiserBTLEManager setIsAdvertising:](self, "setIsAdvertising:", 1);
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        -[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser");
        LogPrintF();
      }
      v3 = self;
      v4 = -[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser");
      v5 = -[APAdvertiserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed") + 1;
      -[APAdvertiserBTLEManager setBtleAdvertiserSeed:](self, "setBtleAdvertiserSeed:", v5);
      v6 = -[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser");
      v7 = MEMORY[0x24BDAC760];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __43__APAdvertiserBTLEManager_startAdvertising__block_invoke;
      v9[3] = &unk_24E21FD68;
      v9[4] = v3;
      v9[5] = v4;
      v10 = v5;
      -[CBAdvertiser activateWithCompletion:](v6, "activateWithCompletion:", v9);
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __43__APAdvertiserBTLEManager_startAdvertising__block_invoke_2;
      v8[3] = &unk_24E21FD90;
      v8[4] = v3;
      v8[5] = v4;
      -[CBAdvertiser setInvalidationHandler:](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "setInvalidationHandler:", v8);
    }
    else
    {
      APSLogErrorAt();
      -[APAdvertiserBTLEManager stopAdvertising](self, "stopAdvertising");
    }
  }
}

- (void)stopAdvertising
{
  -[APAdvertiserBTLEManager stopAdvertisingWithSeed:](self, "stopAdvertisingWithSeed:", -[APAdvertiserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed"));
}

- (void)stopAdvertisingWithSeed:(int)a3
{
  APAdvertiserBTLEManager *v4;
  CBAdvertiser *v5;

  if (-[APAdvertiserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed") == a3)
  {
    if (-[APAdvertiserBTLEManager isAdvertising](self, "isAdvertising")
      && gLogCategory_APAdvertiserBTLEManager <= 50
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      v4 = self;
      v5 = -[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser");
      LogPrintF();
    }
    -[CBAdvertiser invalidate](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser", v4, v5), "invalidate");

    -[APAdvertiserBTLEManager setBtleAdvertiser:](self, "setBtleAdvertiser:", 0);
    -[APAdvertiserBTLEManager setIsAdvertising:](self, "setIsAdvertising:", 0);
  }
}

- (void)restartAdvertisingIfNecessary
{
  -[APAdvertiserBTLEManager stopAdvertising](self, "stopAdvertising");
  -[APAdvertiserBTLEManager update](self, "update");
}

- (void)startScanning
{
  APAdvertiserBTLEManager *v3;
  uint64_t v4;
  CBDiscovery *v5;
  _QWORD v6[5];
  int v7;

  if (!-[APAdvertiserBTLEManager isScanning](self, "isScanning"))
  {
    -[APAdvertiserBTLEManager setBtleDiscoverer:](self, "setBtleDiscoverer:", -[APAdvertiserBTLEManager createBTLEDiscoverer](self, "createBTLEDiscoverer"));
    if (-[APAdvertiserBTLEManager btleDiscoverer](self, "btleDiscoverer"))
    {
      -[APAdvertiserBTLEManager setIsScanning:](self, "setIsScanning:", 1);
      if (gLogCategory_APAdvertiserBTLEManager <= 50
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v3 = self;
      v4 = -[APAdvertiserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed") + 1;
      -[APAdvertiserBTLEManager setBtleDiscovererSeed:](self, "setBtleDiscovererSeed:", v4);
      v5 = -[APAdvertiserBTLEManager btleDiscoverer](self, "btleDiscoverer");
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __40__APAdvertiserBTLEManager_startScanning__block_invoke;
      v6[3] = &unk_24E21FDB8;
      v6[4] = v3;
      v7 = v4;
      -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
    }
    else
    {
      APSLogErrorAt();
      -[APAdvertiserBTLEManager stopScanning](self, "stopScanning");
    }
  }
}

- (void)stopScanning
{
  -[APAdvertiserBTLEManager stopScanningWithSeed:](self, "stopScanningWithSeed:", -[APAdvertiserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed"));
}

- (void)stopScanningWithSeed:(int)a3
{
  if (-[APAdvertiserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed") == a3)
  {
    if (-[APAdvertiserBTLEManager isScanning](self, "isScanning")
      && gLogCategory_APAdvertiserBTLEManager <= 50
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CBDiscovery invalidate](-[APAdvertiserBTLEManager btleDiscoverer](self, "btleDiscoverer"), "invalidate");

    -[APAdvertiserBTLEManager setBtleDiscoverer:](self, "setBtleDiscoverer:", 0);
    -[APAdvertiserBTLEManager setIsScanning:](self, "setIsScanning:", 0);
    -[NSMutableDictionary removeAllObjects](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "removeAllObjects");
    -[APAdvertiserBTLEManager updateLostLegacyDeviceTimer](self, "updateLostLegacyDeviceTimer");
    -[NSMutableDictionary removeAllObjects](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "removeAllObjects");
    -[APAdvertiserBTLEManager computeNearbyDeviceTypesAndDispatchEventIfNecessary](self, "computeNearbyDeviceTypesAndDispatchEventIfNecessary");
  }
}

- (void)dispatchEvent:(unsigned int)a3
{
  OpaqueFigCFWeakReferenceHolder *weakSelf;
  unsigned int seed;
  OS_dispatch_queue *v7;
  __int128 v8;
  __int128 v9;
  _QWORD block[5];
  __int128 v11;
  unsigned int v12;
  unsigned int v13;

  weakSelf = self->_weakSelf;
  pthread_mutex_lock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  seed = self->_eventHandlerState.seed;
  v8 = *(_OWORD *)&self->_eventHandlerState.func;
  pthread_mutex_unlock((pthread_mutex_t *)self->_eventHandlerState.mutex);
  if ((_QWORD)v8)
  {
    if (weakSelf)
      CFRetain(weakSelf);
    v7 = -[APAdvertiserBTLEManager eventQueue](self, "eventQueue", v8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__APAdvertiserBTLEManager_dispatchEvent___block_invoke;
    block[3] = &__block_descriptor_64_e5_v8__0l;
    block[4] = weakSelf;
    v12 = seed;
    v13 = a3;
    v11 = v9;
    dispatch_async((dispatch_queue_t)v7, block);
  }
}

- (void)updateLostLegacyDeviceTimer
{
  NSMutableDictionary *v3;
  uint64_t v4;
  APAdvertiserBTLEManager *v5;
  OS_dispatch_source *v6;
  NSObject *lostLegacyDeviceTimer;
  _QWORD v8[5];
  _QWORD handler[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (-[NSMutableDictionary count](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "count"))
  {
    v3 = -[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices");
    v4 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke;
    v10[3] = &unk_24E21FE00;
    v10[4] = &v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v10);
    if (!-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"))
    {
      -[APAdvertiserBTLEManager setLostLegacyDeviceTimer:](self, "setLostLegacyDeviceTimer:", dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_internalQueue));
      if (!-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"))
      {
        APSLogErrorAt();
        goto LABEL_8;
      }
      v5 = self;
      handler[0] = v4;
      handler[1] = 3221225472;
      handler[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_2;
      handler[3] = &unk_24E21FC00;
      handler[4] = v5;
      dispatch_source_set_event_handler((dispatch_source_t)-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"), handler);
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_3;
      v8[3] = &unk_24E21FC00;
      v8[4] = v5;
      dispatch_source_set_cancel_handler((dispatch_source_t)-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"), v8);
      dispatch_source_set_timer((dispatch_source_t)-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_resume((dispatch_object_t)-[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer"));
    }
    v6 = -[APAdvertiserBTLEManager lostLegacyDeviceTimer](self, "lostLegacyDeviceTimer");
    dispatch_source_set_timer((dispatch_source_t)v6, v12[3], 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    lostLegacyDeviceTimer = self->_lostLegacyDeviceTimer;
    if (lostLegacyDeviceTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_lostLegacyDeviceTimer);
      dispatch_release(lostLegacyDeviceTimer);
      self->_lostLegacyDeviceTimer = 0;
    }
  }
LABEL_8:
  _Block_object_dispose(&v11, 8);
}

- (void)removeExpiredDevices
{
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  _QWORD v7[7];

  v3 = dispatch_time(0, 0);
  v4 = objc_opt_new();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__APAdvertiserBTLEManager_removeExpiredDevices__block_invoke;
    v7[3] = &unk_24E21FE28;
    v7[5] = v5;
    v7[6] = v3;
    v7[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v7);
    -[NSMutableDictionary removeObjectsForKeys:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "removeObjectsForKeys:", v5);

    -[APAdvertiserBTLEManager updateLostLegacyDeviceTimer](self, "updateLostLegacyDeviceTimer");
  }
  else
  {
    APSLogErrorAt();
  }
}

- (void)computeNearbyDeviceTypesAndDispatchEventIfNecessary
{
  NSMutableDictionary *v3;
  int v4;
  unsigned int v5;
  int v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = -[APAdvertiserBTLEManager soloDevices](self, "soloDevices");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__APAdvertiserBTLEManager_computeNearbyDeviceTypesAndDispatchEventIfNecessary__block_invoke;
  v11[3] = &unk_24E21FE00;
  v11[4] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v11);
  v4 = *((_DWORD *)v13 + 6);
  if (v4 == -[APAdvertiserBTLEManager soloDeviceFlags](self, "soloDeviceFlags"))
    goto LABEL_16;
  v5 = -[APAdvertiserBTLEManager soloDeviceFlags](self, "soloDeviceFlags");
  v6 = *((_DWORD *)v13 + 6);
  v7 = -[APAdvertiserBTLEManager soloDeviceFlags](self, "soloDeviceFlags");
  v8 = *((_DWORD *)v13 + 6);
  -[APAdvertiserBTLEManager setSoloDeviceFlags:](self, "setSoloDeviceFlags:", v8);
  if ((v6 & 0x80000000) == 0 || (v5 & 0x80000000) != 0)
  {
    if (v6 < 0 || (v5 & 0x80000000) == 0)
      goto LABEL_9;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[APAdvertiserBTLEManager dispatchEvent:](self, "dispatchEvent:", v9);
LABEL_9:
  if ((v8 & 8) != 0 && (v7 & 8) == 0)
  {
    v10 = 2;
LABEL_15:
    -[APAdvertiserBTLEManager dispatchEvent:](self, "dispatchEvent:", v10);
    goto LABEL_16;
  }
  if ((v8 & 8) == 0 && (v7 & 8) != 0)
  {
    v10 = 3;
    goto LABEL_15;
  }
LABEL_16:
  _Block_object_dispose(&v12, 8);
}

- (void)handleFoundDevice:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (gLogCategory_APAdvertiserBTLEManager <= 40)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize())
    {
      v5 = objc_msgSend(a3, "identifier");
      v6 = objc_msgSend(a3, "airplaySourceFlags");
      v10 = objc_msgSend(a3, "deviceFlags");
      v11 = &unk_21E1B1A81;
      v8 = v6;
      v9 = &unk_21E1B1A25;
      v7 = v5;
      LogPrintF();
    }
    if (gLogCategory_APAdvertiserBTLEManager <= 40
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(a3, "identifier", v7, v8, v9, v10, v11);
      LogPrintF();
    }
  }
  if (APSShouldStartAdvertistingForAirPlaySourceBeacon())
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(a3, "airplaySourceFlags")), objc_msgSend(a3, "identifier"));
    -[NSMutableDictionary removeObjectForKey:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "removeObjectForKey:", objc_msgSend(a3, "identifier"));
  }
  else
  {
    -[APAdvertiserBTLEManager handleLostDevice:withGoodbye:](self, "handleLostDevice:withGoodbye:", a3, 1);
  }
  -[APAdvertiserBTLEManager computeNearbyDeviceTypesAndDispatchEventIfNecessary](self, "computeNearbyDeviceTypesAndDispatchEventIfNecessary");
}

- (void)handleLostDevice:(id)a3 withGoodbye:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "objectForKeyedSubscript:", objc_msgSend(a3, "identifier")))
  {
    if (v4)
    {
      -[APAdvertiserBTLEManager removeLostDeviceWithIdentifier:](self, "removeLostDeviceWithIdentifier:", objc_msgSend(a3, "identifier"));
    }
    else if (!-[NSMutableDictionary objectForKeyedSubscript:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "objectForKeyedSubscript:", objc_msgSend(a3, "identifier")))
    {
      if (gLogCategory_APAdvertiserBTLEManager <= 40
        && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(a3, "identifier");
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](-[APAdvertiserBTLEManager pendingLostLegacyDevices](self, "pendingLostLegacyDevices"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", dispatch_time(0, 15000000000)), objc_msgSend(a3, "identifier"));
      -[APAdvertiserBTLEManager updateLostLegacyDeviceTimer](self, "updateLostLegacyDeviceTimer");
    }
  }
}

- (void)removeLostDeviceWithIdentifier:(id)a3
{
  id v5;

  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v5 = a3;
    LogPrintF();
  }
  -[NSMutableDictionary removeObjectForKey:](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices", v5), "removeObjectForKey:", a3);
  -[APAdvertiserBTLEManager computeNearbyDeviceTypesAndDispatchEventIfNecessary](self, "computeNearbyDeviceTypesAndDispatchEventIfNecessary");
}

- (int)showDebugWithDataBuffer:(id *)a3 verbose:(BOOL)a4
{
  const char *v6;
  int v7;
  const char *v8;
  const char *v9;
  const char *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  const char *v16;
  const char *v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  _QWORD v27[5];
  char v28;
  _OWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  memset(v29, 0, sizeof(v29));
  if (-[APAdvertiserBTLEManager isEnabled](self, "isEnabled", a3, a4))
    v6 = "yes";
  else
    v6 = "no";
  v16 = v6;
  DataBuffer_AppendF();
  v28 = 0;
  v7 = -[APAdvertiserBTLEManager supportsSolo:](self, "supportsSolo:", &v28, v16);
  DataBuffer_AppendF();
  if (self->_btleMode)
    v8 = "presence";
  else
    v8 = "none";
  v17 = v8;
  DataBuffer_AppendF();
  v18 = +[APAdvertiserBTLEManager stringForBTLEState:](APAdvertiserBTLEManager, "stringForBTLEState:", -[APAdvertiserBTLEManager btleManagerState](self, "btleManagerState", v17));
  DataBuffer_AppendF();
  if (-[APAdvertiserBTLEManager isAdvertising](self, "isAdvertising", v18))
    v9 = "yes";
  else
    v9 = "no";
  v19 = v9;
  DataBuffer_AppendF();
  if (-[APAdvertiserBTLEManager isScanning](self, "isScanning", v19))
    v10 = "yes";
  else
    v10 = "no";
  v20 = v10;
  DataBuffer_AppendF();
  if (-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser", v20))
  {
    -[CBAdvertiser airplayTargetIPv4](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "airplayTargetIPv4");
    IPv4AddressToCString();
    v11 = -[CBAdvertiser airplayTargetFlags](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "airplayTargetFlags");
    v12 = -[CBAdvertiser airplayTargetConfigSeed](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "airplayTargetConfigSeed");
    v25 = v29;
    v26 = -[CBAdvertiser airplayTargetPort](-[APAdvertiserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "airplayTargetPort");
    v22 = &unk_21E1B19A4;
    v24 = v12;
    v21 = v11;
    DataBuffer_AppendF();
  }
  if (-[APAdvertiserBTLEManager soloDevices](self, "soloDevices", v21, v22, v24, v25, v26))
    v13 = -[NSMutableDictionary count](-[APAdvertiserBTLEManager soloDevices](self, "soloDevices"), "count");
  else
    v13 = 0;
  v23 = -[APAdvertiserBTLEManager soloDeviceFlags](self, "soloDeviceFlags");
  DataBuffer_AppendF();
  if (v13)
  {
    DataBuffer_AppendF();
    v14 = -[APAdvertiserBTLEManager soloDevices](self, "soloDevices", v13, v23, &unk_21E1B1A25);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __59__APAdvertiserBTLEManager_showDebugWithDataBuffer_verbose___block_invoke;
    v27[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSNumber_16_B24l;
    v27[4] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v27);
  }
  return v7;
}

- (CBAdvertiser)btleAdvertiser
{
  return self->_btleAdvertiser;
}

- (void)setBtleAdvertiser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CBDiscovery)btleDiscoverer
{
  return self->_btleDiscoverer;
}

- (void)setBtleDiscoverer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (int)btleAdvertiserSeed
{
  return self->_btleAdvertiserSeed;
}

- (void)setBtleAdvertiserSeed:(int)a3
{
  self->_btleAdvertiserSeed = a3;
}

- (int)btleDiscovererSeed
{
  return self->_btleDiscovererSeed;
}

- (void)setBtleDiscovererSeed:(int)a3
{
  self->_btleDiscovererSeed = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setSeed:(unsigned __int8)a3
{
  self->_seed = a3;
}

- (unsigned)soloDeviceFlags
{
  return self->_soloDeviceFlags;
}

- (void)setSoloDeviceFlags:(unsigned int)a3
{
  self->_soloDeviceFlags = a3;
}

- (NSMutableDictionary)soloDevices
{
  return self->_soloDevices;
}

- (void)setSoloDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSMutableDictionary)pendingLostLegacyDevices
{
  return self->_pendingLostLegacyDevices;
}

- (void)setPendingLostLegacyDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (int)touchSetupActiveNotifyToken
{
  return self->_touchSetupActiveNotifyToken;
}

- (void)setTouchSetupActiveNotifyToken:(int)a3
{
  self->_touchSetupActiveNotifyToken = a3;
}

- (OS_dispatch_source)lostLegacyDeviceTimer
{
  return self->_lostLegacyDeviceTimer;
}

- (void)setLostLegacyDeviceTimer:(id)a3
{
  self->_lostLegacyDeviceTimer = (OS_dispatch_source *)a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (CUNetInterfaceMonitor)netInterfaceMonitor
{
  return self->_netInterfaceMonitor;
}

- (void)setNetInterfaceMonitor:(id)a3
{
  self->_netInterfaceMonitor = (CUNetInterfaceMonitor *)a3;
}

uint64_t __59__APAdvertiserBTLEManager_showDebugWithDataBuffer_verbose___block_invoke()
{
  CFGetInt64Ranged();
  return DataBuffer_AppendF();
}

uint64_t __78__APAdvertiserBTLEManager_computeNearbyDeviceTypesAndDispatchEventIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFGetInt64Ranged();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 0x80000000;
  return result;
}

unint64_t __47__APAdvertiserBTLEManager_removeExpiredDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result;

  result = objc_msgSend(a3, "unsignedLongLongValue");
  if (result <= *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeLostDeviceWithIdentifier:", a2);
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
  return result;
}

unint64_t __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result;
  uint64_t v5;

  result = objc_msgSend(a3, "unsignedLongLongValue");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result < *(_QWORD *)(v5 + 24))
    *(_QWORD *)(v5 + 24) = result;
  return result;
}

uint64_t __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeExpiredDevices");
}

void __54__APAdvertiserBTLEManager_updateLostLegacyDeviceTimer__block_invoke_3(uint64_t a1)
{

}

void __41__APAdvertiserBTLEManager_dispatchEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  const void *v6;

  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = v2;
    pthread_mutex_lock(*(pthread_mutex_t **)(v2 + 40));
    v4 = *(_DWORD *)(a1 + 56);
    v5 = *(_DWORD *)(v3 + 48);
    pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 40));
    if (v4 == v5)
      (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(v3 + 72), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 48));
    CFRelease((CFTypeRef)v3);
  }
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

void __40__APAdvertiserBTLEManager_startScanning__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a2)
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "stopScanningWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stopScanningWithSeed:", *(unsigned int *)(a1 + 40), v4);
    }
  }
  else if (gLogCategory_APAdvertiserBTLEManager <= 50
         && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __43__APAdvertiserBTLEManager_startAdvertising__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    if (gLogCategory_APAdvertiserBTLEManager <= 90
      && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "stopAdvertisingWithSeed:", *(unsigned int *)(a1 + 48), v5, v7, a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stopAdvertisingWithSeed:", *(unsigned int *)(a1 + 48), v4, v6, v8);
    }
  }
  else if (gLogCategory_APAdvertiserBTLEManager <= 50
         && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __43__APAdvertiserBTLEManager_startAdvertising__block_invoke_2()
{
  uint64_t result;

  if (gLogCategory_APAdvertiserBTLEManager <= 50)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  _BOOL8 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (gLogCategory_APAdvertiserBTLEManager <= 40
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      objc_msgSend(v2, "primaryIPv4Addr");
    }
    else
    {
      v15 = 0;
      v16 = 0;
      LODWORD(v18) = 0;
      v17 = 0;
    }
    if (gLogCategory_APAdvertiserBTLEManager > 30)
      v4 = 1;
    else
      v4 = gLogCategory_APAdvertiserBTLEManager == -1 && _LogCategory_Initialize() == 0;
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "primaryIPv6Addr");
    }
    else
    {
      v11 = 0;
      v12 = 0;
      LODWORD(v14) = 0;
      v13 = 0;
    }
    v9 = v4;
    v10 = &v11;
    v7 = v3;
    v8 = &v15;
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "handlePrimaryIPChanged", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_2()
{
  uint64_t result;

  if (gLogCategory_APAdvertiserBTLEManager <= 40)
  {
    if (gLogCategory_APAdvertiserBTLEManager != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __59__APAdvertiserBTLEManager_startMonitoringForNetworkChanges__block_invoke_3(uint64_t a1)
{
  if (gLogCategory_APAdvertiserBTLEManager <= 50
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    IsAppleInternalBuild();
    objc_msgSend(*(id *)(a1 + 40), "controlFlags");
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "handlePrimaryIPChanged");
}

uint64_t __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleP2PSoloQueryTimerFired");
}

uint64_t __49__APAdvertiserBTLEManager_startP2PSoloQueryTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleP2PSoloQueryTimerCancelled");
}

uint64_t __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke(uint64_t a1, void *a2)
{
  char v4;
  void *v5;

  v4 = objc_msgSend(a2, "airplaySourceFlags");
  v5 = *(void **)(a1 + 32);
  if (v4 < 0)
    return objc_msgSend(v5, "handleLostDevice:withGoodbye:", a2, 1);
  else
    return objc_msgSend(v5, "handleFoundDevice:", a2);
}

uint64_t __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLostDevice:withGoodbye:", a2, 0);
}

void __47__APAdvertiserBTLEManager_createBTLEDiscoverer__block_invoke_3(uint64_t a1)
{

}

uint64_t __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferences");
}

uint64_t __48__APAdvertiserBTLEManager_initWithEventContext___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "startP2PSoloQueryTimer");
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return APSLogErrorAt();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "updatePreferences");
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

+ (id)stringForBTLEMode:(unsigned __int16)a3
{
  if (!a3)
    return CFSTR("None");
  if (a3 == 1)
    return CFSTR("Discoverable");
  if (gLogCategory_APAdvertiserBTLEManager <= 60
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSTR("Unknown ");
}

+ (id)stringForBTLEState:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return off_24E21FE68[a3];
  if (gLogCategory_APAdvertiserBTLEManager <= 60
    && (gLogCategory_APAdvertiserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSTR("unknown");
}

@end
