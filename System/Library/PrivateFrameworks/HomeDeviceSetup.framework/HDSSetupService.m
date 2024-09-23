@implementation HDSSetupService

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (OS_os_log *)(id)signpostLog_log_0;
}

void __30__HDSSetupService_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (HDSSetupService)init
{
  HDSSetupService *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *wifiDispatchQueue;
  uint64_t v7;
  SUControllerManager *suControllerManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDSSetupService;
  v2 = -[HDSSetupService init](&v10, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("WiFiSetup", 0);
    wifiDispatchQueue = v2->_wifiDispatchQueue;
    v2->_wifiDispatchQueue = (OS_dispatch_queue *)v5;

    v2->_iTunesCloudCompleteToken = -1;
    v2->_timeAuto = -1;
    v2->_timeZoneAuto = -1;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEAE7A8]), "initWithDelegate:", v2);
    suControllerManager = v2->_suControllerManager;
    v2->_suControllerManager = (SUControllerManager *)v7;

  }
  return v2;
}

- (void)dealloc
{
  HDSSetupService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (HDSSetupService *)FatalErrorF();
    -[HDSSetupService _cleanup](v3, v4);
  }
  else
  {
    -[HDSSetupService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)HDSSetupService;
    -[HDSSetupService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id progressHandler;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HDSSetupService_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HDSSetupService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  uint64_t Int64;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  SFClient *v15;
  SFClient *sfClient;
  __WiFiManagerClient *v17;
  SFSiriClient *v18;
  SFSiriClient *siriClient;
  HMHomeManager *v20;
  HMHomeManager *homeManager;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;
  int v26;

  v26 = 0;
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  Int64 = CFPrefs_GetInt64();
  if (v26)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  self->_prefCDPEnabled = v5;
  v6 = CFPrefs_GetInt64();
  if (v26)
    v7 = 1;
  else
    v7 = v6 == 0;
  v8 = !v7;
  self->_wifiSetupEnabled = v8;
  v9 = CFPrefs_GetInt64();
  if (v26)
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = !v10;
  self->_identifyB238AsB520 = v11;
  v12 = CFPrefs_GetInt64();
  if (v26)
    v13 = 1;
  else
    v13 = v12 == 0;
  v14 = !v13;
  self->_shouldSetupAgentPlayBootTone = v14;
  if (!self->_sfClient)
  {
    v15 = (SFClient *)objc_alloc_init(MEMORY[0x24BE900E8]);
    sfClient = self->_sfClient;
    self->_sfClient = v15;

    -[SFClient activateAssertionWithIdentifier:](self->_sfClient, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventRepair"));
    -[SFClient preventExitForLocaleReason:](self->_sfClient, "preventExitForLocaleReason:", CFSTR("HomePod Setup"));
    objc_initWeak(&location, self->_sfClient);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __28__HDSSetupService__activate__block_invoke;
    v23[3] = &unk_24FCD47C8;
    objc_copyWeak(&v24, &location);
    -[SFClient setInterruptionHandler:](self->_sfClient, "setInterruptionHandler:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  if (self->_wifiSetupEnabled)
  {
    v17 = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_wifiManager = v17;
    if (v17)
    {
      WiFiManagerClientDisable();
    }
    else if (gLogCategory_HDSSetupService <= 60
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_siriClient)
  {
    v18 = (SFSiriClient *)objc_alloc_init(MEMORY[0x24BE901C8]);
    siriClient = self->_siriClient;
    self->_siriClient = v18;

    -[SFSiriClient setDispatchQueue:](self->_siriClient, "setDispatchQueue:", self->_dispatchQueue);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __28__HDSSetupService__activate__block_invoke_2;
    v22[3] = &unk_24FCD47F0;
    v22[4] = self;
    -[SFSiriClient setSiriDialogHandler:](self->_siriClient, "setSiriDialogHandler:", v22);
    -[SFSiriClient activate](self->_siriClient, "activate");
  }
  v20 = (HMHomeManager *)objc_msgSend(objc_alloc(getHMHomeManagerClass_0()), "initWithOptions:", 0);
  homeManager = self->_homeManager;
  self->_homeManager = v20;

  -[HDSSetupService _sfServiceStart](self, "_sfServiceStart");
}

void __28__HDSSetupService__activate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "preventExitForLocaleReason:", CFSTR("HomePod Setup"));

}

uint64_t __28__HDSSetupService__activate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSiriDialogIdentifier:", a2);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupService_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  OS_dispatch_source *finishApplyTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  RPCompanionLinkClient *companionLinkClient;
  SFService *sfService;
  SFSiriClient *siriClient;
  CUAudioPlayer *audioPlayer;
  SFClient *sfClient;
  ICCloudClient *icClient;
  void (**progressHandler)(id, uint64_t, _QWORD);

  if (!self->_invalidateCalled
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  finishApplyTimer = self->_finishApplyTimer;
  if (finishApplyTimer)
  {
    v4 = finishApplyTimer;
    dispatch_source_cancel(v4);
    v5 = self->_finishApplyTimer;
    self->_finishApplyTimer = 0;

  }
  if (self->_sfSession)
    -[HDSSetupService _handleSessionEnded:](self, "_handleSessionEnded:");
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  -[SFService invalidate](self->_sfService, "invalidate");
  sfService = self->_sfService;
  self->_sfService = 0;

  -[SFSiriClient invalidateWithFlags:](self->_siriClient, "invalidateWithFlags:", 32);
  siriClient = self->_siriClient;
  self->_siriClient = 0;

  if (self->_wifiManager)
  {
    WiFiManagerClientEnable();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  -[CUAudioPlayer invalidateWithFlags:](self->_audioPlayer, "invalidateWithFlags:", 1);
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  -[SFClient invalidate](self->_sfClient, "invalidate");
  sfClient = self->_sfClient;
  self->_sfClient = 0;

  icClient = self->_icClient;
  self->_icClient = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 20, 0);
  -[HDSSetupService _cleanup](self, "_cleanup");
}

- (void)_sfServiceStart
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  SFService *v6;
  SFService *sfService;
  uint64_t v8;
  uint64_t v9;
  SFService *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[16];

  if (!self->_sfService)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = -[HDSSetupService signpostID](self, "signpostID");
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SFServiceStart", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    v6 = (SFService *)objc_alloc_init(MEMORY[0x24BE901A8]);
    sfService = self->_sfService;
    self->_sfService = v6;

    if (self->_advertiseFast)
      -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
    -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
    -[SFService setIdentifier:](self->_sfService, "setIdentifier:", *MEMORY[0x24BE90398]);
    -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("HomePodSetup"));
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
    if (+[HDSDefaults disableNeedsSetup](HDSDefaults, "disableNeedsSetup")
      && isInternalBuild())
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
    }
    if (SFDeviceModelCodeGet())
      v8 = 33;
    else
      v8 = 11;
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", v8);
    if (self->_identifyB238AsB520)
      -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 33);
    -[SFService setPairSetupACL:](self->_sfService, "setPairSetupACL:", &unk_24FCE3B10);
    -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
    -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__HDSSetupService__sfServiceStart__block_invoke;
    v15[3] = &unk_24FCD4818;
    v15[4] = self;
    -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v15);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __34__HDSSetupService__sfServiceStart__block_invoke_222;
    v14[3] = &unk_24FCD4840;
    v14[4] = self;
    -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v14);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __34__HDSSetupService__sfServiceStart__block_invoke_224;
    v13[3] = &unk_24FCD4818;
    v13[4] = self;
    -[SFService setSessionSecuredHandler:](self->_sfService, "setSessionSecuredHandler:", v13);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __34__HDSSetupService__sfServiceStart__block_invoke_2;
    v12[3] = &unk_24FCD4868;
    v12[4] = self;
    -[SFService setReceivedRequestHandler:](self->_sfService, "setReceivedRequestHandler:", v12);
    v10 = self->_sfService;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __34__HDSSetupService__sfServiceStart__block_invoke_3;
    v11[3] = &unk_24FCD4138;
    v11[4] = self;
    -[SFService activateWithCompletion:](v10, "activateWithCompletion:", v11);
  }
}

void __34__HDSSetupService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetupSession", (const char *)&unk_22F7B8AEE, v7, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", v3);
}

void __34__HDSSetupService__sfServiceStart__block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SetupSession", (const char *)&unk_22F7B8AEE, v7, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", v3);
}

void __34__HDSSetupService__sfServiceStart__block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 70, 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 33, 0);
  }

}

uint64_t __34__HDSSetupService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRawRequest:flags:responseHandler:", a4, a3);
}

void __34__HDSSetupService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[8];
  const __CFString *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SFServiceStart", (const char *)&unk_22F7B8AEE, v13, 2u);
    }
  }

  v7 = v3;
  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v9 = *(_QWORD *)(v8 + 432);
    if (v9)
    {
      v14 = CFSTR("eo");
      v15 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, 30, v10);
