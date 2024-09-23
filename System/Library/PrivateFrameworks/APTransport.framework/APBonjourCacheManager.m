@implementation APBonjourCacheManager

- (void)forceReportCachedDevices
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__APBonjourCacheManager_forceReportCachedDevices__block_invoke;
  block[3] = &unk_1E8257FF0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_reportCachedItemsFound:(int64_t)a3
{
  int var0;
  NSMutableDictionary *cachedItems;
  _QWORD v6[6];

  if (self->_isPublicAirPlayNetwork)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    cachedItems = self->_cachedItems;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__APBonjourCacheManager__reportCachedItemsFound___block_invoke;
    v6[3] = &unk_1E8258130;
    v6[4] = self;
    v6[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedItems, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

uint64_t __49__APBonjourCacheManager_forceReportCachedDevices__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  int v4;

  result = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(result + 104);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), result = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      result = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(result + 96))
    return objc_msgSend((id)result, "_reportCachedItemsFound:", 5);
  return result;
}

- (APBonjourCacheManager)init
{
  APBonjourCacheManager *v2;
  APBonjourCacheManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *coreWiFiQueue;
  uint64_t v6;
  CWFInterface *coreWiFiInterface;
  CWFInterface *v8;
  objc_super v10;
  char label[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)label = 0u;
  v12 = 0u;
  v10.receiver = self;
  v10.super_class = (Class)APBonjourCacheManager;
  v2 = -[APBonjourCacheManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_pairedPeersChangedToken = -1;
    v3->_ucat = (LogCategory *)&gLogCategory_APBonjourCache;
    SNPrintF();
    v4 = dispatch_queue_create(label, 0);
    coreWiFiQueue = v3->_coreWiFiQueue;
    v3->_coreWiFiQueue = (OS_dispatch_queue *)v4;

    if (v3->_coreWiFiQueue
      && (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1BA50]), "initWithServiceType:", 2, v3),
          coreWiFiInterface = v3->_coreWiFiInterface,
          v3->_coreWiFiInterface = (CWFInterface *)v6,
          coreWiFiInterface,
          (v8 = v3->_coreWiFiInterface) != 0))
    {
      -[CWFInterface activate](v8, "activate");
      v3->_auditCaches = APSSettingsGetInt64() != 0;
      -[APBonjourCacheManager _migrateCacheDirectoryIfNecessary](v3, "_migrateCacheDirectoryIfNecessary");
    }
    else
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)APBonjourCacheManager;
  -[APBonjourCacheManager dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__APBonjourCacheManager_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E8257FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __48__APBonjourCacheManager_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  CUSystemMonitor *v5;
  CUSystemMonitor *systemMonitor;
  uint64_t v7;
  CUSystemMonitor *v8;
  NSObject *dispatchQueue;
  CUCoalescer *v10;
  CUCoalescer *writeCoaleser;
  _QWORD v12[5];
  _QWORD handler[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = (void (**)(id, _QWORD))a3;
  -[APBonjourCacheManager _ensureKnownNetworkProfileMonitoringStarted](self, "_ensureKnownNetworkProfileMonitoringStarted");
  if (!self->_systemMonitor)
  {
    v5 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E0D1B458]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v5;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke;
    v15[3] = &unk_1E8257FF0;
    v15[4] = self;
    -[CUSystemMonitor setPrimaryNetworkChangedHandler:](self->_systemMonitor, "setPrimaryNetworkChangedHandler:", v15);
    v8 = self->_systemMonitor;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_2;
    v14[3] = &unk_1E8257FF0;
    v14[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v8, "activateWithCompletion:", v14);
  }
  if (self->_pairedPeersChangedToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_3;
    handler[3] = &unk_1E8258018;
    handler[4] = self;
    notify_register_dispatch("com.apple.pairing.peerChanged", &self->_pairedPeersChangedToken, dispatchQueue, handler);
    -[APBonjourCacheManager _pairedPeersChanged](self, "_pairedPeersChanged");
  }
  if (!self->_writeCoaleser)
  {
    v10 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E0D1B350]);
    writeCoaleser = self->_writeCoaleser;
    self->_writeCoaleser = v10;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__APBonjourCacheManager__activateWithCompletion___block_invoke_4;
    v12[3] = &unk_1E8257FF0;
    v12[4] = self;
    -[CUCoalescer setActionHandler:](self->_writeCoaleser, "setActionHandler:", v12);
    -[CUCoalescer setDispatchQueue:](self->_writeCoaleser, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](self->_writeCoaleser, "setMinDelay:", 5.0);
    -[CUCoalescer setMaxDelay:](self->_writeCoaleser, "setMaxDelay:", 300.0);
    if (!v4)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v4)
LABEL_7:
    v4[2](v4, 0);
LABEL_8:

}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkSignatureChanged");
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkSignatureChanged");
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 40) != -1)
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 104);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 32), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    return objc_msgSend((id)v1, "_pairedPeersChanged");
  }
  return result;
}

uint64_t __49__APBonjourCacheManager__activateWithCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushCachedItems");
}

- (void)_handleKnownNetworkProfileUpdate:(BOOL)a3
{
  _BOOL4 isPublicAirPlayNetwork;
  _BOOL4 v4;
  int var0;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  isPublicAirPlayNetwork = self->_isPublicAirPlayNetwork;
  if (isPublicAirPlayNetwork != a3)
  {
    v4 = a3;
    var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1)
      {
LABEL_4:
        v7 = "yes";
        if (isPublicAirPlayNetwork)
          v8 = "yes";
        else
          v8 = "no";
        if (!v4)
          v7 = "no";
        v9 = v8;
        v10 = v7;
        LogPrintF();
        goto LABEL_11;
      }
      if (_LogCategory_Initialize())
      {
        isPublicAirPlayNetwork = self->_isPublicAirPlayNetwork;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_isPublicAirPlayNetwork = v4;
    -[APBonjourCacheManager _auditCachesIfNecessary:event:](self, "_auditCachesIfNecessary:event:", 0, 9, v9, v10);
    if (self->_isPublicAirPlayNetwork)
      -[APBonjourCacheManager _reportCachedItemsLost:](self, "_reportCachedItemsLost:", 9);
    else
      -[APBonjourCacheManager _reportCachedItemsFound:](self, "_reportCachedItemsFound:", 9);
  }
}

