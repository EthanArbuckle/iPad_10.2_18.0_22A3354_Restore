@implementation APRKStreamRenderingManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_sharedManager;
}

void __44__APRKStreamRenderingManager_sharedInstance__block_invoke()
{
  APRKStreamRenderingManager *v0;
  void *v1;

  if (IsAppleInternalBuild())
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LogControl();
  }
  v0 = objc_alloc_init(APRKStreamRenderingManager);
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = (uint64_t)v0;

}

+ (BOOL)getAppHasSetAdvertisingAccessModeEntitlement
{
  return 1;
}

+ (BOOL)setAdvertisingAccessMode:(unint64_t)a3 withError:(id *)a4
{
  int v6;
  int v7;
  int v8;

  if (+[APRKStreamRenderingManager getAppHasSetAdvertisingAccessModeEntitlement](APRKStreamRenderingManager, "getAppHasSetAdvertisingAccessModeEntitlement"))
  {
    if (!a3 || a3 == 3 || a3 == 1)
    {
      v6 = APSSettingsSetInt64();
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        v7 = APSSettingsRemoveValue();
        if (v7)
        {
          v8 = v7;
        }
        else
        {
          v8 = APSSettingsSetValue();
          if (!v8)
          {
            APSSettingsSynchronize();
            notify_post("com.apple.airplay.prefsChanged");
            goto LABEL_9;
          }
        }
      }
      APSLogErrorAt();
    }
    else
    {
      v8 = -6705;
      APSLogErrorAt();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = -6773;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v8, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v8 == 0;
}

+ (unint64_t)getAdvertisingAccessMode
{
  int v2;

  if (APSGetAccessControlConfig())
  {
    APSLogErrorAt();
  }
  else
  {
    v2 = APSGetP2PAllow();
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v2 == 1)
      return 0;
    if (!v2)
      return 1;
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return -1;
}

+ (void)setListeningForAlternateBonjourBrowsing:(BOOL)a3
{
  if (APSSettingsSetInt64()
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APSSettingsSynchronize();
  if (!a3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    notify_post("com.apple.airplay.alternatebonjourbrowsingdisabled");
  }
  notify_post("com.apple.airplay.prefsChanged");
}

+ (BOOL)listeningForAlternateBonjourBrowsing
{
  return APSSettingsGetInt64() != 0;
}

- (APRKStreamRenderingManager)init
{
  APRKStreamRenderingManager *v2;
  APRKStreamRenderingManager *v3;
  CGSize v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *isolationQueue;
  NSMutableArray *v7;
  NSMutableArray *renderersArray;
  dispatch_queue_t v9;
  OS_dispatch_queue *permittedClientsQueue;
  int IntWithDefault;
  AWDLActivator *v12;
  AWDLActivator *awdlActivator;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)APRKStreamRenderingManager;
  v2 = -[APRKStreamRenderingManager init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_server = 0;
    *(_DWORD *)&v2->_useCALayerForMirroring = 1;
    v2->_supportRemoteControl = 0;
    v4 = (CGSize)*MEMORY[0x24BDBF148];
    v2->_customDisplaySize = (CGSize)*MEMORY[0x24BDBF148];
    v2->_customDisplaySizeMax = v4;
    v5 = dispatch_queue_create("com.apple.aprkstreamrenderingmanager.isolationqueue", 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v5;

    objc_storeStrong((id *)&v3->_delegateQueue, MEMORY[0x24BDAC9B8]);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    renderersArray = v3->_renderersArray;
    v3->_renderersArray = v7;

    v3->_supportedModesMask = 0;
    v3->_maxNumberOfConcurrentSessions = 0;
    v3->_concurrentPlaybackPolicy = 0;
    *(_OWORD *)&v3->_displayHDRMode = xmmword_22E26EA20;
    *(_OWORD *)&v3->_permissionTimeout = xmmword_22E26EA30;
    v9 = dispatch_queue_create("com.apple.aprkstreamrenderingmanager.permissionqueue", 0);
    permittedClientsQueue = v3->_permittedClientsQueue;
    v3->_permittedClientsQueue = (OS_dispatch_queue *)v9;

    IntWithDefault = APSSettingsGetIntWithDefault();
    v3->_permissionEnabled = IntWithDefault == 0;
    if (IntWithDefault
      && gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = objc_alloc_init(AWDLActivator);
    awdlActivator = v3->_awdlActivator;
    v3->_awdlActivator = v12;

    v3->_preemptionPolicy = 0;
    v3->_useUniqueClientName = APSSettingsGetIntWithDefault() != 0;
  }
  return v3;
}

- (int)startReceiverServer
{
  return -[APRKStreamRenderingManager _startReceiverServerWithSupportedModesMask:](self, "_startReceiverServerWithSupportedModesMask:", 7);
}

- (int)stopReceiverServer
{
  void *v3;
  void *v4;
  int v5;
  AirPlayReceiverServerPrivate *server;

  if (!self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_17:
    LogPrintF();
    return 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverServerGetDispatchQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFObjectControlSync();

  AirPlayReceiverServerGetDispatchQueue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFObjectControlSync();

  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }
  -[AWDLActivator stop](self->_awdlActivator, "stop");
  if (!v5)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_17;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

- (id)rendererForUniqueID:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__APRKStreamRenderingManager_rendererForUniqueID___block_invoke;
    block[3] = &unk_24FA1BD60;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(isolationQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __50__APRKStreamRenderingManager_rendererForUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_rendererForUniqueIDInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)activeRenderersCount
{
  NSObject *isolationQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__APRKStreamRenderingManager_activeRenderersCount__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__APRKStreamRenderingManager_activeRenderersCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allClientNames
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__APRKStreamRenderingManager_allClientNames__block_invoke;
  v6[3] = &unk_24FA1C398;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __44__APRKStreamRenderingManager_allClientNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__APRKStreamRenderingManager_allClientNames__block_invoke_2;
  v4[3] = &unk_24FA1C370;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __44__APRKStreamRenderingManager_allClientNames__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "managedClientName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)allRenderers
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__APRKStreamRenderingManager_allRenderers__block_invoke;
  v6[3] = &unk_24FA1BDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__APRKStreamRenderingManager_allRenderers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)activeRenderers
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__APRKStreamRenderingManager_activeRenderers__block_invoke;
  v6[3] = &unk_24FA1BDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __45__APRKStreamRenderingManager_activeRenderers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setMaxNumberOfConcurrentSessions:(unint64_t)a3
{
  self->_maxNumberOfConcurrentSessions = a3;
}

- (void)setPreemptionPolicy:(unint64_t)a3
{
  self->_preemptionPolicy = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_server)
    AirPlayReceiverServerSetProperty();
}

- (void)setUseCALayerForMirroring:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_useCALayerForMirroring = a3;
}

- (BOOL)useCALayerForMirroring
{
  return self->_useCALayerForMirroring;
}

- (void)setOptimizeAudioRenderingLatency:(BOOL)a3
{
  self->_optimizeAudioRenderingLatency = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)optimizeAudioRenderingLatency
{
  return APSSettingsGetIntWithDefault() != 0;
}

- (void)setEnableMixingMediaAudio:(BOOL)a3
{
  self->_enableMixingMediaAudio = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)enableMixingMediaAudio
{
  return self->_enableMixingMediaAudio;
}

- (void)setCustomDisplaySizeMax:(CGSize)a3
{
  CGFloat v4;
  CGFloat v5;
  CFDictionaryRef DictionaryRepresentation;

  APSGetMaxSizePreservingAspectRatio();
  self->_customDisplaySizeMax.width = v4;
  self->_customDisplaySizeMax.height = v5;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_server)
  {
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_customDisplaySizeMax);
    AirPlayReceiverServerSetProperty();
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
}

- (void)setDisplayHDRMode:(unint64_t)a3
{
  -[APRKStreamRenderingManager _getHDRModeString:](self, "_getHDRModeString:");
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_displayHDRMode = a3;
  if (self->_server)
    AirPlayReceiverServerSetProperty();
}

- (unint64_t)displayHDRMode
{
  return self->_displayHDRMode;
}

- (unint64_t)airPlayVideoVersionSupport
{
  return self->_airPlayVideoVersionSupport;
}

- (void)setUsesHomeKitIntegration:(BOOL)a3
{
  _BOOL4 v3;
  int IntWithDefault;
  BOOL v6;

  v3 = a3;
  if (IsAppleInternalBuild())
  {
    IntWithDefault = APSSettingsGetIntWithDefault();
    if (IntWithDefault)
      v6 = 0;
    else
      v6 = v3;
    self->_usesHomeKitIntegration = v6;
    if (v3 && IntWithDefault)
    {
      if (gLogCategory_AirPlayReceiverKit > 50)
        return;
      if (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize())
        LogPrintF();
    }
  }
  else
  {
    self->_usesHomeKitIntegration = v3;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)usesHomeKitIntegration
{
  return self->_usesHomeKitIntegration;
}

- (void)setDemoModeEnabled:(BOOL)a3
{
  if (self->_server)
  {
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)demoModeEnabled
{
  AirPlayReceiverServerPrivate *server;

  server = self->_server;
  if (server)
    LOBYTE(server) = CFObjectGetPropertyInt64Sync() != 0;
  return (char)server;
}

- (void)setSupportsSenderUIEvents:(BOOL)a3
{
  if (self->_server)
  {
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)supportsSenderUIEvents
{
  AirPlayReceiverServerPrivate *server;

  server = self->_server;
  if (server)
    LOBYTE(server) = CFObjectGetPropertyInt64Sync() != 0;
  return (char)server;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (id)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setPermissionTimeout:(int64_t)a3
{
  self->_permissionTimeout = a3;
}

- (int64_t)permissionTimeout
{
  return self->_permissionTimeout;
}

- (int)forcePINRefresh
{
  if (!self->_server)
    return 0;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return AirPlayReceiverServerControl();
}

- (BOOL)systemSupportsWiFiUDM
{
  return APSSystemSupportsWiFiUDM() != 0;
}

- (BOOL)isAirPlayReceiverSupported
{
  if (isAirPlayReceiverSupported_once != -1)
    dispatch_once(&isAirPlayReceiverSupported_once, &__block_literal_global_102);
  return isAirPlayReceiverSupported_sIsReceiverSupported != 0;
}

uint64_t __56__APRKStreamRenderingManager_isAirPlayReceiverSupported__block_invoke()
{
  uint64_t result;

  if (APSIsVirtualMachine())
    result = IsAppleInternalBuild();
  else
    result = APSSystemSupportsWiFiUDM();
  isAirPlayReceiverSupported_sIsReceiverSupported = result;
  if (gLogCategory_AirPlayReceiverKit <= 50)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)setAltAdvertisingEnabled:(BOOL)a3
{
  self->_altAdvertisingEnabled = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)altAdvertisingEnabled
{
  return self->_altAdvertisingEnabled;
}

- (void)setAssistedModeEnabled:(BOOL)a3
{
  self->_assistedModeEnabled = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)assistedModeEnabled
{
  return self->_assistedModeEnabled;
}

- (id)assistedInfoForAWDL
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, sizeof(v10));
  if (!self->_assistedModeEnabled || !self->_server)
  {
    APSLogErrorAt();
    goto LABEL_10;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[AWDLActivator startWithMaxDuration:](self->_awdlActivator, "startWithMaxDuration:", 30);
  v3 = CUGetInterfaceAddresses();
  if ((_DWORD)v3)
  {
    v8 = v3;
LABEL_15:
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v9 = v8;
      LogPrintF();
    }
    goto LABEL_10;
  }
  v4 = SockAddrToString();
  if ((_DWORD)v4)
  {
    v8 = v4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[APRKStreamRenderingManager assistedInfoForIPAddress:](self, "assistedInfoForIPAddress:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_10:
    -[AWDLActivator stop](self->_awdlActivator, "stop", v9);
    v6 = 0;
  }
  return v6;
}

- (id)assistedInfoForIPAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  int v17;

  v4 = a3;
  v17 = 0;
  if (!self->_assistedModeEnabled || !self->_server)
  {
    APSLogErrorAt();
    v11 = 0;
    v5 = 0;
    v6 = 0;
LABEL_24:
    v12 = 0;
    goto LABEL_16;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v15 = v4;
    LogPrintF();
  }
  -[APRKStreamRenderingManager _setRandomPassword](self, "_setRandomPassword", v15);
  v5 = (void *)AirPlayReceiverServerCopyProperty();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = (void *)AirPlayReceiverServerCopyProperty();
  v8 = objc_msgSend(v7, "intValue");

  if ((int)v8 <= 0)
  {
    APSLogErrorAt();
    v11 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("NetworkPort"));

  objc_msgSend(v6, "setObject:forKey:", self->_passwordString, CFSTR("AuthString"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("NetworkAddress"));
  if (objc_msgSend(v4, "containsString:", CFSTR("%awdl")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("IsP2P"));

  }
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v11 = 0;
  }
LABEL_16:
  if (v17
    && gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v13 = v11;

  return v13;
}

- (id)assistedInfoForDiscovery
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  CFTypeRef cf;

  cf = 0;
  if (!self->_assistedModeEnabled || !self->_server)
  {
    APSLogErrorAt();
    v6 = 0;
    v9 = 0;
    v8 = 0;
    v4 = 0;
LABEL_29:
    v7 = 0;
    goto LABEL_16;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = Mutable;
  if (!Mutable)
  {
    APSLogErrorAt();
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = -6728;
    goto LABEL_16;
  }
  CFDictionarySetValue(Mutable, CFSTR("AssistedOverAWDL"), (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetInt64();
  AirPlayReceiverServerGetDispatchQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFObjectControlSync();

  if (v6)
  {
    APSLogErrorAt();
    v9 = 0;
    v8 = 0;
    goto LABEL_29;
  }
  -[APRKStreamRenderingManager _setRandomPassword](self, "_setRandomPassword");
  v7 = (void *)objc_msgSend((id)cf, "mutableCopy");
  objc_msgSend(v7, "setObject:forKey:", self->_passwordString, CFSTR("AuthString"));
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v9)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v6 = NSErrorToOSStatus();
    AirPlayReceiverServerGetDispatchQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFObjectControlSync();

    v8 = 0;
  }
  else
  {
    v6 = 0;
  }
LABEL_16:
  if (cf)
    CFRelease(cf);
  if (v4)
    CFRelease(v4);
  if (v6
    && gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v8;
}

- (id)assistedInfoForMode:(unint64_t)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    -[APRKStreamRenderingManager assistedInfoForDiscovery](self, "assistedInfoForDiscovery");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (void *)v11;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    -[APRKStreamRenderingManager assistedInfoForAWDL](self, "assistedInfoForAWDL");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
LABEL_12:
    LogPrintF();
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (!v6)
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("IPAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IPAddress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APRKStreamRenderingManager assistedInfoForIPAddress:](self, "assistedInfoForIPAddress:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v10;
}

- (void)setForcePermissionDialog:(BOOL)a3
{
  self->_forcePermissionDialog = a3;
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSetProperty();
  }
}

- (id)ensureUniqueClientName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = v4;
  if (v4)
  {
    v6 = v4;
    if (self->_useUniqueClientName)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = self->_renderersArray;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 1;
        v11 = v5;
        while (2)
        {
          v12 = *(_QWORD *)v18;
LABEL_6:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "managedClientName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v11);

            if ((v15 & 1) != 0)
              break;
            if (v9 == ++v13)
            {
              v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
              if (v9)
                goto LABEL_6;
              v6 = v11;
              goto LABEL_16;
            }
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%d"), v5, v10);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = (v10 + 1);
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v7 = self->_renderersArray;
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v11 = v6;
          if (v9)
            continue;
          break;
        }
      }
      else
      {
        v6 = v5;
      }
LABEL_16:

      if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0
        && gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

  return v6;
}

- (id)createStreamRendererWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *isolationQueue;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  OpaqueAPReceiverUIController *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[AWDLActivator stop](self->_awdlActivator, "stop");
  AirPlayReceiverServerGetDispatchQueue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFObjectControlSync();

  if (v8)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke;
    block[3] = &unk_24FA1C3E0;
    v17 = &v19;
    block[4] = self;
    v15 = v8;
    v16 = v9;
    v18 = a5;
    dispatch_sync(isolationQueue, block);

  }
  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  APRKStreamRenderer *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[6];

  objc_msgSend(*(id *)(a1 + 32), "_rendererForUniqueIDInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "ensureUniqueClientName:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[APRKStreamRenderer initWithUniqueID:clientName:UIController:useCALayerForMirroring:]([APRKStreamRenderer alloc], "initWithUniqueID:clientName:UIController:useCALayerForMirroring:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(NSObject **)(v9 + 32);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke_2;
      block[3] = &unk_24FA1C398;
      v11 = *(_QWORD *)(a1 + 56);
      block[4] = v9;
      block[5] = v11;
      dispatch_async(v10, block);
    }

  }
}

void __87__APRKStreamRenderingManager_createStreamRendererWithUniqueID_clientName_UIController___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartStreamingWithRenderer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)removeRendererWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  uint64_t v7;
  NSObject *delegateQueue;
  _QWORD v9[6];
  _QWORD block[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__1;
    v13[4] = __Block_byref_object_dispose__1;
    v14 = 0;
    isolationQueue = self->_isolationQueue;
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke;
    block[3] = &unk_24FA1BD60;
    v12 = v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(isolationQueue, block);
    delegateQueue = self->_delegateQueue;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke_2;
    v9[3] = &unk_24FA1C398;
    v9[4] = self;
    v9[5] = v13;
    dispatch_async(delegateQueue, v9);

    _Block_object_dispose(v13, 8);
  }

}