LABEL_11:

    }
  }
  else
  {
    if (*(_BYTE *)(v8 + 208))
    {
      objc_msgSend((id)v8, "_playReadyToSetupSound");
      v8 = *(_QWORD *)(a1 + 32);
    }
    v11 = *(_QWORD *)(v8 + 432);
    if (v11)
    {
      v16 = CFSTR("PlayBootTone");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_BYTE *)(v8 + 208) == 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 10, v12);

      goto LABEL_11;
    }
  }

}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SFSession *sfSession;
  SFSession *v14;
  SFSession *v15;
  SFSession *v16;
  SFSession *v17;
  SFSession *v18;
  SFSession *v19;
  SFSession *v20;
  SFSession *v21;
  SFSession *v22;
  SFDeviceOperationHandlerCDPSetup *v23;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  SFDeviceOperationHandlerWiFiSetup *v25;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  SFDeviceOperationHandlerCNJSetup *v27;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  id v29;
  void *v30;
  void *v31;
  void (**progressHandler)(id, uint64_t, id);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  int v47;

  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession peer](*p_sfSession, "peer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    self->_peerFeatureFlags = 0;
    objc_storeStrong((id *)&self->_sfSession, a3);
    v8 = (void *)GestaltCopyAnswer();
    if ((unint64_t)objc_msgSend(v8, "length") < 4)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v35 = v8;
        LogPrintF();
      }
    }
    else
    {
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFService setFixedPIN:](self->_sfService, "setFixedPIN:", v9);

    }
    v47 = 1;
    v10 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkAudioServicesSetProperty[0])(1633907828, 0, 0, 4, (uint64_t)&v47);
    if ((_DWORD)v10)
    {
      if (gLogCategory_HDSSetupService <= 60)
      {
        v11 = (void *)v10;
        if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
        {
          v35 = v11;
          LogPrintF();
        }
      }
    }
    v12 = MEMORY[0x24BDAC760];
    sfSession = self->_sfSession;
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __41__HDSSetupService__handleSessionStarted___block_invoke;
    v46[3] = &unk_24FCD4690;
    v46[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_hds_hh2"), &unk_24FCE3B38, v46, v35);
    v14 = self->_sfSession;
    v45[0] = v12;
    v45[1] = 3221225472;
    v45[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_2;
    v45[3] = &unk_24FCD4690;
    v45[4] = self;
    -[SFSession registerRequestID:options:handler:](v14, "registerRequestID:options:handler:", CFSTR("unsetup_hp_sunosetup_cancel_su"), &unk_24FCE3B38, v45);
    v15 = self->_sfSession;
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_3;
    v44[3] = &unk_24FCD4690;
    v44[4] = self;
    -[SFSession registerRequestID:options:handler:](v15, "registerRequestID:options:handler:", CFSTR("_hds_ams_token"), &unk_24FCE3B38, v44);
    v16 = self->_sfSession;
    v43[0] = v12;
    v43[1] = 3221225472;
    v43[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_4;
    v43[3] = &unk_24FCD4690;
    v43[4] = self;
    -[SFSession registerRequestID:options:handler:](v16, "registerRequestID:options:handler:", CFSTR("_pa"), &unk_24FCE3B38, v43);
    v17 = self->_sfSession;
    v42[0] = v12;
    v42[1] = 3221225472;
    v42[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_5;
    v42[3] = &unk_24FCD4690;
    v42[4] = self;
    -[SFSession registerRequestID:options:handler:](v17, "registerRequestID:options:handler:", CFSTR("_dA"), &unk_24FCE3B38, v42);
    v18 = self->_sfSession;
    v41[0] = v12;
    v41[1] = 3221225472;
    v41[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_6;
    v41[3] = &unk_24FCD4690;
    v41[4] = self;
    -[SFSession registerRequestID:options:handler:](v18, "registerRequestID:options:handler:", CFSTR("_aa"), &unk_24FCE3B38, v41);
    v19 = self->_sfSession;
    v40[0] = v12;
    v40[1] = 3221225472;
    v40[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_7;
    v40[3] = &unk_24FCD4690;
    v40[4] = self;
    -[SFSession registerRequestID:options:handler:](v19, "registerRequestID:options:handler:", CFSTR("_pvoice"), &unk_24FCE3B38, v40);
    v20 = self->_sfSession;
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_8;
    v39[3] = &unk_24FCD4690;
    v39[4] = self;
    -[SFSession registerRequestID:options:handler:](v20, "registerRequestID:options:handler:", CFSTR("_hds_fu"), &unk_24FCE3B38, v39);
    v21 = self->_sfSession;
    v38[0] = v12;
    v38[1] = 3221225472;
    v38[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_9;
    v38[3] = &unk_24FCD4690;
    v38[4] = self;
    -[SFSession registerRequestID:options:handler:](v21, "registerRequestID:options:handler:", CFSTR("_hds_hp_js"), &unk_24FCE3B38, v38);
    v22 = self->_sfSession;
    v37[0] = v12;
    v37[1] = 3221225472;
    v37[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_10;
    v37[3] = &unk_24FCD4690;
    v37[4] = self;
    -[SFSession registerRequestID:options:handler:](v22, "registerRequestID:options:handler:", CFSTR("sysdrop_sys_start"), &unk_24FCE3B38, v37);
    if (self->_prefCDPEnabled)
    {
      v23 = (SFDeviceOperationHandlerCDPSetup *)objc_alloc_init(MEMORY[0x24BE90140]);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v23;

      -[SFDeviceOperationHandlerCDPSetup setDispatchQueue:](self->_cdpSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHandlerCDPSetup setSfSession:](self->_cdpSetupHandler, "setSfSession:", v5);
      -[SFDeviceOperationHandlerCDPSetup activate](self->_cdpSetupHandler, "activate");
    }
    v25 = (SFDeviceOperationHandlerWiFiSetup *)objc_alloc_init(MEMORY[0x24BE90150]);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v25;

    -[SFDeviceOperationHandlerWiFiSetup setDispatchQueue:](self->_wifiSetupHandler, "setDispatchQueue:", self->_wifiDispatchQueue);
    -[SFDeviceOperationHandlerWiFiSetup setSfSession:](self->_wifiSetupHandler, "setSfSession:", v5);
    -[SFDeviceOperationHandlerWiFiSetup activate](self->_wifiSetupHandler, "activate");
    v27 = (SFDeviceOperationHandlerCNJSetup *)objc_alloc_init(MEMORY[0x24BE90148]);
    captiveNetworkHandler = self->_captiveNetworkHandler;
    self->_captiveNetworkHandler = v27;

    -[SFDeviceOperationHandlerCNJSetup setDispatchQueue:](self->_captiveNetworkHandler, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceOperationHandlerCNJSetup setSfSession:](self->_captiveNetworkHandler, "setSfSession:", v5);
    -[SFDeviceOperationHandlerCNJSetup activate](self->_captiveNetworkHandler, "activate");
    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[SFSession trSession](self->_sfSession, "trSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("trSession"));
    objc_msgSend(v5, "messageSessionTemplate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("mst"));
    }
    else if (gLogCategory_HDSSetupService <= 60
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 31, v29);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
    if (self->_homeManager)
    {
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "aa_primaryAppleAccount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        -[HMHomeManager removeAllHomeKitPairingIdentities](self->_homeManager, "removeAllHomeKitPairingIdentities");
        if (gLogCategory_HDSSetupService <= 30
          && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }

  }
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runHomeKitSetupMode:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePurgeSUNoSetup:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAMSTokenImportActionRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreAuthRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceActivationRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthActionRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleVoicePreviewRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSUNoSetupScanRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCheckHomePodForJS:responseHandler:");
}

void __41__HDSSetupService__handleSessionStarted___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleStartSysDrop:responseHandler:", v7, v8);

}

- (void)_runHomeKitSetupMode:(id)a3 responseHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorWithOSStatusF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v6, 0, 0);

}

- (void)_handlePurgeSUNoSetup:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSSetupService suControllerManager](self, "suControllerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HDSSetupService suControllerManager](self, "suControllerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke;
    v11[3] = &unk_24FCD48B8;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v9, "managerStatus:", v11);

  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v10, 0, 0);

  }
}

void __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (gLogCategory_HDSSetupService > 90
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "updateState") == 9 || objc_msgSend(v7, "updateState") == 10)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "updateState") != 1 && objc_msgSend(v7, "updateState") != 17)
  {
    objc_msgSend(*(id *)(a1 + 32), "suControllerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke_2;
    v11[3] = &unk_24FCD4890;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v10, "purgeUpdate:completion:", v8, v11);

    goto LABEL_19;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_9:
    LogPrintF();
  }
LABEL_18:
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
LABEL_19:

}

void __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSSetupService > 90
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
LABEL_7:
    LogPrintF();
    goto LABEL_11;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
LABEL_11:
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFSession *v5;
  SysDropService *sysDropService;
  SysDropService *v7;
  APCPlayer *apcPlayer;
  APCPlayer *v9;
  RPCompanionLinkClient *companionLinkClient;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  OS_dispatch_semaphore *semaForScanFoundSU;
  NSError *errorForScanSUNoSetup;
  SFSession *v17;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void (**v19)(id, uint64_t, _QWORD);
  void (**v20)(id, uint64_t, _QWORD);
  void *v21;
  _QWORD v22[5];

  sfSession = (SFSession *)a3;
  v5 = sfSession;
  if (self->_sfSession != sfSession)
    goto LABEL_2;
  if (sfSession && gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_8;
      sfSession = self->_sfSession;
    }
    -[SFSession peer](sfSession, "peer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_8:
  sysDropService = self->_sysDropService;
  if (sysDropService)
  {
    -[SysDropService invalidate](sysDropService, "invalidate");
    v7 = self->_sysDropService;
  }
  else
  {
    v7 = 0;
  }
  self->_sysDropService = 0;

  apcPlayer = self->_apcPlayer;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __39__HDSSetupService__handleSessionEnded___block_invoke;
  v22[3] = &unk_24FCD3FE8;
  v22[4] = self;
  -[APCPlayer stopSend:withCompletion:](apcPlayer, "stopSend:withCompletion:", 0, v22);
  v9 = self->_apcPlayer;
  self->_apcPlayer = 0;

  if (self->_siriClient)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFSiriClient stopSpeaking](self->_siriClient, "stopSpeaking", v21);
  }
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate", v21);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  if (self->_siriDidDeviceSetup)
  {
    -[SFSiriClient deviceSetupEnd](self->_siriClient, "deviceSetupEnd");
    self->_siriDidDeviceSetup = 0;
  }
  -[SFDeviceOperationHandlerWiFiSetup invalidate](self->_wifiSetupHandler, "invalidate");
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  -[SFDeviceOperationHandlerCNJSetup invalidate](self->_captiveNetworkHandler, "invalidate");
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  -[SFDeviceOperationHandlerCDPSetup invalidate](self->_cdpSetupHandler, "invalidate");
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  semaForScanFoundSU = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = 0;

  errorForScanSUNoSetup = self->_errorForScanSUNoSetup;
  self->_errorForScanSUNoSetup = 0;

  self->_canCompanionShowHomePodSU = 0;
  v17 = self->_sfSession;
  self->_sfSession = 0;

  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", !self->_finished);
  if (+[HDSDefaults disableNeedsSetup](HDSDefaults, "disableNeedsSetup")
    && isInternalBuild())
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
  }
  if (self->_finished && !self->_finishedEventSent)
  {
    self->_finishedEventSent = 1;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 96, 0);
  }
  v19 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (v19)
    v19[2](v19, 32, 0);
  if (self->_finished)
    self->_finishSessionEnded = 1;
  if (self->_finished2)
  {
    v20 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (v20)
      v20[2](v20, 100, 0);
  }
LABEL_2:

}

uint64_t __39__HDSSetupService__handleSessionEnded___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 710, 0);
  return result;
}

- (void)_handleAuthActionRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t Int64Ranged;
  const char *v10;
  APCPlayer *apcPlayer;
  APCPlayer *v12;
  id v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v13 = v6;
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 6)
      v10 = "?";
    else
      v10 = off_24FCD4CC0[(int)Int64Ranged];
    v13 = (id)v10;
    LogPrintF();
  }
  switch((int)Int64Ranged)
  {
    case 1:
      -[HDSSetupService _handleAuthActionAudioPasscodeInit:response:](self, "_handleAuthActionAudioPasscodeInit:response:", v6, v8);
      goto LABEL_29;
    case 2:
      -[HDSSetupService _handleAuthActionAudioPasscodeStartWithResponse:](self, "_handleAuthActionAudioPasscodeStartWithResponse:", v8);
      goto LABEL_29;
    case 3:
      apcPlayer = self->_apcPlayer;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __60__HDSSetupService__handleAuthActionRequest_responseHandler___block_invoke;
      v14[3] = &unk_24FCD3FE8;
      v14[4] = self;
      -[APCPlayer stopSend:withCompletion:](apcPlayer, "stopSend:withCompletion:", 0, v14);
      v12 = self->_apcPlayer;
      self->_apcPlayer = 0;

      goto LABEL_29;
    case 4:
      -[HDSSetupService _handleAuthActionSiriInit:](self, "_handleAuthActionSiriInit:", v6);
      goto LABEL_29;
    case 5:
      -[HDSSetupService _handleAuthActionSiriStart:response:responseHandler:](self, "_handleAuthActionSiriStart:response:responseHandler:", v6, v8, v7);
      goto LABEL_34;
    case 6:
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFSiriClient stopSpeaking](self->_siriClient, "stopSpeaking", v13);
      goto LABEL_29;
    default:
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v13 = (id)Int64Ranged;
        LogPrintF();
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24FCE3E30, CFSTR("er"), v13);
LABEL_29:
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);
LABEL_34:

      return;
  }
}

uint64_t __60__HDSSetupService__handleAuthActionRequest_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 710, 0);
  return result;
}

