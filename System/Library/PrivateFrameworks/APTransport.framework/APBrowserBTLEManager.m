@implementation APBrowserBTLEManager

- (int)ensurePreferencesUpdatedWithShouldForce:(BOOL)a3
{
  int BooleanIfPresent;
  int v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v11;
  const char *v12;
  BOOL v13;

  if (-[APBrowserBTLEManager isInvalidated](self, "isInvalidated"))
    return -72224;
  if (!a3 && -[APBrowserBTLEManager preferencesUpdated](self, "preferencesUpdated"))
    return 0;
  v13 = APSIsDemoModeEnabled() == 0;
  BooleanIfPresent = APSSettingsGetBooleanIfPresent();
  if (gLogCategory_APBrowserBTLEManager <= 50)
  {
    v6 = BooleanIfPresent;
    if (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize())
    {
      v7 = "yes";
      if (v13)
        v8 = "yes";
      else
        v8 = "no";
      if (!v6)
        v7 = "no";
      v11 = v8;
      v12 = v7;
      LogPrintF();
    }
  }
  -[APBrowserBTLEManager setIsEnabled:](self, "setIsEnabled:", v13, v11, v12);
  -[APBrowserBTLEManager setIsSoloBeaconDisabled:](self, "setIsSoloBeaconDisabled:", 0);
  v9 = -[APBrowserBTLEManager update](self, "update");
  if (v9)
    APSLogErrorAt();
  else
    -[APBrowserBTLEManager setPreferencesUpdated:](self, "setPreferencesUpdated:", 1);
  return v9;
}