uint64_t __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_rendererForUniqueIDInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (gLogCategory_AirPlayReceiverKit <= 50)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void __57__APRKStreamRenderingManager_removeRendererWithUniqueID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStopStreamingWithRenderer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)setShouldForwardLayers:(BOOL)a3
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_shouldForwardLayers = a3;
}

- (BOOL)shouldForwardLayers
{
  return self->_shouldForwardLayers;
}

- (void)processShowGlobalPasscodePromptRequest:(id)a3 withClientName:(id)a4
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
  block[2] = __84__APRKStreamRenderingManager_processShowGlobalPasscodePromptRequest_withClientName___block_invoke;
  block[3] = &unk_24FA1BE98;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(delegateQueue, block);

}

void __84__APRKStreamRenderingManager_processShowGlobalPasscodePromptRequest_withClientName___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shouldShowGlobalPasscodeWithString:withClientName:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (void)processHideGlobalPasscodePromptRequest
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__APRKStreamRenderingManager_processHideGlobalPasscodePromptRequest__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __68__APRKStreamRenderingManager_processHideGlobalPasscodePromptRequest__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shouldHideGlobalPasscode");

  }
}

- (BOOL)isAllowedToProceedForClientWithName:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  dispatch_semaphore_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *delegateQueue;
  id v16;
  id v17;
  id v18;
  int64_t permissionTimeout;
  dispatch_time_t v20;
  BOOL v21;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  _QWORD aBlock[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v6 = a3;
  v7 = a4;
  if (self->_permissionEnabled)
  {
    -[APRKStreamRenderingManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = -[APRKStreamRenderingManager _isPermittedClient:](self, "_isPermittedClient:", v7);

      if (!v9)
      {
        v10 = dispatch_semaphore_create(0);
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 0;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke;
        aBlock[3] = &unk_24FA1C408;
        v36 = &v37;
        v13 = v10;
        v35 = v13;
        v14 = _Block_copy(aBlock);
        delegateQueue = self->_delegateQueue;
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_2;
        block[3] = &unk_24FA1C430;
        block[4] = self;
        v16 = v6;
        v31 = v16;
        v17 = v11;
        v32 = v17;
        v18 = v14;
        v33 = v18;
        dispatch_async(delegateQueue, block);
        permissionTimeout = self->_permissionTimeout;
        if (permissionTimeout < 0)
          v20 = -1;
        else
          v20 = dispatch_time(0, 1000000000 * permissionTimeout);
        if (dispatch_semaphore_wait(v13, v20))
        {
          if (gLogCategory_AirPlayReceiverKit <= 50
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            -[APRKStreamRenderingManager delegate](self, "delegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v16;
            LogPrintF();

          }
          -[APRKStreamRenderingManager delegate](self, "delegate", v26, v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_opt_respondsToSelector();

          if ((v24 & 1) != 0)
          {
            v25 = self->_delegateQueue;
            v28[0] = v12;
            v28[1] = 3221225472;
            v28[2] = __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_3;
            v28[3] = &unk_24FA1BD10;
            v28[4] = self;
            v29 = v17;
            dispatch_async(v25, v28);

          }
        }
        else if (*((_BYTE *)v38 + 24))
        {
          -[APRKStreamRenderingManager _addPermittedClient:](self, "_addPermittedClient:", v7);
          v21 = 1;
LABEL_24:

          _Block_object_dispose(&v37, 8);
          goto LABEL_8;
        }
        v21 = 0;
        goto LABEL_24;
      }
    }
    else
    {

    }
  }
  v21 = 1;
LABEL_8:
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v21;
}

intptr_t __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shouldAskPermissionWithRequestID:forClientWithName:withCompletionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __75__APRKStreamRenderingManager_isAllowedToProceedForClientWithName_clientID___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldCancelPermissionRequestWithRequestID:", *(_QWORD *)(a1 + 40));

}

- (__CFString)_getHDRModeString:(unint64_t)a3
{
  __CFString **v3;

  switch(a3)
  {
    case 3uLL:
      v3 = (__CFString **)MEMORY[0x24BDDD040];
      return *v3;
    case 2uLL:
      v3 = (__CFString **)MEMORY[0x24BDDD048];
      return *v3;
    case 1uLL:
      v3 = (__CFString **)MEMORY[0x24BDDD050];
      return *v3;
  }
  return 0;
}

- (int)_startReceiverServerWithSupportedModesMask:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int v14;
  const __CFAllocator *v15;
  CFNumberRef v16;
  __CFDictionary *Mutable;
  double v18;
  double v19;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v23;
  __CFString *v24;
  uint64_t v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  unint64_t concurrentPlaybackPolicy;
  const void *v31;
  int v32;
  void *v33;
  _QWORD block[5];
  uint64_t (*valuePtr)();
  CGSize v37;
  CGSize v38;

  valuePtr = UIControllerCreate;
  -[APRKStreamRenderingManager _customDisplaySizeFromPrefsWithDefault:](self, "_customDisplaySizeFromPrefsWithDefault:", self->_customDisplaySize.width, self->_customDisplaySize.height);
  v6 = v5;
  v8 = v7;
  -[APRKStreamRenderingManager _customDisplaySizeMaxFromPrefsWithDefault:](self, "_customDisplaySizeMaxFromPrefsWithDefault:", self->_customDisplaySizeMax.width, self->_customDisplaySizeMax.height);
  v10 = v9;
  v12 = v11;
  v13 = -[APRKStreamRenderingManager _customDisplayHDRModeFromPrefsWithDefault:](self, "_customDisplayHDRModeFromPrefsWithDefault:", self->_displayHDRMode);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  if (_startReceiverServerWithSupportedModesMask__onceToken != -1)
    dispatch_once(&_startReceiverServerWithSupportedModesMask__onceToken, block);
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v16 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v15, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE03100], v16);
  v18 = *MEMORY[0x24BDBF148];
  v19 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v6 != *MEMORY[0x24BDBF148] || v8 != v19)
  {
    v37.width = v6;
    v37.height = v8;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v37);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030C0], DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
  if (v10 != v18 || v12 != v19)
  {
    v38.width = v10;
    v38.height = v12;
    v23 = CGSizeCreateDictionaryRepresentation(v38);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030C8], v23);
    CFRelease(v23);
  }
  v24 = -[APRKStreamRenderingManager _getHDRModeString:](self, "_getHDRModeString:", v13);
  if (v24)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030B8], v24);
  if (a3)
  {
    self->_supportedModesMask = a3;
    v25 = APSFeaturesCreateMutable();
    if (!v25)
    {
      APSLogErrorAt();
      v14 = -6728;
      goto LABEL_93;
    }
    v26 = (const void *)v25;
    if ((a3 & 1) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
    }
    if ((a3 & 3) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
    }
    if ((a3 & 4) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSFeaturesSetFeature();
      APSFeaturesSetFeature();
      APSFeaturesSetFeature();
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030D8], v26);
    CFRelease(v26);
  }
  v27 = (const void *)*MEMORY[0x24BDBD270];
  v28 = (const void *)*MEMORY[0x24BDBD268];
  if (self->_usesHomeKitIntegration)
    v29 = (const void *)*MEMORY[0x24BDBD270];
  else
    v29 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE03118], v29);
  if (self->_maxNumberOfConcurrentSessions)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFDictionarySetInt64();
  }
  else if (gLogCategory_AirPlayReceiverKit <= 10
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  concurrentPlaybackPolicy = self->_concurrentPlaybackPolicy;
  if (concurrentPlaybackPolicy)
  {
    if (concurrentPlaybackPolicy == 1)
      v31 = v27;
    else
      v31 = v28;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030E8], v31);
  }
  if (self->_supportRemoteControl)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030F8], v27);
  if (self->_assistedModeEnabled)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030F0], v27);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE03110], v27);
  }
  if (self->_altAdvertisingEnabled)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE03108], v27);
  if (self->_enableMixingMediaAudio)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE030D0], v27);
  v32 = AirPlayReceiverServerCreate();
  if (v32)
  {
    v14 = v32;
    if (gLogCategory_AirPlayReceiverKit > 90
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_92;
    }
  }
  else
  {
    if (self->_assistedModeEnabled)
      -[APRKStreamRenderingManager _setRandomPassword](self, "_setRandomPassword");
    AirPlayReceiverServerGetDispatchQueue();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFObjectControlSync();

    if (!v14)
    {
      if (self->_preemptionPolicy)
        AirPlayReceiverServerSetProperty();
      if (self->_forcePermissionDialog)
      {
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        AirPlayReceiverServerSetProperty();
      }
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v14 = 0;
      goto LABEL_93;
    }
    if (gLogCategory_AirPlayReceiverKit > 90
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_92;
    }
  }
  LogPrintF();