- (void)_handleAuthActionAudioPasscodeInit:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  NSData *v8;
  NSData **p_apcCapData;
  APCPlayer *apcPlayer;
  APCPlayer *v11;
  APCPlayer *v12;
  APCPlayer *v13;
  int v14;
  void *v16;
  int v17;
  char *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  APCPlayer *v23;
  char *v24;
  char *v25;
  APCPlayer *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  id v33;
  __int16 v34;
  char v35;
  _QWORD v36[5];
  char __str[8];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  p_apcCapData = &self->_apcCapData;
  if (v8)
  {
    objc_storeStrong((id *)p_apcCapData, v8);
  }
  else
  {
    v8 = *p_apcCapData;
    if (!v8)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v27 = 0;
      v30 = 4294960591;
      goto LABEL_54;
    }
  }
  apcPlayer = self->_apcPlayer;
  if (apcPlayer)
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __63__HDSSetupService__handleAuthActionAudioPasscodeInit_response___block_invoke;
    v36[3] = &unk_24FCD3FE8;
    v36[4] = self;
    -[APCPlayer stopSend:withCompletion:](apcPlayer, "stopSend:withCompletion:", 1, v36);
  }
  v11 = (APCPlayer *)objc_msgSend(objc_alloc(getAPCPlayerClass()), "initWithListenerCapabilityData:payloadLength:", v8, 3);
  v12 = self->_apcPlayer;
  self->_apcPlayer = v11;

  v13 = self->_apcPlayer;
  if (!v13)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v27 = 0;
    v30 = 4294960564;
    goto LABEL_54;
  }
  -[APCPlayer setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
  __str[0] = 0;
  v14 = 298;
  do
    RandomString();
  while (__str[0] == 48 && v14-- != 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __str);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFService setFixedPIN:](self->_sfService, "setFixedPIN:", v16);

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v17 = IsAppleInternalBuild();
    v18 = "*";
    if (v17)
      v18 = __str;
    v31 = v18;
    LogPrintF();
  }
  v19 = strtoul(__str, 0, 10);
  v34 = v19;
  v35 = BYTE2(v19);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v34, 3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HomeDeviceSetup"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLForResource:withExtension:", CFSTR("HomePodPasscode-b238.m4a"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = self->_apcPlayer;
    v33 = 0;
    -[APCPlayer preparePayload:usingCarrierAtURL:error:](v23, "preparePayload:usingCarrierAtURL:error:", v20, v22, &v33);
    v24 = (char *)v33;
  }
  else
  {
    NSErrorWithOSStatusF();
    v24 = (char *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  if (v24)
  {
    if (gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v31 = v25;
      LogPrintF();
    }
    v26 = self->_apcPlayer;
    v32 = v25;
    -[APCPlayer preparePayload:usingCarrierAsset:error:](v26, "preparePayload:usingCarrierAsset:error:", v20, 3, &v32, v31);
    v27 = v32;

    if (v27)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v31 = v27;
        LogPrintF();
      }
      goto LABEL_51;
    }
  }
  -[APCPlayer configurationData](self->_apcPlayer, "configurationData", v31);
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v27 = 0;
LABEL_51:
    v30 = 4294960596;
LABEL_54:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("er"));
    goto LABEL_34;
  }
  v29 = (void *)v28;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("apcPC"));
  v27 = 0;
LABEL_34:

}

uint64_t __63__HDSSetupService__handleAuthActionAudioPasscodeInit_response___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 710, 0);
  return result;
}

- (void)_handleAuthActionAudioPasscodeStartWithResponse:(id)a3
{
  id v4;
  APCPlayer *apcPlayer;
  void (**progressHandler)(id, uint64_t, _QWORD);
  NSData *v7;
  APCPlayer *v8;
  APCPlayer *v9;
  APCPlayer *v10;
  id v11;
  const char *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  APCPlayer *v17;
  id v18;
  uint64_t v19;
  APCPlayer *v20;
  id v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int16 v27;
  char v28;

  v4 = a3;
  apcPlayer = self->_apcPlayer;
  if (apcPlayer)
  {
LABEL_2:
    -[APCPlayer startSend](apcPlayer, "startSend", v24);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 60, 0);
    goto LABEL_23;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = self->_apcCapData;
  if (v7)
  {
    v8 = (APCPlayer *)objc_msgSend(objc_alloc(getAPCPlayerClass()), "initWithListenerCapabilityData:payloadLength:", v7, 3);
    v9 = self->_apcPlayer;
    self->_apcPlayer = v8;

    v10 = self->_apcPlayer;
    if (v10)
    {
      -[APCPlayer setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
      -[SFService fixedPIN](self->_sfService, "fixedPIN");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "UTF8String");

      if (v12)
      {
        v13 = strtoul(v12, 0, 10);
        v27 = v13;
        v28 = BYTE2(v13);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v27, 3);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HomeDeviceSetup"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLForResource:withExtension:", CFSTR("HomePodPasscode-b238.m4a"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = self->_apcPlayer;
          v26 = 0;
          -[APCPlayer preparePayload:usingCarrierAtURL:error:](v17, "preparePayload:usingCarrierAtURL:error:", v14, v16, &v26);
          v18 = v26;
        }
        else
        {
          NSErrorWithOSStatusF();
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = (uint64_t)v18;
        if (v18)
        {
          v20 = self->_apcPlayer;
          v25 = (id)v19;
          -[APCPlayer preparePayload:usingCarrierAsset:error:](v20, "preparePayload:usingCarrierAsset:error:", v14, 3, &v25);
          v21 = v25;

          if (v21)
          {
            if (gLogCategory_HDSSetupService <= 60
              && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
            {
              v24 = v21;
              LogPrintF();
            }
            v22 = 8;
            v19 = 4294960596;
            goto LABEL_19;
          }
          v19 = 0;
        }
        else
        {
          v21 = 0;
        }
        v22 = 0;
LABEL_19:

        goto LABEL_20;
      }
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v21 = 0;
      v14 = 0;
      v22 = 8;
      v19 = 4294960551;
    }
    else
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v21 = 0;
      v14 = 0;
      v22 = 8;
      v19 = 4294960564;
    }
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v21 = 0;
    v14 = 0;
    v22 = 8;
    v19 = 4294960591;
  }
LABEL_20:

  if (!v22)
  {
    apcPlayer = self->_apcPlayer;
    goto LABEL_2;
  }
  if ((_DWORD)v19)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("er"));

  }
LABEL_23:

}

- (void)_handleAuthActionSiriInit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BYTE v8[5];

  v4 = a3;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8[0] = 0;
  RandomString();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFService setFixedPIN:](self->_sfService, "setFixedPIN:", v5);

  if (IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      CFStringGetTypeID();
      v7 = CFPrefs_CopyTypedValue();

      v6 = (void *)v7;
    }
    if (objc_msgSend(v6, "length"))
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFService setFixedPIN:](self->_sfService, "setFixedPIN:", v6);
    }

  }
}

- (void)_handleAuthActionSiriStart:(id)a3 response:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  SFSiriClient *siriClient;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v20 = v8;
    LogPrintF();
  }
  -[SFService fixedPIN](self->_sfService, "fixedPIN", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "length") <= 3)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v21 = v11;
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4294960551, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("er"));

    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v9);
  }
  else
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFDictionaryGetInt64Ranged() << 32;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == 0x200000000)
      v16 = 64;
    else
      v16 = 192;
    if (v14 == 0x100000000)
      v17 = 128;
    else
      v17 = v16;
    if (v12
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v13
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v15
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    siriClient = self->_siriClient;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __71__HDSSetupService__handleAuthActionSiriStart_response_responseHandler___block_invoke;
    v22[3] = &unk_24FCD4668;
    v23 = v9;
    v24 = v10;
    -[SFSiriClient speakPasscode:instructions:languageCode:voiceName:flags:completion:](siriClient, "speakPasscode:instructions:languageCode:voiceName:flags:completion:", v11, v12, v13, v15, v17, v22);

  }
}