- (int)setBTLEMode:(unsigned __int16)a3
{
  uint64_t v3;
  int v5;

  v3 = a3;
  if (-[APBrowserBTLEManager isInvalidated](self, "isInvalidated"))
    return -72224;
  if (self->_btleMode == (_DWORD)v3)
    return 0;
  if ((v3 - 1) >= 2)
  {
    if ((_DWORD)v3)
    {
      if (gLogCategory_APBrowserBTLEManager <= 90
        && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return -6705;
    }
    else
    {
      v5 = -[APBrowserBTLEManager stop](self, "stop");
      if (v5)
LABEL_8:
        APSLogErrorAt();
    }
  }
  else
  {
    v5 = -[APBrowserBTLEManager startMode:](self, "startMode:", v3);
    if (v5)
      goto LABEL_8;
  }
  return v5;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (int)startMode:(unsigned __int16)a3
{
  uint64_t v3;
  int v5;
  int v6;
  id v8;

  if (!a3)
  {
    APSLogErrorAt();
    return -72221;
  }
  v3 = a3;
  if (self->_btleMode == a3)
    return 0;
  v5 = -[APBrowserBTLEManager ensurePreferencesUpdatedWithShouldForce:](self, "ensurePreferencesUpdatedWithShouldForce:", 0);
  if (v5)
  {
    v6 = v5;
LABEL_13:
    APSLogErrorAt();
    return v6;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v8 = +[APBrowserBTLEManager stringForBTLEMode:](APBrowserBTLEManager, "stringForBTLEMode:", v3);
    LogPrintF();
  }
  self->_btleMode = v3;
  v6 = -[APBrowserBTLEManager update](self, "update", v8);
  if (v6)
    goto LABEL_13;
  return v6;
}

+ (id)stringForBTLEMode:(unsigned __int16)a3
{
  if (a3 < 3u)
    return off_1E8254EF8[(__int16)a3];
  if (gLogCategory_APBrowserBTLEManager <= 60
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSTR("Unknown");
}

- (int)update
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v9;

  if (-[APBrowserBTLEManager isEnabled](self, "isEnabled") && self->_btleMode)
  {
    if (-[APBrowserBTLEManager isEnabled](self, "isEnabled") && self->_btleMode)
    {
      v3 = -[APBrowserBTLEManager ensureScanningStarted](self, "ensureScanningStarted");
      if (v3)
      {
        v5 = v3;
        goto LABEL_25;
      }
      if (!APSIsAPMSpeaker())
      {
        if (self->_btleMode == 2
          && self->_p2pSoloSupported
          && !-[APBrowserBTLEManager isSoloBeaconDisabled](self, "isSoloBeaconDisabled")
          && -[APBrowserBTLEManager shouldAdvertiseSourcePresence](self, "shouldAdvertiseSourcePresence"))
        {
          v4 = -[APBrowserBTLEManager ensureAdvertisingStarted](self, "ensureAdvertisingStarted");
          if (v4)
          {
            v5 = v4;
LABEL_25:
            APSLogErrorAt();
            return v5;
          }
        }
        else
        {
          v9 = -[APBrowserBTLEManager ensureAdvertisingStopped](self, "ensureAdvertisingStopped");
          if (v9)
          {
            v5 = v9;
            goto LABEL_25;
          }
        }
      }
    }
  }
  else
  {
    v6 = -[APBrowserBTLEManager ensureAdvertisingStopped](self, "ensureAdvertisingStopped");
    if (v6)
    {
      v5 = v6;
      goto LABEL_25;
    }
    v7 = -[APBrowserBTLEManager ensureScanningStopped](self, "ensureScanningStopped");
    if (v7)
    {
      v5 = v7;
      goto LABEL_25;
    }
  }
  if (gLogCategory_APBrowserBTLEManager <= 10
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    -[APBrowserBTLEManager isSoloBeaconDisabled](self, "isSoloBeaconDisabled");
    -[APBrowserBTLEManager nearbySoloDevicesCount](self, "nearbySoloDevicesCount");
    LogPrintF();
  }
  return 0;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)preferencesUpdated
{
  return self->_preferencesUpdated;
}

- (int)ensureAdvertisingStopped
{
  return -[APBrowserBTLEManager ensureAdvertisingStoppedWithSeed:](self, "ensureAdvertisingStoppedWithSeed:", -[APBrowserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed"));
}

- (int)ensureAdvertisingStoppedWithSeed:(int)a3
{
  if (-[APBrowserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed") == a3)
  {
    if (-[APBrowserBTLEManager isAdvertising](self, "isAdvertising")
      && gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CBAdvertiser invalidate](-[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "invalidate");

    -[APBrowserBTLEManager setBtleAdvertiser:](self, "setBtleAdvertiser:", 0);
    -[APBrowserBTLEManager setIsAdvertising:](self, "setIsAdvertising:", 0);
  }
  return 0;
}

- (CBAdvertiser)btleAdvertiser
{
  return self->_btleAdvertiser;
}

- (int)btleAdvertiserSeed
{
  return self->_btleAdvertiserSeed;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (void)setBtleAdvertiser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (int)ensureScanningStarted
{
  APBrowserBTLEManager *v3;
  uint64_t v4;
  CBDiscovery *v5;
  _QWORD v7[5];
  int v8;

  if (!-[APBrowserBTLEManager isScanning](self, "isScanning"))
  {
    -[APBrowserBTLEManager setBtleDiscoverer:](self, "setBtleDiscoverer:", -[APBrowserBTLEManager createBTLEDiscoverer](self, "createBTLEDiscoverer"));
    if (!-[APBrowserBTLEManager btleDiscoverer](self, "btleDiscoverer"))
    {
      APSLogErrorAt();
      -[APBrowserBTLEManager ensureScanningStopped](self, "ensureScanningStopped");
      return -72220;
    }
    -[APBrowserBTLEManager setIsScanning:](self, "setIsScanning:", 1);
    if (gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = self;
    v4 = -[APBrowserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed") + 1;
    -[APBrowserBTLEManager setBtleDiscovererSeed:](self, "setBtleDiscovererSeed:", v4);
    v5 = -[APBrowserBTLEManager btleDiscoverer](self, "btleDiscoverer");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__APBrowserBTLEManager_ensureScanningStarted__block_invoke;
    v7[3] = &unk_1E8254EB0;
    v7[4] = v3;
    v8 = v4;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v7);
  }
  return 0;
}

- (CBDiscovery)btleDiscoverer
{
  return self->_btleDiscoverer;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void)setBtleDiscovererSeed:(int)a3
{
  self->_btleDiscovererSeed = a3;
}

- (void)setBtleDiscoverer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (int)btleDiscovererSeed
{
  return self->_btleDiscovererSeed;
}

- (id)createBTLEDiscoverer
{
  id v3;
  APBrowserBTLEManager *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C97758]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APBrowserBTLEManager queue](self, "queue"));
    objc_msgSend(v3, "setDiscoveryFlags:", objc_msgSend(v3, "discoveryFlags") | 0x8000000000);
    v4 = self;
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke;
    v9[3] = &unk_1E8254E60;
    v9[4] = v4;
    objc_msgSend(v3, "setDeviceFoundHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_2;
    v8[3] = &unk_1E8254E60;
    v8[4] = v4;
    objc_msgSend(v3, "setDeviceLostHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_3;
    v7[3] = &unk_1E8254E38;
    v7[4] = v4;
    objc_msgSend(v3, "setInvalidationHandler:", v7);
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __45__APBrowserBTLEManager_ensureScanningStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a2)
  {
    if (gLogCategory_APBrowserBTLEManager <= 90
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "ensureScanningStoppedWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "ensureScanningStoppedWithSeed:", *(unsigned int *)(a1 + 40), v4);
    }
  }
  else if (gLogCategory_APBrowserBTLEManager <= 50
         && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (APBrowserBTLEManager)initWithEventContext:(void *)a3
{
  APBrowserBTLEManager *v3;
  APBrowserBTLEManager *v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  NSMutableDictionary *v8;
  objc_super v10;

  v3 = self;
  if (!a3)
    goto LABEL_7;
  v10.receiver = self;
  v10.super_class = (Class)APBrowserBTLEManager;
  v5 = -[APBrowserBTLEManager init](&v10, sel_init);
  v3 = v5;
  if (v5)
  {
    v5->_eventContext = a3;
    v6 = dispatch_queue_create("APBrowserBTLEManagerInternalQueue", 0);
    v3->_queue = (OS_dispatch_queue *)v6;
    if (!v6
      || (v7 = dispatch_queue_create("APBrowserBTLEManagerEventQueue", 0),
          (v3->_eventQueue = (OS_dispatch_queue *)v7) == 0)
      || (v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]), (v3->_btleDevices = v8) == 0))
    {
LABEL_7:
      APSLogErrorAt();
      if (gLogCategory_APBrowserBTLEManager <= 90
        && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *eventQueue;
  objc_super v5;

  self->_eventContext = 0;

  self->_btleAdvertiser = 0;
  self->_btleDiscoverer = 0;

  self->_btleDevices = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  eventQueue = self->_eventQueue;
  if (eventQueue)
  {
    dispatch_release(eventQueue);
    self->_eventQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APBrowserBTLEManager;
  -[APBrowserBTLEManager dealloc](&v5, sel_dealloc);
}

- (int)invalidate
{
  int v3;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  if (-[APBrowserBTLEManager isInvalidated](self, "isInvalidated"))
    return -72224;
  -[APBrowserBTLEManager setIsInvalidated:](self, "setIsInvalidated:", 1);
  -[APBrowserBTLEManager stop](self, "stop");
  v3 = -[APBrowserBTLEManager dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 4, 0);
  -[CBAdvertiser invalidate](-[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser"), "invalidate");
  -[CBDiscovery invalidate](-[APBrowserBTLEManager btleDiscoverer](self, "btleDiscoverer"), "invalidate");
  v4 = -[APBrowserBTLEManager eventQueue](self, "eventQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__APBrowserBTLEManager_invalidate__block_invoke;
  block[3] = &unk_1E8254E38;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v4, block);
  return v3;
}

uint64_t __34__APBrowserBTLEManager_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEventHandlerFunc:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setEventHandlerContext:", 0);
}

- (id)createBTLEAdvertiser
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C97720]);
  if (v3)
  {
    objc_msgSend(v3, "setDispatchQueue:", -[APBrowserBTLEManager queue](self, "queue"));
    objc_msgSend(v3, "setAirplaySourceFlags:", 18);
    if (APSSettingsGetInt64())
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 1);
    if (-[APBrowserBTLEManager browseForAltReceiver](self, "browseForAltReceiver"))
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 4);
    if (APSIsProximitySenderEnabled())
      objc_msgSend(v3, "setAirplaySourceFlags:", objc_msgSend(v3, "airplaySourceFlags") | 8);
    if (gLogCategory_APBrowserBTLEManager <= 40
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v3, "airplaySourceFlags");
      LogPrintF();
    }
  }
  else
  {
    APSLogErrorAt();
  }
  return v3;
}

uint64_t __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke(uint64_t a1, void *a2)
{
  char v4;
  void *v5;

  v4 = objc_msgSend(a2, "airplayTargetFlags");
  v5 = *(void **)(a1 + 32);
  if (v4 < 0)
    return objc_msgSend(v5, "handleLostDevice:", a2);
  else
    return objc_msgSend(v5, "handleFoundDevice:", a2);
}

uint64_t __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLostDevice:", a2);
}

void __44__APBrowserBTLEManager_createBTLEDiscoverer__block_invoke_3(uint64_t a1)
{

}

- (int)stop
{
  int v3;
  int v4;

  if (!self->_btleMode)
    return 0;
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_btleMode = 0;
  v3 = -[APBrowserBTLEManager update](self, "update");
  if (v3)
  {
    v4 = v3;
    goto LABEL_11;
  }
  v4 = -[APBrowserBTLEManager dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 3, 0);
  if (v4)
LABEL_11:
    APSLogErrorAt();
  return v4;
}

- (int)setEventHandler:(void *)a3 context:(void *)a4 managerRef:(OpaqueAPBrowserBTLEManager *)a5
{
  int v8;
  OS_dispatch_queue *v9;
  _QWORD block[7];

  v8 = -72224;
  if (!-[APBrowserBTLEManager isInvalidated](self, "isInvalidated", a3, a4, a5))
  {
    if (self->_btleMode)
    {
      APSLogErrorAt();
      return -72223;
    }
    else
    {
      v9 = -[APBrowserBTLEManager eventQueue](self, "eventQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__APBrowserBTLEManager_setEventHandler_context_managerRef___block_invoke;
      block[3] = &unk_1E8254E88;
      block[4] = self;
      block[5] = a3;
      block[6] = a4;
      dispatch_sync((dispatch_queue_t)v9, block);
      return 0;
    }
  }
  return v8;
}

uint64_t __59__APBrowserBTLEManager_setEventHandler_context_managerRef___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEventHandlerFunc:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEventHandlerContext:", *(_QWORD *)(a1 + 48));
}

- (unint64_t)nearbySoloDevicesCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](-[APBrowserBTLEManager btleDevices](self, "btleDevices", 0), "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "airplayTargetFlags") & 1;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)shouldAdvertiseSourcePresence
{
  if (!APSIsAPMSpeaker())
    return 1;
  APSCopyTightSyncInfo();
  return 0;
}

- (int)setSupportsSolo:(BOOL)a3
{
  int v3;
  int p2pSoloSupported;
  int v6;
  const char *v7;
  const char *v8;
  const char *v10;
  const char *v11;

  v3 = a3;
  if (-[APBrowserBTLEManager isInvalidated](self, "isInvalidated"))
    return -72224;
  self->_p2pSoloSupportedIsSet = 1;
  p2pSoloSupported = self->_p2pSoloSupported;
  if (p2pSoloSupported == v3)
    return 0;
  if (gLogCategory_APBrowserBTLEManager <= 40)
  {
    if (gLogCategory_APBrowserBTLEManager != -1)
    {
LABEL_6:
      v7 = "yes";
      if (p2pSoloSupported)
        v8 = "yes";
      else
        v8 = "no";
      if (!v3)
        v7 = "no";
      v10 = v8;
      v11 = v7;
      LogPrintF();
      goto LABEL_13;
    }
    if (_LogCategory_Initialize())
    {
      p2pSoloSupported = self->_p2pSoloSupported;
      goto LABEL_6;
    }
  }
LABEL_13:
  self->_p2pSoloSupported = v3;
  v6 = -[APBrowserBTLEManager update](self, "update", v10, v11);
  if (v6)
    APSLogErrorAt();
  return v6;
}

- (int)getBTLEMode:(unsigned __int16 *)a3
{
  int result;

  if (-[APBrowserBTLEManager isInvalidated](self, "isInvalidated"))
    return -72224;
  result = 0;
  *a3 = self->_btleMode;
  return result;
}

- (int)ensureAdvertisingStarted
{
  APBrowserBTLEManager *v3;
  uint64_t v4;
  CBAdvertiser *v5;
  _QWORD v7[5];
  int v8;

  if (!-[APBrowserBTLEManager isAdvertising](self, "isAdvertising"))
  {
    -[APBrowserBTLEManager setBtleAdvertiser:](self, "setBtleAdvertiser:", -[APBrowserBTLEManager createBTLEAdvertiser](self, "createBTLEAdvertiser"));
    if (!-[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser"))
    {
      APSLogErrorAt();
      -[APBrowserBTLEManager ensureAdvertisingStopped](self, "ensureAdvertisingStopped");
      return -72220;
    }
    -[APBrowserBTLEManager setIsAdvertising:](self, "setIsAdvertising:", 1);
    if (gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = self;
    v4 = -[APBrowserBTLEManager btleAdvertiserSeed](self, "btleAdvertiserSeed") + 1;
    -[APBrowserBTLEManager setBtleAdvertiserSeed:](self, "setBtleAdvertiserSeed:", v4);
    v5 = -[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__APBrowserBTLEManager_ensureAdvertisingStarted__block_invoke;
    v7[3] = &unk_1E8254EB0;
    v7[4] = v3;
    v8 = v4;
    -[CBAdvertiser activateWithCompletion:](v5, "activateWithCompletion:", v7);
  }
  return 0;
}

void __48__APBrowserBTLEManager_ensureAdvertisingStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a2)
  {
    if (gLogCategory_APBrowserBTLEManager <= 90
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "ensureAdvertisingStoppedWithSeed:", *(unsigned int *)(a1 + 40), a2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "ensureAdvertisingStoppedWithSeed:", *(unsigned int *)(a1 + 40), v4);
    }
  }
  else if (gLogCategory_APBrowserBTLEManager <= 50
         && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (int)ensureScanningStopped
{
  return -[APBrowserBTLEManager ensureScanningStoppedWithSeed:](self, "ensureScanningStoppedWithSeed:", -[APBrowserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed"));
}

- (int)ensureScanningStoppedWithSeed:(int)a3
{
  if (-[APBrowserBTLEManager btleDiscovererSeed](self, "btleDiscovererSeed") == a3)
  {
    if (-[APBrowserBTLEManager isScanning](self, "isScanning")
      && gLogCategory_APBrowserBTLEManager <= 50
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CBDiscovery invalidate](-[APBrowserBTLEManager btleDiscoverer](self, "btleDiscoverer"), "invalidate");

    -[APBrowserBTLEManager setBtleDiscoverer:](self, "setBtleDiscoverer:", 0);
    -[APBrowserBTLEManager setIsScanning:](self, "setIsScanning:", 0);
    -[NSMutableDictionary removeAllObjects](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "removeAllObjects");
  }
  return 0;
}

- (int)dispatchEvent:(unsigned int)a3 withEventInfo:(id)a4
{
  OS_dispatch_queue *v7;
  _QWORD block[6];
  id v10;
  unsigned int v11;
  id location;

  objc_initWeak(&location, self);
  v7 = -[APBrowserBTLEManager eventQueue](self, "eventQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__APBrowserBTLEManager_dispatchEvent_withEventInfo___block_invoke;
  block[3] = &unk_1E8254ED8;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 0;
}

uint64_t __52__APBrowserBTLEManager_dispatchEvent_withEventInfo___block_invoke(uint64_t a1)
{
  id Weak;
  uint64_t result;

  Weak = objc_loadWeak((id *)(a1 + 48));
  result = objc_msgSend(Weak, "eventHandlerFunc");
  if (result)
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t))objc_msgSend(Weak, "eventHandlerFunc"))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), objc_msgSend(Weak, "eventHandlerContext"));
  return result;
}

+ (int)createEventInfoDictionary:(id *)a3 withDeviceID:(id)a4 IPAddress:(id)a5 port:(id)a6 supportsSolo:(id)a7 rssi:(id)a8
{
  void *v14;
  void *v15;
  int v16;

  if (a4)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", a4, CFSTR("deviceID"));
      if (a5)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", a5, CFSTR("ipAddress"));
      if (a6)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", a6, CFSTR("port"));
      if (a7)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", a7, CFSTR("supportsSolo"));
      if (a8)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", a8, CFSTR("rssi"));
      v16 = 0;
      *a3 = v15;
    }
    else
    {
      APSLogErrorAt();
      return -72220;
    }
  }
  else
  {
    v16 = -72221;
    APSLogErrorAt();
  }
  return v16;
}

- (int)handleFoundDevice:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _OWORD *v32;
  id v33;
  _OWORD v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  memset(v34, 0, sizeof(v34));
  if (!self->_btleMode)
  {
LABEL_32:
    v20 = 0;
    goto LABEL_22;
  }
  objc_msgSend(a3, "airplayTargetIPv4");
  IPv4AddressToCString();
  v5 = objc_msgSend(a3, "airplayTargetPort");
  if (!(_DWORD)v5)
  {
    if ((objc_msgSend(a3, "airplayTargetFlags") & 2) != 0)
      v5 = 7000;
    else
      v5 = 5000;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v6 = objc_msgSend(a3, "identifier");
    v28 = objc_msgSend(a3, "airplayTargetFlags");
    v30 = &unk_1C94323BC;
    v24 = v34;
    v26 = v5;
    v22 = v6;
    LogPrintF();
  }
  if (!objc_msgSend(a3, "airplayTargetIPv4", v22, v24, v26, v28, v30)
    && !objc_msgSend(a3, "airplayTargetFlags"))
  {
    if (gLogCategory_APBrowserBTLEManager <= 40
      && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_32;
  }
  if (gLogCategory_APBrowserBTLEManager <= 10
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v7 = objc_msgSend(a3, "identifier");
    v8 = objc_msgSend(a3, "bleRSSI");
    v9 = objc_msgSend(a3, "airplayTargetFlags");
    v31 = objc_msgSend(a3, "airplayTargetConfigSeed");
    v32 = v34;
    v27 = v9;
    v29 = &unk_1C94323BC;
    v23 = v7;
    v25 = v8;
    LogPrintF();
  }
  v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[APBrowserBTLEManager btleDevices](self, "btleDevices", v23, v25, v27, v29, v31, v32), "objectForKeyedSubscript:", objc_msgSend(a3, "identifier"));
  v11 = objc_msgSend(a3, "airplayTargetConfigSeed");
  v12 = objc_msgSend(v10, "airplayTargetConfigSeed");
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "setObject:forKeyedSubscript:", a3, objc_msgSend(a3, "identifier"));
  if (!v10 || v11 != v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
    if (!v13)
    {
      APSLogErrorAt();
      v20 = -72222;
      goto LABEL_22;
    }
    v14 = v13;
    v15 = objc_msgSend(a3, "identifier");
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "airplayTargetFlags") & 1);
    v18 = +[APBrowserBTLEManager createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:](APBrowserBTLEManager, "createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:", &v33, v15, v14, v16, v17, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "bleRSSI")));
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      v19 = -[APBrowserBTLEManager dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", v10 != 0, v33);
      if (!v19)
        goto LABEL_21;
      v20 = v19;
    }