LABEL_92:
  APSLogErrorAt();
LABEL_93:
  if (Mutable)
    CFRelease(Mutable);
  if (v16)
    CFRelease(v16);
  return v14;
}

uint64_t __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD handler[5];

  v2 = dispatch_queue_create("APRKAlternateBonjourBrowsingDisabledNotificationQueue", 0);
  v3 = (void *)_startReceiverServerWithSupportedModesMask__notificationQueue;
  _startReceiverServerWithSupportedModesMask__notificationQueue = (uint64_t)v2;

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke_2;
  handler[3] = &unk_24FA1C458;
  handler[4] = *(_QWORD *)(a1 + 32);
  return notify_register_dispatch("com.apple.airplay.alternatebonjourbrowsingdisabled", &_startReceiverServerWithSupportedModesMask__notifyOnceToken, (dispatch_queue_t)_startReceiverServerWithSupportedModesMask__notificationQueue, handler);
}

void __73__APRKStreamRenderingManager__startReceiverServerWithSupportedModesMask___block_invoke_2(uint64_t a1)
{
  const char *v2;
  const __CFString *v3;
  id v4;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v2 = "com.apple.airplay.alternatebonjourbrowsingdisabled";
    v3 = CFSTR("APRKAlternateBonjourBrowsingDisabled");
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("APRKAlternateBonjourBrowsingDisabled"), *(_QWORD *)(a1 + 32));

}