uint64_t __71__HDSSetupService__handleAuthActionSiriStart_response_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", NSErrorToOSStatus());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("er"));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int)_handleBasicConfigRequest:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  APCPlayer *apcPlayer;
  APCPlayer *v10;
  uint64_t Int64;
  uint64_t v12;
  const char *v13;
  double v14;
  double v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  int Int64Ranged;
  double v29;
  double v30;
  uint64_t v31;
  CFStringRef *v32;
  uint64_t v33;
  NSString *v34;
  NSString *languageCode;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  NSString *localeIdentifier;
  NSString *v41;
  NSString *v42;
  NSString *temperatureUnit;
  uint64_t v44;
  int v45;
  NSString *v46;
  NSString *siriListenLanguage;
  NSString *v48;
  NSString *siriVoiceLanguage;
  NSString *v50;
  NSString *siriVoiceName;
  NSDate *v52;
  NSDate *timeObj;
  uint64_t TMSourceProxBuddy;
  double v55;
  int v56;
  NSString *v57;
  NSString *timeZone;
  _BOOL4 v59;
  int v60;
  HMDeviceSetupOperationHandler *v61;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  HMDeviceSetupOperationHandler *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  unint64_t v74;
  os_signpost_id_t v75;
  void (**progressHandler)(id, uint64_t, id);
  const __CFString *v78;
  const char *v79;
  uint64_t v80;
  _QWORD block[4];
  id v82;
  BOOL v83;
  _QWORD v84[5];
  uint8_t buf[12];
  unsigned int v86;

  v4 = a3;
  v86 = 0;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HDSSetupService signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v8 = MEMORY[0x24BDAC760];
  apcPlayer = self->_apcPlayer;
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __45__HDSSetupService__handleBasicConfigRequest___block_invoke;
  v84[3] = &unk_24FCD3FE8;
  v84[4] = self;
  -[APCPlayer stopSend:withCompletion:](apcPlayer, "stopSend:withCompletion:", 0, v84);
  v10 = self->_apcPlayer;
  self->_apcPlayer = 0;

  Int64 = CFDictionaryGetInt64();
  v12 = Int64;
  if (!v86)
    ((void (*)(uint64_t))softLink_AXSVoiceOverTouchSetEnabled[0])(Int64 != 0);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v13 = "no";
    if (v12)
      v13 = "yes";
    v79 = v13;
    v80 = v86;
    v78 = CFSTR("voe");
    LogPrintF();
  }
  CFDictionaryGetDouble();
  v15 = v14;
  if (!v86)
  {
    v16 = v14;
    ((void (*)(float))softLink_AXSVoiceOverTouchSetSpeakingRate[0])(v16);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v80 = v86;
    v79 = *(const char **)&v15;
    v78 = CFSTR("vosr");
    LogPrintF();
  }
  -[objc_class sharedInstance](getAXSettingsClass(), "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFDictionaryGetInt64();
  v19 = v18;
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsEnabled:", v18 != 0, v78, v79, v80);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v20 = "no";
    if (v19)
      v20 = "yes";
    v79 = v20;
    v80 = v86;
    v78 = CFSTR("taE");
    LogPrintF();
  }
  v21 = CFDictionaryGetInt64();
  v22 = v21;
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsHoldDurationEnabled:", v21 != 0, v78, v79, v80);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v23 = "no";
    if (v22)
      v23 = "yes";
    v79 = v23;
    v80 = v86;
    v78 = CFSTR("taHE");
    LogPrintF();
  }
  CFDictionaryGetDouble();
  v25 = v24;
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsHoldDuration:", v24);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v80 = v86;
    v79 = *(const char **)&v25;
    v78 = CFSTR("taHD");
    LogPrintF();
  }
  v26 = CFDictionaryGetInt64();
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsIgnoreRepeatEnabled:", v26 != 0, v78, v79, v80);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsIgnoreRepeatDuration:", v27);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsTapActivationMethod:", Int64Ranged);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v86)
    objc_msgSend(v17, "setTouchAccommodationsTapActivationTimeout:", v29);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v86)
    objc_msgSend(v17, "setVoiceOverDoubleTapInterval:", v30);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v31 = CFDictionaryGetInt64();
  v32 = (CFStringRef *)MEMORY[0x24BDBD568];
  if (v31)
  {
    CFPrefs_SetValue();
    CFPrefs_SetInt64();
    CFPreferencesSetValue(CFSTR("AcceptProfileServicePayloadOnHomePod"), (CFPropertyListRef)*MEMORY[0x24BDBD270], *v32, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFDictionaryGetInt64Ranged())
    CFPrefs_SetInt64();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v33 = CFDictionaryGetInt64();
  if (!v86)
    -[objc_class setLocationServicesEnabled:](getCLLocationManagerClass(), "setLocationServicesEnabled:", v33 != 0);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v34;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v86)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    v37 = self->_languageCode;
    self->_languageCode = v36;

    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v38 = self->_languageCode;
  if (v38)
    CFPreferencesSetAppValue(CFSTR("AppleLanguageCodeSetup"), v38, *v32);

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v39;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v41 = self->_localeIdentifier;
  if (v41)
    CFPreferencesSetAppValue(CFSTR("AppleLocaleSetup"), v41, *v32);

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  temperatureUnit = self->_temperatureUnit;
  self->_temperatureUnit = v42;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFPreferencesAppSynchronize(*v32);
  if (-[SFSession sharingSourceVersion](self->_sfSession, "sharingSourceVersion") - 16300101 > 0x13D5BA)
  {
    self->_siriDataSharingDeviceIsValid = 1;
    v44 = CFDictionaryGetInt64();
    if (!v86)
    {
      if (v44)
        v45 = 6;
      else
        v45 = 5;
      self->_siriDataSharingState = v45;
    }
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_siriDataSharingDeviceIsValid = 0;
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_siriDataSharingState = 5;
  }
  self->_siriDisabled = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriListenLanguage = self->_siriListenLanguage;
  self->_siriListenLanguage = v46;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_siriVoiceGender = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v48 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriVoiceLanguage = self->_siriVoiceLanguage;
  self->_siriVoiceLanguage = v48;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriVoiceName = self->_siriVoiceName;
  self->_siriVoiceName = v50;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v52 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timeObj = self->_timeObj;
  self->_timeObj = v52;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_timeObj)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      getTMSourceProxBuddy();
      LogPrintF();
    }
    TMSourceProxBuddy = getTMSourceProxBuddy();
    -[NSDate timeIntervalSinceReferenceDate](self->_timeObj, "timeIntervalSinceReferenceDate");
    ((void (*)(uint64_t, double, double))softLinkTMSetSourceTime[0])(TMSourceProxBuddy, v55, 10.0);
  }
  v56 = CFDictionaryGetInt64() != 0;
  if (v86)
    v56 = -1;
  self->_timeAuto = v56;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_timeCycle = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v57 = (NSString *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v57;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v59 = CFDictionaryGetInt64() != 0;
  if (v86)
    v60 = -1;
  else
    v60 = v59;
  self->_timeZoneAuto = v60;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v61 = (HMDeviceSetupOperationHandler *)objc_alloc_init(getHMDeviceSetupOperationHandlerClass());
  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = v61;

  v63 = self->_homeKitSetupHandler;
  -[SFSession trSession](self->_sfSession, "trSession");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDeviceSetupOperationHandler registerMessageHandlersForSession:](v63, "registerMessageHandlersForSession:", v64);

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v65 = CFDictionaryGetInt64();
  if (self->_languageCode)
  {
    v66 = v65;
    -[objc_class sharedPreferences](getVTPreferencesClass(), "sharedPreferences");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isCompactVoiceTriggerAvailableForLanguageCode:", self->_languageCode);

    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v68)
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[objc_class sharedPreferences](getVTPreferencesClass(), "sharedPreferences");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setUserPreferredVoiceTriggerPhraseType:sender:deviceType:endpointId:", v66 != 0, self, 0, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70
        && gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
  dispatch_get_global_queue(0, 0);
  v71 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __45__HDSSetupService__handleBasicConfigRequest___block_invoke_2;
  block[3] = &unk_24FCD4268;
  v72 = v4;
  v82 = v72;
  v83 = v59;
  dispatch_async(v71, block);

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = -[HDSSetupService signpostID](self, "signpostID");
  if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v75 = v74;
    if (os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v73, OS_SIGNPOST_INTERVAL_END, v75, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 80, v72);

  return 0;
}

uint64_t __45__HDSSetupService__handleBasicConfigRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 710, 0);
  return result;
}

void __45__HDSSetupService__handleBasicConfigRequest___block_invoke_2(uint64_t a1)
{
  uint64_t Int64;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;

  Int64 = CFDictionaryGetInt64();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBoolValue:forSetting:", Int64 != 0, *MEMORY[0x24BE63918]);

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v4 = "no";
    if (Int64)
      v4 = "yes";
    v9 = v4;
    v10 = 0;
    v8 = CFSTR("eca");
    LogPrintF();
  }
  v5 = CFDictionaryGetInt64();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection", v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBoolValue:forSetting:", v5 != 0, *MEMORY[0x24BE638E0]);

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetInt64();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBoolValue:forSetting:", *(unsigned __int8 *)(a1 + 40), *MEMORY[0x24BE63A20]);

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleBasicConfigResponse:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_HDSSetupService <= 30
    && ((v6 = v3, gLogCategory_HDSSetupService != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    objc_msgSend(v4, "count");
    LogPrintF();

  }
  else
  {

  }
}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[HDSSetupService signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_finishSessionEnded = 0;
  -[HDSSetupService _handleFinishApply:responseHandler:](self, "_handleFinishApply:responseHandler:", v6, v7);

}

- (void)_handleFinishApply:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSString *timeZone;
  CFPropertyListRef *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  int64_t v16;
  CFPropertyListRef v17;
  CFPropertyListRef v18;
  const __CFString *v19;
  NSString *languageCode;
  NSString *v21;
  int v22;
  void *v23;
  void *v24;
  NSString *localeIdentifier;
  _BOOL4 v26;
  NSString *v27;
  int v28;
  NSString *temperatureUnit;
  int v30;
  void (**progressHandler)(id, uint64_t, _QWORD);
  int Int64Ranged;
  OS_dispatch_source *finishApplyTimer;
  NSObject *v34;
  OS_dispatch_source *v35;
  OS_dispatch_source *v36;
  OS_dispatch_source *v37;
  NSObject *v38;
  id v39;
  int64_t timeCycle;
  uint64_t v41;
  void *v42;
  id v43;
  _QWORD handler[5];
  id v45;
  int v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v43 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7)
    CUSetSystemName();
  -[HDSSetupService _setSiriInfo](self, "_setSiriInfo");
  timeZone = self->_timeZone;
  v10 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (timeZone)
  {
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (v11 = _LogCategory_Initialize(), timeZone = self->_timeZone, v11))
      {
        timeCycle = (int64_t)timeZone;
        LogPrintF();
        timeZone = self->_timeZone;
      }
    }
    -[NSString UTF8String](timeZone, "UTF8String", timeCycle);
    v12 = tzlink();
    if ((_DWORD)v12)
    {
      if (gLogCategory_HDSSetupService <= 60)
      {
        v13 = v12;
        if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
        {
          timeCycle = (int64_t)self->_timeZone;
          v41 = v13;
          LogPrintF();
        }
      }
    }
    CFPreferencesSetAppValue(CFSTR("timezone"), self->_timeZone, CFSTR("com.apple.preferences.datetime"));
    CFPreferencesSetAppValue(CFSTR("timezoneset"), *v10, CFSTR("com.apple.preferences.datetime"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
    objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_timeZoneAuto)
      v14 = "on";
    else
      v14 = "off";
    timeCycle = (int64_t)v14;
    LogPrintF();
  }
  ((void (*)(uint64_t))softLinkTMSetAutomaticTimeZoneEnabled[0])(1);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_timeAuto)
      v15 = "on";
    else
      v15 = "off";
    timeCycle = (int64_t)v15;
    LogPrintF();
  }
  ((void (*)(uint64_t))softLinkTMSetAutomaticTimeEnabled[0])(1);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    timeCycle = self->_timeCycle;
    LogPrintF();
  }
  v42 = (void *)v8;
  v16 = self->_timeCycle;
  if (v16 == 12)
    v17 = *v10;
  else
    v17 = 0;
  if (v16 == 24)
    v18 = *v10;
  else
    v18 = 0;
  v19 = (const __CFString *)*MEMORY[0x24BDBD568];
  CFPreferencesSetAppValue(CFSTR("AppleICUForce12HourTime"), v17, (CFStringRef)*MEMORY[0x24BDBD568]);
  CFPreferencesSetAppValue(CFSTR("AppleICUForce24HourTime"), v18, v19);
  CFPreferencesAppSynchronize(v19);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ((void (*)(void *, void *, double))softLinkTMSetupTime[0])(self->_dispatchQueue, &__block_literal_global_4, 30.0);
  languageCode = self->_languageCode;
  if (languageCode)
  {
    v21 = self->_languageCode;
    if (gLogCategory_HDSSetupService <= 30)
    {
      v21 = self->_languageCode;
      if (gLogCategory_HDSSetupService != -1 || (v22 = _LogCategory_Initialize(), v21 = self->_languageCode, v22))
      {
        timeCycle = (int64_t)v21;
        LogPrintF();
        v21 = self->_languageCode;
      }
    }
    v23 = (void *)MEMORY[0x24BDBCEA0];
    v47[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1, timeCycle, v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPreferredLanguages:", v24);

  }
  CFPreferencesSetAppValue(CFSTR("AppleLanguageCodeSetup"), 0, v19);
  localeIdentifier = self->_localeIdentifier;
  v26 = localeIdentifier != 0;
  if (localeIdentifier)
  {
    v27 = self->_localeIdentifier;
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (v28 = _LogCategory_Initialize(), v27 = self->_localeIdentifier, v28))
      {
        timeCycle = (int64_t)v27;
        LogPrintF();
        v27 = self->_localeIdentifier;
      }
    }
    CFPreferencesSetAppValue(CFSTR("AppleLocale"), v27, v19);
    CFPreferencesAppSynchronize(v19);
  }
  CFPreferencesSetAppValue(CFSTR("AppleLocaleSetup"), 0, v19);
  temperatureUnit = self->_temperatureUnit;
  if (temperatureUnit)
  {
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1
        || (v30 = _LogCategory_Initialize(), temperatureUnit = self->_temperatureUnit, v30))
      {
        timeCycle = (int64_t)temperatureUnit;
        LogPrintF();
        temperatureUnit = self->_temperatureUnit;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "_setPreferredTemperatureUnit:", temperatureUnit, timeCycle);
    v26 = 1;
  }
  else if (!((unint64_t)languageCode | (unint64_t)localeIdentifier))
  {
    goto LABEL_81;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (lockdown_connect())
  {
    if (languageCode)
      lockdown_set_value();
    if (v26)
      lockdown_set_value();
    lockdown_disconnect();
  }
  else if (gLogCategory_HDSSetupService <= 60
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  notify_post("AppleDatePreferencesChangedNotification");
  notify_post("AppleTimePreferencesChangedNotification");
  notify_post("AppleNumberPreferencesChangedNotification");
  notify_post("AppleLanguagePreferencesChangedNotification");
  notify_post("com.apple.language.changed");
LABEL_81:
  CFAbsoluteTimeGetCurrent();
  CFPrefs_SetDouble();
  self->_finished = 1;
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 95, 0);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  finishApplyTimer = self->_finishApplyTimer;
  if (finishApplyTimer)
  {
    v34 = finishApplyTimer;
    dispatch_source_cancel(v34);
    v35 = self->_finishApplyTimer;
    self->_finishApplyTimer = 0;

  }
  v36 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v37 = self->_finishApplyTimer;
  self->_finishApplyTimer = v36;

  v38 = self->_finishApplyTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke_2;
  handler[3] = &unk_24FCD4920;
  v46 = Int64Ranged;
  handler[4] = self;
  v45 = v43;
  v39 = v43;
  dispatch_source_set_event_handler(v38, handler);
  HDSDispatchTimerSet(self->_finishApplyTimer, 4.0, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_finishApplyTimer);

}