- (void)_ensureKnownNetworkProfileMonitoringStarted
{
  NSObject *coreWiFiQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  if (!self->_isMonitoringKnownNetworkProfile)
  {
    self->_isMonitoringKnownNetworkProfile = 1;
    coreWiFiQueue = self->_coreWiFiQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke;
    v4[3] = &unk_1E82580B8;
    objc_copyWeak(&v5, &location);
    dispatch_async(coreWiFiQueue, v4);
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

void __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[14];
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_2;
    v16[3] = &unk_1E8258068;
    objc_copyWeak(&v17, v1);
    objc_msgSend(v4, "setEventHandler:", v16);
    v6 = (void *)*((_QWORD *)v3 + 14);
    v15 = 0;
    objc_msgSend(v6, "startMonitoringEventType:error:", 30, &v15);
    v7 = v15;
    objc_msgSend(*((id *)v3 + 14), "currentKnownNetworkProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v8, "isPublicAirPlayNetwork");

    v9 = *((_QWORD *)v3 + 17);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_4;
    block[3] = &unk_1E8258090;
    v10 = v7;
    v12 = v10;
    v13 = v3;
    v14 = (char)v4;
    dispatch_sync(v9, block);

    objc_destroyWeak(&v17);
  }
  else
  {
    v10 = 0;
  }

}

void __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  char v10;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v7, "type") == 30)
  {
    objc_msgSend(*((id *)WeakRetained + 14), "currentKnownNetworkProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPublicAirPlayNetwork");

    v6 = *((_QWORD *)WeakRetained + 17);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_3;
    block[3] = &unk_1E8258040;
    v9 = WeakRetained;
    v10 = v5;
    dispatch_sync(v6, block);

  }
}

uint64_t __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKnownNetworkProfileUpdate:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __68__APBonjourCacheManager__ensureKnownNetworkProfileMonitoringStarted__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _DWORD **v4;
  int v5;
  int v6;

  if (*(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 128) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  if (v2)
    v3 = 90;
  else
    v3 = 30;
  v4 = *(_DWORD ***)(a1 + 40);
  v5 = *v4[13];
  if (v3 >= v5)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 40), v6))
    {
      LogPrintF();
      v4 = *(_DWORD ***)(a1 + 40);
    }
  }
  return objc_msgSend(v4, "_handleKnownNetworkProfileUpdate:", *(unsigned __int8 *)(a1 + 48));
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__APBonjourCacheManager_invalidate__block_invoke;
  block[3] = &unk_1E8257FF0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__APBonjourCacheManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  int pairedPeersChangedToken;
  CUCoalescer *writeCoaleser;
  CUSystemMonitor *systemMonitor;
  CWFInterface *coreWiFiInterface;
  OS_dispatch_queue *coreWiFiQueue;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v5 = retryTimer;
      dispatch_source_cancel(v5);
      v6 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    if (self->_cacheChanged)
    {
      -[APBonjourCacheManager _flushCachedItems](self, "_flushCachedItems");
      self->_cacheChanged = 0;
    }
    pairedPeersChangedToken = self->_pairedPeersChangedToken;
    if (pairedPeersChangedToken != -1)
    {
      notify_cancel(pairedPeersChangedToken);
      self->_pairedPeersChangedToken = -1;
    }
    -[CUCoalescer invalidate](self->_writeCoaleser, "invalidate");
    writeCoaleser = self->_writeCoaleser;
    self->_writeCoaleser = 0;

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    -[CWFInterface invalidate](self->_coreWiFiInterface, "invalidate");
    coreWiFiInterface = self->_coreWiFiInterface;
    self->_coreWiFiInterface = 0;

    coreWiFiQueue = self->_coreWiFiQueue;
    if (coreWiFiQueue)
    {
      self->_coreWiFiQueue = 0;

    }
    -[APBonjourCacheManager _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id v4;
  id reportDeviceFoundHandler;
  id reportDeviceLostHandler;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    reportDeviceFoundHandler = self->_reportDeviceFoundHandler;
    self->_reportDeviceFoundHandler = 0;

    reportDeviceLostHandler = self->_reportDeviceLostHandler;
    self->_reportDeviceLostHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)deviceFound:(id)a3
{
  -[APBonjourCacheManager _deviceFound:altPairedInfo:recheck:event:](self, "_deviceFound:altPairedInfo:recheck:event:", a3, 0, 0, 1);
}

- (void)_deviceFound:(id)a3 altPairedInfo:(id)a4 recheck:(BOOL)a5 event:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t DeviceID;
  void *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  int v33;
  int var0;
  int v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  NSString *networkSignature;
  void *v46;
  const char *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  int64_t v51;
  void *v52;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  DeviceID = BonjourDevice_GetDeviceID();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BonjourDevice_CopyCFString();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (const void *)APSFeaturesCreateFromStringRepresentation();
  }
  else
  {
    BonjourDevice_GetInt64();
    v16 = (const void *)APSFeaturesCreateFromLegacyFlags();
    APSFeaturesCopyStringRepresentation();
    v15 = 0;
  }
  if (APSFeaturesHasFeature())
  {
    v17 = APSFeaturesHasFeature() != 0;
    if (!v16)
      goto LABEL_7;
    goto LABEL_6;
  }
  v17 = 0;
  if (v16)