- (id)_rendererForUniqueIDInternal:(id)a3
{
  id v4;
  NSMutableArray *renderersArray;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  renderersArray = self->_renderersArray;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__APRKStreamRenderingManager__rendererForUniqueIDInternal___block_invoke;
  v9[3] = &unk_24FA1C480;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](renderersArray, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__APRKStreamRenderingManager__rendererForUniqueIDInternal___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_setPTPClockEnabled:(BOOL)a3
{
  if (self->_server)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSetProperty();
  }
}

- (CGSize)_customDisplaySizeFromPrefsWithDefault:(CGSize)a3
{
  double height;
  double width;
  int IntWithDefault;
  int v6;
  int v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  IntWithDefault = APSSettingsGetIntWithDefault();
  v6 = APSSettingsGetIntWithDefault();
  if (IntWithDefault > 0 || v6 >= 1)
  {
    v8 = v6;
    if (v6 <= 0)
    {
      v8 = (int)((double)IntWithDefault / 1.77777778);
    }
    else if (IntWithDefault <= 0)
    {
      IntWithDefault = (int)((double)v6 * 1.77777778);
    }
    width = (double)IntWithDefault;
    height = (double)v8;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_customDisplaySizeMaxFromPrefsWithDefault:(CGSize)a3
{
  double height;
  double width;
  int IntWithDefault;
  int v6;
  int v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  IntWithDefault = APSSettingsGetIntWithDefault();
  v6 = APSSettingsGetIntWithDefault();
  if (IntWithDefault > 0 || v6 >= 1)
  {
    v8 = v6;
    if (v6 <= 0)
    {
      v8 = (int)((double)IntWithDefault / 1.77777778);
    }
    else if (IntWithDefault <= 0)
    {
      IntWithDefault = (int)((double)v6 * 1.77777778);
    }
    width = (double)IntWithDefault;
    height = (double)v8;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (unint64_t)_customDisplayHDRModeFromPrefsWithDefault:(unint64_t)a3
{
  const void *v5;
  const void *v6;

  CFStringGetTypeID();
  v5 = (const void *)APSSettingsCopyValueEx();
  if (v5)
  {
    v6 = v5;
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDDD050]))
    {
      a3 = 1;
    }
    else if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDDD048]))
    {
      a3 = 2;
    }
    else if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDDD040]))
    {
      a3 = 3;
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      a3 = 0;
    }
    CFRelease(v6);
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    if (a3)
      -[APRKStreamRenderingManager _getHDRModeString:](self, "_getHDRModeString:", a3);
    LogPrintF();
  }
  return a3;
}