void __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupService <= 30
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
}

uint64_t __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishDone:responseHandler:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_handleFinishDone:(unsigned int)a3 responseHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint64_t v9;
  int iTunesCloudCompleteToken;
  NSObject *dispatchQueue;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  RPCompanionLinkClient *v16;
  RPCompanionLinkClient *companionLinkClient;
  id v18;
  RPCompanionLinkClient *v19;
  uint64_t v20;
  OS_dispatch_source *v21;
  OS_dispatch_source *finishTimeoutTimer;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  int v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  int v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  int v37;
  uint64_t state64;
  _QWORD handler[5];
  id v40;
  uint64_t v41;
  int v42;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v24 = v4;
    v25 = &unk_22F7A1D16;
    LogPrintF();
  }
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0, v24, v25);
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 0);
  v7 = (void *)objc_msgSend(objc_alloc(getFLFollowUpControllerClass()), "initWithClientIdentifier:", 0);
  objc_msgSend(v7, "clearPendingFollowUpItems:", 0);
  -[HDSSetupService _boostiTunesCloudDaemon](self, "_boostiTunesCloudDaemon");
  if (!self->_finishedEventSent)
  {
    self->_finishedEventSent = 1;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 96, 0);
  }
  v9 = mach_absolute_time();
  iTunesCloudCompleteToken = self->_iTunesCloudCompleteToken;
  if (iTunesCloudCompleteToken != -1)
  {
    notify_cancel(iTunesCloudCompleteToken);
    self->_iTunesCloudCompleteToken = -1;
  }
  dispatchQueue = self->_dispatchQueue;
  v12 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke;
  handler[3] = &unk_24FCD4948;
  handler[4] = self;
  v41 = v9;
  v42 = v4;
  v13 = v6;
  v40 = v13;
  notify_register_dispatch("com.apple.itunescloud.setupcompleted", &self->_iTunesCloudCompleteToken, dispatchQueue, handler);
  state64 = 0;
  notify_get_state(self->_iTunesCloudCompleteToken, &state64);
  if ((state64 & 1) != 0)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_iTunesCloudCompleted = 1;
    if (self->_iTunesCloudWaitSeconds == 0.0)
    {
      mach_absolute_time();
      UpTicksToSecondsF();
      self->_iTunesCloudWaitSeconds = v14;
    }
    if (-[HDSSetupService _handleFinishDone2Ready](self, "_handleFinishDone2Ready"))
      goto LABEL_24;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((v4 & 2) != 0)
  {
    v15 = mach_absolute_time();
    -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
    v16 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    companionLinkClient = self->_companionLinkClient;
    self->_companionLinkClient = v16;

    -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", self->_dispatchQueue);
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_2;
    v34[3] = &unk_24FCD4970;
    v34[4] = self;
    v36 = v15;
    v37 = v4;
    v18 = v13;
    v35 = v18;
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](self->_companionLinkClient, "setLocalDeviceUpdatedHandler:", v34);
    v19 = self->_companionLinkClient;
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_3;
    v30[3] = &unk_24FCD4998;
    v30[4] = self;
    v32 = v15;
    v33 = v4;
    v31 = v18;
    -[RPCompanionLinkClient activateWithCompletion:](v19, "activateWithCompletion:", v30);
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_30;
  }
  self->_mediaSystemReady = 1;
  if (!-[HDSSetupService _handleFinishDone2Ready](self, "_handleFinishDone2Ready"))
  {
LABEL_30:
    v20 = mach_absolute_time();
    v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    finishTimeoutTimer = self->_finishTimeoutTimer;
    self->_finishTimeoutTimer = v21;

    v23 = self->_finishTimeoutTimer;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_4;
    v26[3] = &unk_24FCD49C0;
    v26[4] = self;
    v28 = v20;
    v29 = v4;
    v27 = v13;
    dispatch_source_set_event_handler(v23, v26);
    HDSDispatchTimerSet(self->_finishTimeoutTimer, 300.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_finishTimeoutTimer);

    goto LABEL_31;
  }
LABEL_24:
  -[HDSSetupService _handleFinishDone2:responseHandler:](self, "_handleFinishDone2:responseHandler:", v4, v13);
LABEL_31:

}

uint64_t __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double *v3;
  uint64_t v4;

  v1 = result;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (*(_DWORD *)(v2 + 64) != -1)
  {
    *(_BYTE *)(v2 + 61) = 1;
    v3 = *(double **)(v1 + 32);
    if (v3[9] == 0.0)
    {
      mach_absolute_time();
      UpTicksToSecondsF();
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 72) = v4;
      v3 = *(double **)(v1 + 32);
    }
    result = objc_msgSend(v3, "_handleFinishDone2Ready");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 32), "_handleFinishDone2:responseHandler:", *(unsigned int *)(v1 + 56), *(_QWORD *)(v1 + 40));
  }
  return result;
}

void __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  double *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v3 = objc_msgSend(v7, "mediaSystemState");
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v6 = v7;
      LogPrintF();
    }
    if (v3 == 4 || v3 == 1)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
      v4 = *(double **)(a1 + 32);
      if (v4[11] == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v5;
        v4 = *(double **)(a1 + 32);
      }
      if (objc_msgSend(v4, "_handleFinishDone2Ready", v6))
        objc_msgSend(*(id *)(a1 + 32), "_handleFinishDone2:responseHandler:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
    }
  }

}

void __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  double *v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v10 = v3;
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
      {
        v9 = v4;
        LogPrintF();
        v4 = v10;
      }
    }
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
      v6 = *(double **)(a1 + 32);
      if (v6[11] == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v7;
        v6 = *(double **)(a1 + 32);
      }
      v8 = objc_msgSend(v6, "_handleFinishDone2Ready", v9);
      v4 = v10;
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_handleFinishDone2:responseHandler:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
        v4 = v10;
      }
    }
  }

}

uint64_t __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_4(uint64_t a1)
{
  double *v2;
  uint64_t v3;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(double **)(a1 + 32);
  if (v2[11] == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v3;
    v2 = *(double **)(a1 + 32);
  }
  return objc_msgSend(v2, "_handleFinishDone2:responseHandler:", *(_DWORD *)(a1 + 56) | 4u, *(_QWORD *)(a1 + 40));
}

- (void)_handleFinishDone2:(unsigned int)a3 responseHandler:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t, _QWORD, void *);
  RPCompanionLinkClient *companionLinkClient;
  int iTunesCloudCompleteToken;
  OS_dispatch_source *finishTimeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSiriClient *siriClient;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];
  _QWORD v22[5];
  _QWORD v23[3];
  _QWORD v24[4];

  v4 = *(_QWORD *)&a3;
  v24[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, _QWORD, void *))a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate");
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  iTunesCloudCompleteToken = self->_iTunesCloudCompleteToken;
  if (iTunesCloudCompleteToken != -1)
  {
    notify_cancel(iTunesCloudCompleteToken);
    self->_iTunesCloudCompleteToken = -1;
  }
  finishTimeoutTimer = self->_finishTimeoutTimer;
  if (finishTimeoutTimer)
  {
    v10 = finishTimeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_finishTimeoutTimer;
    self->_finishTimeoutTimer = 0;

  }
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 700, 0);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  siriClient = self->_siriClient;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__HDSSetupService__handleFinishDone2_responseHandler___block_invoke;
  v22[3] = &unk_24FCD4138;
  v22[4] = self;
  -[SFSiriClient deviceSetupPlayGreetingID:completion:](siriClient, "deviceSetupPlayGreetingID:completion:", 5, v22);
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = -[HDSSetupService signpostID](self, "signpostID");
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Finish", (const char *)&unk_22F7B8AEE, v21, 2u);
    }
  }

  v23[0] = CFSTR("finF");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v23[1] = CFSTR("itWS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_iTunesCloudWaitSeconds);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("msWS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_mediaSystemWaitSeconds);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 1, 0, v20);

  -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", 1, &unk_24FCE3B88);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __54__HDSSetupService__handleFinishDone2_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (gLogCategory_HDSSetupService <= 30)
  {
    v8 = v3;
    if (gLogCategory_HDSSetupService != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      LogPrintF();
      v4 = v8;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 59))
  {
    v7 = *(_QWORD *)(v6 + 432);
    if (v7)
    {
      v9 = v4;
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 100, 0);
      v4 = v9;
    }
  }

}

- (BOOL)_handleFinishDone2Ready
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_iTunesCloudCompleted && self->_mediaSystemReady;
}

- (void)_handleVoicePreviewRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  SUICDefaultVoicePreviewer *v8;
  SUICDefaultVoicePreviewer *voicePreviewer;
  void *v10;
  void *v11;
  uint64_t Int64Ranged;
  void *v13;
  SUICDefaultVoicePreviewer *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (!self->_voicePreviewer)
  {
    v8 = (SUICDefaultVoicePreviewer *)objc_alloc_init(getSUICDefaultVoicePreviewerClass());
    voicePreviewer = self->_voicePreviewer;
    self->_voicePreviewer = v8;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v13 = (void *)objc_msgSend(objc_alloc(getAFVoiceInfoClass()), "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v10, Int64Ranged, 1, v11, 0, 0, 0);
  v14 = self->_voicePreviewer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__HDSSetupService__handleVoicePreviewRequest_responseHandler___block_invoke;
  v16[3] = &unk_24FCD49E8;
  v17 = v7;
  v15 = v7;
  -[SUICDefaultVoicePreviewer previewVoice:completion:](v14, "previewVoice:completion:", v13, v16);

}

void __62__HDSSetupService__handleVoicePreviewRequest_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("siriVPSuccess");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleCheckHomePodForJS:(id)a3 responseHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[objc_class sharedPreferences](getVTPreferencesClass(), "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCompactVoiceTriggerAvailableForLanguageCode:", v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("homepod_js_locale"));

  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v6);

}