LABEL_6:
    CFRelease(v16);
LABEL_7:
  v18 = (void *)BonjourDevice_CopyCFString();
  if (v18)
  {
    v51 = a6;
    if (v7 || !v17)
      goto LABEL_14;
    v19 = DeviceID;
    v20 = v11;
    -[CUSystemMonitor primaryNetworkSignature](self->_systemMonitor, "primaryNetworkSignature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = self->_deviceMap;
        self->_deviceMap = v23;

        deviceMap = self->_deviceMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v10, v18);
      v11 = v20;
      DeviceID = v19;
LABEL_14:
      v25 = (void *)BonjourDevice_CopyCFString();
      v52 = (void *)BonjourDevice_CopyCFString();
      -[APBonjourCacheManager _removeIfDuplicatesFoundOrIfNoLongerCacheable:identifier:serialNumber:manufacturer:isCacheable:](self, "_removeIfDuplicatesFoundOrIfNoLongerCacheable:identifier:serialNumber:manufacturer:isCacheable:", DeviceID, v18, v25);
      if (!v17)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_51;
      }
      v48 = v7;
      v49 = v25;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pairedPeersMap, "objectForKeyedSubscript:", v18);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
        v26 = v11;
      v27 = DeviceID;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v28;
      if (v28)
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("HKPeer"));
        v29 = v13;
        v30 = v11;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CFGetInt64() == 0;

        v11 = v30;
        v13 = v29;
      }
      else
      {
        v32 = 1;
      }
      v36 = (BonjourDevice_GetInt64() & 0x400) == 0 || v32;
      v37 = v26;
      if (v26 || !v36)
      {
        if (v50)
        {
          -[APBonjourCacheManager _updateCachedDeviceInfoWhenRealDeviceIsFound:event:](self, "_updateCachedDeviceInfoWhenRealDeviceIsFound:event:", v10, v51);
          goto LABEL_50;
        }
        if (CFAbsoluteTimeGetCurrent() - self->_networkSignatureWasValidAt >= 10.0)
        {
          if (v26)
          {
            -[APBonjourCacheManager _auditCachesIfNecessary:event:](self, "_auditCachesIfNecessary:event:", v10, v51);
            v40 = self->_ucat->var0;
            if (!self->_isPublicAirPlayNetwork)
            {
              if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
              {
                v42 = "";
                if (v48)
                  v42 = "(recheck)";
                networkSignature = self->_networkSignature;
                v47 = v42;
                v43 = v27;
                v44 = v13;
                LogPrintF();
              }
              v37 = v26;
              -[APBonjourCacheManager _addDeviceToCache:pairedPeerInfo:event:](self, "_addDeviceToCache:pairedPeerInfo:event:", v10, v26, v51, v43, v44, networkSignature, v47);
              goto LABEL_50;
            }
            v37 = v26;
            if (v40 > 30 || v40 == -1 && !_LogCategory_Initialize())
            {
LABEL_50:

              v25 = v49;
LABEL_51:

              goto LABEL_52;
            }
          }
          else
          {
            v41 = self->_ucat->var0;
            if (v41 > 30 || v41 == -1 && !_LogCategory_Initialize())
              goto LABEL_50;
          }
        }
        else
        {
          v39 = self->_ucat->var0;
          if (v39 > 30 || v39 == -1 && !_LogCategory_Initialize())
            goto LABEL_50;
        }
      }
      else
      {
        v38 = self->_ucat->var0;
        if (v38 > 30 || v38 == -1 && !_LogCategory_Initialize())
          goto LABEL_50;
      }
      LogPrintF();
      goto LABEL_50;
    }
    v35 = self->_ucat->var0;
    v11 = v20;
    if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
    {
      -[CUSystemMonitor primaryNetworkSignature](self->_systemMonitor, "primaryNetworkSignature");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v11 = v20;
    }
  }
  else
  {
    v33 = self->_ucat->var0;
    if (v33 <= 90 && (v33 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_52:

}

- (void)_auditCachesIfNecessary:(id)a3 event:(int64_t)a4
{
  id v6;
  double Current;
  double v8;
  int var0;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  const char *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  id v46;
  uint64_t DeviceID;
  id obj;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (!self->_auditCaches)
  {
    v13 = 0;
    v17 = 0;
    v11 = 0;
    goto LABEL_59;
  }
  v8 = Current;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) > 8)
      v10 = "Unknown";
    else
      v10 = off_1E8258178[a4 - 1];
    v12 = "yes";
    if (!v6)
      v12 = "no";
    v39 = v10;
    v41 = v12;
    LogPrintF();
    if (v6)
      goto LABEL_8;
  }
  else if (v6)
  {
LABEL_8:
    v11 = (void *)BonjourDevice_CopyCFString();
    if (v11)
    {
      DeviceID = BonjourDevice_GetDeviceID();
      goto LABEL_15;
    }
    APSLogErrorAt();
    v13 = 0;
    v17 = 0;
LABEL_59:
    v18 = 0;
    goto LABEL_55;
  }
  v11 = 0;
  DeviceID = 0;