- (void)_initPermittedClients
{
  NSMutableDictionary *v3;
  NSMutableDictionary *permittedClients;
  OS_dispatch_source *v5;
  OS_dispatch_source *permissionGrantTimer;
  NSObject *v7;
  _QWORD handler[5];

  if (!self->_permittedClients)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    permittedClients = self->_permittedClients;
    self->_permittedClients = v3;

    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_permittedClientsQueue);
    permissionGrantTimer = self->_permissionGrantTimer;
    self->_permissionGrantTimer = v5;

    v7 = self->_permissionGrantTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __51__APRKStreamRenderingManager__initPermittedClients__block_invoke;
    handler[3] = &unk_24FA1BC70;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_permissionGrantTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume((dispatch_object_t)self->_permissionGrantTimer);
  }
}

uint64_t __51__APRKStreamRenderingManager__initPermittedClients__block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
}

- (BOOL)_isPermittedClient:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *permittedClientsQueue;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (!self->_forcePermissionDialog && v4 != 0)
  {
    permittedClientsQueue = self->_permittedClientsQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__APRKStreamRenderingManager__isPermittedClient___block_invoke;
    block[3] = &unk_24FA1C4A8;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_sync(permittedClientsQueue, block);

    v6 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __49__APRKStreamRenderingManager__isPermittedClient___block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_initPermittedClients");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v5, "doubleValue");
    v4 = *(_QWORD *)(a1 + 32);
    if (Current - v3 <= (double)*(uint64_t *)(v4 + 104))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    else
      objc_msgSend(*(id *)(v4 + 112), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_addPermittedClient:(id)a3
{
  id v4;
  NSObject *permittedClientsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    permittedClientsQueue = self->_permittedClientsQueue;
    block[1] = 3221225472;
    block[2] = __50__APRKStreamRenderingManager__addPermittedClient___block_invoke;
    block[3] = &unk_24FA1BD10;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(permittedClientsQueue, block);

    v4 = v6;
  }

}

void __50__APRKStreamRenderingManager__addPermittedClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_initPermittedClients");
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 128);
  v6 = dispatch_time(0, 1000000000 * *(_QWORD *)(v4 + 104));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_setRandomPassword
{
  void *v3;
  NSString *v4;
  NSString *passwordString;

  if (self->_server)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    passwordString = self->_passwordString;
    self->_passwordString = v4;

    if (AirPlayReceiverServerSetProperty())
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
LABEL_8:
        LogPrintF();
      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 30
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
}

- (APRKStreamRenderingManagerDelegate)delegate
{
  return (APRKStreamRenderingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)supportedModesMask
{
  return self->_supportedModesMask;
}

- (unint64_t)maxNumberOfConcurrentSessions
{
  return self->_maxNumberOfConcurrentSessions;
}

- (unint64_t)concurrentPlaybackPolicy
{
  return self->_concurrentPlaybackPolicy;
}

- (void)setConcurrentPlaybackPolicy:(unint64_t)a3
{
  self->_concurrentPlaybackPolicy = a3;
}

- (BOOL)supportRemoteControl
{
  return self->_supportRemoteControl;
}

- (void)setSupportRemoteControl:(BOOL)a3
{
  self->_supportRemoteControl = a3;
}

- (unint64_t)preemptionPolicy
{
  return self->_preemptionPolicy;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_awdlActivator, 0);
  objc_storeStrong((id *)&self->_passwordString, 0);
  objc_storeStrong((id *)&self->_permissionGrantTimer, 0);
  objc_storeStrong((id *)&self->_permittedClientsQueue, 0);
  objc_storeStrong((id *)&self->_permittedClients, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_renderersArray, 0);
}

@end