LABEL_27:
    APSLogErrorAt();
    goto LABEL_22;
  }
LABEL_21:
  v20 = -[APBrowserBTLEManager update](self, "update");
  if (v20)
    goto LABEL_27;
LABEL_22:

  return v20;
}

- (int)handleLostDevice:(id)a3
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;

  v17 = 0;
  if (!self->_btleMode
    || !-[NSMutableDictionary objectForKey:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "objectForKey:", objc_msgSend(a3, "identifier")))
  {
    v9 = 0;
    goto LABEL_14;
  }
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v5 = objc_msgSend(a3, "identifier");
    v13 = objc_msgSend(a3, "airplayTargetFlags");
    v15 = &unk_1C94323BC;
    v11 = v5;
    LogPrintF();
  }
  v6 = +[APBrowserBTLEManager createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:](APBrowserBTLEManager, "createEventInfoDictionary:withDeviceID:IPAddress:port:supportsSolo:rssi:", &v17, objc_msgSend(a3, "identifier", v11, v13, v15), 0, 0, 0, 0);
  if (v6)
  {
    v9 = v6;
LABEL_18:
    APSLogErrorAt();
    goto LABEL_14;
  }
  v7 = -[APBrowserBTLEManager dispatchEvent:withEventInfo:](self, "dispatchEvent:withEventInfo:", 2, v17);
  if (v7)
  {
    v9 = v7;
    goto LABEL_18;
  }
  -[NSMutableDictionary removeObjectForKey:](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "removeObjectForKey:", objc_msgSend(a3, "identifier"));
  if (gLogCategory_APBrowserBTLEManager <= 40
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    v8 = objc_msgSend(a3, "identifier");
    v14 = -[NSMutableDictionary count](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "count");
    v16 = -[APBrowserBTLEManager nearbySoloDevicesCount](self, "nearbySoloDevicesCount");
    v12 = v8;
    LogPrintF();
  }
  v9 = -[APBrowserBTLEManager update](self, "update", v12, v14, v16);
  if (v9)
    goto LABEL_18;