LABEL_15:
  v58 = 0;
  -[APBonjourCacheManager _getCacheDirectoryURLCreateIfNecessary:error:](self, "_getCacheDirectoryURLCreateIfNecessary:error:", 0, &v58, v39, v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v58;
  if (NSErrorToOSStatus())
  {
    v17 = 0;
    v18 = v14;
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v14;
  objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v16, &v57);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v57;

  if (!NSErrorToOSStatus())
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v17 = v17;
    v51 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (!v51)
    {

      goto LABEL_55;
    }
    v46 = v18;
    obj = v17;
    v52 = 0;
    v49 = v13;
    v50 = *(_QWORD *)v54;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v54 != v50)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(v13, "path", v40, *(_QWORD *)&v42, *(_QWORD *)&v43, *(_QWORD *)&v44, v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingPathComponent:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dictionaryWithContentsOfFile:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          APSLogErrorAt();
          v29 = 0;
          v30 = 0;
          v25 = 0.0;
          goto LABEL_39;
        }
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("networkSignature"));
        v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v26 = objc_msgSend(*(id *)&v25, "isEqualToString:", self->_networkSignature);
        if (v26)
        {
          if (self->_isPublicAirPlayNetwork)
          {
            v27 = self->_ucat->var0;
            if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
            {
              v40 = v20;
              v42 = v25;
              LogPrintF();
            }
          }
        }
        if (!v11)
        {
          v29 = 0;
LABEL_44:
          v30 = 0;
          goto LABEL_39;
        }
        CFDictionaryGetTypeID();
        CFDictionaryGetTypedValue();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (!v28)
        {
          APSLogErrorAt();
          goto LABEL_44;
        }
        objc_msgSend(v28, "objectForKeyedSubscript:", v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          CFDictionaryGetDouble();
          v32 = v31;
          CFDictionaryGetDouble();
          v52 += v26 ^ 1;
          v34 = self->_ucat->var0;
          if (v34 <= 30)
          {
            v35 = v33;
            if (v34 != -1 || _LogCategory_Initialize())
            {
              v36 = "Other";
              if (v26)
                v36 = "Current";
              v42 = v8 - v32;
              v43 = v8 - v35;
              v40 = DeviceID;
              v44 = v25;
              v45 = v36;
              LogPrintF();
            }
          }
        }
LABEL_39:

        ++v19;
        v13 = v49;
      }
      while (v51 != v19);
      v17 = obj;
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      v51 = v37;
      if (!v37)
      {

        if (v52)
        {
          v38 = self->_ucat->var0;
          v18 = v46;
          if (v38 <= 90 && (v38 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
        else
        {
          v18 = v46;
        }
        break;
      }
    }
  }
LABEL_55:

}

- (BOOL)deviceLost:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  int var0;

  v4 = a3;
  v5 = (void *)BonjourDevice_CopyCFString();
  if (!v5)
  {
    BonjourDevice_GetDeviceID();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_11;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v5);
  -[NSMutableSet removeObject:](self->_removedItems, "removeObject:", v5);
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(self->_reportDeviceFoundHandler);
  if (!v6)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (v7)
  {
    BonjourDevice_GetDeviceID();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (**)(_QWORD, void *, uint64_t))v6)[2](v6, v7, 2);

  }
LABEL_15:

  return v8;
}

- (void)cacheHKPeerIfNeeded:(id)a3 pairedPeerInfo:(id)a4
{
  id v6;
  uint64_t DeviceID;
  int var0;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  DeviceID = BonjourDevice_GetDeviceID();
  var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    v9 = DeviceID;
    v10 = v13;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v10 = v13;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_5:
  -[APBonjourCacheManager _deviceFound:altPairedInfo:recheck:event:](self, "_deviceFound:altPairedInfo:recheck:event:", v13, v6, 1, 6, v11, v12);

}

- (void)_refreshOrRemoveCachedItem:(id)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t DeviceID;
  int var0;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  CFDictionaryGetDouble();
  v5 = CFAbsoluteTimeGetCurrent() - v4;
  if (v5 >= 864000.0)
  {
    v6 = (void *)BonjourDevice_CopyCFString();
    if (v6)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", 0, v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v6);
      -[NSMutableSet removeObject:](self->_removedItems, "removeObject:", v6);
      self->_cacheChanged = 1;
      DeviceID = BonjourDevice_GetDeviceID();
      var0 = self->_ucat->var0;
      if (var0 <= 30 && ((v9 = DeviceID, var0 != -1) || _LogCategory_Initialize()))
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        -[CUCoalescer trigger](self->_writeCoaleser, "trigger", v9, v13, *(_QWORD *)&v5);
      }
      else
      {
        -[CUCoalescer trigger](self->_writeCoaleser, "trigger", v11, v12, v14);
      }
    }
    else
    {
      v10 = self->_ucat->var0;
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
}

- (void)_removeIfDuplicatesFoundOrIfNoLongerCacheable:(unint64_t)a3 identifier:(id)a4 serialNumber:(id)a5 manufacturer:(id)a6 isCacheable:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  NSMutableDictionary *cachedItems;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  APBonjourCacheManager *v23;
  unint64_t v24;
  BOOL v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  cachedItems = self->_cachedItems;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__APBonjourCacheManager__removeIfDuplicatesFoundOrIfNoLongerCacheable_identifier_serialNumber_manufacturer_isCacheable___block_invoke;
  v19[3] = &unk_1E82580E0;
  v23 = self;
  v24 = a3;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v25 = a7;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedItems, "enumerateKeysAndObjectsUsingBlock:", v19);

}

void __120__APBonjourCacheManager__removeIfDuplicatesFoundOrIfNoLongerCacheable_identifier_serialNumber_manufacturer_isCacheable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t DeviceID;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  DeviceID = BonjourDevice_GetDeviceID();
  if (v17 && objc_msgSend(v17, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)BonjourDevice_CopyCFString();
    v8 = BonjourDevice_CopyCFString();
    v9 = (void *)v8;
    if (DeviceID != *(_QWORD *)(a1 + 64)
      && (!*(_QWORD *)(a1 + 40)
       || !v7
       || !*(_QWORD *)(a1 + 48)
       || !v8
       || objc_msgSend(v7, "compare:")
       || objc_msgSend(v9, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 48))))
    {

      goto LABEL_25;
    }
    v10 = **(_DWORD **)(*(_QWORD *)(a1 + 56) + 104);
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v14 = DeviceID;
      LogPrintF();

    }
    v13 = *(_QWORD *)(a1 + 64);

    if (DeviceID == v13)
    {
LABEL_24:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "setObject:forKeyedSubscript:", 0, v17, v14);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setObject:forKeyedSubscript:", 0, v17);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "removeObject:", v17);
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 9) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "trigger");
      goto LABEL_25;
    }
    v12 = 7;