- (void)_handleStartSysDrop:(id)a3 responseHandler:(id)a4
{
  id v5;
  void *v6;
  SysDropService *v7;
  SysDropService *sysDropService;
  _QWORD v9[5];

  v5 = a4;
  v6 = (void *)objc_opt_new();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = objc_alloc_init(SysDropService);
  sysDropService = self->_sysDropService;
  self->_sysDropService = v7;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__HDSSetupService__handleStartSysDrop_responseHandler___block_invoke;
  v9[3] = &unk_24FCD4A10;
  v9[4] = self;
  -[SysDropService setPeerEventHandler:](self->_sysDropService, "setPeerEventHandler:", v9);
  -[SysDropService setSfService:](self->_sysDropService, "setSfService:", self->_sfService);
  -[SysDropService setSfSession:](self->_sysDropService, "setSfSession:", self->_sfSession);
  -[SysDropService setServiceStartedFromSetup:](self->_sysDropService, "setServiceStartedFromSetup:", 1);
  -[SysDropService activate](self->_sysDropService, "activate");
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v6);

}

uint64_t __55__HDSSetupService__handleStartSysDrop_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "sendWithFlags:object:", 0, a2);
}

- (void)_handleSUNoSetupScanRequest:(id)a3 responseHandler:(id)a4
{
  void *v5;
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *semaForScanFoundSU;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  OS_dispatch_semaphore *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSError *errorForScanSUNoSetup;
  void (**v17)(_QWORD);

  v17 = (void (**)(_QWORD))a4;
  v5 = (void *)objc_opt_new();
  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaForScanFoundSU = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = v6;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x24BEAE7B0]);
  objc_msgSend(v8, "setUserInitiated:", 1);
  objc_msgSend(v8, "setDownloadWhenFound:", 1);
  -[HDSSetupService suControllerManager](self, "suControllerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanForUpdates:", v8);

  v10 = self->_semaForScanFoundSU;
  v11 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v10, v11);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = 0;

  if (self->_scanFoundSUForSUNoSetup)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_homePodSUNoSetupState = 3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("unsetup_hp_su_phase"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_scanFoundSUForSUNoSetup);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("unsetup_hp_su_scan_success"));

  }
  else if (gLogCategory_HDSSetupService <= 30
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    errorForScanSUNoSetup = self->_errorForScanSUNoSetup;
    LogPrintF();
    -[HDSSetupService wipeWifiConfig](self, "wipeWifiConfig", errorForScanSUNoSetup);
  }
  else
  {
    -[HDSSetupService wipeWifiConfig](self, "wipeWifiConfig", v15);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v17[2](v17);

}

- (void)_handleDeviceActivationRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  HDSDeviceActivation *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if (gLogCategory_HDSSetupService <= 40
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = objc_alloc_init(HDSDeviceActivation);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HDSSetupService__handleDeviceActivationRequest_responseHandler___block_invoke;
  v9[3] = &unk_24FCD4A38;
  v10 = v6;
  v8 = v6;
  -[HDSDeviceActivation performActivationStep:completion:](v7, "performActivationStep:completion:", v5, v9);

}

void __66__HDSSetupService__handleDeviceActivationRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (gLogCategory_HDSSetupService <= 40
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);

}

- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  id v11;
  unint64_t Int64;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  char v20;
  id v21;
  uint64_t v22;
  char *v23;
  uint64_t Int64Ranged;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _BOOL4 canCompanionShowHomePodSU;
  const char *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  const char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  const __CFString *v56;
  id v57;
  char *v58;
  id v59;
  void *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[12];
  unsigned int v67;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v50 = v6;
    LogPrintF();
  }
  v67 = 0;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[HDSSetupService signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  Int64 = CFDictionaryGetInt64();
  self->_peerFeatureFlags = Int64;
  if (!self->_siriDidDeviceSetup)
  {
    -[SFSiriClient deviceSetupBegin:](self->_siriClient, "deviceSetupBegin:", Int64);
    self->_siriDidDeviceSetup = 1;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("cbCapableHP"), v50);
  v13 = (void *)GestaltCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("mdN"));
  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("model"));
  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v15 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("dguid"));
  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v16 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("dsn"));
  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v51 = v17;
    v54 = v67;
    LogPrintF();
  }
  if (objc_msgSend(v17, "count", v51, v54))
    ((void (*)(void *))softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary[0])(v17);
  v18 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("wifiMA"));
  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v60 = v17;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v19 = (char *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v65 = 0;
    v20 = -[objc_class assistantIsSupportedForLanguageCode:error:](getAFConnectionClass(), "assistantIsSupportedForLanguageCode:error:", v19, &v65);
    v21 = v65;
    if ((v20 & 1) == 0)
    {
      v59 = v7;
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v52 = v19;
        v55 = (unint64_t)v21;
        LogPrintF();
      }
      goto LABEL_67;
    }
  }
  else
  {
    v21 = 0;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_84;
  v23 = (char *)v22;
  v59 = v7;
  Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "length"))
  {
    -[objc_class sharedInstance](getAFLocalizationClass(), "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "voiceNamesForOutputLanguageCode:gender:", v23, Int64Ranged);
    v58 = v19;
    v27 = v6;
    v28 = v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = objc_claimAutoreleasedReturnValue();

    v21 = v28;
    v6 = v27;
    v19 = v58;

    v25 = (void *)v30;
  }
  v31 = (__CFString *)objc_msgSend(objc_alloc(getAFVoiceInfoClass()), "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v23, Int64Ranged, 0, v25, 2, 0, 0);
  if ((-[__CFString isValidForSiriSessionLanguage:](v31, "isValidForSiriSessionLanguage:", v19) & 1) == 0)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v55 = (unint64_t)v19;
      v57 = v21;
      v52 = v23;
      LogPrintF();
    }

LABEL_67:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24FCE3E60, CFSTR("siriFl"), v52, v55, v57);
    softLinkAFPreferencesSupportedLanguages();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (char *)objc_msgSend(v32, "mutableCopy");

    -[objc_class sharedPreferences](getAFPreferencesClass(), "sharedPreferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bestSupportedLanguageCodeForLanguageCode:", v19);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v23, "indexOfObject:", v31);
    if (!v31 || v33 == 0x7FFFFFFFFFFFFFFFLL)
    {

      v31 = CFSTR("en-US");
      if (gLogCategory_HDSSetupService > 30
        || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_79;
      }
      v53 = v19;
      v56 = CFSTR("en-US");
    }
    else
    {
      if (gLogCategory_HDSSetupService > 30
        || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_79;
      }
      v53 = v19;
      v56 = v31;
    }
    LogPrintF();
LABEL_79:
    v34 = objc_msgSend(v23, "indexOfObject:", v31, v53, v56);
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v23, "removeObjectAtIndex:", v34);
      objc_msgSend(v23, "insertObject:atIndex:", v31, 0);
    }
    if (v23)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("siriLangs"));
  }

  v7 = v59;
LABEL_84:
  if (_os_feature_enabled_impl())
    v35 = 4495;
  else
    v35 = 399;
  v36 = SFDeviceSupportsTVAudio();
  v37 = v35 | 0x400;
  if (!v36)
    v37 = v35;
  v38 = 10256;
  if (!self->_prefCDPEnabled)
    v38 = 10240;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v38 | v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v39, CFSTR("ff"));

  v40 = (void *)MGCopyAnswer();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, CFSTR("hpBuildVersion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMHomeManager needsOSUpdateToRunHH2](self->_homeManager, "needsOSUpdateToRunHH2"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v41, CFSTR("hh2SU"));

  v42 = (void *)MGCopyAnswer();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v42, CFSTR("hp_bv"));

  v43 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("sd_capa"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, CFSTR("hds_tc_v2_"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, CFSTR("wr_v2"));
  canCompanionShowHomePodSU = CFDictionaryGetInt64() != 0;
  self->_canCompanionShowHomePodSU = canCompanionShowHomePodSU;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_98;
      canCompanionShowHomePodSU = self->_canCompanionShowHomePodSU;
    }
    if (canCompanionShowHomePodSU)
      v45 = "yes";
    else
      v45 = "no";
    v52 = v45;
    v55 = v67;
    LogPrintF();
  }
LABEL_98:
  -[HDSSetupService suControllerManager](self, "suControllerManager", v52, v55);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __57__HDSSetupService__handlePreAuthRequest_responseHandler___block_invoke;
  v61[3] = &unk_24FCD4A60;
  v61[4] = self;
  v47 = v11;
  v62 = v47;
  v48 = v21;
  v63 = v48;
  v49 = v7;
  v64 = v49;
  objc_msgSend(v46, "managerStatus:", v61);

}

void __57__HDSSetupService__handlePreAuthRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  const char *v20;
  id v21;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = objc_msgSend(v7, "updateState");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 364) = objc_msgSend(*(id *)(a1 + 32), "hdsSUStateForSUState");
  v10 = objc_msgSend(*(id *)(a1 + 32), "isHomePodSUNoSetup");
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
    {
      v20 = (const char *)v7;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
      {
        v20 = v8;
        LogPrintF();
      }
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v11 = "no";
        if ((_DWORD)v10)
          v11 = "yes";
        v20 = v11;
        LogPrintF();
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("unsetup_hp_su_start"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 364));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, CFSTR("unsetup_hp_su_phase"));

  if (v9)
  {
    if (gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v21 = v9;
      LogPrintF();
    }
    v14 = v9;
LABEL_28:
    v15 = v14;
    goto LABEL_41;
  }
  if ((v10 & 1) == 0)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_40;
    }
    goto LABEL_33;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 408))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_33:
    LogPrintF();
  }
LABEL_40:
  v15 = 0;
LABEL_41:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("unsetup_hp_su_capable"), v21);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "homePodNeedsSUNoSetup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, CFSTR("unsetup_hp_needs_su"));

  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
}

- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, uint64_t, _QWORD, id);
  unsigned __int8 Int64Ranged;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = *(_QWORD *)&a4;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD, id))a5;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v21 = (unint64_t)v8;
    LogPrintF();
  }
  if (Int64Ranged == 9)
  {
    if ((v6 & 1) != 0)
    {
      -[HDSSetupService _handleFinishRequest:responseHandler:](self, "_handleFinishRequest:responseHandler:", v8, v9);
      goto LABEL_24;
    }
    v11 = -6768;
    if (gLogCategory_HDSSetupService <= 60)
    {
      if (gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
        goto LABEL_34;
LABEL_30:
      LogPrintF();
LABEL_34:
      v11 = -6768;
    }
  }
  else
  {
    if (Int64Ranged != 8)
    {
      if (gLogCategory_HDSSetupService <= 50
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v21 = Int64Ranged;
        v22 = 0;
        LogPrintF();
      }
      v11 = -6732;
      goto LABEL_18;
    }
    if ((v6 & 1) != 0)
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v21 = (unint64_t)v8;
        LogPrintF();
      }
      v11 = -[HDSSetupService _handleBasicConfigRequest:](self, "_handleBasicConfigRequest:", v8, v21);
      if (!v11)
      {
        v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[HDSSetupService _handleBasicConfigResponse:](self, "_handleBasicConfigResponse:", v20);
        v9[2](v9, v6, 0, v20);

        goto LABEL_24;
      }
      goto LABEL_18;
    }
    v11 = -6768;
    if (gLogCategory_HDSSetupService <= 60)
    {
      if (gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
        goto LABEL_34;
      goto LABEL_30;
    }
  }
LABEL_18:
  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD1100];
  v14 = v11;
  v23 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("?");
  if (v15)
    v17 = (const __CFString *)v15;
  v24[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *, id))v9)[2](v9, v6, v19, 0);