LABEL_14:

  return v9;
}

+ (id)stringForBTLEState:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return off_1E8254F10[a3];
  if (gLogCategory_APBrowserBTLEManager <= 60
    && (gLogCategory_APBrowserBTLEManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSTR("unknown");
}

- (int64_t)btleManagerState
{
  int64_t result;

  if (-[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser"))
  {
    result = -[APBrowserBTLEManager btleAdvertiser](self, "btleAdvertiser");
    if (!result)
      return result;
    return objc_msgSend((id)result, "bluetoothState");
  }
  result = -[APBrowserBTLEManager btleDiscoverer](self, "btleDiscoverer");
  if (result)
    return objc_msgSend((id)result, "bluetoothState");
  return result;
}

- (int)copyShowInfo:(id *)a3 verbose:(BOOL)a4
{
  int v6;
  int v7;
  id v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v25;
  id *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _OWORD v33[2];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = -72224;
  memset(v33, 0, sizeof(v33));
  if (!-[APBrowserBTLEManager isInvalidated](self, "isInvalidated", a3, a4))
  {
    v7 = -[APBrowserBTLEManager ensurePreferencesUpdatedWithShouldForce:](self, "ensurePreferencesUpdatedWithShouldForce:", 0);
    if (v7)
    {
      v25 = v7;
      APSLogErrorAt();
      return v25;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      if (v8)
      {
        v9 = v8;
        v26 = a3;
        objc_msgSend(v8, "appendString:", CFSTR("+-+ APBrowserBTLEManager state +-+\n"));
        objc_msgSend(v9, "appendString:", CFSTR("\n"));
        if (-[APBrowserBTLEManager isEnabled](self, "isEnabled"))
          v10 = "yes";
        else
          v10 = "no";
        objc_msgSend(v9, "appendFormat:", CFSTR("BTLE: enabled=%s"), v10);
        if (self->_p2pSoloSupportedIsSet)
        {
          if (self->_p2pSoloSupported)
            v11 = "yes";
          else
            v11 = "no";
        }
        else
        {
          v11 = "<not set, assuming no>";
        }
        objc_msgSend(v9, "appendFormat:", CFSTR(" soloSupported=%s"), v11);
        if (-[APBrowserBTLEManager isSoloBeaconDisabled](self, "isSoloBeaconDisabled"))
          v12 = "yes";
        else
          v12 = "no";
        objc_msgSend(v9, "appendFormat:", CFSTR(" beaconDisabled=%s"), v12);
        objc_msgSend(v9, "appendFormat:", CFSTR(" mode=%@"), +[APBrowserBTLEManager stringForBTLEMode:](APBrowserBTLEManager, "stringForBTLEMode:", self->_btleMode));
        objc_msgSend(v9, "appendFormat:", CFSTR(" coreBluetoothState=%@"), +[APBrowserBTLEManager stringForBTLEState:](APBrowserBTLEManager, "stringForBTLEState:", -[APBrowserBTLEManager btleManagerState](self, "btleManagerState")));
        if (-[APBrowserBTLEManager isAdvertising](self, "isAdvertising"))
          v13 = "yes";
        else
          v13 = "no";
        objc_msgSend(v9, "appendFormat:", CFSTR(" advertising=%s"), v13);
        if (-[APBrowserBTLEManager isScanning](self, "isScanning"))
          v14 = "yes";
        else
          v14 = "no";
        objc_msgSend(v9, "appendFormat:", CFSTR(" scanning=%s"), v14);
        v15 = -[NSMutableDictionary count](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "count");
        objc_msgSend(v9, "appendFormat:", CFSTR(" targetBeaconsNearby=%d"), v15);
        if (v15)
        {
          objc_msgSend(v9, "appendFormat:", CFSTR(" (%d support Solo)"), -[APBrowserBTLEManager nearbySoloDevicesCount](self, "nearbySoloDevicesCount"));
          objc_msgSend(v9, "appendString:", CFSTR("\n"));
          objc_msgSend(v9, "appendString:", CFSTR("Detected BTLE Target Presence beacons:\n"));
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          obj = (id)-[NSMutableDictionary allValues](-[APBrowserBTLEManager btleDevices](self, "btleDevices"), "allValues");
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                objc_msgSend(v9, "appendFormat:", CFSTR("    %@:"), objc_msgSend(v20, "identifier"));
                objc_msgSend(v9, "appendFormat:", CFSTR(" supportsSolo=%d"), objc_msgSend(v20, "airplayTargetFlags") & 1);
                objc_msgSend(v9, "appendFormat:", CFSTR(" supportsMediaControlPort=%d"), (objc_msgSend(v20, "airplayTargetFlags") >> 1) & 1);
                objc_msgSend(v20, "airplayTargetIPv4");
                IPv4AddressToCString();
                objc_msgSend(v20, "airplayTargetFlags");
                v21 = CUPrintFlags32();
                v22 = objc_msgSend(v20, "airplayTargetConfigSeed");
                v23 = objc_msgSend(v20, "airplayTargetPort");
                if (!v23)
                {
                  if ((objc_msgSend(v20, "airplayTargetFlags") & 2) != 0)
                    v23 = 7000;
                  else
                    v23 = 5000;
                }
                objc_msgSend(v9, "appendFormat:", CFSTR(" data=<flags=%@ config=%-3u IPv4=%-15s Port=%-5hu>\n"), v21, v22, v33, v23);
              }
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v17);
          }
        }
        else
        {
          objc_msgSend(v9, "appendString:", CFSTR("\n"));
        }
        v6 = 0;
        *v26 = v9;
      }
      else
      {
        APSLogErrorAt();
        return -72220;
      }
    }
  }
  return v6;
}