LABEL_23:
    objc_msgSend(*(id *)(a1 + 56), "_reportCachedItemLost:event:", v5, v12, v14, v15, v16);
    goto LABEL_24;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    v11 = **(_DWORD **)(*(_QWORD *)(a1 + 56) + 104);
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    {
      v14 = DeviceID;
      LogPrintF();
    }
    v12 = 8;
    goto LABEL_23;
  }
LABEL_25:

}

- (void)_replaceIfnameFromDNSString:(id)a3
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dnsName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("%"));
  if (v4 < objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("dnsName"));

  }
}

- (void)_sanitizeDNSStrings:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("services"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[APBonjourCacheManager _replaceIfnameFromDNSString:](self, "_replaceIfnameFromDNSString:", v12);
  if (v5)
  {
    v6 = objc_msgSend(v5, "count");
    if (v6 >= 1)
    {
      v7 = v6;
      v8 = 0;
      for (i = 0; i != v7; ++i)
      {
        v10 = v8;
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v11, "mutableCopy");

        -[APBonjourCacheManager _replaceIfnameFromDNSString:](self, "_replaceIfnameFromDNSString:", v8);
        objc_msgSend(v5, "replaceObjectAtIndex:withObject:", i, v8);
      }

    }
  }
  objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("services"));

}

- (void)_networkSignatureChanged
{
  void *v3;
  NSString *networkSignature;
  NSString *v5;
  NSString *v6;
  char v7;
  int var0;
  NSString *v9;
  int v10;
  NSString *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *cachedItems;
  NSString *v14;
  NSString *v15;

  if (self->_systemMonitor)
  {
    -[APBonjourCacheManager _ensureKnownNetworkProfileMonitoringStarted](self, "_ensureKnownNetworkProfileMonitoringStarted");
    -[CUSystemMonitor primaryNetworkSignature](self->_systemMonitor, "primaryNetworkSignature");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    networkSignature = self->_networkSignature;
    v15 = v3;
    v5 = networkSignature;
    if (v15 == v5)
    {

LABEL_23:
      return;
    }
    v6 = v5;
    if ((v15 == 0) != (v5 != 0))
    {
      v7 = -[NSString isEqual:](v15, "isEqual:", v5);

      if ((v7 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
    var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      v9 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_13;
        v9 = v15;
      }
      v14 = v9;
      LogPrintF();
    }
LABEL_13:
    if (self->_networkSignature)
      -[APBonjourCacheManager _flushCachedItems](self, "_flushCachedItems");
    -[APBonjourCacheManager _reportCachedItemsLost:](self, "_reportCachedItemsLost:", 3, v14);
    if (-[NSString containsString:](v15, "containsString:", CFSTR("Cellular")))
    {
      v10 = self->_ucat->var0;
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();

      v11 = 0;
    }
    else
    {
      v11 = v15;
    }
    v15 = v11;
    objc_storeStrong((id *)&self->_networkSignature, v11);
    self->_networkSignatureWasValidAt = CFAbsoluteTimeGetCurrent();
    -[APBonjourCacheManager _auditCachesIfNecessary:event:](self, "_auditCachesIfNecessary:event:", 0, 3);
    -[APBonjourCacheManager _readCachedItems](self, "_readCachedItems");
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cachedItems = self->_cachedItems;
    self->_cachedItems = v12;

    -[APBonjourCacheManager _refreshCachedItems](self, "_refreshCachedItems");
    -[APBonjourCacheManager _reportCachedItemsFound:](self, "_reportCachedItemsFound:", 3);
    -[APBonjourCacheManager _recheckDevices:](self, "_recheckDevices:", 3);
    goto LABEL_23;
  }
}

- (void)_pairedPeersChanged
{
  int var0;
  id v4;
  _QWORD v5[6];

  if (!self->_pairedPeersGetting)
  {
    self->_pairedPeersGetting = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = objc_alloc_init(MEMORY[0x1E0D1B3F0]);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__APBonjourCacheManager__pairedPeersChanged__block_invoke;
    v5[3] = &unk_1E8258108;
    v5[4] = self;
    v5[5] = v4;
    objc_msgSend(v4, "getPairedPeersWithOptions:completion:", 4, v5);

  }
}

void __44__APBonjourCacheManager__pairedPeersChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _DWORD **v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _DWORD **v18;
  int v19;
  int v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v7 = *(_DWORD ***)(a1 + 32);
  if (v6)
  {
    v8 = *v7[13];
    if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
    {
      v21 = (uint64_t)v6;
      LogPrintF();
    }
    if (objc_msgSend(v6, "code", v21) == 4099 || objc_msgSend(v6, "code") == 4097)
      objc_msgSend(*(id *)(a1 + 32), "_startRetryGetPairedPeersTimer");
  }
  else
  {
    objc_msgSend(v7, "_cancelRetryGetPairedPeers");
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v9);
    v18 = *(_DWORD ***)(a1 + 32);
    v19 = *v18[13];
    if (v19 <= 30)
    {
      if (v19 != -1 || (v20 = _LogCategory_Initialize(), v18 = *(_DWORD ***)(a1 + 32), v20))
      {
        v21 = objc_msgSend(v9, "count");
        LogPrintF();
        v18 = *(_DWORD ***)(a1 + 32);
      }
    }
    objc_msgSend(v18, "_recheckDevices:", 4, v21);

    v5 = v22;
  }

}