LABEL_24:
}

- (void)_handleSiriDialogIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_HDSSetupService <= 30
    && ((v6 = v3, gLogCategory_HDSSetupService != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_playReadyToSetupSound
{
  CUAudioPlayer *v3;
  CUAudioPlayer *audioPlayer;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CUAudioPlayer *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int v13;
  int v14;

  v3 = (CUAudioPlayer *)objc_alloc_init(MEMORY[0x24BE29778]);
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v3;

  -[CUAudioPlayer setDispatchQueue:](self->_audioPlayer, "setDispatchQueue:", self->_dispatchQueue);
  -[CUAudioPlayer setLabel:](self->_audioPlayer, "setLabel:", CFSTR("HomePod Setup"));
  -[CUAudioPlayer activate](self->_audioPlayer, "activate");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HomeDeviceSetup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("HomePodReadyToSetUp-b238.m4a"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1056964608;
    if ((objc_msgSend(v7, "getVolume:forCategory:", &v14, CFSTR("MediaPlayback")) & 1) == 0
      && gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v8) = 1059145646;
    if ((objc_msgSend(v7, "setVolumeTo:forCategory:", CFSTR("MediaPlayback"), v8) & 1) == 0
      && gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = self->_audioPlayer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__HDSSetupService__playReadyToSetupSound__block_invoke;
    v11[3] = &unk_24FCD4A88;
    v12 = v7;
    v13 = v14;
    v10 = v7;
    -[CUAudioPlayer playURL:completion:](v9, "playURL:completion:", v6, v11);

  }
  else if (gLogCategory_HDSSetupService <= 90
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __41__HDSSetupService__playReadyToSetupSound__block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "setVolumeTo:forCategory:", CFSTR("MediaPlayback"), a2);
  if ((result & 1) == 0 && gLogCategory_HDSSetupService <= 90)
  {
    if (gLogCategory_HDSSetupService != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)_setSiriInfo
{
  const char *v3;
  uint64_t siriDataSharingState;
  const char *v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSString *v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  const char *v19;
  const char *v20;
  NSString *siriListenLanguage;
  int64_t siriVoiceGender;
  const char *v23;
  NSString *v24;
  __int128 v25;
  NSString *v26;
  intptr_t v27;
  NSString *siriVoiceLanguage;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_siriDisabled)
      v3 = "yes";
    else
      v3 = "no";
    siriDataSharingState = self->_siriDataSharingState;
    if (siriDataSharingState >= 8)
    {
      if ((int)siriDataSharingState <= 9)
        v5 = "?";
      else
        v5 = "User";
    }
    else
    {
      v5 = off_24FCD4CF8[siriDataSharingState];
    }
    siriVoiceLanguage = self->_siriVoiceLanguage;
    v25 = *(_OWORD *)&self->_siriListenLanguage;
    v19 = v3;
    v23 = v5;
    LogPrintF();
  }
  -[objc_class sharedPreferences](getAFPreferencesClass(), "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssistantIsEnabled:", !self->_siriDisabled, v19, v23, v25, siriVoiceLanguage);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_siriDisabled)
      v7 = "yes";
    else
      v7 = "no";
    v20 = v7;
    LogPrintF();
  }
  if ((self->_siriDataSharingState - 5) <= 1)
  {
    v8 = objc_alloc_init(getAFSettingsConnectionClass());
    v9 = v8;
    if (self->_siriDataSharingState == 6)
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v8, "setSiriDataSharingHomePodSetupDeviceIsValid:completion:", self->_siriDataSharingDeviceIsValid, 0, v20);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __31__HDSSetupService__setSiriInfo__block_invoke;
    v31[3] = &unk_24FCD4AB0;
    v32 = v9;
    v33 = v10;
    v11 = v9;
    objc_msgSend(v11, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", v10, 0, 5, 0, v31);

  }
  if (-[NSString length](self->_siriListenLanguage, "length", v20))
  {
    objc_msgSend(v6, "setLanguageCode:", self->_siriListenLanguage);
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      siriListenLanguage = self->_siriListenLanguage;
      LogPrintF();
    }
  }
  if (-[NSString length](self->_siriVoiceName, "length", siriListenLanguage))
    v12 = self->_siriVoiceName;
  else
    v12 = 0;
  if (self->_siriVoiceGender && -[NSString length](self->_siriVoiceLanguage, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(getAFVoiceInfoClass()), "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", self->_siriVoiceLanguage, self->_siriVoiceGender, 0, v12, 2, 0, 0);
    if (v13)
    {
      v14 = dispatch_semaphore_create(0);
      v15 = objc_alloc_init(getAFSettingsConnectionClass());
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __31__HDSSetupService__setSiriInfo__block_invoke_2;
      v29[3] = &unk_24FCD3FE8;
      v16 = v14;
      v30 = v16;
      objc_msgSend(v15, "setOutputVoice:withCompletion:", v13, v29);
      v17 = dispatch_time(0, 5000000000);
      v18 = dispatch_semaphore_wait(v16, v17);
      objc_msgSend(v6, "setOutputVoice:", v13);
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v26 = v12;
        v27 = v18;
        siriVoiceGender = self->_siriVoiceGender;
        v24 = self->_siriVoiceLanguage;
        LogPrintF();
      }

    }
    else if (gLogCategory_HDSSetupService <= 60
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  objc_msgSend(v6, "synchronize", siriVoiceGender, v24, v26, v27);

}

void __31__HDSSetupService__setSiriInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  id v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_HDSSetupService <= 30)
  {
    v5 = v2;
    if (gLogCategory_HDSSetupService != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }

}

intptr_t __31__HDSSetupService__setSiriInfo__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_boostiTunesCloudDaemon
{
  ICCloudClient *v3;
  ICCloudClient *icClient;
  NSObject *v5;
  _QWORD block[5];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  getICCloudClientClass();
  v3 = (ICCloudClient *)objc_opt_new();
  icClient = self->_icClient;
  self->_icClient = v3;

  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "notifyDeviceSetupFinishedWithCompletion:", &__block_literal_global_680);
}

void __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_HDSSetupService <= 90)
    {
      v6 = v2;
      if (gLogCategory_HDSSetupService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_HDSSetupService <= 30)
  {
    v6 = 0;
    if (gLogCategory_HDSSetupService != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }

}

- (void)_printBitMask:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 32;
  v8 = v4;
  do
  {
    if ((a3 & 1) != 0)
      v6 = CFSTR("1");
    else
      v6 = CFSTR("0");
    objc_msgSend(v4, "insertString:atIndex:", v6, 0);
    v4 = v8;
    a3 >>= 1;
    --v5;
  }
  while (v5);
  if (gLogCategory_HDSSetupService < 31)
  {
    if (gLogCategory_HDSSetupService != -1 || (v7 = _LogCategory_Initialize(), v4 = v8, v7))
    {
      LogPrintF();
      v4 = v8;
    }
  }

}

- (int)hdsSUStateForSUState
{
  unint64_t v2;

  v2 = self->_suUpdateState - 1;
  if (v2 > 0x11)
    return 0;
  else
    return dword_22F7A1D4C[v2];
}

- (BOOL)homePodNeedsSUNoSetup
{
  return 0;
}

- (BOOL)isHomePodSUNoSetup
{
  void *v4;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    SUControllerStringForManagerState();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  return ((self->_suUpdateState - 1) & 0xFFFFFFFFFFFFFFEFLL) != 0;
}

- (void)configureSUControllerManagerToFinish
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BEAE7A0]);
  objc_msgSend(v3, "setPerformAutoDownloadAndPrepare:", 1);
  objc_msgSend(v3, "setPerformAutoInstall:", 1);
  objc_msgSend(v3, "setAutoAcceptTermsAndConditions:", 1);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v6 = v3;
    LogPrintF();
  }
  -[HDSSetupService suControllerManager](self, "suControllerManager", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HDSSetupService_configureSUControllerManagerToFinish__block_invoke;
  v7[3] = &unk_24FCD4AF8;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "modifyConfig:modifying:completion:", v5, 14, v7);

}

void __55__HDSSetupService_configureSUControllerManagerToFinish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)sendSUNoSetupSUInstallDonePeerEvent
{
  SFSession *sfSession;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  sfSession = self->_sfSession;
  v9[0] = &unk_24FCE3E78;
  v8[0] = CFSTR("spe");
  v8[1] = CFSTR("hp_su_est_time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_estTimeRemainingSUNoSetup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C8];
  v8[2] = CFSTR("unsetup_hp_su_start");
  v8[3] = CFSTR("unsetup_hp_su_phase");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodSUNoSetupState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = CFSTR("unsetup_hp_su_install_done");
  v9[3] = v6;
  v9[4] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSession sendWithFlags:object:](sfSession, "sendWithFlags:object:", 0, v7);

}

- (void)sendSUNoSetupSUStatusPeerEvent
{
  SFSession *sfSession;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  sfSession = self->_sfSession;
  v8[0] = &unk_24FCE3E78;
  v7[0] = CFSTR("spe");
  v7[1] = CFSTR("hp_su_est_time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_estTimeRemainingSUNoSetup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  v8[2] = MEMORY[0x24BDBD1C8];
  v7[2] = CFSTR("unsetup_hp_su_start");
  v7[3] = CFSTR("unsetup_hp_su_phase");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodSUNoSetupState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSession sendWithFlags:object:](sfSession, "sendWithFlags:object:", 0, v6);

}

- (void)sendSUNoSetupErrorPeerEvent:(int64_t)a3
{
  SFSession *sfSession;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  sfSession = self->_sfSession;
  v8[0] = &unk_24FCE3E78;
  v7[0] = CFSTR("spe");
  v7[1] = CFSTR("unsetup_hp_sunosetup_error");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("unsetup_hp_su_start");
  v8[1] = v5;
  v8[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSession sendWithFlags:object:](sfSession, "sendWithFlags:object:", 0, v6);

  self->_canCompanionShowHomePodSU = 0;
}

- (void)wipeWifiConfig
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(void))self->_progressHandler + 2))();
}

- (BOOL)canSendPeerUpdates
{
  return self->_canCompanionShowHomePodSU
      && self->_sfSession
      && !-[SFService needsSetup](self->_sfService, "needsSetup");
}

- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  NSObject *semaForScanFoundSU;
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v12 = v8;
    v13 = v9;
    LogPrintF();
  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_errorForScanSUNoSetup, a5);
    v10 = 1;
  }
  else
  {
    self->_scanFoundSUForSUNoSetup = 1;
    v10 = 3;
  }
  self->_suUpdateState = v10;
  self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState", v12, v13);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  semaForScanFoundSU = self->_semaForScanFoundSU;
  if (semaForScanFoundSU)
    dispatch_semaphore_signal(semaForScanFoundSU);
  if (self->_scanFoundSUForSUNoSetup)
    -[HDSSetupService configureSUControllerManagerToFinish](self, "configureSUControllerManagerToFinish");

}

- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v10 = v8;
    v11 = v9;
    LogPrintF();
  }
  self->_suUpdateState = 2;
  self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState", v10, v11);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  id v6;
  uint64_t homePodSUNoSetupState;
  id v8;
  void *v9;
  NSDate *v10;
  void *v11;
  double v12;
  int64_t suUpdateState;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    suUpdateState = (int64_t)v6;
    LogPrintF();
  }
  if (v6)
  {
    self->_suUpdateState = 4;
    homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
    self->_homePodSUNoSetupState = homePodSUNoSetupState;
    if (gLogCategory_HDSSetupService > 30)
      goto LABEL_14;
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_14:
        v8 = objc_alloc(MEMORY[0x24BDBCE60]);
        objc_msgSend(v6, "progress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "estimatedTimeRemaining");
        v10 = (NSDate *)objc_msgSend(v8, "initWithTimeIntervalSinceNow:");

        if (v10 == self->_estFinishTimeSUNoSetup)
        {
          if (gLogCategory_HDSSetupService > 30
            || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_38;
          }
        }
        else
        {
          objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, v10);
          objc_msgSend(v6, "progress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "estimatedTimeRemaining");
          self->_estTimeRemainingSUNoSetup = v12;

          if (-[HDSSetupService canSendPeerUpdates](self, "canSendPeerUpdates"))
          {
            if (gLogCategory_HDSSetupService <= 30
              && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            -[HDSSetupService sendSUNoSetupSUStatusPeerEvent](self, "sendSUNoSetupSUStatusPeerEvent", suUpdateState, v14);
            goto LABEL_38;
          }
          if (!self->_canCompanionShowHomePodSU
            && gLogCategory_HDSSetupService <= 30
            && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (self->_sfSession && !-[SFService needsSetup](self->_sfService, "needsSetup")
            || gLogCategory_HDSSetupService > 30
            || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_38;
          }
        }
        LogPrintF();
LABEL_38:

        goto LABEL_39;
      }
      homePodSUNoSetupState = self->_homePodSUNoSetupState;
    }
    suUpdateState = self->_suUpdateState;
    v14 = homePodSUNoSetupState;
    LogPrintF();
    goto LABEL_14;
  }
  if (-[HDSSetupService canSendPeerUpdates](self, "canSendPeerUpdates"))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", 903, suUpdateState);
    -[HDSSetupService wipeWifiConfig](self, "wipeWifiConfig");
    self->_suUpdateState = 1;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
  }
LABEL_39:

}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v10 = v8;
    v11 = v9;
    LogPrintF();
  }
  if (v9)
  {
    self->_suUpdateState = 1;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
    if (-[HDSSetupService canSendPeerUpdates](self, "canSendPeerUpdates"))
      -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v9, "code"));
    -[HDSSetupService wipeWifiConfig](self, "wipeWifiConfig", v10, v11);
  }
  else
  {
    self->_suUpdateState = 4;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

}

- (void)manager:(id)a3 didFinishDownload:(id)a4
{
  id v6;
  id v7;
  uint64_t homePodSUNoSetupState;
  void *v9;
  int v10;
  SUControllerManager *suControllerManager;
  id v12;
  int64_t suUpdateState;
  uint64_t v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v12 = v7;
    LogPrintF();
  }
  self->_suUpdateState = 8;
  homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState", v12);
  self->_homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1)
    {
LABEL_7:
      suUpdateState = self->_suUpdateState;
      v14 = homePodSUNoSetupState;
      LogPrintF();
      goto LABEL_9;
    }
    if (_LogCategory_Initialize())
    {
      homePodSUNoSetupState = self->_homePodSUNoSetupState;
      goto LABEL_7;
    }
  }
LABEL_9:
  -[HDSSetupService configureSUControllerManagerToFinish](self, "configureSUControllerManagerToFinish", suUpdateState, v14);
  objc_msgSend(v7, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDone");

  if (v10)
  {
    suControllerManager = self->_suControllerManager;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __45__HDSSetupService_manager_didFinishDownload___block_invoke;
    v15[3] = &unk_24FCD4B20;
    v15[4] = self;
    -[SUControllerManager managerState:](suControllerManager, "managerState:", v15);
  }

}

void __45__HDSSetupService_manager_didFinishDownload___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "canSendPeerUpdates"))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "installUpdate:", v8);
  }

}

- (void)manager:(id)a3 didChangeProgressOnApply:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  uint64_t homePodSUNoSetupState;
  id v11;
  NSDate *v12;
  double v13;
  id v14;
  int64_t suUpdateState;
  id v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v14 = v8;
    v16 = v9;
    LogPrintF();
  }
  self->_suUpdateState = 9;
  homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState", v14, v16);
  self->_homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1)
    {
LABEL_7:
      suUpdateState = self->_suUpdateState;
      v17 = homePodSUNoSetupState;
      LogPrintF();
      goto LABEL_9;
    }
    if (_LogCategory_Initialize())
    {
      homePodSUNoSetupState = self->_homePodSUNoSetupState;
      goto LABEL_7;
    }
  }
LABEL_9:
  v11 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v9, "estimatedTimeRemaining");
  v12 = (NSDate *)objc_msgSend(v11, "initWithTimeIntervalSinceNow:");
  if (v12 == self->_estFinishTimeSUNoSetup)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, v12);
  objc_msgSend(v9, "estimatedTimeRemaining");
  self->_estTimeRemainingSUNoSetup = v13;
  if (-[HDSSetupService canSendPeerUpdates](self, "canSendPeerUpdates"))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSSetupService sendSUNoSetupSUStatusPeerEvent](self, "sendSUNoSetupSUStatusPeerEvent", suUpdateState, v17);
    goto LABEL_31;
  }
  if (!self->_canCompanionShowHomePodSU
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((!self->_sfSession || -[SFService needsSetup](self->_sfService, "needsSetup"))
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_30:
    LogPrintF();
  }
LABEL_31:

}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUControllerManager *suControllerManager;
  id v12;
  id v13;
  _QWORD v14[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v12 = v9;
    v13 = v10;
    LogPrintF();
  }
  if (v10)
  {
    self->_suUpdateState = 1;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
    if (-[HDSSetupService canSendPeerUpdates](self, "canSendPeerUpdates"))
      -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v10, "code"));
    suControllerManager = self->_suControllerManager;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__HDSSetupService_manager_didFailInstallation_withError___block_invoke;
    v14[3] = &unk_24FCD4138;
    v14[4] = self;
    -[SUControllerManager purgeUpdate:completion:](suControllerManager, "purgeUpdate:completion:", v9, v14, v12, v13);
  }
  else
  {
    self->_suUpdateState = 9;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

}

void __57__HDSSetupService_manager_didFailInstallation_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v6 = 0;
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "wipeWifiConfig");
    goto LABEL_12;
  }
  if (gLogCategory_HDSSetupService <= 90)
  {
    v6 = v3;
    if (gLogCategory_HDSSetupService != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
LABEL_12:
      v4 = v6;
    }
  }

}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  id v6;
  uint64_t homePodSUNoSetupState;
  id v8;
  int64_t suUpdateState;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v8 = v6;
    LogPrintF();
  }
  self->_suUpdateState = 10;
  homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState", v8);
  self->_homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      homePodSUNoSetupState = self->_homePodSUNoSetupState;
    }
    suUpdateState = self->_suUpdateState;
    v10 = homePodSUNoSetupState;
    LogPrintF();
  }
LABEL_9:
  -[HDSSetupService configureSUControllerManagerToFinish](self, "configureSUControllerManagerToFinish", suUpdateState, v10);
  -[HDSSetupService sendSUNoSetupSUInstallDonePeerEvent](self, "sendSUNoSetupSUInstallDonePeerEvent");

}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  int v15;
  SUControllerManager *suControllerManager;
  id v17;
  int64_t suUpdateState;
  const char *v19;
  uint64_t homePodSUNoSetupState;
  const char *v21;
  _QWORD v22[5];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v12 = "no";
    if (v7)
      v13 = "yes";
    else
      v13 = "no";
    if (v6)
      v12 = "yes";
    v19 = v13;
    v21 = v12;
    v17 = v11;
    LogPrintF();
  }
  objc_msgSend(v11, "progress", v17, v19, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDone");

  if (v15)
  {
    suControllerManager = self->_suControllerManager;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __100__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl___block_invoke;
    v22[3] = &unk_24FCD4B20;
    v22[4] = self;
    -[SUControllerManager managerState:](suControllerManager, "managerState:", v22);
  }
  else
  {
    self->_suUpdateState = 4;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    suUpdateState = self->_suUpdateState;
    homePodSUNoSetupState = self->_homePodSUNoSetupState;
    LogPrintF();
  }
  -[HDSSetupService configureSUControllerManagerToFinish](self, "configureSUControllerManagerToFinish", suUpdateState, homePodSUNoSetupState);

}

void __100__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "canSendPeerUpdates"))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "installUpdate:", v8);
  }

}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  void *v17;
  int v18;
  SUControllerManager *suControllerManager;
  id v20;
  int64_t suUpdateState;
  const char *v22;
  uint64_t homePodSUNoSetupState;
  const char *v24;
  id v25;
  _QWORD v26[5];

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v15 = "no";
    if (v9)
      v16 = "yes";
    else
      v16 = "no";
    if (v8)
      v15 = "yes";
    v24 = v15;
    v25 = v14;
    v20 = v13;
    v22 = v16;
    LogPrintF();
  }
  objc_msgSend(v13, "progress", v20, v22, v24, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isDone");

  if (v18)
  {
    suControllerManager = self->_suControllerManager;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __114__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl_denialReasons___block_invoke;
    v26[3] = &unk_24FCD4B20;
    v26[4] = self;
    -[SUControllerManager managerState:](suControllerManager, "managerState:", v26);
  }
  else
  {
    self->_suUpdateState = 4;
    self->_homePodSUNoSetupState = -[HDSSetupService hdsSUStateForSUState](self, "hdsSUStateForSUState");
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    suUpdateState = self->_suUpdateState;
    homePodSUNoSetupState = self->_homePodSUNoSetupState;
    LogPrintF();
  }
  -[HDSSetupService configureSUControllerManagerToFinish](self, "configureSUControllerManagerToFinish", suUpdateState, homePodSUNoSetupState);

}

void __114__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl_denialReasons___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "canSendPeerUpdates"))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "installUpdate:", v8);
  }

}

- (void)manager:(id)a3 connectionError:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)connectionRegained:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_HDSSetupService <= 30
    && ((v6 = v3, gLogCategory_HDSSetupService != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (SysDropService)sysDropService
{
  return self->_sysDropService;
}

- (void)setSysDropService:(id)a3
{
  objc_storeStrong((id *)&self->_sysDropService, a3);
}

- (SUControllerManager)suControllerManager
{
  return self->_suControllerManager;
}

- (void)setSuControllerManager:(id)a3
{
  objc_storeStrong((id *)&self->_suControllerManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suControllerManager, 0);
  objc_storeStrong((id *)&self->_sysDropService, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiDispatchQueue, 0);
  objc_storeStrong((id *)&self->_errorForScanSUNoSetup, 0);
  objc_storeStrong((id *)&self->_semaForScanFoundSU, 0);
  objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_icClient, 0);
  objc_storeStrong((id *)&self->_voicePreviewer, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timeObj, 0);
  objc_storeStrong((id *)&self->_siriVoiceName, 0);
  objc_storeStrong((id *)&self->_siriVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_siriListenLanguage, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_siriGreetingDetails, 0);
  objc_storeStrong((id *)&self->_siriClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_sfClient, 0);
  objc_storeStrong((id *)&self->_finishTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_finishApplyTimer, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_apcPlayer, 0);
  objc_storeStrong((id *)&self->_apcCapData, 0);
}

@end