- (void)setBtleAdvertiserSeed:(int)a3
{
  self->_btleAdvertiserSeed = a3;
}

- (BOOL)browseForAltReceiver
{
  return self->_browseForAltReceiver;
}

- (void)setBrowseForAltReceiver:(BOOL)a3
{
  self->_browseForAltReceiver = a3;
}

- (void)eventHandlerContext
{
  return self->_eventHandlerContext;
}

- (void)setEventHandlerContext:(void *)a3
{
  self->_eventHandlerContext = a3;
}

- (void)eventHandlerFunc
{
  return self->_eventHandlerFunc;
}

- (void)setEventHandlerFunc:(void *)a3
{
  self->_eventHandlerFunc = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void)setPreferencesUpdated:(BOOL)a3
{
  self->_preferencesUpdated = a3;
}

- (NSMutableDictionary)btleDevices
{
  return self->_btleDevices;
}

- (void)setBtleDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (BOOL)isSoloBeaconDisabled
{
  return self->_isSoloBeaconDisabled;
}

- (void)setIsSoloBeaconDisabled:(BOOL)a3
{
  self->_isSoloBeaconDisabled = a3;
}

- (const)btleDiscoveryManagerToken
{
  return self->_btleDiscoveryManagerToken;
}

- (void)setBtleDiscoveryManagerToken:(const void *)a3
{
  self->_btleDiscoveryManagerToken = a3;
}

@end