- (void)_startRetryGetPairedPeersTimer
{
  int var0;
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v5 = retryTimer;
    dispatch_source_cancel(v5);
    v6 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v8 = self->_retryTimer;
  self->_retryTimer = v7;

  v9 = self->_retryTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55__APBonjourCacheManager__startRetryGetPairedPeersTimer__block_invoke;
  handler[3] = &unk_1E8257FF0;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_retryTimer);
}

int *__55__APBonjourCacheManager__startRetryGetPairedPeersTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *result;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(int **)(v2 + 104);
  if (*result <= 30)
  {
    if (*result != -1 || (result = (int *)_LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), (_DWORD)result))
    {
      result = (int *)LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (!*(_BYTE *)(v2 + 64))
  {
    v4 = *(void **)(v2 + 56);
    if (v4)
    {
      v5 = v4;
      dispatch_source_cancel(v5);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = 0;

    }
    return (int *)objc_msgSend(*(id *)(a1 + 32), "_pairedPeersChanged");
  }
  return result;
}

- (void)_cancelRetryGetPairedPeers
{
  int var0;
  OS_dispatch_source *retryTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  if (self->_retryTimer)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v6 = retryTimer;
      dispatch_source_cancel(v6);
      v5 = self->_retryTimer;
      self->_retryTimer = 0;

    }
  }
}

- (void)_recheckDevices:(int64_t)a3
{
  NSMutableDictionary *deviceMap;
  _QWORD v4[6];

  if (self->_networkSignature)
  {
    deviceMap = self->_deviceMap;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__APBonjourCacheManager__recheckDevices___block_invoke;
    v4[3] = &unk_1E8258130;
    v4[4] = self;
    v4[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v4);
  }
}

void __41__APBonjourCacheManager__recheckDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "_deviceFound:altPairedInfo:recheck:event:", v5, 0, 1, *(_QWORD *)(a1 + 40));

}

- (void)_refreshCachedItems
{
  NSMutableDictionary *cachedItems;
  _QWORD v3[5];

  cachedItems = self->_cachedItems;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__APBonjourCacheManager__refreshCachedItems__block_invoke;
  v3[3] = &unk_1E8258158;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedItems, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __44__APBonjourCacheManager__refreshCachedItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshOrRemoveCachedItem:");
}

void __49__APBonjourCacheManager__reportCachedItemsFound___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(void *, id, _QWORD);
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  v4 = (void (**)(void *, id, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  if (v4)
  {
    BonjourDevice_GetDeviceID();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 104);
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4[2](v4, v7, *(_QWORD *)(a1 + 40));

  }
}

- (void)_reportCachedItemLost:(id)a3 event:(int64_t)a4
{
  void (**v6)(void *, void *, int64_t);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(void *, void *, int64_t))_Block_copy(self->_reportDeviceLostHandler);
  if (v6)
  {
    v7 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("services"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("services"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("removedServices"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("cached"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("wakeArray"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("wakeAddr"));
    v6[2](v6, v7, a4);

  }
}

- (void)_reportCachedItemsLost:(int64_t)a3
{
  NSMutableDictionary *cachedItems;
  _QWORD v4[6];

  cachedItems = self->_cachedItems;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__APBonjourCacheManager__reportCachedItemsLost___block_invoke;
  v4[3] = &unk_1E8258130;
  v4[4] = self;
  v4[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedItems, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __48__APBonjourCacheManager__reportCachedItemsLost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t DeviceID;
  void *v5;
  _DWORD **v6;
  int v7;
  unint64_t v8;
  const char *v9;
  int v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  DeviceID = BonjourDevice_GetDeviceID();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_DWORD ***)(a1 + 32);
  v7 = *v6[13];
  if (v7 <= 30)
  {
    if (v7 != -1 || (v10 = _LogCategory_Initialize(), v6 = *(_DWORD ***)(a1 + 32), v10))
    {
      v8 = *(_QWORD *)(a1 + 40) - 1;
      if (v8 > 8)
        v9 = "Unknown";
      else
        v9 = off_1E8258178[v8];
      v12 = v5;
      v13 = v9;
      v11 = DeviceID;
      LogPrintF();
      v6 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v6, "_reportCachedItemLost:event:", v14, *(_QWORD *)(a1 + 40), v11, v12, v13);

}

- (void)_updateLastSeenTimestamp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t DeviceID;
  int var0;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)BonjourDevice_CopyCFString();
  if (v4)
  {
    if (-[NSMutableSet containsObject:](self->_removedItems, "containsObject:", v4))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("lastSeen"));

      -[APBonjourCacheManager _sanitizeDNSStrings:](self, "_sanitizeDNSStrings:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", v6, v4);
      self->_cacheChanged = 1;
      DeviceID = BonjourDevice_GetDeviceID();
      var0 = self->_ucat->var0;
      if (var0 <= 30)
      {
        v10 = DeviceID;
        if (var0 != -1 || _LogCategory_Initialize())
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name"));
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
      }
      -[CUCoalescer trigger](self->_writeCoaleser, "trigger", v12, v13);

    }
  }
  else
  {
    v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)_updateCachedDeviceInfoWhenRealDeviceIsFound:(id)a3 event:(int64_t)a4
{
  uint64_t DeviceID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int var0;
  NSMutableSet *removedItems;
  NSMutableSet *v26;
  NSMutableSet *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;

  v34 = a3;
  DeviceID = BonjourDevice_GetDeviceID();
  v7 = (void *)BonjourDevice_CopyCFString();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BonjourDevice_GetDeviceID();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("txt"));
      v33 = DeviceID;
      v13 = v10;
      v14 = a4;
      v15 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("txt"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      v11 = v15;
      a4 = v14;
      v10 = v13;
      DeviceID = v33;

      if ((v18 & 1) != 0)
      {
LABEL_12:
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v31 = v11;
          v32 = v10;
          LogPrintF();
        }
        removedItems = self->_removedItems;
        if (!removedItems)
        {
          v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v27 = self->_removedItems;
          self->_removedItems = v26;

          removedItems = self->_removedItems;
        }
        -[NSMutableSet addObject:](removedItems, "addObject:", v7, v31, v32);
        -[APBonjourCacheManager _updateLastSeenTimestamp:](self, "_updateLastSeenTimestamp:", v34);
        v28 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("cached"));
        v29 = _Block_copy(self->_reportDeviceFoundHandler);
        v30 = v29;
        if (v29)
          (*((void (**)(void *, void *, int64_t))v29 + 2))(v29, v28, a4);

        goto LABEL_21;
      }
    }
    else
    {

    }
    v19 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("name"));

    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("txt"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("txt"));

    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("services"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("services"));

    -[APBonjourCacheManager _sanitizeDNSStrings:](self, "_sanitizeDNSStrings:", v19);
    v23 = self->_ucat->var0;
    if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("name"));
      v31 = DeviceID;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", v19, v7, v31, v32);
    self->_cacheChanged = 1;
    -[CUCoalescer trigger](self->_writeCoaleser, "trigger");

    goto LABEL_12;
  }
LABEL_22:

}

- (void)_addDeviceToCache:(id)a3 pairedPeerInfo:(id)a4 event:(int64_t)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *cachedItems;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  if (!self->_cachedItems)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedItems = self->_cachedItems;
    self->_cachedItems = v9;

  }
  v11 = (void *)BonjourDevice_CopyCFString();
  if (v11)
  {
    v12 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("cached"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("lastSeen"));

    -[APBonjourCacheManager _sanitizeDNSStrings:](self, "_sanitizeDNSStrings:", v12);
    objc_msgSend(v8, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("wakeArray"));
    objc_msgSend(v8, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("wakeAddr"));
    if (a5 == 6)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HKPeer"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", v12, v11);
    self->_cacheChanged = 1;
    -[CUCoalescer trigger](self->_writeCoaleser, "trigger");

  }
}

- (void)_flushCachedItems
{
  if (self->_cachedItems)
  {
    -[APBonjourCacheManager _writeCachedItems:](self, "_writeCachedItems:");
    self->_cacheChanged = 0;
  }
}

- (id)_getCacheDirectoryURLCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, v5, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v8)
  {
    v14 = v8;
    APSLogErrorAt();
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.airplay/APBonjourCache"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    APSLogErrorAt();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2F90];
    v17 = -6728;
    goto LABEL_8;
  }
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v11, 0);

  if ((v12 & 1) != 0)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_9;
  }
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2F90];
    v17 = -6727;
LABEL_8:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v20 = 0;
  objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v20);
  v13 = v20;
  if (!v13)
    goto LABEL_6;
  v19 = v13;
  APSLogErrorAt();
  v14 = v19;
LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v14);
  if (v14)
  {

    v10 = 0;
  }

  return v10;
}

- (id)_getCacheFileURLCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int var0;
  int v15;
  int v16;
  NSString *serviceType;
  uint64_t v18;
  id v19;

  if (!self->_serviceType)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
LABEL_14:
    LogPrintF();
LABEL_22:
    v12 = 0;
    v9 = 0;
    v8 = 0;
LABEL_23:
    v11 = 0;
    goto LABEL_6;
  }
  v6 = a3;
  if (!-[NSString UTF8String](self->_networkSignature, "UTF8String"))
  {
    v15 = self->_ucat->var0;
    if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
    goto LABEL_14;
  }
  -[NSString UTF8String](self->_networkSignature, "UTF8String");
  strlen(-[NSString UTF8String](self->_networkSignature, "UTF8String"));
  v7 = SipHash();
  serviceType = self->_serviceType;
  v18 = v7;
  NSPrintF();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[APBonjourCacheManager _getCacheDirectoryURLCreateIfNecessary:error:](self, "_getCacheDirectoryURLCreateIfNecessary:error:", v6, &v19, serviceType, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v10)
  {
    v12 = v10;
    v16 = self->_ucat->var0;
    if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_23;
  }
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    APSLogErrorAt();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6728, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (id)_readCachedItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  int var0;
  int v13;
  void *v14;
  uint64_t v16;
  id v17;
  id v18;

  v18 = 0;
  -[APBonjourCacheManager _getCacheFileURLCreateIfNecessary:error:](self, "_getCacheFileURLCreateIfNecessary:error:", 0, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (!v3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (!v7)
  {
LABEL_18:
    v14 = 0;
    v9 = v4;
    goto LABEL_27;
  }
  v17 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (v8)
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_ucat->var0;
    if (v10)
    {
      if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
      {
        v16 = objc_msgSend(v10, "count");
        LogPrintF();
      }
      v14 = (void *)objc_msgSend(v10, "mutableCopy", v16);
    }
    else
    {
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v14 = 0;
    }

  }
  else
  {
    v13 = self->_ucat->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v14 = 0;
  }

LABEL_27:
  return v14;
}

- (BOOL)_writeCachedItems:(id)a3
{
  id v4;
  int var0;
  void *v6;
  id v7;
  NSString *networkSignature;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  char v13;
  id v14;
  int v15;
  int v16;
  int v17;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v19 = objc_msgSend(v4, "count");
    LogPrintF();
  }
  v22 = 0;
  -[APBonjourCacheManager _getCacheFileURLCreateIfNecessary:error:](self, "_getCacheFileURLCreateIfNecessary:error:", 1, &v22, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v6)
  {
    v23[0] = CFSTR("cachedItems");
    v23[1] = CFSTR("networkSignature");
    networkSignature = self->_networkSignature;
    v24[0] = v4;
    v24[1] = networkSignature;
    v23[2] = CFSTR("serviceType");
    v24[2] = self->_serviceType;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    if (v10)
    {
      v20 = v11;
      v12 = 1;
      v13 = objc_msgSend(v10, "writeToURL:options:error:", v6, 1, &v20);
      v14 = v20;

      if ((v13 & 1) == 0)
      {
        v15 = self->_ucat->var0;
        if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        v12 = 0;
      }
      v11 = v14;
    }
    else
    {
      v17 = self->_ucat->var0;
      if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v12 = 0;
    }

    v7 = v11;
  }
  else
  {
    v16 = self->_ucat->var0;
    if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v12 = 0;
  }

  return v12;
}

- (void)_migrateCacheDirectoryIfNecessary
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  void *v45;
  int v46;
  uint64_t v47;
  int var0;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  void *v57;
  void *v58;
  APBonjourCacheManager *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v59 = self;
  -[APBonjourCacheManager _getCacheDirectoryURLCreateIfNecessary:error:](self, "_getCacheDirectoryURLCreateIfNecessary:error:", 1, &v72);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v72;
  v57 = (void *)v3;
  if (!v3)
  {
    var0 = v59->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v4;
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v71);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v71;

  if (!v6)
  {
    APSLogErrorAt();
    goto LABEL_74;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = objc_msgSend(&unk_1E8262498, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (!v8)
    goto LABEL_73;
  v9 = v8;
  v58 = 0;
  v10 = *(_QWORD *)v68;
  v51 = *(_QWORD *)v68;
  v52 = v6;
  do
  {
    v11 = 0;
    v53 = v9;
    do
    {
      if (*(_QWORD *)v68 != v10)
        objc_enumerationMutation(&unk_1E8262498);
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v11), 1, v49, v50);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v12;
      if (!objc_msgSend(v57, "isEqual:", v12))
      {
        v54 = v11;
        objc_msgSend(v12, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v56, "fileExistsAtPath:isDirectory:", v14, 0);

        if (!v15)
        {
          v11 = v54;
          goto LABEL_66;
        }
        v16 = v59->_ucat->var0;
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
        {
          v49 = v58;
          LogPrintF();
        }
        objc_msgSend(v58, "path", v49);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v7;
        objc_msgSend(v56, "contentsOfDirectoryAtPath:error:", v17, &v66);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v66;

        if (v19)
        {
          v20 = v59->_ucat->var0;
          v11 = v54;
          if (v20 <= 90 && (v20 != -1 || _LogCategory_Initialize()))
          {
            v49 = v19;
            goto LABEL_24;
          }
          goto LABEL_64;
        }
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v18;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        v22 = v58;
        if (v21)
        {
          v23 = v21;
          v24 = *(_QWORD *)v63;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v63 != v24)
                objc_enumerationMutation(obj);
              v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v25);
              v27 = v59->_ucat->var0;
              if (v27 <= 30 && (v27 != -1 || _LogCategory_Initialize()))
              {
                objc_msgSend(v22, "path", v49);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringByAppendingPathComponent:", v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "stringByAppendingPathComponent:", v26);
                v49 = v29;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                LogPrintF();

                v22 = v58;
              }
              objc_msgSend(v22, "path", v49);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringByAppendingPathComponent:", v26);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "path");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "stringByAppendingPathComponent:", v26);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = 0;
              objc_msgSend(v56, "moveItemAtPath:toPath:error:", v32, v34, &v61);
              v35 = v61;

              v22 = v58;
              if (v35)
              {
                v36 = objc_msgSend(v35, "code");
                v37 = v59->_ucat->var0;
                if (v36 == 516)
                {
                  if (v37 <= 30 && (v37 != -1 || _LogCategory_Initialize()))
                  {
                    v49 = v26;
                    LogPrintF();
                  }
                  objc_msgSend(v58, "path", v49);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "stringByAppendingPathComponent:", v26);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "removeItemAtPath:error:", v39, 0);

                }
                else if (v37 <= 90 && (v37 != -1 || _LogCategory_Initialize()))
                {
                  v49 = v26;
                  v50 = v35;
                  LogPrintF();
                }

              }
              ++v25;
            }
            while (v23 != v25);
            v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
            v23 = v40;
          }
          while (v40);
        }

        objc_msgSend(v22, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "contentsOfDirectoryAtPath:error:", v41, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "count");

        v6 = v52;
        v9 = v53;
        v10 = v51;
        v11 = v54;
        if (!v43)
        {
          v44 = v59->_ucat->var0;
          if (v44 <= 50 && (v44 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          objc_msgSend(v58, "path", v49);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          objc_msgSend(v56, "removeItemAtPath:error:", v45, &v60);
          v19 = v60;

          if (v19)
          {
            v46 = v59->_ucat->var0;
            if (v46 <= 90 && (v46 != -1 || _LogCategory_Initialize()))
            {
              v49 = v19;
LABEL_24:
              LogPrintF();
            }
LABEL_64:

          }
        }

        v7 = 0;
        goto LABEL_66;
      }
      v13 = v59->_ucat->var0;
      if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
      {
        v49 = v12;
        LogPrintF();
      }
LABEL_66:
      ++v11;
    }
    while (v11 != v9);
    v47 = objc_msgSend(&unk_1E8262498, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    v9 = v47;
  }
  while (v47);

LABEL_73:
LABEL_74:
  v4 = v7;
LABEL_75:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)label
{
  return self->_label;
}

- (id)reportDeviceFoundHandler
{
  return self->_reportDeviceFoundHandler;
}

- (void)setReportDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)reportDeviceLostHandler
{
  return self->_reportDeviceLostHandler;
}

- (void)setReportDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_reportDeviceLostHandler, 0);
  objc_storeStrong(&self->_reportDeviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiQueue, 0);
  objc_storeStrong((id *)&self->_coreWiFiInterface, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_writeCoaleser, 0);
  objc_storeStrong((id *)&self->_networkSignature, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_pairedPeersMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);
}

@end
