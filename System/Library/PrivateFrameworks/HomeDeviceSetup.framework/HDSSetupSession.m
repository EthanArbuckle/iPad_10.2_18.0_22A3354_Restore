@implementation HDSSetupSession

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupSession_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1)
    dispatch_once(&signpostLog_onceToken_2, block);
  return (OS_os_log *)(id)signpostLog_log_2;
}

void __30__HDSSetupSession_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;

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

- (HDSSetupSession)init
{
  HDSSetupSession *v2;
  HDSSetupSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSUUID *sessionID;
  SysDropSession *v8;
  SysDropSession *sysDropSession;
  HDSSetupSession *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDSSetupSession;
  v2 = -[HDSSetupSession init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_amsOptimizationSecs = 0.0;
    CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_proxSetupActiveToken = -1;
    v3->_homePodSUState = 0;
    v3->_automaticSoftwareUpdateAgreed = 0;
    v3->_softwareUpdateAgreed = 0;
    v3->_odeonState = 0;
    v3->_rmvSelectionState = 0;
    *(_OWORD *)&v3->_siriSettingState = 0u;
    v6 = objc_opt_new();
    sessionID = v3->_sessionID;
    v3->_sessionID = (NSUUID *)v6;

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = objc_alloc_init(SysDropSession);
    sysDropSession = v3->_sysDropSession;
    v3->_sysDropSession = v8;

    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  HDSSetupSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (HDSSetupSession *)FatalErrorF();
    -[HDSSetupSession _cleanup](v3, v4);
  }
  else
  {
    -[HDSSetupSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)HDSSetupSession;
    -[HDSSetupSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  int proxSetupActiveToken;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v5;
  UIViewController *presentingViewController;
  id preAuthHandler;
  id promptForAppleMusicHandler;
  id promptForHomeHandler;
  id promptForHomeiCloudHandler;
  id promptForiTunesSignInHandler;
  id promptForLocationEnableHandler;
  id promptForPersonalRequestsHandler;
  id promptForPINHandler;
  id promptForRoomHandlerDetailed;
  id promptForSiriEnableHandler;
  id promptForSoundRecognitionHandler;
  id promptForTermsHandler;
  id promptToInstallHomeAppHandler;
  id promptToShareSettingsHandler;
  id promptForSiriLanguageHandler;
  id promptForStereoRoleHandler;
  id promptForStereoMultipleHandler;
  id promptForTVAudioHandler;

  proxSetupActiveToken = self->_proxSetupActiveToken;
  if (proxSetupActiveToken != -1)
  {
    notify_set_state(proxSetupActiveToken, 0);
    notify_post("com.apple.sharing.wha-prox-setup");
    notify_cancel(self->_proxSetupActiveToken);
    self->_proxSetupActiveToken = -1;
  }
  -[HDSSetupSession _cleanupSession](self, "_cleanupSession");
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    v5 = self->_progressHandler;
  }
  else
  {
    v5 = 0;
  }
  self->_progressHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  preAuthHandler = self->_preAuthHandler;
  self->_preAuthHandler = 0;

  promptForAppleMusicHandler = self->_promptForAppleMusicHandler;
  self->_promptForAppleMusicHandler = 0;

  promptForHomeHandler = self->_promptForHomeHandler;
  self->_promptForHomeHandler = 0;

  promptForHomeiCloudHandler = self->_promptForHomeiCloudHandler;
  self->_promptForHomeiCloudHandler = 0;

  promptForiTunesSignInHandler = self->_promptForiTunesSignInHandler;
  self->_promptForiTunesSignInHandler = 0;

  promptForLocationEnableHandler = self->_promptForLocationEnableHandler;
  self->_promptForLocationEnableHandler = 0;

  promptForPersonalRequestsHandler = self->_promptForPersonalRequestsHandler;
  self->_promptForPersonalRequestsHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  promptForRoomHandlerDetailed = self->_promptForRoomHandlerDetailed;
  self->_promptForRoomHandlerDetailed = 0;

  promptForSiriEnableHandler = self->_promptForSiriEnableHandler;
  self->_promptForSiriEnableHandler = 0;

  promptForSoundRecognitionHandler = self->_promptForSoundRecognitionHandler;
  self->_promptForSoundRecognitionHandler = 0;

  promptForTermsHandler = self->_promptForTermsHandler;
  self->_promptForTermsHandler = 0;

  promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_promptToInstallHomeAppHandler = 0;

  promptToShareSettingsHandler = self->_promptToShareSettingsHandler;
  self->_promptToShareSettingsHandler = 0;

  promptForSiriLanguageHandler = self->_promptForSiriLanguageHandler;
  self->_promptForSiriLanguageHandler = 0;

  promptForStereoRoleHandler = self->_promptForStereoRoleHandler;
  self->_promptForStereoRoleHandler = 0;

  promptForStereoMultipleHandler = self->_promptForStereoMultipleHandler;
  self->_promptForStereoMultipleHandler = 0;

  promptForTVAudioHandler = self->_promptForTVAudioHandler;
  self->_promptForTVAudioHandler = 0;

}

- (void)_cleanupSession
{
  SysDropSession *sysDropSession;
  TROperationQueue *trOperationQueue;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *trOperations;
  TRSession *trSession;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  HDSDeviceOperationHomeKitSetup *homeKitSetupOperation;
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  HDSBonjourTest *bonjourTestOperation;
  SFDeviceOperationCNJSetup *captiveJoin;
  SFSession *sfSession;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  sysDropSession = self->_sysDropSession;
  if (sysDropSession)
    -[SysDropSession invalidate](sysDropSession, "invalidate");
  -[HDSSetupSession _runAudioPasscodeCleanup:](self, "_runAudioPasscodeCleanup:", 1);
  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_trOperations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "cancel", (_QWORD)v19);
        objc_msgSend(v10, "setCompletionBlock:", 0);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_trOperations, "removeAllObjects");
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  -[TRSession setDisconnectHandler:](self->_trSession, "setDisconnectHandler:", 0);
  -[TRSession disconnect](self->_trSession, "disconnect");
  trSession = self->_trSession;
  self->_trSession = 0;

  self->_trAuthenticationStateReset = 0;
  -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  -[HDSDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  -[HDSBonjourTest invalidate](self->_bonjourTestOperation, "invalidate");
  bonjourTestOperation = self->_bonjourTestOperation;
  self->_bonjourTestOperation = 0;

  -[SFDeviceOperationCNJSetup invalidate](self->_captiveJoin, "invalidate");
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HDSSetupSession_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HDSSetupSession_activate__block_invoke(uint64_t a1)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[8])
    return objc_msgSend(v1, "_run");
  else
    return objc_msgSend(v1, "_activate");
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
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  uint64_t v33;
  BOOL v34;
  BOOL v35;
  uint64_t v36;
  BOOL v37;
  BOOL v38;
  uint64_t v39;
  BOOL v40;
  BOOL v41;
  int v42;
  uint64_t v43;
  BOOL v44;
  BOOL v45;
  void *v46;
  int jsDefaultDisabled;
  const char *v48;
  int IsVirtualMachine;
  const char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  RPCompanionLinkClient *v58;
  RPCompanionLinkClient *companionLinkClient;
  RPCompanionLinkClient *v60;
  void *v61;
  SSAccount *v62;
  SSAccount *iTunesAccount;
  NSString *v64;
  NSString *iTunesUserID;
  void (**progressHandler)(id, uint64_t, _QWORD);
  const char *v67;
  _QWORD v68[5];
  _QWORD v69[4];
  id v70;
  id location;
  _QWORD v72[5];
  id v73;
  int v74;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v74 = 0;
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  notify_register_check("com.apple.sharing.wha-prox-setup", &self->_proxSetupActiveToken);
  notify_set_state(self->_proxSetupActiveToken, 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  -[HDSSetupSession preflightAppleMusic](self, "preflightAppleMusic");
  Int64 = CFPrefs_GetInt64();
  if (v74)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  self->_apcEnabled = v5;
  v6 = CFPrefs_GetInt64();
  if (v74)
    v7 = 0;
  else
    v7 = v6 == 0;
  v8 = !v7;
  self->_appleMusicEnabled = v8;
  self->_appleMusicForce = CFPrefs_GetInt64() != 0;
  self->_forceSoftwareUpdate = CFPrefs_GetInt64() != 0;
  v9 = CFPrefs_GetInt64();
  if (v74)
    v10 = 0;
  else
    v10 = v9 == 0;
  v11 = !v10;
  self->_audioProgress = v11;
  v12 = CFPrefs_GetInt64();
  if (v74)
    v13 = 0;
  else
    v13 = v12 == 0;
  v14 = !v13;
  self->_cdpEnabled = v14;
  v15 = CFPrefs_GetInt64();
  if (v74)
    v16 = 0;
  else
    v16 = v15 == 0;
  v17 = !v16;
  self->_prefTVAudioEnabled = v17;
  if (v16
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v18 = CFPrefs_GetInt64();
  if (v74)
    v19 = 0;
  else
    v19 = v18 == 0;
  v20 = !v19;
  self->_prefBonjourTest = v20;
  v21 = CFPrefs_GetInt64();
  if (v74)
    v22 = 0;
  else
    v22 = v21 == 0;
  v23 = !v22;
  self->_preflightEnabled = v23;
  self->_prefForceSiriGreeting = CFPrefs_GetInt64() != 0;
  v24 = CFPrefs_GetInt64();
  if (v74)
    v25 = 0;
  else
    v25 = v24 == 0;
  v26 = !v25;
  self->_prefLEDPasscodeEnabled = v26;
  v27 = CFPrefs_GetInt64();
  if (v74)
    v28 = 0;
  else
    v28 = v27 == 0;
  v29 = !v28;
  self->_prefMultiUser = v29;
  v30 = CFPrefs_GetInt64();
  if (v74)
    v31 = 0;
  else
    v31 = v30 == 0;
  v32 = !v31;
  self->_prefStereoPairEnabled = v32;
  v33 = CFPrefs_GetInt64();
  if (v74)
    v34 = 0;
  else
    v34 = v33 == 0;
  v35 = !v34;
  self->_prefStereoWait = v35;
  v36 = CFPrefs_GetInt64();
  if (v74)
    v37 = 0;
  else
    v37 = v36 == 0;
  v38 = !v37;
  self->_preventAppleWiFi = v38;
  v39 = CFPrefs_GetInt64();
  if (v74)
    v40 = 0;
  else
    v40 = v39 == 0;
  v41 = !v40;
  self->_siriPasscodeEnabled = v41;
  v42 = self->_appleStoreMode | CFPrefs_GetInt64();
  if (v74)
    v42 = 0;
  self->_appleStoreMode = v42;
  v43 = CFPrefs_GetInt64();
  if (v74)
    v44 = 1;
  else
    v44 = v43 == 0;
  v45 = !v44;
  self->_prefPrototypeForceUpdate = v45;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.HomeDeviceSetup"));
  jsDefaultDisabled = objc_msgSend(v46, "BOOLForKey:", CFSTR("hdsDisableJS"));
  self->_jsDefaultDisabled = jsDefaultDisabled;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_103;
      jsDefaultDisabled = self->_jsDefaultDisabled;
    }
    v48 = "yes";
    if (!jsDefaultDisabled)
      v48 = "no";
    v67 = v48;
    LogPrintF();
  }
LABEL_103:
  self->_skipWiFiSetup = CFPrefs_GetInt64() != 0;
  if (v74)
  {
    IsVirtualMachine = SFDeviceIsVirtualMachine();
    self->_skipWiFiSetup = IsVirtualMachine;
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_110;
        IsVirtualMachine = self->_skipWiFiSetup;
      }
      v50 = "yes";
      if (!IsVirtualMachine)
        v50 = "no";
      v67 = v50;
      LogPrintF();
    }
  }
LABEL_110:
  v51 = CFPrefs_GetInt64();
  v52 = 5;
  if (!v74)
    v52 = v51;
  self->_wifiMaxAttempts = v52;
  v53 = CFPrefs_GetInt64();
  if (v74)
    v54 = 1;
  else
    v54 = v53;
  self->_wifiRetryDelay = v54;
  -[HDSSetupSession isDeviceActiveFetch](self, "isDeviceActiveFetch", v67);
  -[HDSSetupSession fetchTermsAndConditionsServerStatus](self, "fetchTermsAndConditionsServerStatus");
  -[HDSSetupSession loadMultiUserSupportedLanguages](self, "loadMultiUserSupportedLanguages");
  v55 = objc_alloc_init((Class)getAFSettingsConnectionClass_0[0]());
  v56 = MEMORY[0x24BDAC760];
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __28__HDSSetupSession__activate__block_invoke;
  v72[3] = &unk_24FCD4F40;
  v72[4] = self;
  v57 = v55;
  v73 = v57;
  objc_msgSend(v57, "getSiriDataSharingOptInStatusWithCompletion:", v72);
  objc_initWeak(&location, self);
  v58 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v58;

  -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", self->_dispatchQueue);
  v69[0] = v56;
  v69[1] = 3221225472;
  v69[2] = __28__HDSSetupSession__activate__block_invoke_2;
  v69[3] = &unk_24FCD4F68;
  objc_copyWeak(&v70, &location);
  -[RPCompanionLinkClient setDeviceFoundHandler:](self->_companionLinkClient, "setDeviceFoundHandler:", v69);
  v60 = self->_companionLinkClient;
  v68[0] = v56;
  v68[1] = 3221225472;
  v68[2] = __28__HDSSetupSession__activate__block_invoke_3;
  v68[3] = &unk_24FCD4138;
  v68[4] = self;
  -[RPCompanionLinkClient activateWithCompletion:](v60, "activateWithCompletion:", v68);
  objc_msgSend((Class)getSSAccountStoreClass[0](), "defaultStore");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activeAccount");
  v62 = (SSAccount *)objc_claimAutoreleasedReturnValue();
  iTunesAccount = self->_iTunesAccount;
  self->_iTunesAccount = v62;

  -[SSAccount accountName](self->_iTunesAccount, "accountName");
  v64 = (NSString *)objc_claimAutoreleasedReturnValue();
  iTunesUserID = self->_iTunesUserID;
  self->_iTunesUserID = v64;

  -[HDSSetupSession _setupAudio](self, "_setupAudio");
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 10, 0);
  if (self->_isCLIMode)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_126;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_126:
  -[HDSSetupSession _run](self, "_run");
  objc_destroyWeak(&v70);
  objc_destroyWeak(&location);

}

void __28__HDSSetupSession__activate__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v5, CFSTR("Activate"));
    v5 = v9;
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (v6 = _LogCategory_Initialize(), v5 = v9, v6))
    {
      LogPrintF();
      v5 = v9;
    }
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v7 = _LogCategory_Initialize(), v5 = v9, v7))
      {
        LogPrintF();
        v5 = v9;
      }
    }
  }
  if (a3 == 2)
    v8 = 5;
  else
    v8 = 0;
  if (a3 == 1)
    v8 = 6;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 528) = v8;

}

void __28__HDSSetupSession__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deviceColorFoundHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("AudioAccessory5,1"));

    if (v8 && v6 && v5)
      ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

void __28__HDSSetupSession__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  AVAudioPlayer *audioPlayerStart;
  AVAudioPlayer *audioPlayerStep;
  void *v5;
  void *v6;
  AVAudioSession *audioSession;
  BOOL v8;
  id v9;
  AVAudioSession *v10;
  RPCompanionLinkClient *companionLinkClient;
  id v12;
  id v13;

  if (!self->_invalidateCalled
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  -[AVAudioPlayer stop](self->_audioPlayerStart, "stop");
  -[AVAudioPlayer setDelegate:](self->_audioPlayerStart, "setDelegate:", 0);
  audioPlayerStart = self->_audioPlayerStart;
  self->_audioPlayerStart = 0;

  -[AVAudioPlayer stop](self->_audioPlayerStep, "stop");
  -[AVAudioPlayer setDelegate:](self->_audioPlayerStep, "setDelegate:", 0);
  audioPlayerStep = self->_audioPlayerStep;
  self->_audioPlayerStep = 0;

  if (self->_audioSession)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getAVAudioSessionInterruptionNotification[0]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, v6, self->_audioSession);

    audioSession = self->_audioSession;
    v13 = 0;
    v8 = -[AVAudioSession setActive:error:](audioSession, "setActive:error:", 0, &v13);
    v9 = v13;
    if (!v8)
    {
      -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v9, CFSTR("Invalidate"));
      if (gLogCategory_HDSSetupSession <= 50
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v12 = v9;
        LogPrintF();
      }
    }
    v10 = self->_audioSession;
    self->_audioSession = 0;

  }
  -[RPCompanionLinkClient invalidate](self->_companionLinkClient, "invalidate", v12);
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  -[HDSSetupSession _cleanup](self, "_cleanup");
}

- (void)appleMusicNext
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HDSSetupSession_appleMusicNext__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HDSSetupSession_appleMusicNext__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];
  uint8_t buf[16];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 192))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "AppleMusic", (const char *)&unk_22F7B8AEE, v9, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192) = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)homePodSoftwareUpdateNonSetupAcknowledged
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_homePodSoftwareUpdateNonSetupAcknowledged__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSSetupSession_homePodSoftwareUpdateNonSetupAcknowledged__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1316) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)homePodSoftwareUpdateNonSetupDidComplete
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HDSSetupSession_homePodSoftwareUpdateNonSetupDidComplete__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__HDSSetupSession_homePodSoftwareUpdateNonSetupDidComplete__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1428) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)disconnect
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_disconnect__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HDSSetupSession_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 272);
  *(_QWORD *)(v2 + 272) = 0;

}

- (void)homeAppInstallChoice:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__HDSSetupSession_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_24FCD4268;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__HDSSetupSession_homeAppInstallChoice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "homeAppInstallChoice:", *(unsigned __int8 *)(a1 + 40));
}

- (void)homeiCloudEnable
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_homeiCloudEnable__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_homeiCloudEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)homeKitSelectHome:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__HDSSetupSession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __37__HDSSetupSession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "selectHome:", *(_QWORD *)(a1 + 40));
}

- (void)homeKitReselectHome
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_homeKitReselectHome__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__HDSSetupSession_homeKitReselectHome__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "reselectHome");
}

- (void)homeKitSelectRoom:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__HDSSetupSession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __37__HDSSetupSession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "selectRoom:", *(_QWORD *)(a1 + 40));
}

- (void)ledPasscodeMatched
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HDSSetupSession_ledPasscodeMatched__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__HDSSetupSession_ledPasscodeMatched__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 437) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)locationEnable:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__HDSSetupSession_locationEnable___block_invoke;
  v4[3] = &unk_24FCD4268;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__HDSSetupSession_locationEnable___block_invoke(uint64_t a1)
{
  int v2;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 204) = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 205) = 1;
  if (*(_BYTE *)(a1 + 40))
    v2 = 1;
  else
    v2 = 2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1264) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__HDSSetupSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__HDSSetupSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)personalRequestsEnabled:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__HDSSetupSession_personalRequestsEnabled___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__HDSSetupSession_personalRequestsEnabled___block_invoke(uint64_t a1)
{
  BOOL v2;
  int v3;
  int v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_BYTE *)(a1 + 40) == 0;
  if (*(_BYTE *)(a1 + 40))
    v3 = 6;
  else
    v3 = 5;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 504) = v3;
  if (v2)
    v4 = 2;
  else
    v4 = 1;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1256) = v4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)playAudioPasscodeAgain
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HDSSetupSession_playAudioPasscodeAgain__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__HDSSetupSession_playAudioPasscodeAgain__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 444;
  if (!*(_BYTE *)(v2 + 1138))
    v3 = 400;
  *(_BYTE *)(v2 + v3) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)preflight
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__HDSSetupSession_preflight__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__HDSSetupSession_preflight__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((Class)getSSAccountStoreClass[0](), "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "accountName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 160);
  *(_QWORD *)(v7 + 160) = v6;

}

- (void)preflightAppleMusic
{
  BOOL v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *appleMusicTimeoutTimer;
  NSObject *v9;
  _QWORD handler[5];
  _QWORD v11[5];
  int v12;

  v12 = 0;
  v3 = CFPrefs_GetInt64() == 0;
  v4 = !v3;
  self->_appleMusicEnabled = v4;
  if (!v3 && self->_iTunesAccount)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_appleMusicState = 1;
    v5 = objc_alloc_init((Class)getSKCloudServiceControllerClass[0]());
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__HDSSetupSession_preflightAppleMusic__block_invoke;
    v11[3] = &unk_24FCD4F90;
    v11[4] = self;
    objc_msgSend(v5, "requestCapabilitiesWithCompletionHandler:", v11);
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    appleMusicTimeoutTimer = self->_appleMusicTimeoutTimer;
    self->_appleMusicTimeoutTimer = v7;

    v9 = self->_appleMusicTimeoutTimer;
    handler[0] = v6;
    handler[1] = 3221225472;
    handler[2] = __38__HDSSetupSession_preflightAppleMusic__block_invoke_2;
    handler[3] = &unk_24FCD3FE8;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    HDSDispatchTimerSet(self->_appleMusicTimeoutTimer, 15.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_appleMusicTimeoutTimer);

  }
}

void __38__HDSSetupSession_preflightAppleMusic__block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v7 = v8;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_preflightAppleMusicCompleted:", 2, v7);
    objc_msgSend(*(id *)(a1 + 32), "setAcceptedMusicTerms:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v8, CFSTR("Preflight-AppleMusic"));
    goto LABEL_25;
  }
  if ((a2 & 1) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = *(void **)(a1 + 32);
    v6 = 6;
    goto LABEL_22;
  }
  if ((a2 & 2) == 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = *(void **)(a1 + 32);
    v6 = 2;
LABEL_22:
    objc_msgSend(v5, "_preflightAppleMusicCompleted:", v6);
    goto LABEL_25;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_preflightAppleMusicCompleted:", 5);
  objc_msgSend(*(id *)(a1 + 32), "setAcceptedMusicTerms:", 1);
LABEL_25:

}

uint64_t __38__HDSSetupSession_preflightAppleMusic__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_preflightAppleMusicCompleted:", 2);
}

- (void)_preflightAppleMusicCompleted:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v6[5];
  int v7;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__HDSSetupSession__preflightAppleMusicCompleted___block_invoke;
  v6[3] = &unk_24FCD4FB8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(dispatchQueue, v6);
}

void __49__HDSSetupSession__preflightAppleMusicCompleted___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  if (v1)
  {
    v3 = v1;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 184);
    *(_QWORD *)(v4 + 184) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 24))
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_8:
        LogPrintF();
      }
    }
    else
    {
      if (*(_BYTE *)(v6 + 176))
        v7 = 5;
      else
        v7 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v6 + 172) = v7;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(*(id *)(a1 + 32), "_run");
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
}

- (BOOL)homePodBuildRequiresADPForcedSU
{
  return (self->_homePodProductVersion - 1) < 3;
}

- (void)recognizeVoiceAnswered:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HDSSetupSession_recognizeVoiceAnswered___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __42__HDSSetupSession_recognizeVoiceAnswered___block_invoke(uint64_t a1)
{
  BOOL v2;
  int v3;
  int v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_BYTE *)(a1 + 40) == 0;
  if (*(_BYTE *)(a1 + 40))
    v3 = 6;
  else
    v3 = 5;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 488) = v3;
  if (v2)
    v4 = 3;
  else
    v4 = 2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1244) = v4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)homePodNeedsSUBeforeSetup
{
  void *v3;
  char v4;
  BOOL v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.HomeDeviceSetup"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("forceSUNoSetup"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (v4 & 1) != 0 || self->_homePodSaysNeedsSUNoSetup;

  return v5;
}

- (BOOL)sysDropEnabled
{
  return +[HDSDefaults sysDropEnabled](HDSDefaults, "sysDropEnabled");
}

- (HMHome)selectedHome
{
  return -[HDSDeviceOperationHomeKitSetup homeKitSelectedHome](self->_homeKitSetupOperation, "homeKitSelectedHome");
}

- (id)selectedRoom
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSString *homeKitSelectedRoomName;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HDSSetupSession selectedHome](self, "selectedHome", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rooms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(homeKitSelectedRoomName) = -[NSString isEqualToString:](homeKitSelectedRoomName, "isEqualToString:", v12);

        if ((_DWORD)homeKitSelectedRoomName)
        {
          v13 = v10;

          v7 = v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_homePodsInAccount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HDSSetupSession availableHomes](self, "availableHomes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    v5 = *MEMORY[0x24BDD49E0];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v7, "accessories");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v13, "category");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "categoryType");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v15, "isEqualToString:", v5))
                objc_msgSend(v4, "addObject:", v13);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v4;
}

- (id)_homePodsInSelectedHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x24BDD49E0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "category", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "categoryType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "isEqualToString:", v10))
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)selectedRoomHasHomePods
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];

  -[HDSSetupSession selectedHome](self, "selectedHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__HDSSetupSession_selectedRoomHasHomePods__block_invoke;
  v8[3] = &unk_24FCD4FE0;
  v8[4] = self;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __42__HDSSetupSession_selectedRoomHasHomePods__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976)))
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD49E0]);
  else
    v8 = 0;

  return v8;
}

- (id)_selectedRoomHomePod
{
  NSString *homeKitSelectedRoomName;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  void *v11;
  _QWORD v12[4];
  NSString *v13;

  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (!homeKitSelectedRoomName)
    return 0;
  v4 = homeKitSelectedRoomName;
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__HDSSetupSession__selectedRoomHomePod__block_invoke;
  v12[3] = &unk_24FCD4FE0;
  v8 = v4;
  v13 = v8;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v12);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __39__HDSSetupSession__selectedRoomHomePod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD49E0]);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_roomHasOdeonConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = *MEMORY[0x24BDD49A0];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "room", (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "categoryType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isEqualToString:", v4))
        {
          if (objc_msgSend(v18, "isEqualToString:", v12))
          {
            objc_msgSend(v14, "audioDestinationController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }

              v20 = 1;
              goto LABEL_21;
            }
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (id)_selectedRoomAllHomePods
{
  NSString *homeKitSelectedRoomName;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = (id)objc_opt_new();
  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (homeKitSelectedRoomName)
  {
    v4 = homeKitSelectedRoomName;
    -[HDSSetupSession selectedHome](self, "selectedHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x24BDD49E0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "room");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "category");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "categoryType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "isEqualToString:", v4)
            && objc_msgSend(v18, "isEqualToString:", v12))
          {
            objc_msgSend(v20, "addObject:", v14);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return v20;
}

- (id)_selectedRoomAllStereoPairs
{
  NSString *homeKitSelectedRoomName;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  NSString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v19 = (id)objc_opt_new();
  homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
  if (homeKitSelectedRoomName)
  {
    v21 = homeKitSelectedRoomName;
    -[HDSSetupSession selectedHome](self, "selectedHome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSystems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "components");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mediaProfile");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "room");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "isEqualToString:", v21))
            objc_msgSend(v19, "addObject:", v11);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return v19;
}

- (NSString)selectedSiriLanguageCode
{
  _BOOL4 siriLanguagePicked;
  NSString *selectedSiriLanguageCode;

  siriLanguagePicked = self->_siriLanguagePicked;
  selectedSiriLanguageCode = self->_selectedSiriLanguageCode;
  if (!siriLanguagePicked && selectedSiriLanguageCode == 0)
    selectedSiriLanguageCode = self->_companionSiriLanguageCode;
  return selectedSiriLanguageCode;
}

- (void)shareSettingsAgreed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_shareSettingsAgreed__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__HDSSetupSession_shareSettingsAgreed__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 580) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)siriEnable
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupSession_siriEnable__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupSession_siriEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 206) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)siriDataSharingEnabled
{
  return self->_siriDataSharing == 6;
}

- (void)siriForEveryoneAnswered
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HDSSetupSession_siriForEveryoneAnswered__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__HDSSetupSession_siriForEveryoneAnswered__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)siriLanguagePicked:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HDSSetupSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__HDSSetupSession_siriLanguagePicked___block_invoke;
  v7[3] = &unk_24FCD4290;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __38__HDSSetupSession_siriLanguagePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 312), *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 320) = 1;
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (void)siriVoicePicked:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__HDSSetupSession_siriVoicePicked___block_invoke;
  v7[3] = &unk_24FCD4290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__HDSSetupSession_siriVoicePicked___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "completionLoggingBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 1);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 344);
  *(_QWORD *)(v3 + 344) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)didDismiss
{
  AFEnablementConfiguration *siriEnablementConfiguration;
  void (**v3)(id, _QWORD);

  siriEnablementConfiguration = self->_siriEnablementConfiguration;
  if (siriEnablementConfiguration)
  {
    -[AFEnablementConfiguration completionLoggingBlock](siriEnablementConfiguration, "completionLoggingBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
}

- (void)siriForiCloudRecognizeAnswered:(BOOL)a3
{
  _BOOL8 v3;
  Class v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (Class)getHFUtilitiesClass[0]();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__HDSSetupSession_siriForiCloudRecognizeAnswered___block_invoke;
  v6[3] = &unk_24FCD5008;
  v6[4] = self;
  v7 = v3;
  -[objc_class updateSiriForiCloudEnabled:completionHandler:](v5, "updateSiriForiCloudEnabled:completionHandler:", v3, v6);
}

void __50__HDSSetupSession_siriForiCloudRecognizeAnswered___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  int v6;
  id v7;
  const char *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v6 = _LogCategory_Initialize(), v4 = v9, v6))
      {
        v7 = v4;
        LogPrintF();
        v4 = v9;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v4, CFSTR("siriForICloud"), v7);
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 40))
      v5 = "yes";
    else
      v5 = "no";
    v8 = v5;
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 32), "recognizeVoiceAnswered:", *(unsigned __int8 *)(a1 + 40), v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "recognizeVoiceAnswered:", *(unsigned __int8 *)(a1 + 40), v7);
  }

}

- (void)skipAudioPasscode
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HDSSetupSession_skipAudioPasscode__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__HDSSetupSession_skipAudioPasscode__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 444) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 445) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 403) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)skipiTunesSignIn
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_skipiTunesSignIn__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_skipiTunesSignIn__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)shouldShowHomePodSoftwareUpdateAvailable
{
  int v3;
  BOOL v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_userOptedToHH2)
  {
    v3 = gLogCategory_HDSSetupSession;
    if ((self->_peerFeatureFlags & 0x800) == 0)
    {
      if (gLogCategory_HDSSetupSession > 30)
        return 1;
      if (gLogCategory_HDSSetupSession == -1)
      {
        v4 = 1;
        if (!_LogCategory_Initialize())
          return v4;
      }
      else
      {
        v4 = 1;
      }
      goto LABEL_15;
    }
  }
  else
  {
    v3 = gLogCategory_HDSSetupSession;
  }
  if (v3 > 30)
    return 0;
  if (v3 == -1)
  {
    v4 = 0;
    if (!_LogCategory_Initialize())
      return v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_15:
  LogPrintF();
  return v4;
}

- (int)exportAMSTokenAndAccountSetup:(id)a3 ifMissing:(BOOL)a4 ifInvalid:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  int amsActivationState;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  amsActivationState = self->_amsActivationState;
  if (!amsActivationState)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_7;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_amsActivationState)
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AMSMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_amsActivationState = 1;
    self->_amsOptimizationStartTicks = mach_absolute_time();
    objc_msgSend(MEMORY[0x24BE08290], "proxyObjectAsync");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke;
    v15[3] = &unk_24FCD5030;
    v15[4] = self;
    objc_msgSend(v13, "exportMultiUserTokenForHomeIdentifier:generateIfMissing:generateIfInvalid:completion:", v8, v6, v5, v15);

    amsActivationState = self->_amsActivationState;
  }

  return amsActivationState;
}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2;
  block[3] = &unk_24FCD42E0;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        v13 = v2;
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v2, CFSTR("ExportAMSToken"), v13);
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 464))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AMSMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AMSMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 464) = 2;
    objc_msgSend(*(id *)(a1 + 40), "_run");
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("amsT"));
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v13 = *(_QWORD *)(a1 + 48);
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 272);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2_339;
    v14[3] = &unk_24FCD4618;
    v14[4] = v11;
    objc_msgSend(v12, "sendRequestID:options:request:responseHandler:", CFSTR("_hds_ams_token"), &unk_24FCE3C50, v3, v14, v13);

  }
}

void __69__HDSSetupSession_exportAMSTokenAndAccountSetup_ifMissing_ifInvalid___block_invoke_2_339(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t Int64;
  _DWORD *v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  NSObject *v20;
  uint64_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];
  uint8_t v27[16];

  v6 = a2;
  v7 = a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = v8;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160);
    LogPrintF();
  }
  Int64 = CFDictionaryGetInt64();
  v10 = *(_DWORD **)(a1 + 32);
  if (v6 || !Int64)
  {
    objc_msgSend(v10, "_logMetricsForSoftError:label:", v6, CFSTR("ExportAMSToken"), v23);
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 464))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v19 = v18;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)v27 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "AMSMultiUser", (const char *)&unk_22F7B8AEE, v27, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v22 = v21;
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)v26 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_END, v22, "AMSMultiUser", (const char *)&unk_22F7B8AEE, v26, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 464) = 2;
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_28;
    }
  }
  else
  {
    if (!v10[116])
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AMSMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_END, v16, "AMSMultiUser", (const char *)&unk_22F7B8AEE, v24, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 464) = 4;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_28:
      LogPrintF();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_run", v23);

}

- (void)speakPasscodeWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HDSSetupSession_speakPasscodeWithCompletion___block_invoke;
  v7[3] = &unk_24FCD41B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __47__HDSSetupSession_speakPasscodeWithCompletion___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_speakPasscodeWithInstructions:languageCode:completion:", 0, 0, *(_QWORD *)(a1 + 40));
}

- (void)speakPasscodeWithLanguageCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HDSSetupSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_speakPasscodeWithLanguageCode_completion___block_invoke;
  block[3] = &unk_24FCD5058;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __60__HDSSetupSession_speakPasscodeWithLanguageCode_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_speakPasscodeWithInstructions:languageCode:completion:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)speakPasscodeWithInstructions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_speakPasscodeWithInstructions_completion___block_invoke;
  block[3] = &unk_24FCD5058;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __60__HDSSetupSession_speakPasscodeWithInstructions_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_speakPasscodeWithInstructions:languageCode:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HDSSetupSession *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__HDSSetupSession_speakPasscodeWithInstructions_languageCode_completion___block_invoke;
  v15[3] = &unk_24FCD4ED8;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __73__HDSSetupSession_speakPasscodeWithInstructions_languageCode_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_speakPasscodeWithInstructions:languageCode:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)_speakPasscodeWithInstructions:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  AFVoiceInfo *selectedSiriVoice;
  AFVoiceInfo *v16;
  AFVoiceInfo *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  SFSession *sfSession;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HDSSetupSession *v35;
  _QWORD v36[5];
  id v37;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x24BDBCED8];
  v11 = a3;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24FCE3EF0, CFSTR("aa"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("authI"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("lang"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v30 = v8;
    LogPrintF();
  }
  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  selectedSiriVoice = self->_selectedSiriVoice;
  if (selectedSiriVoice)
  {
    v16 = selectedSiriVoice;
  }
  else
  {
    objc_msgSend(v13, "outputVoice");
    v16 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    -[AFVoiceInfo name](v17, "name", v30);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  -[AFVoiceInfo languageCode](v17, "languageCode", v30);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 != v8)
  {
    objc_msgSend((Class)getAFVoiceInfoClass_0[0](), "allVoicesForSiriSessionLanguage:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v31 = v19;
      LogPrintF();
    }
    -[AFVoiceInfo name](v17, "name", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hmf_firstObjectWithName:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v19, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        if (gLogCategory_HDSSetupSession <= 90
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v24 = 0;
        v21 = 0;
        goto LABEL_47;
      }
    }
    v35 = self;
    v25 = v9;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v24, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v26 = objc_msgSend(v24, "gender", v32);
    objc_msgSend(v24, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("siriVG"));

    }
    if (v21)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("siriVN"));
    if (gLogCategory_HDSSetupSession > 30)
    {
      v9 = v25;
    }
    else
    {
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      {
        v33 = (void *)v26;
        LogPrintF();
      }
      v9 = v25;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        {
          v33 = v21;
          LogPrintF();
        }
        self = v35;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v24, "name", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        goto LABEL_47;
      }
    }
    self = v35;
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  v20 = -[AFVoiceInfo gender](v17, "gender");
  -[AFVoiceInfo name](v17, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("siriVG"));

  }
  if (v21)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("siriVN"));
  if (v17)
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      {
        v31 = (void *)v20;
        LogPrintF();
      }
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        {
          v31 = v21;
          LogPrintF();
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          -[AFVoiceInfo name](v17, "name", v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
          goto LABEL_48;
        }
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_49:
  sfSession = self->_sfSession;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __74__HDSSetupSession__speakPasscodeWithInstructions_languageCode_completion___block_invoke;
  v36[3] = &unk_24FCD4DC0;
  v36[4] = self;
  v37 = v9;
  v29 = v9;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_aa"), &unk_24FCE3C78, v12, v36);

}

void __74__HDSSetupSession__speakPasscodeWithInstructions_languageCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v9 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v11, CFSTR("SecureConnection-SiriPasscode"));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v8);

}

- (void)stereoRolePicked:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__HDSSetupSession_stereoRolePicked___block_invoke;
  v4[3] = &unk_24FCD4FB8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__HDSSetupSession_stereoRolePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 236) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)stereoMultiplePicked:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HDSSetupSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__HDSSetupSession_stereoMultiplePicked___block_invoke;
  v7[3] = &unk_24FCD4290;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __40__HDSSetupSession_stereoMultiplePicked___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 224), *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (void)soundRecognitionAgreed:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

void __42__HDSSetupSession_soundRecognitionAgreed___block_invoke(uint64_t a1)
{
  const char *v2;
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 40))
      v2 = "yes";
    else
      v2 = "no";
    v12 = v2;
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 553) = 1;
  if (*(_BYTE *)(a1 + 40))
    v3 = 2;
  else
    v3 = 3;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1248) = v3;
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (gLogCategory_HDSSetupSession <= 30)
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_18;
      v5 = *(unsigned __int8 *)(a1 + 40);
    }
    if (v5)
      v6 = "yes";
    else
      v6 = "no";
    v12 = v6;
    LogPrintF();
  }
LABEL_18:
  if ((_DWORD)v4)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(*(id *)(a1 + 32), "selectedHome", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeAccessControlForUser:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_2;
  v14[3] = &unk_24FCD4138;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "updateAudioAnalysisUserDropinAccessLevel:completionHandler:", v7, v14);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_3;
  v13[3] = &unk_24FCD4138;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "updateAudioAnalysisClassifierOptions:completion:", v4, v13);
  objc_msgSend(*(id *)(a1 + 32), "_run");

}

void __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v6, CFSTR("SoundRecognition"));
    v3 = v6;
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }

}

void __42__HDSSetupSession_soundRecognitionAgreed___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
    {
      LogPrintF();
      v3 = v7;
    }
  }
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
      {
        v6 = v3;
        LogPrintF();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v7, CFSTR("SoundRecognition"), v6);
    v3 = v7;
  }

}

- (void)automaticSoftwareUpdatesAgreed:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke(uint64_t a1)
{
  const char *v2;
  int v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  const char *v8;
  _QWORD v9[5];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 40))
      v2 = "yes";
    else
      v2 = "no";
    v8 = v2;
    LogPrintF();
  }
  if (*(_BYTE *)(a1 + 40))
    v3 = 1;
  else
    v3 = 2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 536) = v3;
  v4 = *(_DWORD **)(a1 + 32);
  if (v4[134])
  {
    objc_msgSend(v4, "selectedHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke_2;
    v9[3] = &unk_24FCD4138;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "updateAutomaticSoftwareUpdateEnabled:completionHandler:", v6, v9);

    v4 = *(_DWORD **)(a1 + 32);
  }
  return objc_msgSend(v4, "_run", v8);
}

void __50__HDSSetupSession_automaticSoftwareUpdatesAgreed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v3, CFSTR("AutomaticSoftwareUpdates"));
    v4 = v7;
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
LABEL_7:
        LogPrintF();
        v4 = v7;
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30)
  {
    v7 = 0;
    if (gLogCategory_HDSSetupSession != -1)
      goto LABEL_7;
    v6 = _LogCategory_Initialize();
    v4 = 0;
    if (v6)
      goto LABEL_7;
  }

}

- (void)softwareUpdateAgreed:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__HDSSetupSession_softwareUpdateAgreed___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__HDSSetupSession_softwareUpdateAgreed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1429))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_DWORD *)(v2 + 544) = 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1444) = 1;
      if (gLogCategory_HDSSetupSession > 30)
        return objc_msgSend(*(id *)(a1 + 32), "_run");
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
    }
  }
  else if (*(_BYTE *)(v2 + 1427) && *(_DWORD *)(v2 + 1440) != 4 && *(_DWORD *)(v2 + 536) == 2)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = 1;
      *(_DWORD *)(v2 + 544) = 1;
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_DWORD *)(v4 + 1440);
      if ((v5 - 2) >= 2 && v5 != 1)
        goto LABEL_22;
    }
    else
    {
      *(_DWORD *)(v2 + 544) = 2;
      v4 = *(_QWORD *)(a1 + 32);
      if ((*(_DWORD *)(v4 + 1440) & 0xFFFFFFFE) != 2)
        goto LABEL_22;
      v3 = 3;
    }
    *(_DWORD *)(v4 + 1444) = v3;
  }
LABEL_22:
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)termsAgreed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupSession_termsAgreed__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__HDSSetupSession_termsAgreed__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 560) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)psgSelected:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__HDSSetupSession_psgSelected___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __31__HDSSetupSession_psgSelected___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1272) = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1273) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)tvAudioEnabled:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__HDSSetupSession_tvAudioEnabled___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__HDSSetupSession_tvAudioEnabled___block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 241) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)identifyHomePod:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[RPCompanionLinkClient activeDevices](self->_companionLinkClient, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "name");
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__HDSSetupSession_identifyHomePod___block_invoke;
  v13[3] = &unk_24FCD5080;
  v12 = v4;
  v14 = v12;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self->_companionLinkClient, "sendRequestID:request:destinationID:options:responseHandler:", *MEMORY[0x24BE7CD28], MEMORY[0x24BDBD1B8], v9, 0, &__block_literal_global_6, v9, v11);
      }
      else
      {
        -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](self->_companionLinkClient, "sendRequestID:request:destinationID:options:responseHandler:", *MEMORY[0x24BE7CD28], MEMORY[0x24BDBD1B8], v9, 0, &__block_literal_global_6, v10, v11);
      }
    }
    else if (gLogCategory_HDSSetupSession <= 30
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

uint64_t __35__HDSSetupSession_identifyHomePod___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  return v6;
}

void __35__HDSSetupSession_identifyHomePod___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

- (int)expressSetupState
{
  if (!self->_hasExistingHomePodInAccount)
    return 1;
  if (!self->_hasExistingHomePod)
    return 2;
  if (self->_existingHomepodInSelectedRoom)
    return 4;
  return 3;
}

- (void)fetchLocationServicesEnabled
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 207) = objc_msgSend((Class)getCLLocationManagerClass_0[0](), "locationServicesEnabled");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke_2;
  block[3] = &unk_24FCD3FE8;
  block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __47__HDSSetupSession_fetchLocationServicesEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 200))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PreflightMisc", (const char *)&unk_22F7B8AEE, v7, 2u);
      }
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 200) = 10;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)isDeviceActiveFetch
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if ((HDSIsDevicePhone() & 1) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc((Class)getFMFSessionClass[0]());
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithDelegate:delegateQueue:", self, v4);

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__HDSSetupSession_isDeviceActiveFetch__block_invoke;
    v6[3] = &unk_24FCD50E8;
    v6[4] = self;
    objc_msgSend(v5, "getActiveLocationSharingDevice:", v6);

  }
  else
  {
    self->_activeDeviceSelectionState = 0;
  }
}

void __38__HDSSetupSession_isDeviceActiveFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession_isDeviceActiveFetch__block_invoke_2;
  block[3] = &unk_24FCD42E0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __38__HDSSetupSession_isDeviceActiveFetch__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  if (*(_QWORD *)(result + 32))
  {
    if (gLogCategory_HDSSetupSession > 90)
      goto LABEL_17;
    if (gLogCategory_HDSSetupSession == -1)
    {
      result = _LogCategory_Initialize();
      if (!(_DWORD)result)
        goto LABEL_17;
    }
    goto LABEL_11;
  }
  result = objc_msgSend(*(id *)(result + 48), "isThisDevice");
  if (!(_DWORD)result)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_17;
    if (gLogCategory_HDSSetupSession == -1)
    {
      result = _LogCategory_Initialize();
      if (!(_DWORD)result)
        goto LABEL_17;
    }
LABEL_11:
    result = LogPrintF();
LABEL_17:
    v2 = 2;
    goto LABEL_18;
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  v2 = 1;
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(v1 + 40) + 1260) = v2;
  return result;
}

- (void)fetchTermsAndConditionsServerStatus
{
  void *v3;
  _QWORD v4[5];

  if (+[HDSDefaults forceFailTCServerResponse](HDSDefaults, "forceFailTCServerResponse"))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_termsAndConditionsServersActive = 0;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend((Class)getAARemoteServerClass[0](), "sharedServerWithNoUrlCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke;
    v4[3] = &unk_24FCD5110;
    v4[4] = self;
    objc_msgSend(v3, "configurationWithCompletion:", v4);

  }
}

void __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke_2;
  block[3] = &unk_24FCD42E0;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__HDSSetupSession_fetchTermsAndConditionsServerStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v2, CFSTR("TermsAndConditions"));
  objc_msgSend(*(id *)(a1 + 48), "homepodSetupiCloudTerms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1369) = v3 != 0;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int64_t)roomHomePodStereoPairCount
{
  uint64_t v2;

  if (self->_stereoPairUserInputState == 4)
  {
    if (self->_stereoCounterpartAccessory)
      v2 = -1;
    else
      v2 = 0;
  }
  else
  {
    v2 = 0;
  }
  return v2 + self->_selectedRoomHomePodAndStereoPairCount;
}

- (void)setSysDropMode:(BOOL)a3
{
  +[HDSDefaults setSysDropMode:](HDSDefaults, "setSysDropMode:", a3);
}

- (void)_run
{
  int v3;
  void *v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  const char *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  _BOOL4 trUseAIDA;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  void *v70;
  const char *v71;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[HDSSetupSession _runSFSessionStart](self, "_runSFSessionStart");
    if (v3 == 4 || v3 == 2)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        -[SFSession identifier](self->_sfSession, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[SFSession identifier](self->_sfSession, "identifier", v70);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if (!self->_preAuthState)
          -[HDSSetupSession _runPreAuthRequest](self, "_runPreAuthRequest");
        if (self->_pauseAfterPreAuth && !self->_homePodSoftwareUpdateCancelled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          return;
        }
        if (-[HDSSetupSession homePodNeedsSUBeforeSetup](self, "homePodNeedsSUBeforeSetup")
          && !self->_homePodIsSUNoSetup
          && self->_homePodCanSUNoSetup)
        {
          v16 = -[HDSSetupSession _runHomePodSoftwareUpdateNonSetupAcknowledgement](self, "_runHomePodSoftwareUpdateNonSetupAcknowledgement");
          if (v16 != 4 && v16 != 2)
            return;
          if (!self->_skipWiFiSetup && self->_preflightEnabled && (self->_testFlags & 0x400000) == 0)
          {
            v32 = -[HDSSetupSession _runPreflightWiFi](self, "_runPreflightWiFi");
            if (v32 != 4 && v32 != 2)
              return;
          }
          v17 = -[HDSSetupSession _runPreAuthAlignmentAndSiri](self, "_runPreAuthAlignmentAndSiri");
          if (v17 != 4 && v17 != 2)
            return;
          if (!self->_sfSessionSecured)
          {
            if (self->_apcEnabled && (self->_peerFeatureFlags & 1) != 0 && !self->_forcedCLIPasscode)
            {
              if (self->_prefLEDPasscodeEnabled)
              {
                v43 = -[HDSSetupSession _runLEDPassCodeAlignment](self, "_runLEDPassCodeAlignment");
                if (v43 != 4 && v43 != 2)
                  return;
              }
              v44 = -[HDSSetupSession _runAudioPasscode](self, "_runAudioPasscode");
              if (v44 != 4 && v44 != 2)
                return;
            }
            if (!self->_sfSessionSecured)
            {
              if ((self->_siriFlags & 1) != 0
                && !-[HDSSetupSession isCompanionSiriLanguageSupportedByHomePod](self, "isCompanionSiriLanguageSupportedByHomePod"))
              {
                v18 = -[HDSSetupSession _runSiriLanguage](self, "_runSiriLanguage");
                if (v18 != 4 && v18 != 2)
                  return;
              }
              if (!self->_sfSessionSecured && self->_siriPasscodeEnabled && (self->_peerFeatureFlags & 2) != 0)
              {
                v41 = -[HDSSetupSession _runSiriPasscode](self, "_runSiriPasscode");
                if (v41 != 4 && v41 != 2)
                  return;
              }
            }
          }
          if ((self->_testFlags & 0x800000) == 0)
          {
            if (!self->_skipWiFiSetup)
            {
              v35 = -[HDSSetupSession _runWiFiSetup](self, "_runWiFiSetup");
              if (v35 != 4 && v35 != 2)
                return;
            }
            v19 = -[HDSSetupSession _runCaptiveJoin](self, "_runCaptiveJoin");
            if (v19 != 4 && v19 != 2)
              return;
            if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0)
              -[HDSSetupSession _runBonjourTest](self, "_runBonjourTest");
          }
          v20 = -[HDSSetupSession _runForcedHomePodSoftwareUpdateNonSetup](self, "_runForcedHomePodSoftwareUpdateNonSetup");
          if (v20 != 4 && v20 != 2)
            return;
        }
        if (self->_homePodSoftwareUpdateStateNonSetup != 4 && !self->_homePodIsSUNoSetup
          || self->_homePodSoftwareUpdateCancelled
          || (v15 = -[HDSSetupSession _runHomePodSoftwareUpdateNonSetupComplete](self, "_runHomePodSoftwareUpdateNonSetupComplete"), v15 == 4)|| v15 == 2)
        {
          if (!self->_homePodSoftwareUpdateCancelled
            || (v5 = -[HDSSetupSession _runHomePodSoftwareUpdateNonSetupCancelled](self, "_runHomePodSoftwareUpdateNonSetupCancelled"), v5 == 4)|| v5 == 2)
          {
            -[HDSSetupSession _runHomeKitSetupMode](self, "_runHomeKitSetupMode");
            if (!self->_apcState)
            {
              objc_msgSend((id)objc_opt_class(), "signpostLog");
              v6 = objc_claimAutoreleasedReturnValue();
              v7 = -[HDSSetupSession signpostID](self, "signpostID");
              if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v8 = v7;
                if (os_signpost_enabled(v6))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
                }
              }

              self->_apcState = 11;
              -[HDSSetupSession _runAudioPasscodeInitRequest](self, "_runAudioPasscodeInitRequest");
            }
            if (!self->_preflightEnabled
              || (self->_testFlags & 0x400000) != 0
              || (self->_skipWiFiSetup
               || (v25 = -[HDSSetupSession _runPreflightWiFi](self, "_runPreflightWiFi"), v25 == 4)
               || v25 == 2)
              && ((v9 = -[HDSSetupSession _runPreflightiCloud](self, "_runPreflightiCloud"), v9 == 4) || v9 == 2)
              && ((v10 = -[HDSSetupSession _runPreflightiTunes](self, "_runPreflightiTunes"), v10 == 4) || v10 == 2))
            {
              v11 = -[HDSSetupSession _runPreflightCDP](self, "_runPreflightCDP");
              if (v11 == 4 || v11 == 2)
              {
                if (self->_siriEnablementConfigurationState
                  || (v21 = -[HDSSetupSession _runSiriEnablementConfigurationFetch](self, "_runSiriEnablementConfigurationFetch"), v21 == 4)|| v21 == 2)
                {
                  -[HDSSetupSession _runAuthKitTrustStartIfNeeded](self, "_runAuthKitTrustStartIfNeeded");
                  v12 = -[HDSSetupSession _runPreAuthAlignmentAndSiri](self, "_runPreAuthAlignmentAndSiri");
                  if (v12 == 4 || v12 == 2)
                  {
                    if (self->_sfSessionSecured
                      || (!self->_apcEnabled
                       || (self->_peerFeatureFlags & 1) == 0
                       || self->_forcedCLIPasscode
                       || (!self->_prefLEDPasscodeEnabled
                        || (v36 = -[HDSSetupSession _runLEDPassCodeAlignment](self, "_runLEDPassCodeAlignment"), v36 == 4)
                        || v36 == 2)
                       && ((v37 = -[HDSSetupSession _runAudioPasscode](self, "_runAudioPasscode"), v37 == 4) || v37 == 2))
                      && (self->_sfSessionSecured
                       || ((self->_siriFlags & 1) == 0
                        || -[HDSSetupSession isCompanionSiriLanguageSupportedByHomePod](self, "isCompanionSiriLanguageSupportedByHomePod")|| (v13 = -[HDSSetupSession _runSiriLanguage](self, "_runSiriLanguage"), v13 == 4)|| v13 == 2)&& (self->_sfSessionSecured|| !self->_siriPasscodeEnabled|| (self->_peerFeatureFlags & 2) == 0|| (v34 = -[HDSSetupSession _runSiriPasscode](self, "_runSiriPasscode"), v34 == 4)|| v34 == 2)))
                    {
                      if (self->_isCLIMode && self->_delayForOdeonStereoPair)
                      {
                        v14 = -[HDSSetupSession _runBackgroundActivation](self, "_runBackgroundActivation");
                        if (v14 != 2 && v14 != 4)
                          return;
                      }
                      else
                      {
                        -[HDSSetupSession _runBackgroundActivation](self, "_runBackgroundActivation");
                      }
                      if ((self->_siriFlags & 1) == 0
                        || -[HDSSetupSession isCompanionSiriLanguageSupportedByHomePod](self, "isCompanionSiriLanguageSupportedByHomePod")|| (v22 = -[HDSSetupSession _runSiriLanguage](self, "_runSiriLanguage"), v22 == 4)|| v22 == 2)
                      {
                        if (self->_jsDefaultDisabled
                          || (v26 = -[HDSSetupSession _runPreflightJSCheck](self, "_runPreflightJSCheck"), v26 == 4)
                          || v26 == 2)
                        {
                          v23 = -[HDSSetupSession _runHomeKitUserInput](self, "_runHomeKitUserInput");
                          if (v23 == 4 || v23 == 2)
                          {
                            if (_os_feature_enabled_impl())
                            {
                              if (!self->_hasExistingHomePodInAccount
                                && (!self->_canDoV2TermsAndConditions || !self->_termsAndConditionsServersActive))
                              {
                                v24 = -[HDSSetupSession _runTerms](self, "_runTerms");
                                if (v24 != 2 && v24 != 4)
                                  return;
                              }
                            }
                            else if ((!self->_hasExistingHomePod
                                    || -[ACAccount aa_needsToVerifyTerms](self->_iCloudAccount, "aa_needsToVerifyTerms"))&& !self->_hasExistingHomePodInAccount)
                            {
                              v33 = -[HDSSetupSession _runTerms](self, "_runTerms");
                              if (v33 != 4 && v33 != 2)
                                return;
                            }
                            v27 = -[HDSSetupSession _runShareSettings](self, "_runShareSettings");
                            if (v27 == 4 || v27 == 2)
                            {
                              v28 = -[HDSSetupSession _runPreAuth](self, "_runPreAuth");
                              if (v28 == 4 || v28 == 2)
                              {
                                if (!self->_prefStereoPairEnabled
                                  || (v29 = -[HDSSetupSession _runStereoPairUserInput](self, "_runStereoPairUserInput"),
                                      v29 == 4)
                                  || v29 == 2)
                                {
                                  if (!self->_prefTVAudioEnabled
                                    || (v30 = -[HDSSetupSession _runTVAudioUserInput](self, "_runTVAudioUserInput"),
                                        v30 == 4)
                                    || v30 == 2)
                                  {
                                    if (!self->_appleMusicEnabled
                                      || self->_iTunesSignInSkip
                                      || self->_hasExistingHomePod && !self->_appleMusicForce
                                      || (v40 = -[HDSSetupSession _runAppleMusic](self, "_runAppleMusic"), v40 == 4)
                                      || v40 == 2)
                                    {
                                      if (self->_hasExistingHomePodInAccount
                                        || (v38 = -[HDSSetupSession _runPreflightMisc](self, "_runPreflightMisc"),
                                            v38 == 4)
                                        || v38 == 2)
                                      {
                                        if (!self->_prefMultiUser
                                          || (self->_peerFeatureFlags & 0x100) == 0
                                          || self->_hasExistingHomePod
                                          || (v42 = -[HDSSetupSession _runRecognizeVoice](self, "_runRecognizeVoice"),
                                              v42 == 4)
                                          || v42 == 2)
                                        {
                                          if (!self->_hasExistingHomePodInSelectedRoom)
                                          {
                                            v39 = -[HDSSetupSession _runPersonalRequests](self, "_runPersonalRequests");
                                            if (v39 != 2 && v39 != 4)
                                              return;
LABEL_185:
                                            if (self->_userOptedToHH2
                                              && !self->_automaticUpdatesEnabled
                                              && self->_homePodProductVersion != 4)
                                            {
                                              v46 = -[HDSSetupSession _runAutomaticSoftwareUpdate](self, "_runAutomaticSoftwareUpdate");
                                              if (v46 != 4 && v46 != 2)
                                                return;
                                            }
                                            if (self->_forceSoftwareUpdateForADP
                                              || self->_userOptedToHH2
                                              && !self->_automaticUpdatesEnabled
                                              && self->_automaticSoftwareUpdateAgreed == 2
                                              && self->_homePodProductVersion != 4)
                                            {
                                              v47 = -[HDSSetupSession _runSoftwareUpdate](self, "_runSoftwareUpdate");
                                              if (v47 != 4 && v47 != 2)
                                                return;
                                            }
                                            if (!self->_soundRecognitionOptedIn
                                              && self->_homePodIsCallbellCapable
                                              && self->_userOptedToHH2
                                              && self->_homeSafetySecurityEnabled)
                                            {
                                              v60 = -[HDSSetupSession _runSoundRecognition](self, "_runSoundRecognition");
                                              if (v60 != 4 && v60 != 2)
                                                return;
                                            }
                                            v48 = -[HDSSetupSession _enableSiriForPersonalRequestIfNecessary](self, "_enableSiriForPersonalRequestIfNecessary");
                                            if (v48 != 4 && v48 != 2)
                                              return;
                                            v49 = -[HDSSetupSession _runCheckAccount](self, "_runCheckAccount");
                                            if (v49 != 4 && v49 != 2)
                                              return;
                                            if (!self->_sfSessionSecured)
                                            {
                                              v61 = -[HDSSetupSession _runPairSetup](self, "_runPairSetup");
                                              if (v61 != 4 && v61 != 2)
                                                return;
                                            }
                                            if ((self->_testFlags & 0x800000) == 0)
                                            {
                                              v50 = -[HDSSetupSession _runBasicConfig](self, "_runBasicConfig");
                                              if (v50 != 4 && v50 != 2)
                                                return;
                                              if (!self->_skipWiFiSetup)
                                              {
                                                v62 = -[HDSSetupSession _runWiFiSetup](self, "_runWiFiSetup");
                                                if (v62 != 4 && v62 != 2)
                                                  return;
                                              }
                                              v51 = -[HDSSetupSession _runCaptiveJoin](self, "_runCaptiveJoin");
                                              if (v51 != 4 && v51 != 2)
                                                return;
                                              if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0)
                                                -[HDSSetupSession _runBonjourTest](self, "_runBonjourTest");
                                              v52 = -[HDSSetupSession _runAuthKitTrustFinish](self, "_runAuthKitTrustFinish");
                                              if (v52 != 4 && v52 != 2)
                                                return;
                                              v53 = -[HDSSetupSession _runTRSessionStart](self, "_runTRSessionStart");
                                              if (v53 != 4 && v53 != 2)
                                                return;
                                              v54 = -[HDSSetupSession _runTRSetupConfiguration](self, "_runTRSetupConfiguration");
                                              if (v54 != 4 && v54 != 2)
                                                return;
                                              trUseAIDA = self->_trUseAIDA;
                                              if (self->_trUseAIDA)
                                              {
                                                if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                                                {
                                                  v56 = -[HDSSetupSession _runCDPSetup:](self, "_runCDPSetup:", 1);
                                                  if (v56 != 4 && v56 != 2)
                                                    return;
                                                }
                                                v57 = -[HDSSetupSession _runTRActivation](self, "_runTRActivation");
                                                if (v57 != 4 && v57 != 2)
                                                  return;
                                                v58 = -[HDSSetupSession _runTRiCloudAuthentication](self, "_runTRiCloudAuthentication");
                                                if (v58 != 4 && v58 != 2)
                                                  return;
                                                v59 = -[HDSSetupSession _runTROtherAuthentication](self, "_runTROtherAuthentication");
                                                if (v59 != 2 && v59 != 4)
                                                  return;
                                              }
                                              else
                                              {
                                                v63 = -[HDSSetupSession _runTRActivation](self, "_runTRActivation");
                                                if (v63 != 4 && v63 != 2)
                                                  return;
                                                v64 = -[HDSSetupSession _runTRAuthentication:](self, "_runTRAuthentication:", self->_trUnauthServices);
                                                if (v64 != 4 && v64 != 2)
                                                  return;
                                                if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                                                {
                                                  v65 = -[HDSSetupSession _runCDPSetup:](self, "_runCDPSetup:", 0);
                                                  if (v65 != 4 && v65 != 2)
                                                    return;
                                                }
                                              }
                                              if (self->_prefMultiUser)
                                              {
                                                v66 = -[HDSSetupSession _runMultiUserEnable](self, "_runMultiUserEnable");
                                                if (v66 != 4 && v66 != 2)
                                                  return;
                                              }
                                              v67 = -[HDSSetupSession _runHomeKitSetup](self, "_runHomeKitSetup");
                                              if (v67 != 4 && v67 != 2)
                                                return;
                                              v68 = -[HDSSetupSession _runHomePodSoftwareUpdate](self, "_runHomePodSoftwareUpdate");
                                              if (v68 != 4 && v68 != 2)
                                                return;
                                              if (!trUseAIDA
                                                && self->_cdpEnabled
                                                && (self->_peerFeatureFlags & 0x10) != 0)
                                              {
                                                v69 = -[HDSSetupSession _runCDPSetup:](self, "_runCDPSetup:", 1);
                                                if (v69 != 4 && v69 != 2)
                                                  return;
                                              }
                                            }
                                            -[HDSSetupSession _runFinishStart](self, "_runFinishStart");
                                            return;
                                          }
                                          if (!self->_shouldShowCardForPRCounts)
                                            goto LABEL_185;
                                          if (gLogCategory_HDSSetupSession <= 30)
                                          {
                                            v31 = "yes";
                                            if (gLogCategory_HDSSetupSession == -1)
                                            {
                                              if (!_LogCategory_Initialize())
                                                goto LABEL_183;
                                              if (!self->_shouldShowCardForPRCounts)
                                                v31 = "no";
                                            }
                                            v71 = v31;
                                            LogPrintF();
                                          }
LABEL_183:
                                          v45 = -[HDSSetupSession _runPersonalRequests](self, "_runPersonalRequests", v71);
                                          if (v45 != 4 && v45 != 2)
                                            return;
                                          goto LABEL_185;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  SFSession *v8;
  SFSession *sfSession;
  uint64_t v10;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[16];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_14;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_sfSessionState)
      {
LABEL_14:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v8 = (SFSession *)objc_alloc_init(MEMORY[0x24BE901B0]);
      sfSession = self->_sfSession;
      self->_sfSession = v8;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("B238Setup"));
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", *MEMORY[0x24BE90398]);
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 1);
      -[SFSession setTouchRemoteEnabled:](self->_sfSession, "setTouchRemoteEnabled:", 1);
      v10 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke;
      v18[3] = &unk_24FCD4138;
      v18[4] = self;
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v18);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_2;
      v17[3] = &unk_24FCD3FE8;
      v17[4] = self;
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v17);
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_3;
      v16[3] = &unk_24FCD5138;
      v16[4] = self;
      -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:", v16);
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 35, 0);
      v12 = self->_sfSession;
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_4;
      v15[3] = &unk_24FCD4138;
      v15[4] = self;
      -[SFSession activateWithCompletion:](v12, "activateWithCompletion:", v15);
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __37__HDSSetupSession__runSFSessionStart__block_invoke_453;
      v14[3] = &unk_24FCD3F48;
      v14[4] = self;
      -[SFSession setReceivedObjectHandler:](self->_sfSession, "setReceivedObjectHandler:", v14);
    }
  }
  return self->_sfSessionState;
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1362) = 1;
  v4 = *(_BYTE **)(a1 + 32);
  v5 = v3;
  if (!v4[1336])
    goto LABEL_7;
  if (objc_msgSend(v3, "code") != -6753)
  {
    v4 = *(_BYTE **)(a1 + 32);
    v3 = v5;
LABEL_7:
    objc_msgSend(v4, "_reportError:label:", v3, CFSTR("SFSessionError"));
    goto LABEL_8;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_8:

}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1362) = 1;
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BDD1100];
  v9 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("?");
  if (v4)
    v6 = (const __CFString *)v4;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6762, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reportError:label:", v8, CFSTR("SFSessionInterruption"));

}

_QWORD *__37__HDSSetupSession__runSFSessionStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v7 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 284);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_promptForPINWithFlags:throttleSeconds:", a2, a3, v7);
  result = *(_QWORD **)(a1 + 32);
  if (result[150])
    return (_QWORD *)objc_msgSend(result, "pairSetupTryPIN:");
  return result;
}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];
  uint8_t v21[16];
  uint8_t v22[16];

  v3 = a2;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 284);
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SFSessionStart", (const char *)&unk_22F7B8AEE, v19, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 284) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("SFSessionActivate"));
  }
  else
  {
    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SFSessionStart", (const char *)&unk_22F7B8AEE, v22, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_END, v16, "SFSessionStart", (const char *)&unk_22F7B8AEE, v21, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 284) = 4;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_run", v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_run", v17);
    }
  }

}

void __37__HDSSetupSession__runSFSessionStart__block_invoke_453(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (v6 = _LogCategory_Initialize(), v5 = v8, v6))
    {
      v7 = v5;
      LogPrintF();
      v5 = v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_handlePeerEvent:flags:", v5, a2, v7);

}

- (void)_updateSFSessionErrorHandlerForSUBS
{
  SFSession *sfSession;

  sfSession = self->_sfSession;
  if (sfSession)
  {
    -[SFSession setErrorHandler:](sfSession, "setErrorHandler:", &__block_literal_global_457);
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __54__HDSSetupSession__updateSFSessionErrorHandlerForSUBS__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_HDSSetupSession <= 30
    && ((v5 = v2, gLogCategory_HDSSetupSession != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_runHomeKitSetupMode
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (!self->_homeKitSetupModeState && self->_preAuthState == 4 && (self->_peerFeatureFlags & 0x800) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_homeKitSetupModeState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_homeKitSetupModeState = 1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__HDSSetupSession__runHomeKitSetupMode__block_invoke;
    v6[3] = &unk_24FCD4F90;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDD76D8], "fetchSetupModeWithCompletion:", v6);
  }
}

void __39__HDSSetupSession__runHomeKitSetupMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint8_t buf[8];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 468))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 468) = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v17 = a2;
      LogPrintF();
    }
    v20[0] = CFSTR("hksm");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("hh2state");
    v21[0] = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2 == 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 272);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __39__HDSSetupSession__runHomeKitSetupMode__block_invoke_2;
    v18[3] = &unk_24FCD4618;
    v18[4] = v15;
    objc_msgSend(v16, "sendRequestID:options:request:responseHandler:", CFSTR("_hds_hh2"), &unk_24FCE3CA0, v14, v18);

  }
}

void __39__HDSSetupSession__runHomeKitSetupMode__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  os_signpost_id_t v24;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v11 = *(void **)(a1 + 32);
    v10 = (id *)(a1 + 32);
    objc_msgSend(v11, "_logMetricsForSoftError:label:", v7, CFSTR("ExportHH2State "));
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*((_DWORD *)*v10 + 117))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(*v10, "signpostID");
      if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*v10, "signpostID");
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)v27 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_END, v17, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, v27, 2u);
      }
    }
    v18 = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v19 = *(_QWORD *)(a1 + 32);
    v10 = (id *)(a1 + 32);
    if (!*(_DWORD *)(v19 + 468))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(*v10, "signpostID");
      if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)v26 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, v26, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(*v10, "signpostID");
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v23;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)v25 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_END, v24, "HomeKitSetupMode", (const char *)&unk_22F7B8AEE, v25, 2u);
      }
    }
    v18 = 4;
  }

  *((_DWORD *)*v10 + 117) = v18;
}

- (int)_runPreflightWiFi
{
  int preflightWiFiState;
  NSObject *v5;
  void *v6;
  uint64_t Int64Ranged;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  unint64_t v27;
  os_signpost_id_t v28;
  _BOOL4 wifiIsCaptive;
  _BOOL4 peerSupportsCaptiveNetworks;
  int v31;
  NSObject *v32;
  unint64_t v33;
  os_signpost_id_t v34;
  unint64_t v35;
  _BOOL4 v37;
  unsigned int v38;
  const char *v39;
  NSObject *v40;
  unint64_t v41;
  os_signpost_id_t v42;
  unint64_t v43;
  uint8_t *v44;
  int v45;
  uint64_t Int64;
  NSObject *v48;
  unint64_t v49;
  os_signpost_id_t v50;
  unint64_t v51;
  NSString *v52;
  NSString *wifiOUI;
  NSString *v54;
  NSString *wifiSecurityString;
  NSObject *v56;
  unint64_t v57;
  os_signpost_id_t v58;
  NSObject *v59;
  unint64_t v60;
  os_signpost_id_t v61;
  void *v62;
  const char *v63;
  uint8_t v64[16];
  uint8_t buf[16];

  preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2)
    goto LABEL_95;
  v5 = &getAFSettingsConnectionClass;
  if (preflightWiFiState || self->_preAuthState != 4)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_95;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = (void *)WiFiCopyCurrentNetworkInfoEx();
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("password"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v62 = v8;
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_preflightWiFiState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_92;
    v17 = v21;
    if (!os_signpost_enabled(v15))
      goto LABEL_92;
    *(_WORD *)buf = 0;
LABEL_90:
    v44 = buf;
LABEL_91:
    _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PreflightWiFi", (const char *)&unk_22F7B8AEE, v44, 2u);
LABEL_92:

    self->_preflightWiFiState = 3;
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v11, CFSTR("PreflightWiFi"));
    LODWORD(v5) = self->_preflightWiFiState;

LABEL_93:
    v45 = 1;
    goto LABEL_94;
  }
  if (self->_preventAppleWiFi
    && ((objc_msgSend(v9, "isEqual:", CFSTR("AppleWiFi")) & 1) != 0
     || objc_msgSend(v10, "isEqual:", CFSTR("AppleWiFiSecure"))))
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_preflightWiFiState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v14 = v13;
        if (os_signpost_enabled(v12))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_92;
    v17 = v16;
    if (!os_signpost_enabled(v15))
      goto LABEL_92;
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  if (CFDictionaryGetInt64())
  {
    if ((_DWORD)Int64Ranged != 1
      && (v62 = (void *)Int64Ranged, NSPrintF(), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || -[SFDevice osVersion](self->_peerDevice, "osVersion", v62) <= 0xA
      && (-[SFDevice osVersion](self->_peerDevice, "osVersion"),
          NSPrintF(),
          (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      NSErrorWithOSStatusF();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_preflightWiFiState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog", v22);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v27 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v28 = v27;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v28, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_preflightWiFiState = 3;
      -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v23, CFSTR("PreflightWiFi"));
      LODWORD(v5) = self->_preflightWiFiState;

      goto LABEL_93;
    }
  }
  wifiIsCaptive = CFDictionaryGetInt64() != 0;
  self->_wifiIsCaptive = wifiIsCaptive;
  peerSupportsCaptiveNetworks = self->_peerSupportsCaptiveNetworks;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1
      || (v31 = _LogCategory_Initialize(), wifiIsCaptive = self->_wifiIsCaptive, v31))
    {
      LogPrintF();
      wifiIsCaptive = self->_wifiIsCaptive;
    }
  }
  if (!peerSupportsCaptiveNetworks && wifiIsCaptive)
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_preflightWiFiState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v35 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_92;
    v17 = v35;
    if (!os_signpost_enabled(v15))
      goto LABEL_92;
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  v37 = (_DWORD)Int64Ranged != 5 || !peerSupportsCaptiveNetworks;
  v38 = Int64Ranged - 2;
  if (Int64Ranged >= 2 && v37)
  {
    if (v38 > 7)
      v39 = "?";
    else
      v39 = off_24FCD5740[v38];
    v63 = v39;
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_preflightWiFiState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog", v63);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PreflightWiFi", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v43 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v43 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_92;
    v17 = v43;
    if (!os_signpost_enabled(v15))
      goto LABEL_92;
    *(_WORD *)buf = 0;
    goto LABEL_90;
  }
  *(_DWORD *)buf = 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_104:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_104;
  }
  Int64 = CFDictionaryGetInt64();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homePod6GCapable && Int64)
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_preflightWiFiState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v50 = v49;
        if (os_signpost_enabled(v48))
        {
          *(_WORD *)v64 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v50, "PreflightWiFi", (const char *)&unk_22F7B8AEE, v64, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v51 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v51 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_92;
    v17 = v51;
    if (!os_signpost_enabled(v15))
      goto LABEL_92;
    *(_WORD *)v64 = 0;
    v44 = v64;
    goto LABEL_91;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiCCA = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiChannel = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiOUI = self->_wifiOUI;
  self->_wifiOUI = v52;

  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_wifiRSSI = CFDictionaryGetInt64();
  if (*(_DWORD *)buf
    && gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiSecurityString = self->_wifiSecurityString;
  self->_wifiSecurityString = v54;

  if (!*(_DWORD *)buf)
    goto LABEL_151;
  if (gLogCategory_HDSSetupSession <= 60)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
LABEL_151:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_preflightWiFiState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v58 = v57;
      if (os_signpost_enabled(v56))
      {
        *(_WORD *)v64 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v58, "PreflightWiFi", (const char *)&unk_22F7B8AEE, v64, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v61 = v60;
    if (os_signpost_enabled(v59))
    {
      *(_WORD *)v64 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v59, OS_SIGNPOST_INTERVAL_END, v61, "PreflightWiFi", (const char *)&unk_22F7B8AEE, v64, 2u);
    }
  }

  v45 = 0;
  self->_preflightWiFiState = 4;
LABEL_94:

  if (!v45)
LABEL_95:
    LODWORD(v5) = self->_preflightWiFiState;
  return (int)v5;
}

- (int)_runPreflightiCloud
{
  int preflightiCloudState;
  int v4;
  unint64_t v5;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  void (**progressHandler)(id, uint64_t, _QWORD);
  ACAccountStore *v11;
  ACAccountStore *iCloudAccountStore;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *iCloudUserID;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  NSObject *v23;
  unint64_t v24;
  os_signpost_id_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  ACAccountStore *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v42;
  NSObject *v43;
  unint64_t v44;
  os_signpost_id_t v45;
  unint64_t v46;
  os_signpost_id_t v47;
  void *v48;
  char v49;
  NSObject *v51;
  unint64_t v52;
  os_signpost_id_t v53;
  NSObject *v54;
  unint64_t v55;
  os_signpost_id_t v56;
  unint64_t v57;
  os_signpost_id_t v58;
  _QWORD v59[4];
  id v60;
  HDSSetupSession *v61;
  uint8_t buf[8];
  uint64_t v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  preflightiCloudState = self->_preflightiCloudState;
  HIDWORD(v5) = preflightiCloudState;
  LODWORD(v5) = preflightiCloudState;
  v4 = v5 >> 1;
  if ((v4 - 1) < 2)
    goto LABEL_82;
  if (v4 == 5)
  {
    if (self->_homeiCloudEnabled)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[HDSSetupSession _homeKitUpdateiCloudSwitchState:](self, "_homeKitUpdateiCloudSwitchState:", 1);
      if (!self->_preflightiCloudState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v30 = v29;
          if (os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v31, OS_SIGNPOST_INTERVAL_END, v33, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_preflightiCloudState = 4;
      goto LABEL_82;
    }
    if (preflightiCloudState == 2 || preflightiCloudState == 4)
    {
LABEL_82:
      LODWORD(v27) = self->_preflightiCloudState;
      return (int)v27;
    }
LABEL_15:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_82;
  }
  if (v4)
    goto LABEL_15;
  if (gLogCategory_HDSSetupSession > 30)
    goto LABEL_22;
  if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    LogPrintF();
  if (!self->_preflightiCloudState)
  {
LABEL_22:
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  self->_preflightiCloudState = 1;
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 120, 0);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v11 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
  iCloudAccountStore = self->_iCloudAccountStore;
  self->_iCloudAccountStore = v11;

  -[ACAccountStore aa_primaryAppleAccount](self->_iCloudAccountStore, "aa_primaryAppleAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!self->_preflightiCloudState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v23, OS_SIGNPOST_INTERVAL_END, v25, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_preflightiCloudState = 3;
    NSErrorWithOSStatusF();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v26, CFSTR("PreflightiCloud"));
    LODWORD(v27) = self->_preflightiCloudState;

    return (int)v27;
  }
  v14 = v13;
  objc_storeStrong((id *)&self->_iCloudAccount, v13);
  objc_msgSend(v14, "username");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  iCloudUserID = self->_iCloudUserID;
  self->_iCloudUserID = v15;

  if (!self->_iCloudAccountState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  self->_iCloudAccountState = 1;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v34 = self->_iCloudAccountStore;
  v63 = *MEMORY[0x24BDB4528];
  v64[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke;
  v59[3] = &unk_24FCD51A8;
  v36 = v14;
  v60 = v36;
  v61 = self;
  -[ACAccountStore aa_updatePropertiesForAppleAccount:options:completion:](v34, "aa_updatePropertiesForAppleAccount:options:completion:", v36, v35, v59);

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((Class)getAKAccountManagerClass[0](), "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "accountPropertyForKey:", CFSTR("altDSID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    v39 = 0;
LABEL_72:
    if (!self->_preflightiCloudState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v45 = v44;
        if (os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v45, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v27 = objc_claimAutoreleasedReturnValue();
    v46 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v47 = v46;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v27, OS_SIGNPOST_INTERVAL_END, v47, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_preflightiCloudState = 3;
    NSErrorWithOSStatusF();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v48, CFSTR("PreflightiCloudHSA2"));
    LODWORD(v27) = self->_preflightiCloudState;

    v49 = 0;
    goto LABEL_81;
  }
  objc_msgSend(v37, "authKitAccountWithAltDSID:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
    goto LABEL_72;
  v40 = objc_msgSend(v37, "securityLevelForAccount:", v39);
  if (!v40
    || v40 == 5
    || +[HDSDefaults sysDropForceErrorEarlyEnabled](HDSDefaults, "sysDropForceErrorEarlyEnabled"))
  {
    goto LABEL_72;
  }
  getkAccountDataclassHome[0]();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v36, "isEnabledForDataclass:", v41);

  if ((v42 & 1) == 0)
  {
    if (self->_promptForHomeiCloudHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiCloudState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v53 = v52;
          if (os_signpost_enabled(v51))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v53, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_preflightiCloudState = 10;
      (*((void (**)(void))self->_promptForHomeiCloudHandler + 2))();
      v49 = 0;
      LODWORD(v27) = self->_preflightiCloudState;
      goto LABEL_81;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSSetupSession _homeKitUpdateiCloudSwitchState:](self, "_homeKitUpdateiCloudSwitchState:", 1);
  }
  if (!self->_preflightiCloudState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v56 = v55;
      if (os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v27 = objc_claimAutoreleasedReturnValue();
  v57 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v58 = v57;
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v27, OS_SIGNPOST_INTERVAL_END, v58, "PreflightiCloud", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_preflightiCloudState = 4;
  v49 = 1;
LABEL_81:

  if ((v49 & 1) != 0)
    goto LABEL_82;
  return (int)v27;
}

void __38__HDSSetupSession__runPreflightiCloud__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;
  _QWORD v15[5];

  v5 = a3;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "aa_needsToVerifyTerms");
    v7 = "no";
    if (v6)
      v8 = "yes";
    else
      v8 = "no";
    if (a2)
      v7 = "yes";
    v13 = v7;
    v14 = v5;
    v12 = v8;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v5, CFSTR("Preflight-iCloud"), v12, v13, v14);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 104);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke_2;
  v15[3] = &unk_24FCD5180;
  v15[4] = v10;
  objc_msgSend(v11, "saveVerifiedAccount:withCompletionHandler:", v9, v15);

}

void __38__HDSSetupSession__runPreflightiCloud__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v5, CFSTR("Preflight-iCloud"));
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HDSSetupSession__runPreflightiCloud__block_invoke_3;
  block[3] = &unk_24FCD3FE8;
  block[4] = v6;
  dispatch_async(v7, block);

}

uint64_t __38__HDSSetupSession__runPreflightiCloud__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, v9, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (int)_runPreflightiTunes
{
  int result;
  int v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int appleMusicState;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  unint64_t v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  unint64_t v34;
  NSObject *v35;
  unint64_t v36;
  os_signpost_id_t v37;
  NSObject *v38;
  unint64_t v39;
  os_signpost_id_t v40;
  unint64_t v41;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint8_t buf[16];

  result = self->_preflightiTunesState;
  switch(result)
  {
    case 0:
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_20;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_preflightiTunesState)
      {
LABEL_20:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_preflightiTunesState = 1;
      if (self->_iTunesAccount)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_appleMusicEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (!self->_preflightiTunesState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v33 = v32;
              if (os_signpost_enabled(v31))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

          }
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v11 = objc_claimAutoreleasedReturnValue();
          v34 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v13 = v34;
            if (os_signpost_enabled(v11))
            {
              *(_WORD *)buf = 0;
              goto LABEL_93;
            }
          }
          goto LABEL_94;
        }
        appleMusicState = self->_appleMusicState;
        if (appleMusicState == 1)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (self->_preflightiTunesState)
          {
LABEL_113:
            result = 11;
            self->_preflightiTunesState = 11;
            progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
            if (progressHandler)
            {
              progressHandler[2](self->_progressHandler, 122, 0);
              return self->_preflightiTunesState;
            }
            return result;
          }
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v15 = objc_claimAutoreleasedReturnValue();
          v41 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v41 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v17 = v41, !os_signpost_enabled(v15)))
          {
LABEL_112:

            goto LABEL_113;
          }
          *(_WORD *)buf = 0;
        }
        else
        {
          if (appleMusicState)
          {
            if (!self->_preflightiTunesState)
            {
              objc_msgSend((id)objc_opt_class(), "signpostLog");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = -[HDSSetupSession signpostID](self, "signpostID");
              if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v20 = v19;
                if (os_signpost_enabled(v18))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_22F74D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
                }
              }

            }
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v23 = v22;
              if (os_signpost_enabled(v21))
              {
                *(_WORD *)buf = 0;
                goto LABEL_75;
              }
            }
            goto LABEL_76;
          }
          -[HDSSetupSession preflightAppleMusic](self, "preflightAppleMusic");
          if (self->_preflightiTunesState)
            goto LABEL_113;
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_112;
          v17 = v16;
          if (!os_signpost_enabled(v15))
            goto LABEL_112;
          *(_WORD *)buf = 0;
        }
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
        goto LABEL_112;
      }
      if (self->_promptForiTunesSignInHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_preflightiTunesState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v30 = v29;
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        self->_preflightiTunesState = 10;
        (*((void (**)(void))self->_promptForiTunesSignInHandler + 2))();
        return self->_preflightiTunesState;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v37 = v36;
          if (os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v37, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v38, OS_SIGNPOST_INTERVAL_END, v40, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      result = 2;
      self->_preflightiTunesState = 2;
      self->_iTunesSignInSkip = 1;
      return result;
    case 2:
    case 4:
      return result;
    case 10:
      if (!self->_iTunesSignInSkip)
        goto LABEL_13;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v10 = v9;
          if (os_signpost_enabled(v8))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
LABEL_93:
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }
LABEL_94:

      result = 2;
      goto LABEL_95;
    case 11:
      if (self->_appleMusicState < 2)
        goto LABEL_13;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightiTunesState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v21 = objc_claimAutoreleasedReturnValue();
      v27 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v23 = v27;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
LABEL_75:
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v21, OS_SIGNPOST_INTERVAL_END, v23, "PreflightiTunes", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }
LABEL_76:

      result = 4;
LABEL_95:
      self->_preflightiTunesState = result;
      return result;
    default:
LABEL_13:
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1
          || (v4 = _LogCategory_Initialize(), result = self->_preflightiTunesState, v4))
        {
          LogPrintF();
          return self->_preflightiTunesState;
        }
      }
      return result;
  }
}

- (int)_runPreflightCDP
{
  int result;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  result = self->_preflightCDPState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_preflightCDPState = 1;
    objc_msgSend((Class)getCDPAccountClass[0](), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SVSLocalizedString(CFSTR("HOME_DEVICE_SETUP_CUSTOMER_NAME"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE1AA20]);
    objc_msgSend(v4, "primaryAccountAltDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithAltDSID:", v7);

    objc_msgSend(v8, "setFeatureName:", v5);
    objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
    objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeType:", 0);
    if (self->_presentingChildViewController)
      objc_msgSend(v8, "setPresentingViewController:");
    objc_msgSend(v8, "setSecurityUpgradeContext:", *MEMORY[0x24BE0AC50]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__HDSSetupSession__runPreflightCDP__block_invoke;
    v10[3] = &unk_24FCD5180;
    v10[4] = self;
    objc_msgSend(v9, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v10);

    return self->_preflightCDPState;
  }
  return result;
}

void __35__HDSSetupSession__runPreflightCDP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession__runPreflightCDP__block_invoke_2;
  block[3] = &unk_24FCD51D0;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __35__HDSSetupSession__runPreflightCDP__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSSetupSession <= 90)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v3))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    return objc_msgSend(*(id *)(a1 + 40), "_reportError:label:", v2, CFSTR("CDPManateeRepair"));
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 96) = 4;
    return objc_msgSend(*(id *)(a1 + 40), "_run");
  }
}

- (int)_runPreflightJSCheck
{
  int homePodJSCheckState;
  void *v4;
  void *v5;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  void *v9;
  _QWORD v10[5];

  homePodJSCheckState = self->_homePodJSCheckState;
  switch(homePodJSCheckState)
  {
    case 4:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodJSCheckState;
      }
LABEL_12:
      LogPrintF();
      return self->_homePodJSCheckState;
    case 1:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodJSCheckState;
      }
      goto LABEL_12;
    case 0:
      self->_homePodJSCheckState = 1;
      v4 = (void *)objc_opt_new();
      -[HDSSetupSession selectedSiriLanguageCode](self, "selectedSiriLanguageCode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("usr_lang_code"));

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v9 = v4;
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 40, 0);
      sfSession = self->_sfSession;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __39__HDSSetupSession__runPreflightJSCheck__block_invoke;
      v10[3] = &unk_24FCD4618;
      v10[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_hds_hp_js"), 0, v4, v10, v9);

      break;
  }
  return self->_homePodJSCheckState;
}

void __39__HDSSetupSession__runPreflightJSCheck__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1488);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__HDSSetupSession__runPreflightJSCheck__block_invoke_2;
  v9[3] = &unk_24FCD4290;
  v9[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

uint64_t __39__HDSSetupSession__runPreflightJSCheck__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1352) = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1356) = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (int)_runPreflightMisc
{
  uint64_t v2;
  uint64_t v3;
  int preflightMiscState;
  int *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  Class (**v10)();
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  int v19;
  int v20;
  const char *v21;
  _BOOL4 locationServicesEnabled;
  int v23;
  BOOL v24;
  const char *v25;
  void *v26;
  int v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  unint64_t v35;
  os_signpost_id_t v36;
  NSObject *v37;
  unint64_t v38;
  os_signpost_id_t v39;
  unint64_t v40;
  os_signpost_id_t v41;
  uint64_t v42;
  int *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  unint64_t v50;
  os_signpost_id_t v51;
  void (**promptForLocationAlreadyEnabledHandler)(id, BOOL);
  int v53;
  NSObject *v54;
  unint64_t v55;
  os_signpost_id_t v56;
  void (**promptForLocationEnableHandler)(id, SEL, _QWORD);
  NSObject *v58;
  unint64_t v59;
  os_signpost_id_t v60;
  const char *v62;
  void *v63;
  void *v64;
  uint8_t v65[2];
  uint8_t v66[16];
  uint8_t buf[16];
  __int16 v68;
  uint8_t v69[16];
  uint8_t v70[16];
  uint8_t v71[16];

  preflightMiscState = self->_preflightMiscState;
  v6 = &gLogCategory_HDSSetupSession;
  v7 = "-[HDSSetupSession _runPreflightMisc]";
  v8 = "_runPreflightMisc start\n";
  v9 = "Preflight Misc done\n";
  v10 = &getAFSettingsConnectionClass;
  while (2)
  {
    v11 = preflightMiscState;
    switch(preflightMiscState)
    {
      case 0:
        v12 = *((_DWORD *)v10 + 150);
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        -[HDSSetupSession fetchLocationServicesEnabled](self, "fetchLocationServicesEnabled", v62, v63, v64);
        goto LABEL_102;
      case 4:
        v13 = *((_DWORD *)v10 + 150);
        if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_102;
      case 10:
        v14 = *((_DWORD *)v10 + 150);
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        locationServicesEnabled = self->_locationServicesEnabled;
        if (self->_locationServicesEnabled)
        {
          v23 = *((_DWORD *)v10 + 150);
LABEL_37:
          if (v23 <= 30)
          {
            if (v23 != -1)
            {
LABEL_39:
              v24 = !locationServicesEnabled;
              v25 = "yes";
              if (v24)
                v25 = "no";
              v62 = v25;
              LogPrintF();
              goto LABEL_83;
            }
            if (_LogCategory_Initialize())
            {
              locationServicesEnabled = self->_locationServicesEnabled;
              goto LABEL_39;
            }
          }
LABEL_83:
          self->_locationEnabled = 1;
          if (!self->_preflightMiscState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v51 = v50;
              if (os_signpost_enabled(v49))
              {
                *(_WORD *)v71 = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v51, "PreflightMisc", (const char *)&unk_22F7B8AEE, v71, 2u);
              }
            }

            v10 = &getAFSettingsConnectionClass;
          }
          self->_preflightMiscState = 12;
          promptForLocationAlreadyEnabledHandler = (void (**)(id, BOOL))self->_promptForLocationAlreadyEnabledHandler;
          if (promptForLocationAlreadyEnabledHandler)
            promptForLocationAlreadyEnabledHandler[2](promptForLocationAlreadyEnabledHandler, self->_locationServicesEnabled);
          goto LABEL_102;
        }
        v23 = *((_DWORD *)v10 + 150);
        if (!self->_promptForLocationEnableHandler)
          goto LABEL_37;
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (!self->_preflightMiscState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v60 = v59;
            if (os_signpost_enabled(v58))
            {
              *(_WORD *)v70 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v60, "PreflightMisc", (const char *)&unk_22F7B8AEE, v70, 2u);
            }
          }

          v10 = &getAFSettingsConnectionClass;
        }
        self->_preflightMiscState = 11;
        promptForLocationEnableHandler = (void (**)(id, SEL, _QWORD))self->_promptForLocationEnableHandler;
        if (promptForLocationEnableHandler)
          goto LABEL_101;
LABEL_102:
        preflightMiscState = self->_preflightMiscState;
        if (preflightMiscState != v11)
          continue;
        return v11;
      case 11:
        if (self->_locationDecided)
        {
          v15 = 12;
          goto LABEL_62;
        }
        goto LABEL_102;
      case 12:
        v16 = *((_DWORD *)v10 + 150);
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        objc_msgSend((Class)getVTPreferencesClass_0[0](), "sharedPreferences");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "voiceTriggerEnabled");

        v10 = &getAFSettingsConnectionClass;
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            LogPrintF();
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            {
              v42 = v3;
              v43 = v6;
              v44 = v7;
              v45 = v9;
              v46 = v8;
              if (v27)
                v47 = "yes";
              else
                v47 = "no";
              v48 = (void *)MEMORY[0x2348A3310](self->_promptForSiriEnableHandler);
              -[HDSSetupSession selectedSiriLanguageCode](self, "selectedSiriLanguageCode");
              v63 = v48;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v47;
              v8 = v46;
              v9 = v45;
              v7 = v44;
              v6 = v43;
              v3 = v42;
              LogPrintF();

              v10 = &getAFSettingsConnectionClass;
            }
            v53 = *((_DWORD *)v10 + 150);
            if (v53 <= 30 && (v53 != -1 || _LogCategory_Initialize()))
              LogPrintF();
          }
        }
        if (!self->_preflightMiscState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v56 = v55;
            if (os_signpost_enabled(v54))
            {
              *(_WORD *)v69 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PreflightMisc", (const char *)&unk_22F7B8AEE, v69, 2u);
            }
          }

          v10 = &getAFSettingsConnectionClass;
        }
        self->_preflightMiscState = 13;
        promptForLocationEnableHandler = (void (**)(id, SEL, _QWORD))self->_promptForSiriEnableHandler;
        if (promptForLocationEnableHandler)
LABEL_101:
          promptForLocationEnableHandler[2](promptForLocationEnableHandler, a2, v2);
        goto LABEL_102;
      case 13:
        v17 = *((_DWORD *)v10 + 150);
        if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
        {
          v18 = "yes";
          if (!self->_siriEnabled)
            v18 = "no";
          v62 = v18;
          LogPrintF();
        }
        if (self->_siriEnabled)
        {
          self->_preflightMiscState = 4;
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v30 = v29;
            if (os_signpost_enabled(v28))
            {
              v68 = 0;
              v31 = (uint8_t *)&v68;
              v32 = v28;
              v33 = v30;
              goto LABEL_73;
            }
          }
          goto LABEL_74;
        }
        goto LABEL_102;
      case 14:
        v19 = *((_DWORD *)v10 + 150);
        if (v19 <= 30)
        {
          if (v19 != -1 || _LogCategory_Initialize())
            LogPrintF();
          if (!self->_preflightMiscState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v36 = v35;
              if (os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PreflightMisc", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

            v10 = &getAFSettingsConnectionClass;
          }
        }
        v15 = 15;
LABEL_62:
        self->_preflightMiscState = v15;
        goto LABEL_102;
      case 15:
        v20 = *((_DWORD *)v10 + 150);
        if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
        {
          v21 = "yes";
          if (!self->_selectedSiriVoice)
            v21 = "no";
          v62 = v21;
          LogPrintF();
        }
        if (self->_selectedSiriVoice)
        {
          if (!self->_preflightMiscState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v39 = v38;
              if (os_signpost_enabled(v37))
              {
                *(_WORD *)v66 = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PreflightMisc", (const char *)&unk_22F7B8AEE, v66, 2u);
              }
            }

          }
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v28 = objc_claimAutoreleasedReturnValue();
          v40 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v41 = v40;
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)v65 = 0;
              v31 = v65;
              v32 = v28;
              v33 = v41;
LABEL_73:
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v32, OS_SIGNPOST_INTERVAL_END, v33, "PreflightMisc", (const char *)&unk_22F7B8AEE, v31, 2u);
            }
          }
LABEL_74:

          self->_preflightMiscState = 4;
          v10 = &getAFSettingsConnectionClass;
        }
        goto LABEL_102;
      default:
        goto LABEL_102;
    }
  }
}

- (int)_runHomeKitUserInput
{
  int homeKitUserInputState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  void (**progressHandler)(id, uint64_t, _QWORD);
  HDSDeviceOperationHomeKitSetup *v8;
  HDSDeviceOperationHomeKitSetup *homeKitSetupOperation;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[16];

  homeKitUserInputState = self->_homeKitUserInputState;
  if (homeKitUserInputState != 4)
  {
    if (homeKitUserInputState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_11;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_homeKitUserInputState)
      {
LABEL_11:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_homeKitUserInputState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 230, 0);
      -[HDSDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
      v8 = objc_alloc_init(HDSDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v8;

      -[HDSDeviceOperationHomeKitSetup setSessionID:](self->_homeKitSetupOperation, "setSessionID:", self->_sessionID);
      -[HDSDeviceOperationHomeKitSetup setIsCLIMode:](self->_homeKitSetupOperation, "setIsCLIMode:", self->_isCLIMode);
      -[HDSDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[HDSDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetupOperation, "setUserInteractive:", 1);
      -[SSAccount backingAccount](self->_iTunesAccount, "backingAccount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSDeviceOperationHomeKitSetup setITunesAccount:](self->_homeKitSetupOperation, "setITunesAccount:", v10);

      -[HDSDeviceOperationHomeKitSetup setITunesAccountID:](self->_homeKitSetupOperation, "setITunesAccountID:", self->_iTunesUserID);
      -[HDSDeviceOperationHomeKitSetup setPauseAfterUserInput:](self->_homeKitSetupOperation, "setPauseAfterUserInput:", 1);
      if (self->_promptForHomeHandler)
        -[HDSDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetupOperation, "setPromptForHomeHandler:");
      if (self->_promptForRoomHandlerDetailed)
        -[HDSDeviceOperationHomeKitSetup setPromptForRoomHandlerDetailed:](self->_homeKitSetupOperation, "setPromptForRoomHandlerDetailed:");
      -[HDSDeviceOperationHomeKitSetup setPromptToInstallHomeAppHandler:](self->_homeKitSetupOperation, "setPromptToInstallHomeAppHandler:", self->_promptToInstallHomeAppHandler);
      v11 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __39__HDSSetupSession__runHomeKitUserInput__block_invoke;
      v14[3] = &unk_24FCD3FE8;
      v14[4] = self;
      -[HDSDeviceOperationHomeKitSetup setPauseHandler:](self->_homeKitSetupOperation, "setPauseHandler:", v14);
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __39__HDSSetupSession__runHomeKitUserInput__block_invoke_2;
      v13[3] = &unk_24FCD51F8;
      v13[4] = self;
      -[HDSDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v13);
      -[HDSDeviceOperationHomeKitSetup activate](self->_homeKitSetupOperation, "activate");
    }
  }
  return self->_homeKitUserInputState;
}

uint64_t __39__HDSSetupSession__runHomeKitUserInput__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  dispatch_time_t v32;
  const char *v34;
  const char *v35;
  const char *v36;
  uint8_t v37[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "homeKitSelectedRoomName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(_QWORD *)(v3 + 976) = v2;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 960))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HomeKitUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "HomeKitUserInput", (const char *)&unk_22F7B8AEE, v37, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 960) = 4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1421) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "hasHomePod");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1064) = objc_msgSend(*(id *)(a1 + 32), "selectedRoomHasHomePods");
  objc_msgSend(*(id *)(a1 + 32), "_selectedRoomHomePod");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 1072);
  *(_QWORD *)(v12 + 1072) = v11;

  objc_msgSend(*(id *)(a1 + 32), "_homePodsInSelectedHome");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168) = objc_msgSend(v14, "count");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1080) = objc_msgSend(*(id *)(a1 + 32), "_shouldShowPRCardForHomePodsInRoom");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1422) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "hasMultipleUsers");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "homeKitHomeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1427) = objc_msgSend(v15, "hasOptedToHH2");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "homeKitHomeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1242) = objc_msgSend(v16, "homeSafetySecurityEnabled");

  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1427))
        v17 = "yes";
      else
        v17 = "no";
      v34 = v17;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1242))
        v18 = "yes";
      else
        v18 = "no";
      v34 = v18;
      LogPrintF();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "selectedHome", v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 554) = objc_msgSend(v19, "didOnboardAudioAnalysis");

  objc_msgSend(*(id *)(a1 + 32), "_homePodsInAccount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176) = objc_msgSend(v20, "count");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1420) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176) != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1420))
      v21 = "yes";
    else
      v21 = "no";
    v35 = v21;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "availableHomes", v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184) = objc_msgSend(v22, "count");

  objc_msgSend(*(id *)(a1 + 32), "selectedHome");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1241) = objc_msgSend(v23, "isAutomaticSoftwareUpdateEnabled");

  objc_msgSend(*(id *)(a1 + 32), "selectedHome");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "didOnboardAudioAnalysis"))
    v25 = 1;
  else
    v25 = 3;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1248) = v25;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "homekitDataSyncSeconds");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = v26;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "accessorySyncSeconds");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056) = v27;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1241))
      v28 = "yes";
    else
      v28 = "no";
    v36 = v28;
    LogPrintF();
  }
  v29 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v29 + 1417) && *(_BYTE *)(v29 + 1419))
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v30 = _LogCategory_Initialize(), v29 = *(_QWORD *)(a1 + 32), v30))
      {
        LogPrintF();
        v29 = *(_QWORD *)(a1 + 32);
      }
    }
    v36 = *(const char **)(v29 + 1472);
    FPrintF();
    v31 = dispatch_semaphore_create(0);
    v32 = dispatch_time(0, 1000000000 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472));
    dispatch_semaphore_wait(v31, v32);

    v29 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v29, "_run", v36);
}

void __39__HDSSetupSession__runHomeKitUserInput__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  const __CFString *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 952))
  {
    if (!v5)
    {
      NSErrorWithOSStatusF();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
    }
    if (!*(_DWORD *)(v7 + 960))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitUserInput", (const char *)&unk_22F7B8AEE, v15, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 960) = 3;
    if (v6)
      v14 = v6;
    else
      v14 = CFSTR("NoLabel");
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v5, v14);
  }

}

- (int)_runStereoPairUserInput
{
  int stereoPairUserInputState;
  int v4;
  NSArray *v5;
  NSArray *potentialStereoCounterparts;
  NSString *deviceSerialNumber;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  int v11;
  uint64_t stereoPairRole;
  const char *v13;
  HMAccessory *v14;
  HMAccessory *stereoCounterpartAccessory;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  unint64_t v20;
  os_signpost_id_t v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  NSArray *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  char v36;
  NSArray *v37;
  int v38;
  int v39;
  NSObject *v40;
  unint64_t v41;
  os_signpost_id_t v42;
  NSObject *v43;
  unint64_t v44;
  os_signpost_id_t v45;
  NSObject *v46;
  unint64_t v47;
  os_signpost_id_t v48;
  unint64_t v49;
  NSObject *v50;
  unint64_t v51;
  os_signpost_id_t v52;
  unint64_t v53;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[16];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  stereoPairUserInputState = self->_stereoPairUserInputState;
  while (2)
  {
    v4 = stereoPairUserInputState;
    switch(stereoPairUserInputState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_48;
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_stereoPairUserInputState)
        {
LABEL_48:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v21 = v20;
            if (os_signpost_enabled(v19))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        v11 = 10;
        goto LABEL_117;
      case 10:
        -[HDSDeviceOperationHomeKitSetup findStereoCounterpartsWithSupportedVersions:](self->_homeKitSetupOperation, "findStereoCounterpartsWithSupportedVersions:", -[HDSSetupSession _peerDeviceSupportedStereoPairVersions](self, "_peerDeviceSupportedStereoPairVersions"));
        v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
        potentialStereoCounterparts = self->_potentialStereoCounterparts;
        self->_potentialStereoCounterparts = v5;

        deviceSerialNumber = self->_deviceSerialNumber;
        if (!deviceSerialNumber)
          goto LABEL_76;
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_66;
        if (gLogCategory_HDSSetupSession != -1)
          goto LABEL_9;
        if (_LogCategory_Initialize())
        {
          deviceSerialNumber = self->_deviceSerialNumber;
LABEL_9:
          v55 = deviceSerialNumber;
          LogPrintF();
        }
LABEL_66:
        v28 = (NSArray *)objc_opt_new();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v29 = self->_potentialStereoCounterparts;
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v57 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v34, "serialNumber", v55);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isEqualToString:", self->_deviceSerialNumber);

              if ((v36 & 1) == 0)
                -[NSArray addObject:](v28, "addObject:", v34);
            }
            v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          }
          while (v31);
        }

        v37 = self->_potentialStereoCounterparts;
        self->_potentialStereoCounterparts = v28;

LABEL_76:
        if (-[NSArray count](self->_potentialStereoCounterparts, "count", v55))
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v55 = self->_potentialStereoCounterparts;
            LogPrintF();
          }
          v38 = self->_stereoPairUserInputState;
LABEL_97:
          v11 = v38 + 1;
          goto LABEL_117;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_stereoPairUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v48 = v47;
            if (os_signpost_enabled(v46))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v43 = objc_claimAutoreleasedReturnValue();
        v49 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_116;
        v45 = v49;
        if (!os_signpost_enabled(v43))
          goto LABEL_116;
        goto LABEL_115;
      case 11:
        if (self->_promptForStereoRoleHandler)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          -[HDSSetupSession _runStereoPairUserInputPickColors:](self, "_runStereoPairUserInputPickColors:", 0, v55);
          ++self->_stereoPairUserInputState;
          (*((void (**)(void))self->_promptForStereoRoleHandler + 2))();
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (!self->_stereoPairUserInputState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v52 = v51;
              if (os_signpost_enabled(v50))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v52, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

          }
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v43 = objc_claimAutoreleasedReturnValue();
          v53 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v45 = v53;
            if (os_signpost_enabled(v43))
            {
LABEL_115:
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v43, OS_SIGNPOST_INTERVAL_END, v45, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }
LABEL_116:

          v11 = 2;
LABEL_117:
          self->_stereoPairUserInputState = v11;
        }
LABEL_118:
        stereoPairUserInputState = self->_stereoPairUserInputState;
        if (stereoPairUserInputState != v4)
          continue;
        return v4;
      case 12:
        stereoPairRole = self->_stereoPairRole;
        if (!(_DWORD)stereoPairRole)
          goto LABEL_118;
        if (gLogCategory_HDSSetupSession <= 30)
        {
          if (gLogCategory_HDSSetupSession != -1
            || (v39 = _LogCategory_Initialize(), stereoPairRole = self->_stereoPairRole, v39))
          {
            v13 = "?";
            if (stereoPairRole <= 3)
              v13 = off_24FCD5818[(int)stereoPairRole];
            v55 = (void *)v13;
            LogPrintF();
            stereoPairRole = self->_stereoPairRole;
          }
        }
        -[HDSDeviceOperationHomeKitSetup setStereoRole:](self->_homeKitSetupOperation, "setStereoRole:", stereoPairRole, v55);
        v38 = self->_stereoPairUserInputState;
        if (self->_stereoPairRole != 1)
          goto LABEL_97;
        if (!v38)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v42 = v41;
            if (os_signpost_enabled(v40))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v45 = v44;
          if (os_signpost_enabled(v43))
            goto LABEL_115;
        }
        goto LABEL_116;
      case 13:
        if (-[NSArray count](self->_potentialStereoCounterparts, "count") == 1
          || !self->_promptForStereoMultipleHandler)
        {
          -[NSArray firstObject](self->_potentialStereoCounterparts, "firstObject", v55);
          v14 = (HMAccessory *)objc_claimAutoreleasedReturnValue();
          stereoCounterpartAccessory = self->_stereoCounterpartAccessory;
          self->_stereoCounterpartAccessory = v14;

          -[HDSDeviceOperationHomeKitSetup setStereoCounterpart:](self->_homeKitSetupOperation, "setStereoCounterpart:", self->_stereoCounterpartAccessory);
          if (!self->_stereoPairUserInputState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v18 = v17;
              if (os_signpost_enabled(v16))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

          }
          self->_stereoPairUserInputState = 15;
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v55 = self->_stereoCounterpartAccessory;
            LogPrintF();
          }
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v55 = self->_potentialStereoCounterparts;
            LogPrintF();
          }
          ++self->_stereoPairUserInputState;
          (*((void (**)(void))self->_promptForStereoMultipleHandler + 2))();
        }
        goto LABEL_118;
      case 14:
        if (!self->_stereoCounterpartAccessory)
          goto LABEL_118;
        -[HDSDeviceOperationHomeKitSetup setStereoCounterpart:](self->_homeKitSetupOperation, "setStereoCounterpart:");
        if (!self->_stereoPairUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v10 = v9;
            if (os_signpost_enabled(v8))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        v11 = 15;
        goto LABEL_117;
      case 15:
        -[HDSSetupSession _runStereoPairUserInputPickColors:](self, "_runStereoPairUserInputPickColors:", 1);
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_stereoPairUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v24 = v23;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_END, v27, "StereoUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        v11 = 4;
        goto LABEL_117;
      default:
        goto LABEL_118;
    }
  }
}

- (int)_runSetupPSG
{
  HDSSetupSession *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  HMAccessory *stereoCounterpartAccessory;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSString *v44;
  NSString *v45;
  NSString *v46;
  id v48;
  HMAccessory *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  HDSSetupSession *v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v2 = self;
  v71 = *MEMORY[0x24BDAC8D0];
  switch(self->_psgState)
  {
    case 0:
      if (!self->_promptForSetupPSGHandler)
      {
        if (gLogCategory_HDSSetupSession > 30
          || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_95;
        }
        goto LABEL_22;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v2->_psgState = 1;
      (*((void (**)(void))v2->_promptForSetupPSGHandler + 2))();
      break;
    case 1:
      if (self->_psgSelected)
      {
        if (self->_psgEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          -[NSSet anyObject](v2->_psgsInSelectedRoom, "anyObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDSSetupSession _selectedRoomAllHomePods](v2, "_selectedRoomAllHomePods");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v3, "copy");

          v54 = v2;
          -[HDSSetupSession _selectedRoomAllStereoPairs](v2, "_selectedRoomAllStereoPairs");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)objc_msgSend(v4, "copy");

          v6 = (void *)objc_opt_new();
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          obj = v5;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v65 != v9)
                  objc_enumerationMutation(obj);
                v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                objc_msgSend(v11, "components");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
                if (v13)
                {
                  v14 = v13;
                  v15 = *(_QWORD *)v61;
                  do
                  {
                    for (j = 0; j != v14; ++j)
                    {
                      if (*(_QWORD *)v61 != v15)
                        objc_enumerationMutation(v12);
                      objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "mediaProfile");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "accessory");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "addObject:", v18);

                    }
                    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
                  }
                  while (v14);
                }

              }
              v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
            }
            while (v8);
          }

          if (v54->_stereoPairUserInputState == 4)
          {
            stereoCounterpartAccessory = v54->_stereoCounterpartAccessory;
            if (stereoCounterpartAccessory)
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1
                 || (v20 = _LogCategory_Initialize(), stereoCounterpartAccessory = v54->_stereoCounterpartAccessory, v20)))
              {
                v49 = stereoCounterpartAccessory;
                LogPrintF();
                objc_msgSend(v6, "addObject:", v54->_stereoCounterpartAccessory, v49);
              }
              else
              {
                objc_msgSend(v6, "addObject:", stereoCounterpartAccessory, v48);
              }
            }
          }
          v21 = (void *)objc_opt_new();
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v22 = v51;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v57;
            do
            {
              for (k = 0; k != v24; ++k)
              {
                if (*(_QWORD *)v57 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
                if ((objc_msgSend(v6, "containsObject:", v27) & 1) == 0)
                  objc_msgSend(v21, "addObject:", v27);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            }
            while (v24);
          }

          v2 = v54;
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            {
              v48 = v53;
              LogPrintF();
            }
            if (gLogCategory_HDSSetupSession <= 30)
            {
              if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
              {
                v48 = v21;
                LogPrintF();
              }
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                v48 = obj;
                LogPrintF();
              }
            }
          }
          v28 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(CFSTR("psgStereoPairs"), "substringToIndex:", 1, v48);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "uppercaseString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("psgStereoPairs"), "substringFromIndex:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@"), v30, v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(CFSTR("psgHomePods"), "substringToIndex:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uppercaseString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("psgHomePods"), "substringFromIndex:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@%@"), v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(CFSTR("existingMediaGroup"), "substringToIndex:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "uppercaseString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("existingMediaGroup"), "substringFromIndex:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("%@%@"), v40, v41);
          v42 = objc_claimAutoreleasedReturnValue();

          v52 = (void *)v32;
          v50 = v32;
          v43 = (void *)v42;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set%@:"), v50);
          v44 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v44);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set%@:"), v37);
          v45 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v45);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("set%@:"), v43);
          v46 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v46);

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            -[HDSDeviceOperationHomeKitSetup setValue:forKey:](v54->_homeKitSetupOperation, "setValue:forKey:", obj, CFSTR("psgStereoPairs"));
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            -[HDSDeviceOperationHomeKitSetup setValue:forKey:](v54->_homeKitSetupOperation, "setValue:forKey:", v21, CFSTR("psgHomePods"));
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            -[HDSDeviceOperationHomeKitSetup setValue:forKey:](v54->_homeKitSetupOperation, "setValue:forKey:", v53, CFSTR("existingMediaGroup"));
          }

        }
        else if (gLogCategory_HDSSetupSession <= 30
               && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_22:
          LogPrintF();
        }
LABEL_95:
        v2->_psgState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_19;
      }
      break;
    case 2:
    case 4:
      return v2->_psgState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_19:
        LogPrintF();
      }
      break;
  }
  return v2->_psgState;
}

- (void)_runStereoPairUserInputPickColors:(BOOL)a3
{
  int v4;
  HMAccessory *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE90280];
  self->_stereoCounterpartColor = v4;
  v5 = self->_stereoCounterpartAccessory;
  if (!v5)
  {
    -[NSArray firstObject](self->_potentialStereoCounterparts, "firstObject");
    v5 = (HMAccessory *)objc_claimAutoreleasedReturnValue();
  }
  -[HMAccessory uniqueIdentifier](v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_17:

    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_26;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_companionLinkClient, "activeDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {
LABEL_16:

    goto LABEL_17;
  }
  v9 = v8;
  v18 = v4;
  v10 = *(_QWORD *)v20;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
    objc_msgSend(v12, "homeKitIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v6);

    if (v14)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  objc_msgSend(v12, "deviceColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || (v17 = objc_msgSend(v15, "intValue"), v18 == v17))
  {

    goto LABEL_16;
  }
  self->_stereoCounterpartColor = v17;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_19;
  }
LABEL_26:

}

- (int)_runTVAudioUserInput
{
  int tvAudioUserInputState;
  const char *v4;
  const char *v5;
  int *v6;
  Class (**v7)();
  int v8;
  int v9;
  HMAccessory *stereoCounterpartAccessory;
  char v11;
  int v12;
  NSArray *v13;
  NSArray *potentialTVs;
  NSArray *v15;
  void *v16;
  HMAccessory *v17;
  HMAccessory *tvAudioInput;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  Class (**v25)();
  const char *v26;
  int *v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  NSObject *v34;
  unint64_t v35;
  os_signpost_id_t v36;
  HMAccessory *v37;
  int v38;
  int v39;
  NSObject *v40;
  unint64_t v41;
  os_signpost_id_t v42;
  NSObject *v43;
  unint64_t v44;
  os_signpost_id_t v45;
  int v46;
  NSObject *v47;
  unint64_t v48;
  os_signpost_id_t v49;
  NSObject *v50;
  unint64_t v51;
  os_signpost_id_t v52;
  NSObject *v53;
  unint64_t v54;
  os_signpost_id_t v55;
  unint64_t v56;
  const char *v57;
  NSObject *v58;
  unint64_t v59;
  os_signpost_id_t v60;
  NSObject *v61;
  unint64_t v62;
  os_signpost_id_t v63;
  int v64;
  NSObject *v65;
  unint64_t v66;
  os_signpost_id_t v67;
  NSObject *v68;
  unint64_t v69;
  os_signpost_id_t v70;
  void *v72;
  _QWORD v73[5];
  uint8_t buf[16];

  tvAudioUserInputState = self->_tvAudioUserInputState;
  v4 = "-[HDSSetupSession _runTVAudioUserInput]";
  v5 = "TVAudioUserInput start\n";
  v6 = &dword_22F74D000;
  v7 = &getAFSettingsConnectionClass;
  while (2)
  {
    v8 = tvAudioUserInputState;
    switch(tvAudioUserInputState)
    {
      case 0:
        v9 = *((_DWORD *)v7 + 150);
        if (v9 > 30)
          goto LABEL_46;
        if (v9 != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_tvAudioUserInputState)
        {
LABEL_46:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v30 = v29;
            if (os_signpost_enabled(v28))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(v6, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        v23 = 10;
        goto LABEL_123;
      case 10:
        stereoCounterpartAccessory = self->_stereoCounterpartAccessory;
        if (!stereoCounterpartAccessory)
        {
          v23 = 11;
          goto LABEL_123;
        }
        v11 = -[HMAccessory supportsAudioDestination](stereoCounterpartAccessory, "supportsAudioDestination");
        v12 = *((_DWORD *)v7 + 150);
        if ((v11 & 1) != 0)
        {
          if (v12 > 30 || v12 == -1 && !_LogCategory_Initialize())
            goto LABEL_122;
          goto LABEL_72;
        }
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (!self->_tvAudioUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v55 = v54;
            if (os_signpost_enabled(v53))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(v6, v53, OS_SIGNPOST_INTERVAL_BEGIN, v55, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v50 = objc_claimAutoreleasedReturnValue();
        v56 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v56 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_107;
        v52 = v56;
        if (!os_signpost_enabled(v50))
          goto LABEL_107;
        goto LABEL_106;
      case 11:
        -[HDSDeviceOperationHomeKitSetup findTVs](self->_homeKitSetupOperation, "findTVs");
        v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
        potentialTVs = self->_potentialTVs;
        self->_potentialTVs = v13;

        if (-[NSArray count](self->_potentialTVs, "count"))
        {
          v15 = self->_potentialTVs;
          v73[0] = MEMORY[0x24BDAC760];
          v73[1] = 3221225472;
          v73[2] = __39__HDSSetupSession__runTVAudioUserInput__block_invoke;
          v73[3] = &unk_24FCD5220;
          v73[4] = self;
          -[NSArray cuFilteredArrayUsingBlock:](v15, "cuFilteredArrayUsingBlock:", v73);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (HMAccessory *)objc_msgSend(v16, "count");
          if (v17)
          {
            objc_msgSend(v16, "firstObject");
            v17 = (HMAccessory *)objc_claimAutoreleasedReturnValue();
          }
          tvAudioInput = self->_tvAudioInput;
          self->_tvAudioInput = v17;

          v19 = *((_DWORD *)v7 + 150);
          if (self->_tvAudioInput)
          {
            if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
            {
              v72 = self->_potentialTVs;
              LogPrintF();
            }
            v46 = self->_tvAudioUserInputState + 1;
          }
          else
          {
            v25 = v7;
            v26 = v4;
            v27 = v6;
            if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            v57 = v5;
            if (!self->_tvAudioUserInputState)
            {
              objc_msgSend((id)objc_opt_class(), "signpostLog");
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = -[HDSSetupSession signpostID](self, "signpostID");
              if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v60 = v59;
                if (os_signpost_enabled(v58))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(v27, v58, OS_SIGNPOST_INTERVAL_BEGIN, v60, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
                }
              }

            }
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v63 = v62;
              if (os_signpost_enabled(v61))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(v27, v61, OS_SIGNPOST_INTERVAL_END, v63, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

            v46 = 2;
            v5 = v57;
            v6 = v27;
            v4 = v26;
            v7 = v25;
          }
          self->_tvAudioUserInputState = v46;

          goto LABEL_124;
        }
        v24 = *((_DWORD *)v7 + 150);
        if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (!self->_tvAudioUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v49 = v48;
            if (os_signpost_enabled(v47))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(v6, v47, OS_SIGNPOST_INTERVAL_BEGIN, v49, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v52 = v51;
          if (os_signpost_enabled(v50))
          {
LABEL_106:
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(v6, v50, OS_SIGNPOST_INTERVAL_END, v52, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }
LABEL_107:

        goto LABEL_108;
      case 12:
        if (self->_promptForTVAudioHandler)
        {
          v20 = *((_DWORD *)v7 + 150);
          if (self->_tvAudioInput)
          {
            if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            ++self->_tvAudioUserInputState;
            (*((void (**)(void))self->_promptForTVAudioHandler + 2))();
            goto LABEL_124;
          }
        }
        else
        {
          v20 = *((_DWORD *)v7 + 150);
        }
        if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (!self->_tvAudioUserInputState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v42 = v41;
            if (os_signpost_enabled(v40))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(v6, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v45 = v44;
          if (os_signpost_enabled(v43))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(v6, v43, OS_SIGNPOST_INTERVAL_END, v45, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

LABEL_108:
        v23 = 2;
        goto LABEL_123;
      case 13:
        if (!self->_tvAudioInputAvailable)
          goto LABEL_124;
        v21 = *((_DWORD *)v7 + 150);
        if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (self->_tvAudioEnabled)
        {
          v37 = self->_tvAudioInput;
          v38 = *((_DWORD *)v7 + 150);
          if (v37)
          {
            if (v38 <= 30)
            {
              if (v38 != -1 || (v64 = _LogCategory_Initialize(), v37 = self->_tvAudioInput, v64))
              {
                -[HMAccessory uniqueIdentifier](v37, "uniqueIdentifier", v72);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                LogPrintF();

                v37 = self->_tvAudioInput;
              }
            }
            self->_odeonState = 1;
            -[HDSDeviceOperationHomeKitSetup setTvAudioInput:](self->_homeKitSetupOperation, "setTvAudioInput:", v37, v72);
          }
          else if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
          {
LABEL_72:
            LogPrintF();
          }
LABEL_122:
          v23 = self->_tvAudioUserInputState + 1;
LABEL_123:
          self->_tvAudioUserInputState = v23;
        }
        else
        {
          v39 = *((_DWORD *)v7 + 150);
          if (v39 <= 30 && (v39 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          if (!self->_tvAudioUserInputState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v67 = v66;
              if (os_signpost_enabled(v65))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(v6, v65, OS_SIGNPOST_INTERVAL_BEGIN, v67, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

          }
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v70 = v69;
            if (os_signpost_enabled(v68))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(v6, v68, OS_SIGNPOST_INTERVAL_END, v70, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

          self->_tvAudioUserInputState = 2;
          self->_odeonState = 2;
        }
LABEL_124:
        tvAudioUserInputState = self->_tvAudioUserInputState;
        if (tvAudioUserInputState != v8)
          continue;
        return v8;
      case 14:
        v22 = *((_DWORD *)v7 + 150);
        if (v22 <= 30)
        {
          if (v22 != -1 || _LogCategory_Initialize())
            LogPrintF();
          if (!self->_tvAudioUserInputState)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v33 = v32;
              if (os_signpost_enabled(v31))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(v6, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

          }
        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v36 = v35;
          if (os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(v6, v34, OS_SIGNPOST_INTERVAL_END, v36, "TVAudioUserInput", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        v23 = 4;
        goto LABEL_123;
      default:
        goto LABEL_124;
    }
  }
}

id __39__HDSSetupSession__runTVAudioUserInput__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "isControllable"))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v4 = v3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v4 = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1236) = 3;
  }

  return v4;
}

- (int)_runPreAuth
{
  void (**progressHandler)(id, uint64_t, _QWORD);

  switch(self->_preAuthState)
  {
    case 0:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[HDSSetupSession _runPreAuthRequest](self, "_runPreAuthRequest");
      break;
    case 1:
      if (self->_preAuthStartedProgress)
        goto LABEL_6;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthStartedProgress = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 40, 0);
      break;
    case 2:
    case 4:
      return self->_preAuthState;
    default:
LABEL_6:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  return self->_preAuthState;
}

- (void)_runPreAuthRequest
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  uint64_t apcEnabled;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  NSString **p_companionSiriLanguageCode;
  NSString *companionSiriLanguageCode;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  SFSession *sfSession;
  AFVoiceInfo *selectedSiriVoice;
  id v22;
  _QWORD v23[5];
  uint8_t buf[16];

  if (self->_isCLIMode)
    self->_pauseAfterPreAuth = 1;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!self->_preAuthState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  self->_preAuthState = 1;
  apcEnabled = self->_apcEnabled;
  if (self->_siriPasscodeEnabled)
    apcEnabled |= 2uLL;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", apcEnabled | 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ff"));

  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "assistantIsEnabled") & 1) != 0)
  {
    objc_msgSend(v9, "languageCode");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString isEqual:](v10, "isEqual:", CFSTR("en")))
  {

    v10 = CFSTR("en-US");
LABEL_16:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("siriLL"));
    goto LABEL_17;
  }
  if (v10)
    goto LABEL_16;
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = 0;
LABEL_17:
  p_companionSiriLanguageCode = &self->_companionSiriLanguageCode;
  companionSiriLanguageCode = self->_companionSiriLanguageCode;
  self->_companionSiriLanguageCode = &v10->isa;

  objc_msgSend(v9, "outputVoice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "languageCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("siriVL"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*p_companionSiriLanguageCode)
    objc_storeStrong((id *)&self->_companionSiriLanguageCode, v15);
  objc_storeStrong((id *)&self->_selectedSiriVoice, v14);
  v16 = objc_msgSend(v14, "gender");
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("siriVG"));

  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v14, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("siriVN"));
  }
  else
  {
    if (gLogCategory_HDSSetupSession > 60)
      goto LABEL_47;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      selectedSiriVoice = (AFVoiceInfo *)*p_companionSiriLanguageCode;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      selectedSiriVoice = self->_selectedSiriVoice;
      LogPrintF();
    }
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("companionSU"), selectedSiriVoice);
  softLinkAFPreferencesHorsemanSupplementalLanguageDictionary[0]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("siriSupLangs"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F08, CFSTR("sndID"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v22 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __37__HDSSetupSession__runPreAuthRequest__block_invoke;
  v23[3] = &unk_24FCD4618;
  v23[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_pa"), &unk_24FCE3CC8, v3, v23, v22);

}

uint64_t __37__HDSSetupSession__runPreAuthRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runPreAuthResponse:error:", a4, a2);
}

- (void)_runPreAuthResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  unint64_t v20;
  os_signpost_id_t v21;
  NSArray *v22;
  NSArray *siriLanguageCodes;
  void *v24;
  void *v25;
  void *v26;
  unint64_t peerFeatureFlags;
  void (**preAuthHandler)(void);
  id v29;
  _BOOL4 homePodIsCallbellCapable;
  const char *v31;
  _BOOL4 homePod6GCapable;
  const char *v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  uint8_t buf[12];
  unsigned int v40;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v40 = 0;
  if (v7 && !v8)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v36 = (uint64_t)v7;
      LogPrintF();
    }
    if (!self->_preAuthState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v18 = v17;
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = v20;
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v19, OS_SIGNPOST_INTERVAL_END, v21, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_preAuthState = 4;
    self->_peerFeatureFlags = CFDictionaryGetInt64();
    objc_storeStrong((id *)&self->_preAuthResponse, a3);
    self->_siriFlags = CFDictionaryGetInt64Ranged();
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siriLanguageCodes = self->_siriLanguageCodes;
    self->_siriLanguageCodes = v22;

    -[SFSession setPairSetupACL:](self->_sfSession, "setPairSetupACL:", &unk_24FCE3CF0);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_storeStrong((id *)&self->_deviceGUID, v24);
    }
    else if (gLogCategory_HDSSetupSession <= 60
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v36 = v40;
      LogPrintF();
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_storeStrong((id *)&self->_deviceSerialNumber, v26);
    }
    else if (gLogCategory_HDSSetupSession <= 60
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v36 = v40;
      LogPrintF();
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_storeStrong((id *)&self->_deviceModel, v25);
    }
    else if (gLogCategory_HDSSetupSession <= 60
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v36 = v40;
      LogPrintF();
    }
    peerFeatureFlags = self->_peerFeatureFlags;
    if ((peerFeatureFlags & 4) == 0)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v36 = -[SFSession sharingSourceVersion](self->_sfSession, "sharingSourceVersion", v36);
        LogPrintF();
      }
      self->_prefStereoPairEnabled = 0;
      peerFeatureFlags = self->_peerFeatureFlags;
    }
    if ((peerFeatureFlags & 0x400) == 0)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v36 = -[SFSession sharingSourceVersion](self->_sfSession, "sharingSourceVersion", v36);
        LogPrintF();
      }
      self->_prefTVAudioEnabled = 0;
      peerFeatureFlags = self->_peerFeatureFlags;
    }
    self->_peerSupportsCaptiveNetworks = (peerFeatureFlags & 0x2000) != 0;
    preAuthHandler = (void (**)(void))self->_preAuthHandler;
    if (preAuthHandler)
    {
      preAuthHandler[2]();
      v29 = self->_preAuthHandler;
      self->_preAuthHandler = 0;

    }
    homePodIsCallbellCapable = CFDictionaryGetInt64() != 0;
    self->_homePodIsCallbellCapable = homePodIsCallbellCapable;
    if (v40)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_69:
        LogPrintF();
      }
LABEL_73:
      homePod6GCapable = CFDictionaryGetInt64() != 0;
      self->_homePod6GCapable = homePod6GCapable;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1)
        {
LABEL_75:
          if (homePod6GCapable)
            v33 = "yes";
          else
            v33 = "no";
          v36 = (uint64_t)v33;
          v37 = v40;
          LogPrintF();
          goto LABEL_80;
        }
        if (_LogCategory_Initialize())
        {
          homePod6GCapable = self->_homePod6GCapable;
          goto LABEL_75;
        }
      }
LABEL_80:
      -[HDSSetupSession runSUNoSetupPreAuthResponse:](self, "runSUNoSetupPreAuthResponse:", v7, v36, v37);
      -[HDSSetupSession runHomeKitSUPreAuthResponse:](self, "runHomeKitSUPreAuthResponse:", v7);
      self->_homePodSysDropCapable = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      self->_canDoV2TermsAndConditions = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodIsWiFiRetryV2 = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (self->_canDoV2TermsAndConditions && self->_termsAndConditionsServersActive)
        v34 = _os_feature_enabled_impl();
      else
        v34 = 0;
      self->_termsAndConditionsV2Shown = v34;
      v35 = objc_alloc_init((Class)getCDPWalrusStateControllerClass[0]());
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __45__HDSSetupSession__runPreAuthResponse_error___block_invoke;
      v38[3] = &unk_24FCD4F90;
      v38[4] = self;
      objc_msgSend(v35, "walrusStatusWithCompletion:", v38);

      goto LABEL_101;
    }
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_73;
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_73;
      homePodIsCallbellCapable = self->_homePodIsCallbellCapable;
    }
    if (homePodIsCallbellCapable)
      v31 = "yes";
    else
      v31 = "no";
    v36 = (uint64_t)v31;
    goto LABEL_69;
  }
  if (!self->_preAuthState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "PreAuth", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_preAuthState = 3;
  if (objc_msgSend(v9, "code") == -6732 || !v9)
  {
    NSErrorWithOSStatusF();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v25, CFSTR("PreAuth"));
LABEL_101:

    goto LABEL_102;
  }
  -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("PreAuth"));
LABEL_102:

}

void __45__HDSSetupSession__runPreAuthResponse_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HDSSetupSession__runPreAuthResponse_error___block_invoke_2;
  block[3] = &unk_24FCD5248;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __45__HDSSetupSession__runPreAuthResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_QWORD *)(a1 + 48) == 1 && objc_msgSend(*(id *)(a1 + 40), "homePodBuildRequiresADPForcedSU"))
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1429) = 1;
    }
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 1417))
    *(_BYTE *)(v2 + 1424) = 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(_QWORD **)(a1 + 40);
  v4 = v3[197];
  if (v4)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(v3[197], 50, 0);
    v3 = *(_QWORD **)(a1 + 40);
  }
  return objc_msgSend(v3, "_run");
}

- (void)runSUNoSetupPreAuthResponse:(id)a3
{
  id v4;
  int Int64Ranged;

  v4 = a3;
  self->_homePodCanSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodIsSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodSaysNeedsSUNoSetup = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homePodSUNoSetupState = Int64Ranged;

}

- (void)runHomeKitSUPreAuthResponse:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *homePodProductVersionString;
  int v8;
  NSString *deviceBuildVersion;
  NSString *v10;

  v4 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeStrong((id *)&self->_deviceBuildVersion, v5);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      deviceBuildVersion = self->_deviceBuildVersion;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    deviceBuildVersion = 0;
    goto LABEL_8;
  }
  self->_homePodNeedsSU = CFDictionaryGetInt64() != 0;
  self->_homePodReceivedSUResponse = 1;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  homePodProductVersionString = self->_homePodProductVersionString;
  self->_homePodProductVersionString = v6;

  self->_homePodRecievedProductVersionResponse = 1;
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v10 = self->_homePodProductVersionString;
    LogPrintF();
    v8 = -[HDSSetupSession isHomePodProductVersionParis:](self, "isHomePodProductVersionParis:", self->_homePodProductVersionString, v10);
  }
  else
  {
    v8 = -[HDSSetupSession isHomePodProductVersionParis:](self, "isHomePodProductVersionParis:", self->_homePodProductVersionString, deviceBuildVersion);
  }
  self->_homePodProductVersion = v8;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (int)isHomePodProductVersionParis:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BE3F2A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithVersionString:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("16.0.0"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v5)
  {
    if ((objc_msgSend(v6, "isGreaterThanVersion:", v5) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToVersion:", v6) & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v5, "isGreaterThanVersion:", v6))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("16.1.0"));
      if ((objc_msgSend(v5, "isGreaterThanVersion:", v8) & 1) != 0)
      {
        v7 = 4;
      }
      else if (objc_msgSend(v5, "isEqualToVersion:", v8))
      {
        v7 = 3;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 1;
  }

  return v7;
}

- (int)_runCheckAccount
{
  int result;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  void (**progressHandler)(id, uint64_t, _QWORD);
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  result = self->_iCloudAccountState;
  switch(result)
  {
    case 0:
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_13;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_iCloudAccountState)
      {
LABEL_13:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)v16 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_END, v9, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, v16, 2u);
        }
      }

      result = 2;
      goto LABEL_30;
    case 1:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 124, 0);
      if (!self->_iCloudAccountState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)v15 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "iCloudAccountCheck", (const char *)&unk_22F7B8AEE, v15, 2u);
          }
        }

      }
      result = 11;
LABEL_30:
      self->_iCloudAccountState = result;
      break;
    case 2:
    case 4:
      return result;
    default:
      if (gLogCategory_HDSSetupSession <= 30)
      {
        if (gLogCategory_HDSSetupSession != -1
          || (v14 = _LogCategory_Initialize(), result = self->_iCloudAccountState, v14))
        {
          LogPrintF();
          result = self->_iCloudAccountState;
        }
      }
      break;
  }
  return result;
}

- (int)_enableSiriForPersonalRequestIfNecessary
{
  void *v3;
  int personalRequestsChoice;
  int v5;
  const char *v6;
  const char *v7;
  char v8;
  void *v9;
  const char *v11;
  void *v12;
  const char *v13;

  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  personalRequestsChoice = self->_personalRequestsChoice;
  v5 = objc_msgSend(v3, "assistantIsEnabled");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v6 = "yes";
    if (personalRequestsChoice == 6)
      v7 = "yes";
    else
      v7 = "no";
    if (!v5)
      v6 = "no";
    v11 = v7;
    v13 = v6;
    LogPrintF();
  }
  if (personalRequestsChoice == 6)
    v8 = v5;
  else
    v8 = 1;
  if ((v8 & 1) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v3, "setAssistantIsEnabled:", 1, v11, v13);
    if (self->_selectedSiriVoice)
    {
      -[HDSSetupSession selectedSiriLanguageCode](self, "selectedSiriLanguageCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v12 = v9;
        LogPrintF();
      }
      objc_msgSend(v3, "setLanguageCode:outputVoice:", v9, self->_selectedSiriVoice, v12);

    }
  }

  return 4;
}

- (int)_runSiriLanguage
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  void (**promptForVoiceRecognitionHandler)(id, BOOL);
  void (**promptForSiriLanguageHandler)(id, NSArray *, const __CFString *);
  NSArray *siriLanguageCodes;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  void *v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];

  switch(self->_siriLanguageState)
  {
    case 0:
      if (self->_promptForSiriLanguageHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v3 = objc_claimAutoreleasedReturnValue();
          v4 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v5 = v4;
            if (os_signpost_enabled(v3))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SiriLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        self->_siriLanguageState = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          -[NSArray firstObject](self->_siriLanguageCodes, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        promptForSiriLanguageHandler = (void (**)(id, NSArray *, const __CFString *))self->_promptForSiriLanguageHandler;
        siriLanguageCodes = self->_siriLanguageCodes;
        -[NSArray firstObject](siriLanguageCodes, "firstObject", v25);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (const __CFString *)v15;
        else
          v17 = CFSTR("?");
        promptForSiriLanguageHandler[2](promptForSiriLanguageHandler, siriLanguageCodes, v17);

      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v20 = v19;
            if (os_signpost_enabled(v18))
            {
              *(_WORD *)v29 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SiriLanguage", (const char *)&unk_22F7B8AEE, v29, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v23 = v22;
          if (os_signpost_enabled(v21))
          {
            *(_WORD *)v28 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v21, OS_SIGNPOST_INTERVAL_END, v23, "SiriLanguage", (const char *)&unk_22F7B8AEE, v28, 2u);
          }
        }

        self->_siriLanguageState = 4;
      }
      break;
    case 1:
      if (self->_siriLanguagePicked)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriLanguageState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)v27 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SiriLanguage", (const char *)&unk_22F7B8AEE, v27, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)v26 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SiriLanguage", (const char *)&unk_22F7B8AEE, v26, 2u);
          }
        }

        self->_siriLanguageState = 4;
        promptForVoiceRecognitionHandler = (void (**)(id, BOOL))self->_promptForVoiceRecognitionHandler;
        if (promptForVoiceRecognitionHandler)
          promptForVoiceRecognitionHandler[2](promptForVoiceRecognitionHandler, -[HDSSetupSession _isVoiceRecognitionSupported](self, "_isVoiceRecognitionSupported"));
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_siriLanguageState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_siriLanguageState;
}

- (int)_runRecognizeVoice
{
  int recognizeVoiceState;
  int v4;
  int recognizeVoiceEnabled;
  const char *v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  int v10;
  int recognizeVoiceStepState;
  int v12;
  int v13;
  const char *v14;
  _BOOL4 hasExistingHomePodInSelectedRoom;
  const char *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  unint64_t v20;
  os_signpost_id_t v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  int v31;
  int v32;
  id v33;
  const char *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[16];

  recognizeVoiceState = self->_recognizeVoiceState;
  while (2)
  {
    v4 = recognizeVoiceState;
    switch(recognizeVoiceState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_30;
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_recognizeVoiceState)
        {
LABEL_30:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v9 = v8;
            if (os_signpost_enabled(v7))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecognizeMyVoice", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        v10 = 10;
        goto LABEL_78;
      case 10:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        -[HDSSetupSession _runRecognizeVoiceCheckLanguageStart](self, "_runRecognizeVoiceCheckLanguageStart", v35);
        goto LABEL_103;
      case 11:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        recognizeVoiceStepState = self->_recognizeVoiceStepState;
        if (recognizeVoiceStepState == 1)
          goto LABEL_103;
        if (recognizeVoiceStepState == 4)
LABEL_77:
          v10 = self->_recognizeVoiceState + 1;
        else
          v10 = 2;
        goto LABEL_78;
      case 12:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        -[HDSSetupSession _runRecognizeVoiceCheckVoiceProfileStart](self, "_runRecognizeVoiceCheckVoiceProfileStart", v35);
        goto LABEL_103;
      case 13:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v12 = self->_recognizeVoiceStepState;
        if (v12 == 1)
          goto LABEL_103;
        if (v12 == 4)
        {
          v13 = self->_recognizeVoiceState + 1;
          self->_recognizeVoiceState = v13;
          if (v13 != 2)
            goto LABEL_103;
        }
        else
        {
          self->_recognizeVoiceState = 2;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          v14 = "yes";
          if (!self->_recognizeVoiceEnabled)
            v14 = "no";
          v35 = v14;
          LogPrintF();
        }
LABEL_103:
        recognizeVoiceState = self->_recognizeVoiceState;
        if (recognizeVoiceState != v4)
          continue;
        return v4;
      case 14:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (-[HDSSetupSession _recognizeVoiceAlreadyEnabled](self, "_recognizeVoiceAlreadyEnabled", v35))
          hasExistingHomePodInSelectedRoom = self->_hasExistingHomePodInSelectedRoom;
        else
          hasExistingHomePodInSelectedRoom = 0;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          v16 = "yes";
          if (!hasExistingHomePodInSelectedRoom)
            v16 = "no";
          v35 = v16;
          LogPrintF();
        }
        if (!hasExistingHomePodInSelectedRoom)
          goto LABEL_77;
        self->_recognizeVoiceEnabled = 6;
        self->_rmvSelectionState = 2;
        if (!self->_recognizeVoiceState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v21 = v20;
            if (os_signpost_enabled(v19))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "RecognizeMyVoice", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v24 = v23;
          if (os_signpost_enabled(v22))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_END, v24, "RecognizeMyVoice", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        v10 = 4;
LABEL_78:
        self->_recognizeVoiceState = v10;
        goto LABEL_103;
      case 15:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ++self->_recognizeVoiceState;
        self->_recognizeVoiceEnabled = 0;
        v17 = MEMORY[0x2348A3310](self->_progressHandler);
        v18 = (id)v17;
        if (v17)
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, 140, 0);
        goto LABEL_102;
      case 16:
        recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
        if (!recognizeVoiceEnabled)
          goto LABEL_103;
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_80;
        v6 = "yes";
        if (gLogCategory_HDSSetupSession != -1)
          goto LABEL_27;
        if (_LogCategory_Initialize())
        {
          v6 = "yes";
          if (!self->_recognizeVoiceEnabled)
            v6 = "no";
LABEL_27:
          v35 = v6;
          LogPrintF();
        }
LABEL_80:
        if (!self->_recognizeVoiceState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v27 = v26;
            if (os_signpost_enabled(v25))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "RecognizeMyVoice", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v30 = v29;
          if (os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_END, v30, "RecognizeMyVoice", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        if (recognizeVoiceEnabled == 6)
          v31 = 4;
        else
          v31 = 2;
        self->_recognizeVoiceState = v31;
        if (recognizeVoiceEnabled == 6)
          v32 = 2;
        else
          v32 = 3;
        self->_rmvSelectionState = v32;
        -[HDSSetupSession _runMultiUserEnableEnableSettingStart:privateSettings:](self, "_runMultiUserEnableEnableSettingStart:privateSettings:", CFSTR("root.home.dismissedIdentifyVoiceOnboarding"), 1, v35);
        if (recognizeVoiceEnabled == 6)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v35 = "yes";
            LogPrintF();
          }
          v33 = objc_alloc_init((Class)getAFSettingsConnectionClass_0[0]());
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __37__HDSSetupSession__runRecognizeVoice__block_invoke;
          v36[3] = &unk_24FCD4160;
          v36[4] = self;
          v37 = v33;
          v18 = v33;
          objc_msgSend(v18, "homeOnboardingFlowInvoked:completion:", 1, v36);

LABEL_102:
        }
        goto LABEL_103;
      default:
        goto LABEL_103;
    }
  }
}

void __37__HDSSetupSession__runRecognizeVoice__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (int)_runSiriEnablementConfigurationFetch
{
  int siriEnablementConfigurationState;
  int v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];

  siriEnablementConfigurationState = self->_siriEnablementConfigurationState;
  do
  {
    v4 = siriEnablementConfigurationState;
    if (siriEnablementConfigurationState)
      break;
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_8;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_siriEnablementConfigurationState)
    {
LABEL_8:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)v9 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriEnablementState", (const char *)&unk_22F7B8AEE, v9, 2u);
        }
      }

    }
    self->_siriEnablementConfigurationState = 1;
    -[HDSSetupSession _getSiriEnablementConfiguration](self, "_getSiriEnablementConfiguration");
    siriEnablementConfigurationState = self->_siriEnablementConfigurationState;
  }
  while (siriEnablementConfigurationState != v4);
  return v4;
}

- (void)_runRecognizeVoiceCheckLanguageStart
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  _QWORD v13[5];
  uint8_t buf[16];

  if (-[NSString length](self->_companionSiriLanguageCode, "length"))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_recognizeVoiceStepState = 1;
    v6 = objc_alloc_init((Class)getAFSettingsConnectionClass_0[0]());
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke;
    v13[3] = &unk_24FCD5270;
    v13[4] = self;
    objc_msgSend(v6, "fetchSupportedMultiUserLanguageCodes:", v13);

  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_recognizeVoiceStepState = 2;
  }
}

void __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke_2;
  block[3] = &unk_24FCD42E0;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __55__HDSSetupSession__runRecognizeVoiceCheckLanguageStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_runRecognizeVoiceCheckLanguageResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_runRecognizeVoiceCheckLanguageResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  int recognizeVoiceStepState;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  const char *v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  id v23;
  NSString *v24;
  const char *v25;
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[16];
  uint8_t v29[16];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = self->_companionSiriLanguageCode;
    recognizeVoiceStepState = 2;
    if (v8)
    {
      if (objc_msgSend(v6, "containsObject:", v8))
        recognizeVoiceStepState = 4;
      else
        recognizeVoiceStepState = 2;
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v26 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v26, 2u);
      }
    }

    self->_recognizeVoiceStepState = recognizeVoiceStepState;
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_36;
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_36:
        -[HDSSetupSession _run](self, "_run", v23, v24, v25);

        goto LABEL_37;
      }
      recognizeVoiceStepState = self->_recognizeVoiceStepState;
    }
    if (recognizeVoiceStepState >= 8)
    {
      v16 = "?";
      if (recognizeVoiceStepState > 9)
        v16 = "User";
    }
    else
    {
      v16 = off_24FCD57D8[recognizeVoiceStepState];
    }
    v24 = v8;
    v25 = v16;
    v23 = v6;
    LogPrintF();
    goto LABEL_36;
  }
  -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v7, CFSTR("RMV"));
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_recognizeVoiceStepState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v29, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_END, v22, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v28, 2u);
    }
  }

  self->_recognizeVoiceStepState = 3;
  -[HDSSetupSession _run](self, "_run");
LABEL_37:

}

- (void)_runRecognizeVoiceCheckVoiceProfileStart
{
  NSString *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v3 = self->_companionSiriLanguageCode;
  if (-[NSString length](v3, "length"))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_recognizeVoiceStepState = 1;
    objc_msgSend((Class)getSSRVoiceProfileManagerClass[0](), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke;
    v14[3] = &unk_24FCD4D98;
    v14[4] = self;
    objc_msgSend(v7, "isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:", v3, v14);

  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_recognizeVoiceStepState = 2;
  }

}

void __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke_2;
  block[3] = &unk_24FCD51D0;
  v11 = a3;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __59__HDSSetupSession__runRecognizeVoiceCheckVoiceProfileStart__block_invoke_2(uint64_t a1)
{
  int v2;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_recognizeVoiceAlreadyEnabled"))
      v2 = 2;
    else
      v2 = 3;
  }
  else
  {
    v2 = 1;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1244) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "_runRecognizeVoiceCheckVoiceProfileResponse:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_getSiriEnablementConfiguration
{
  AFEnablementFlowConfigurationProvider *v3;
  AFEnablementFlowConfigurationProvider *siriEnablementConfigurationProvider;
  NSArray *siriLanguageCodes;
  NSArray *v6;
  NSArray *v7;
  AFEnablementFlowConfigurationProvider *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_siriEnablementConfigurationProvider)
  {
    v3 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init((Class)getAFEnablementFlowConfigurationProviderClass[0]());
    siriEnablementConfigurationProvider = self->_siriEnablementConfigurationProvider;
    self->_siriEnablementConfigurationProvider = v3;

  }
  siriLanguageCodes = self->_siriLanguageCodes;
  if (siriLanguageCodes)
  {
    v6 = siriLanguageCodes;
  }
  else
  {
    v10[0] = self->_companionSiriLanguageCode;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = self->_siriEnablementConfigurationProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke;
  v9[3] = &unk_24FCD5298;
  v9[4] = self;
  -[AFEnablementFlowConfigurationProvider configurationForEnablementFlow:recognitionLanguageCodes:completion:](v8, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 3, v7, v9);

}

void __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 1488);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __50__HDSSetupSession__getSiriEnablementConfiguration__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 336))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v4 = v3;
      if (os_signpost_enabled(v2))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SiriEnablementState", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "SiriEnablementState", (const char *)&unk_22F7B8AEE, v9, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 336) = 4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 344), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)_runRecognizeVoiceCheckVoiceProfileResponse:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  char *v6;
  const char *v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  const char *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v4 = a3;
  v6 = (char *)a4;
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6)
  {
    -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v6, CFSTR("RMV"));
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v21 = v6;
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v24 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v24, 2u);
      }
    }

    v14 = 3;
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v7 = "no";
      if (v4)
        v7 = "yes";
      v21 = v7;
      LogPrintF();
    }
    if (!self->_recognizeVoiceStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v23, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v18, OS_SIGNPOST_INTERVAL_END, v20, "RecognizeVoiceCheckLanguage", (const char *)&unk_22F7B8AEE, v22, 2u);
      }
    }

    if (v4)
      v14 = 4;
    else
      v14 = 2;
  }
  self->_recognizeVoiceStepState = v14;
  -[HDSSetupSession _run](self, "_run", v21);

}

- (int)_runPersonalRequests
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void (**promptForPersonalRequestsHandler)(id, SEL);
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  uint8_t *v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  unint64_t v17;
  __int16 v19;
  uint8_t v20[16];
  uint8_t v21[2];
  uint8_t v22[16];
  uint8_t buf[16];

  switch(self->_personalRequestsState)
  {
    case 0:
      if (!self->_promptForPersonalRequestsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_personalRequestsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)v22 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PersonalRequests", (const char *)&unk_22F7B8AEE, v22, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v10 = objc_claimAutoreleasedReturnValue();
        v17 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v17;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)v21 = 0;
            v13 = v21;
            goto LABEL_47;
          }
        }
        goto LABEL_48;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_personalRequestsState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PersonalRequests", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_personalRequestsState = 1;
      promptForPersonalRequestsHandler = (void (**)(id, SEL))self->_promptForPersonalRequestsHandler;
      if (promptForPersonalRequestsHandler)
        promptForPersonalRequestsHandler[2](promptForPersonalRequestsHandler, a2);
      break;
    case 1:
      if (self->_personalRequestsChoice)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_personalRequestsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v9 = v8;
            if (os_signpost_enabled(v7))
            {
              *(_WORD *)v20 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PersonalRequests", (const char *)&unk_22F7B8AEE, v20, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            v19 = 0;
            v13 = (uint8_t *)&v19;
LABEL_47:
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PersonalRequests", (const char *)&unk_22F7B8AEE, v13, 2u);
          }
        }
LABEL_48:

        self->_personalRequestsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_personalRequestsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_personalRequestsState;
}

- (void)runPersonalRequestsAgreedCLI:(BOOL)a3 makeActiveDevice:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  BOOL v14;

  if ((HDSIsDevicePhone() & 1) != 0)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = objc_alloc((Class)getFMFSessionClass[0]());
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDelegate:delegateQueue:", self, v8);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke;
    v11[3] = &unk_24FCD52E8;
    v13 = a3;
    v11[4] = self;
    v12 = v9;
    v14 = a4;
    v10 = v9;
    objc_msgSend(v10, "getActiveLocationSharingDevice:", v11);

  }
  else
  {
    -[HDSSetupSession personalRequestsEnabled:](self, "personalRequestsEnabled:", 0);
  }
}

void __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  char v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke_2;
  block[3] = &unk_24FCD52C0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v16 = *(_BYTE *)(a1 + 48);
  block[1] = 3221225472;
  v14 = v5;
  v15 = v8;
  v17 = *(_BYTE *)(a1 + 49);
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __65__HDSSetupSession_runPersonalRequestsAgreedCLI_makeActiveDevice___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 40), "personalRequestsEnabled:", 0);
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "isThisDevice"))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 40), "siriCheck:", *(unsigned __int8 *)(a1 + 64));
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 40), "showMeDeviceSwitchWithDevice:session:siriEnabled:activeDeviceEnabled:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
  }
}

- (void)siriCheck:(BOOL)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "assistantIsEnabled") & 1) != 0
    || (objc_msgSend((Class)getVTPreferencesClass_0[0](), "sharedPreferences"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "voiceTriggerEnabled"),
        v5,
        v6))
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 1;
  }
  else if (a3)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 1;
    objc_msgSend(v8, "setAssistantIsEnabled:", 1);
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 0;
  }
  -[HDSSetupSession personalRequestsEnabled:](self, "personalRequestsEnabled:", v7);

}

- (void)showMeDeviceSwitchWithDevice:(id)a3 session:(id)a4 siriEnabled:(BOOL)a5 activeDeviceEnabled:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  if (!v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSSetupSession personalRequestsEnabled:](self, "personalRequestsEnabled:", 0);
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke;
  v13[3] = &unk_24FCD5008;
  v13[4] = self;
  v14 = a5;
  v12 = (void *)MEMORY[0x2348A3310](v13);
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v11, "setActiveDevice:completion:", 0, v12);
  }

}

void __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[5];
  char v5;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_2;
  block[3] = &unk_24FCD4268;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __88__HDSSetupSession_showMeDeviceSwitchWithDevice_session_siriEnabled_activeDeviceEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "siriCheck:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_shouldShowPRCardForHomePodsInRoom
{
  HDSSetupSession *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HDSSetupSession *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v28;
  void *v29;
  HDSSetupSession *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x24BDAC8D0];
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    && gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v3, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(v4, "assistantAccessControlForHome:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = 0;
        goto LABEL_19;
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 90
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = 0;
  v8 = 1;
LABEL_19:
  -[HDSSetupSession _selectedRoomAllHomePods](v2, "_selectedRoomAllHomePods");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = v2->_homeKitSelectedRoomName;
  if (!v10)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_49;
    }
LABEL_36:
    LogPrintF();
LABEL_49:
    v26 = 1;
    goto LABEL_50;
  }
  if ((v8 & 1) != 0)
  {
LABEL_42:
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v24 = v2;
    v25 = 0;
    goto LABEL_47;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v7, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v13)
  {

    goto LABEL_42;
  }
  v14 = v13;
  v28 = v10;
  v29 = v7;
  v30 = v2;
  v31 = v5;
  v32 = v3;
  v15 = 0;
  v16 = *(_QWORD *)v34;
  v17 = *MEMORY[0x24BDD49E0];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v34 != v16)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v19, "room");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "category");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "categoryType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "isEqualToString:", v11))
        v15 += objc_msgSend(v23, "isEqualToString:", v17);

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v14);

  if (v28 != v15)
  {
    v5 = v31;
    v3 = v32;
    v7 = v29;
    v2 = v30;
    if (v15)
    {
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_49;
      }
      goto LABEL_36;
    }
    goto LABEL_42;
  }
  v5 = v31;
  v3 = v32;
  v7 = v29;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v24 = v30;
  v25 = 1;
LABEL_47:
  -[HDSSetupSession personalRequestsEnabled:](v24, "personalRequestsEnabled:", v25);
  v26 = 0;
LABEL_50:

  return v26;
}

- (void)_runPersonalRequestsSkipCard
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  Class (**v7)();
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMAccessory *v12;
  HMAccessory *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  int v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (self->_personalRequestsSkipCardState)
    return;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PersonalRequestsSkipCard", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_personalRequestsSkipCardState = 1;
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &getAFSettingsConnectionClass;
  if (!v6
    && gLogCategory_HDSSetupSession <= 90
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v6, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_30;
  }
  if (!v6 || (objc_msgSend(v8, "assistantAccessControlForHome:", v6), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_30:
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = 0;
    goto LABEL_35;
  }
  v11 = (void *)v10;
  v12 = self->_existingHomepodInSelectedRoom;
  if (v12)
  {
    v13 = v12;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v11, "accessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v28 = v11;
      v29 = v9;
      v16 = *(_QWORD *)v31;
LABEL_16:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "uniqueIdentifier", v28, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessory uniqueIdentifier](v13, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (v20)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v15)
            goto LABEL_16;
          v7 = &getAFSettingsConnectionClass;
          goto LABEL_51;
        }
      }
      v7 = &getAFSettingsConnectionClass;
      if (gLogCategory_HDSSetupSession > 30)
      {
        v15 = 1;
LABEL_51:
        v11 = v28;
        v9 = v29;
        goto LABEL_54;
      }
      v11 = v28;
      v9 = v29;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      v15 = 1;
    }
LABEL_54:

    goto LABEL_36;
  }
LABEL_35:
  v15 = 0;
LABEL_36:
  -[HDSSetupSession personalRequestsEnabled:](self, "personalRequestsEnabled:", v15);
  if (!self->_personalRequestsSkipCardState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PersonalRequestsSkipCard", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = v25;
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v24, OS_SIGNPOST_INTERVAL_END, v26, "PersonalRequestsSkipCard", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_personalRequestsSkipCardState = 4;
  v27 = *((_DWORD *)v7 + 150);
  if (v27 <= 30 && (v27 != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (int)_runSiriForEveryone
{
  int siriForEveryoneState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  siriForEveryoneState = self->_siriForEveryoneState;
  if (siriForEveryoneState != 4 && siriForEveryoneState != 2)
  {
    if (siriForEveryoneState)
    {
      if (self->_siriForEveryoneAnswered)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_siriForEveryoneState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v12 = v11;
            if (os_signpost_enabled(v10))
            {
              *(_WORD *)v18 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SiriForEveryone", (const char *)&unk_22F7B8AEE, v18, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)v17 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "SiriForEveryone", (const char *)&unk_22F7B8AEE, v17, 2u);
          }
        }

        self->_siriForEveryoneState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_18;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_siriForEveryoneState)
      {
LABEL_18:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriForEveryone", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_siriForEveryoneState = 1;
      v8 = MEMORY[0x2348A3310](self->_progressHandler);
      v9 = (void *)v8;
      if (v8)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 150, 0);

    }
  }
  return self->_siriForEveryoneState;
}

- (int)_runAutomaticSoftwareUpdate
{
  int automaticSoftwareUpdateState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  int v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  automaticSoftwareUpdateState = self->_automaticSoftwareUpdateState;
  if (automaticSoftwareUpdateState != 1)
  {
    if (automaticSoftwareUpdateState)
      return self->_automaticSoftwareUpdateState;
    if (self->_promptForAutomaticSoftwareUpdateHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_automaticSoftwareUpdateState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AutomaticSoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_automaticSoftwareUpdateState = 1;
      (*((void (**)(void))self->_promptForAutomaticSoftwareUpdateHandler + 2))();
      return self->_automaticSoftwareUpdateState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_automaticSoftwareUpdateState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)v24 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AutomaticSoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v24, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "AutomaticSoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v23, 2u);
      }
    }

    v13 = 2;
LABEL_44:
    self->_automaticSoftwareUpdateState = v13;
    return self->_automaticSoftwareUpdateState;
  }
  if (self->_automaticSoftwareUpdateAgreed)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_automaticSoftwareUpdateState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AutomaticSoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v22, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "AutomaticSoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v21, 2u);
      }
    }

    v13 = 4;
    goto LABEL_44;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_automaticSoftwareUpdateState;
}

- (int)_runSoftwareUpdate
{
  int softwareUpdateState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  int v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  softwareUpdateState = self->_softwareUpdateState;
  if (softwareUpdateState != 1)
  {
    if (softwareUpdateState)
      return self->_softwareUpdateState;
    if (self->_promptForSoftwareUpdateHandler)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_softwareUpdateState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_softwareUpdateState = 1;
      (*((void (**)(void))self->_promptForSoftwareUpdateHandler + 2))();
      return self->_softwareUpdateState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_softwareUpdateState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)v24 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v24, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v19 = v18;
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)v23 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "SoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v23, 2u);
      }
    }

    v13 = 2;
LABEL_44:
    self->_softwareUpdateState = v13;
    return self->_softwareUpdateState;
  }
  if (self->_softwareUpdateAgreed)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_softwareUpdateState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v22, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "SoftwareUpdatePrompt", (const char *)&unk_22F7B8AEE, v21, 2u);
      }
    }

    v13 = 4;
    goto LABEL_44;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_softwareUpdateState;
}

- (int)_runSoundRecognition
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  _QWORD v20[5];
  uint8_t buf[16];

  switch(self->_soundRecognitionAndDropInState)
  {
    case 0:
      if (self->_promptForSoundRecognitionHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v3 = objc_claimAutoreleasedReturnValue();
          v4 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v5 = v4;
            if (os_signpost_enabled(v3))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SoundRecognition", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        self->_soundRecognitionAndDropInState = 1;
        (*((void (**)(void))self->_promptForSoundRecognitionHandler + 2))();
      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SoundRecognition", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v18 = v17;
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v16, OS_SIGNPOST_INTERVAL_END, v18, "SoundRecognition", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        self->_soundRecognitionAndDropInState = 4;
      }
      break;
    case 1:
      if (self->_soundRecognitionAndDropInSelected)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_soundRecognitionAndDropInState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SoundRecognition", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SoundRecognition", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        self->_soundRecognitionAndDropInState = 4;
        -[HDSSetupSession selectedHome](self, "selectedHome");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __39__HDSSetupSession__runSoundRecognition__block_invoke;
        v20[3] = &unk_24FCD4138;
        v20[4] = self;
        objc_msgSend(v12, "updateDidOnboardAudioAnalysis:completion:", 1, v20);

      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_soundRecognitionAndDropInState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_soundRecognitionAndDropInState;
}

void __39__HDSSetupSession__runSoundRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!v3)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_15;
    if (gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v3, CFSTR("SoundRecognition"));
  if (gLogCategory_HDSSetupSession > 90)
    goto LABEL_15;
  if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
LABEL_7:
    LogPrintF();
LABEL_11:
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedHome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didOnboardAudioAnalysis");
    objc_msgSend(*(id *)(a1 + 32), "selectedHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_15:

}

- (int)_runHomePodSoftwareUpdateNonSetupAcknowledgement
{
  switch(self->_homePodSoftwareUpdateAckNonSetupState)
  {
    case 0:
      if (!self->_promptForHomePodSoftwareUpdateNonSetupAck)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodSoftwareUpdateAckNonSetupState = 1;
      (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupAck + 2))();
      break;
    case 1:
      if (self->_homePodSoftwareUpdateAckNonSetupEnabled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_15:
          LogPrintF();
        }
LABEL_26:
        self->_homePodSoftwareUpdateAckNonSetupState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateAckNonSetupState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateAckNonSetupState;
}

- (int)_runHomePodSoftwareUpdateNonSetupComplete
{
  switch(self->_homePodSoftwareUpdateNonSetupCompletedState)
  {
    case 0:
      if (!self->_promptForHomePodSoftwareUpdateNonSetupCompleted)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homePodSoftwareUpdateNonSetupCompletedState = 1;
      (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupCompleted + 2))();
      break;
    case 1:
      if (self->_homePodSoftwareUpdateNonSetupWasCompleted)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_15:
          LogPrintF();
        }
LABEL_26:
        self->_homePodSoftwareUpdateNonSetupCompletedState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateNonSetupCompletedState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateNonSetupCompletedState;
}

- (int)_runHomePodSoftwareUpdateNonSetupCancelled
{
  switch(self->_homePodSoftwareUpdateNonSetupCancelled)
  {
    case 0:
      if (self->_promptForHomePodSoftwareUpdateNonSetupCancelled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homePodSoftwareUpdateNonSetupCancelled = 1;
        (*((void (**)(void))self->_promptForHomePodSoftwareUpdateNonSetupCancelled + 2))();
      }
      else
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homePodSoftwareUpdateNonSetupCancelled = 4;
      }
      break;
    case 1:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_11;
      }
      break;
    case 2:
    case 4:
      return self->_homePodSoftwareUpdateNonSetupCancelled;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_11:
        LogPrintF();
      }
      break;
  }
  return self->_homePodSoftwareUpdateNonSetupCancelled;
}

- (int)_runForcedHomePodSoftwareUpdateNonSetup
{
  int homePodSoftwareUpdateStateNonSetup;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  _QWORD v7[5];

  homePodSoftwareUpdateStateNonSetup = self->_homePodSoftwareUpdateStateNonSetup;
  switch(homePodSoftwareUpdateStateNonSetup)
  {
    case 4:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodSoftwareUpdateStateNonSetup;
      }
LABEL_12:
      LogPrintF();
      return self->_homePodSoftwareUpdateStateNonSetup;
    case 1:
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        return self->_homePodSoftwareUpdateStateNonSetup;
      }
      goto LABEL_12;
    case 0:
      self->_homePodSoftwareUpdateStateNonSetup = 1;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 900, 0);
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke;
      v7[3] = &unk_24FCD4618;
      v7[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_hds_fu"), 0, MEMORY[0x24BDBD1B8], v7);
      break;
  }
  return self->_homePodSoftwareUpdateStateNonSetup;
}

void __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 1488);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke_2;
  v15[3] = &unk_24FCD43D0;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, v15);

}

void __58__HDSSetupSession__runForcedHomePodSoftwareUpdateNonSetup__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t Int64;
  const char *v4;
  unsigned int Int64Ranged;
  const char *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_OWORD *)(a1 + 32);
      LogPrintF();
    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1312) = 3;
    objc_msgSend(*(id *)(a1 + 56), "_reportError:label:", *(_QWORD *)(a1 + 32), CFSTR("SU-No-Setup Scan failed"));
  }
  else
  {
    Int64 = CFDictionaryGetInt64();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v4 = "yes";
      if (!Int64)
        v4 = "no";
      *(_QWORD *)&v8 = v4;
      LogPrintF();
    }
    if (Int64)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1312) = 4;
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 1430) = 1;
      Int64Ranged = CFDictionaryGetInt64Ranged();
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1448) = Int64Ranged;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        if (Int64Ranged > 6)
          v6 = "Unknown";
        else
          v6 = off_24FCD57A0[Int64Ranged];
        *(_QWORD *)&v8 = v6;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 56), "_run", v8, v9);
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1312) = 3;
      v7 = *(void **)(a1 + 56);
      NSErrorWithOSStatusF();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_reportError:label:", v2, CFSTR("SU-No-Setup Scan failed"));

    }
  }
}

- (int)_runTerms
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  uint8_t *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  unint64_t v16;
  __int16 v18;
  uint8_t v19[16];
  uint8_t v20[2];
  uint8_t v21[16];
  uint8_t buf[16];

  switch(self->_termsState)
  {
    case 0:
      if (!self->_promptForTermsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_termsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)v21 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TermsPrompt", (const char *)&unk_22F7B8AEE, v21, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v16 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v16;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)v20 = 0;
            v12 = v20;
            goto LABEL_46;
          }
        }
        goto LABEL_47;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_termsState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "TermsPrompt", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_termsState = 1;
      (*((void (**)(void))self->_promptForTermsHandler + 2))();
      break;
    case 1:
      if (self->_termsAgreed)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_termsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)v19 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TermsPrompt", (const char *)&unk_22F7B8AEE, v19, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            v18 = 0;
            v12 = (uint8_t *)&v18;
LABEL_46:
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "TermsPrompt", (const char *)&unk_22F7B8AEE, v12, 2u);
          }
        }
LABEL_47:

        self->_termsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_termsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_termsState;
}

- (int)_runPreAuthAlignmentAndSiri
{
  int result;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint64_t v6;

  result = self->_preShareSettingsState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
    {
      if (self->_lpcSkip || self->_isCLIMode || !self->_prefLEDPasscodeEnabled)
        v6 = 60;
      else
        v6 = 55;
      progressHandler[2](progressHandler, v6, 0);
    }
    result = 4;
    self->_preShareSettingsState = 4;
  }
  return result;
}

- (int)_runShareSettings
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  uint8_t *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  unint64_t v16;
  __int16 v18;
  uint8_t v19[16];
  uint8_t v20[2];
  uint8_t v21[16];
  uint8_t buf[16];

  switch(self->_shareSettingsState)
  {
    case 0:
      if (!self->_promptToShareSettingsHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_shareSettingsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v15 = v14;
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)v21 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ShareSettingsPrompt", (const char *)&unk_22F7B8AEE, v21, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v16 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v16;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)v20 = 0;
            v12 = v20;
            goto LABEL_46;
          }
        }
        goto LABEL_47;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_shareSettingsState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ShareSettingsPrompt", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_shareSettingsState = 1;
      (*((void (**)(void))self->_promptToShareSettingsHandler + 2))();
      break;
    case 1:
      if (self->_shareSettingsAgreed)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_shareSettingsState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)v19 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ShareSettingsPrompt", (const char *)&unk_22F7B8AEE, v19, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            v18 = 0;
            v12 = (uint8_t *)&v18;
LABEL_46:
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "ShareSettingsPrompt", (const char *)&unk_22F7B8AEE, v12, 2u);
          }
        }
LABEL_47:

        self->_shareSettingsState = 4;
      }
      else if (gLogCategory_HDSSetupSession <= 30
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
      break;
    case 2:
    case 4:
      return self->_shareSettingsState;
    default:
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_18:
        LogPrintF();
      }
      break;
  }
  return self->_shareSettingsState;
}

- (void)_runAuthKitTrustStartIfNeeded
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[16];

  if (!self->_authKitTrustState)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_7;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_authKitTrustState)
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AuthKitTrust", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_authKitTrustState = 1;
    v6 = objc_alloc_init((Class)getAKAppleIDAuthenticationInAppContextClass[0]());
    -[ACAccount accountPropertyForKey:](self->_iCloudAccount, "accountPropertyForKey:", CFSTR("altDSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAltDSID:", v7);

    objc_msgSend(v6, "setAuthenticationType:", 0);
    objc_msgSend(v6, "setIsUsernameEditable:", 0);
    objc_msgSend(v6, "setPresentingViewController:", self->_presentingViewController);
    objc_msgSend(v6, "setServiceType:", 1);
    -[ACAccount username](self->_iCloudAccount, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsername:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke;
    v10[3] = &unk_24FCD5030;
    v10[4] = self;
    objc_msgSend(v9, "authenticateWithContext:completion:", v6, v10);

  }
}

void __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 1488);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke_2;
  v8[3] = &unk_24FCD4290;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __48__HDSSetupSession__runAuthKitTrustStartIfNeeded__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 584);
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v2)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v5 = v4;
        if (os_signpost_enabled(v3))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AuthKitTrust", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AuthKitTrust", (const char *)&unk_22F7B8AEE, v18, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 584) = 3;
    return objc_msgSend(*(id *)(a1 + 40), "_reportError:label:", *(_QWORD *)(a1 + 32), CFSTR("AuthKitTrustFailed"));
  }
  else
  {
    if (!v2)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AuthKitTrust", (const char *)&unk_22F7B8AEE, v17, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "AuthKitTrust", (const char *)&unk_22F7B8AEE, v16, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 584) = 4;
    return objc_msgSend(*(id *)(a1 + 40), "_run");
  }
}

- (int)_runAuthKitTrustFinish
{
  int result;
  int v5;

  result = self->_authKitTrustState;
  if (result != 2 && result != 4 && gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || (v5 = _LogCategory_Initialize(), result = self->_authKitTrustState, v5))
    {
      LogPrintF();
      return self->_authKitTrustState;
    }
  }
  return result;
}

- (int)_runLEDPassCodeAlignment
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  int result;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint8_t v11[16];
  uint8_t buf[16];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_lpcPlayAgain)
  {
    self->_lpcAlignmentState = 0;
    self->_lpcAligned = 0;
    self->_lpcPlayAgain = 0;
  }
  if (self->_lpcSkip)
  {
    self->_lpcAlignmentState = 2;
    self->_lpcSkip = 0;
    if (self->_apcSkip)
    {
      if (!self->_apcState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)v11 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AudioPasscode", (const char *)&unk_22F7B8AEE, v11, 2u);
        }
      }

      self->_apcState = 2;
    }
  }
  result = self->_lpcAlignmentState;
  if (!result)
  {
    result = 1;
    self->_lpcAlignmentState = 1;
  }
  if (self->_lpcAligned && result != 2 && result != 4)
  {
    self->_apcPlayAgain = 1;
    result = 4;
    self->_lpcAlignmentState = 4;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
    {
      progressHandler[2](self->_progressHandler, 60, 0);
      return self->_lpcAlignmentState;
    }
  }
  return result;
}

- (int)_runAudioPasscode
{
  int apcState;
  int v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  uint8_t v16[16];
  uint8_t buf[16];
  uint8_t v18[16];

  apcState = self->_apcState;
  while (2)
  {
    v4 = apcState;
    switch(apcState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_35;
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_apcState)
        {
LABEL_35:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v11 = v10;
            if (os_signpost_enabled(v9))
            {
              *(_WORD *)v18 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", (const char *)&unk_22F7B8AEE, v18, 2u);
            }
          }

        }
        v5 = 10;
        goto LABEL_40;
      case 2:
        -[HDSSetupSession _runAudioPasscodeLogMetrics](self, "_runAudioPasscodeLogMetrics");
        -[HDSSetupSession _runAudioPasscodeCleanup:](self, "_runAudioPasscodeCleanup:", 1);
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 4:
        -[HDSSetupSession _runAudioPasscodeCleanup:](self, "_runAudioPasscodeCleanup:", 1);
        self->_sfSessionSecured = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 10:
        self->_apcState = 11;
        -[HDSSetupSession _runAudioPasscodeInitRequest](self, "_runAudioPasscodeInitRequest");
        goto LABEL_41;
      case 11:
        if (self->_apcInitDone)
        {
          v5 = 12;
          goto LABEL_40;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_30;
        }
        goto LABEL_41;
      case 12:
        self->_apcState = 13;
        if (!self->_apcListening)
        {
          -[APCListener startListeningWithError:](self->_apcListener, "startListeningWithError:", 0);
          self->_apcListening = 1;
        }
        -[HDSSetupSession _runAudioPasscodeStartRequest](self, "_runAudioPasscodeStartRequest");
        goto LABEL_41;
      case 13:
        if (self->_apcStartDone)
        {
          v5 = 14;
          goto LABEL_40;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_30:
          LogPrintF();
        }
        goto LABEL_41;
      case 14:
        if (self->_apcSecured)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_END, v8, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

          v5 = 4;
LABEL_40:
          self->_apcState = v5;
          goto LABEL_41;
        }
        if (self->_apcPlayAgain)
        {
          self->_apcState = 12;
          self->_apcPlayAgain = 0;
          goto LABEL_41;
        }
        if (self->_apcSkip)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v14 = v13;
            if (os_signpost_enabled(v12))
            {
              *(_WORD *)v16 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", (const char *)&unk_22F7B8AEE, v16, 2u);
            }
          }

          v5 = 2;
          goto LABEL_40;
        }
LABEL_41:
        apcState = self->_apcState;
        if (apcState != v4)
          continue;
        return v4;
      default:
        goto LABEL_41;
    }
  }
}

- (void)_runAudioPasscodeInitRequest
{
  id v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  SFSession *sfSession;
  id v13;
  _QWORD v14[5];
  uint8_t buf[16];

  self->_apcInitDone = 0;
  self->_apcStartDone = 0;
  self->_apcStartTicks = mach_absolute_time();
  self->_pairSetupFlags = 2048;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F20, CFSTR("aa"));
  objc_msgSend((Class)getAPCListenerClass[0](), "capabilityData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("apcLC"));
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v13 = v3;
      LogPrintF();
    }
    sfSession = self->_sfSession;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__HDSSetupSession__runAudioPasscodeInitRequest__block_invoke;
    v14[3] = &unk_24FCD4618;
    v14[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_aa"), &unk_24FCE3D18, v3, v14, v13);
  }
  else
  {
    if (!self->_apcState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_apcState = 3;
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v11, CFSTR("APCInitRequest"));

  }
}

_BYTE *__47__HDSSetupSession__runAudioPasscodeInitRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_runAudioPasscodeInitResponse:error:", a4, a2);
  return result;
}

- (void)_runAudioPasscodeInitResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  void *v15;
  APCListener *v16;
  APCListener *apcListener;
  APCListener *v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  NSObject *v23;
  unint64_t v24;
  os_signpost_id_t v25;
  NSObject *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  unint64_t v29;
  os_signpost_id_t v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && !v7)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v32 = v6;
      LogPrintF();
    }
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[APCListener stopListening](self->_apcListener, "stopListening");
      self->_apcListening = 0;
      v16 = (APCListener *)objc_msgSend(objc_alloc((Class)getAPCListenerClass[0]()), "initWithConfigurationData:", v15);
      apcListener = self->_apcListener;
      self->_apcListener = v16;

      v18 = self->_apcListener;
      if (v18)
      {
        -[APCListener setDispatchQueue:](v18, "setDispatchQueue:", self->_dispatchQueue);
        v19 = MEMORY[0x24BDAC760];
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke;
        v34[3] = &unk_24FCD3FE8;
        v34[4] = self;
        -[APCListener setInvalidationHandler:](self->_apcListener, "setInvalidationHandler:", v34);
        v33[0] = v19;
        v33[1] = 3221225472;
        v33[2] = __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke_2;
        v33[3] = &unk_24FCD5310;
        v33[4] = self;
        -[APCListener setRetrievedDataHandler:](self->_apcListener, "setRetrievedDataHandler:", v33);
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_apcInitDone = 1;
        -[HDSSetupSession _run](self, "_run", v32);
        goto LABEL_41;
      }
      if (!self->_apcState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v23 = objc_claimAutoreleasedReturnValue();
      v29 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v23, OS_SIGNPOST_INTERVAL_END, v30, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }
    }
    else
    {
      if (!self->_apcState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v23, OS_SIGNPOST_INTERVAL_END, v25, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }
    }

    self->_apcState = 3;
    NSErrorWithOSStatusF();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v31, CFSTR("APCInitResponse"));

LABEL_41:
    goto LABEL_42;
  }
  if (!self->_apcState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_apcState = 3;
  -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v8, CFSTR("APCInitResponse"));
LABEL_42:

}

void __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 1488));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __55__HDSSetupSession__runAudioPasscodeInitResponse_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 1488));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v6 = v5;
    v7 = *(void **)(a1 + 32);
    if (v8 || !v6)
    {
      objc_msgSend(v7, "_logMetricsForSoftError:label:");
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_msgSend(v7, "_runAudioPasscodeHandleData:", v6);
    }

  }
}

- (void)_runAudioPasscodeStartRequest
{
  id v3;
  SFSession *sfSession;
  _QWORD v5[5];

  self->_apcPlaying = 1;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F38, CFSTR("aa"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__HDSSetupSession__runAudioPasscodeStartRequest__block_invoke;
  v5[3] = &unk_24FCD4618;
  v5[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_aa"), &unk_24FCE3D40, v3, v5);

}

_BYTE *__48__HDSSetupSession__runAudioPasscodeStartRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_runAudioPasscodeStartResponse:error:", a4, a2);
  return result;
}

- (void)_runAudioPasscodeStartResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  OS_dispatch_source *apcTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *v19;
  NSObject *v20;
  _QWORD handler[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    if (!self->_apcState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_END, v14, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_apcState = 3;
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v8, CFSTR("APCStartResponse"));
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    apcTimer = self->_apcTimer;
    if (apcTimer)
    {
      v16 = apcTimer;
      dispatch_source_cancel(v16);
      v17 = self->_apcTimer;
      self->_apcTimer = 0;

    }
    v18 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v19 = self->_apcTimer;
    self->_apcTimer = v18;

    v20 = self->_apcTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __56__HDSSetupSession__runAudioPasscodeStartResponse_error___block_invoke;
    handler[3] = &unk_24FCD3FE8;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);
    HDSDispatchTimerSet(self->_apcTimer, 10.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_apcTimer);
    self->_apcStartDone = 1;
    -[HDSSetupSession _run](self, "_run");
  }

}

uint64_t __56__HDSSetupSession__runAudioPasscodeStartResponse_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAudioPasscodeTimeout");
}

- (void)_runAudioPasscodeStopRequest
{
  id v3;
  SFSession *sfSession;
  id v5;
  _QWORD v6[5];

  self->_apcPlaying = 0;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F50, CFSTR("aa"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__HDSSetupSession__runAudioPasscodeStopRequest__block_invoke;
  v6[3] = &unk_24FCD4618;
  v6[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_aa"), &unk_24FCE3D68, v3, v6, v5);

}

void __47__HDSSetupSession__runAudioPasscodeStopRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24)
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_runAudioPasscodeHandleData:(id)a3
{
  id v4;
  APCListener *apcListener;
  int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  int v13;
  const __CFString *v14;
  SFSession *sfSession;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  apcListener = self->_apcListener;
  v20 = 0;
  v6 = -[APCListener getResultData:](apcListener, "getResultData:", &v20);
  v7 = v20;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "completionTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v17 = v9;
      LogPrintF();
    }
    -[HDSSetupSession _run](self, "_run", v17);

  }
  if (self->_apcPlaying)
  {
    if (self->_apcSecured)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
LABEL_14:
        LogPrintF();
      }
    }
    else
    {
      v10 = objc_msgSend(v4, "length");
      if ((unint64_t)(v10 - 9) > 0xFFFFFFFFFFFFFFF9)
      {
        v11 = v10;
        objc_msgSend(v4, "getBytes:length:", v21, v10);
        bzero((char *)v21 + v11, 8 - v11);
        v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%llu"), v21[0]);
        if (self->_apcTryingPasscode)
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            IsAppleInternalBuild();
            IsAppleInternalBuild();
            LogPrintF();
          }
        }
        else
        {
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v18 = v12;
            LogPrintF();
          }
          self->_apcTryingPasscode = 1;
          if (self->_apcStartedPairSetup)
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              v13 = IsAppleInternalBuild();
              v14 = CFSTR("*");
              if (v13)
                v14 = v12;
              v18 = v14;
              LogPrintF();
            }
            -[SFSession pairSetupTryPIN:](self->_sfSession, "pairSetupTryPIN:", v12, v18);
          }
          else
          {
            if (gLogCategory_HDSSetupSession <= 30
              && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            objc_storeStrong((id *)&self->_apcPasscode, v12);
            self->_apcStartedPairSetup = 1;
            sfSession = self->_sfSession;
            v16 = self->_pairSetupFlags | 0x80008;
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __47__HDSSetupSession__runAudioPasscodeHandleData___block_invoke;
            v19[3] = &unk_24FCD4138;
            v19[4] = self;
            -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", v16, v19);
          }
        }

      }
      else if (gLogCategory_HDSSetupSession <= 60
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_14;
      }
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_14;
  }

}

void __47__HDSSetupSession__runAudioPasscodeHandleData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 24))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 404))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AudioPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)v13 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "AudioPasscode", (const char *)&unk_22F7B8AEE, v13, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 404) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("ACPPairSetup"));
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 392);
      *(_QWORD *)(v11 + 392) = 0;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 436) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 402) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_runAudioPasscodeLogMetrics");
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }

}

- (void)_runAudioPasscodeTimeout
{
  OS_dispatch_source *apcTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void (**promptForPINHandler)(id, uint64_t, uint64_t);

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ++self->_apcTimeoutCount;
  apcTimer = self->_apcTimer;
  if (apcTimer)
  {
    v4 = apcTimer;
    dispatch_source_cancel(v4);
    v5 = self->_apcTimer;
    self->_apcTimer = 0;

  }
  if (!self->_invalidateCalled)
  {
    -[HDSSetupSession _runAudioPasscodeStopRequest](self, "_runAudioPasscodeStopRequest");
    promptForPINHandler = (void (**)(id, uint64_t, uint64_t))self->_promptForPINHandler;
    if (promptForPINHandler)
      promptForPINHandler[2](promptForPINHandler, 2048, 0xFFFFFFFFLL);
  }
}

- (void)_runAudioPasscodeCleanup:(BOOL)a3
{
  _BOOL4 v3;
  APCListener *apcListener;
  APCListener *v6;
  NSString *apcPasscode;
  OS_dispatch_source *apcTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  AVAudioSession *audioSession;
  void *v12;
  BOOL v13;
  id v14;
  AVAudioSession *v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;

  v3 = a3;
  -[HDSSetupSession _runAudioPasscodeLogMetrics](self, "_runAudioPasscodeLogMetrics");
  if (v3 && self->_apcPlaying)
    -[HDSSetupSession _runAudioPasscodeStopRequest](self, "_runAudioPasscodeStopRequest");
  self->_apcInitDone = 0;
  apcListener = self->_apcListener;
  -[APCListener stopListening](apcListener, "stopListening");
  self->_apcListening = 0;
  v6 = self->_apcListener;
  self->_apcListener = 0;

  apcPasscode = self->_apcPasscode;
  self->_apcPasscode = 0;

  *(_WORD *)&self->_apcStartDone = 0;
  apcTimer = self->_apcTimer;
  if (apcTimer)
  {
    v9 = apcTimer;
    dispatch_source_cancel(v9);
    v10 = self->_apcTimer;
    self->_apcTimer = 0;

  }
  self->_apcTryingPasscode = 0;
  if (apcListener)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    audioSession = self->_audioSession;
    getAVAudioSessionCategoryAmbient[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v13 = -[AVAudioSession setCategory:error:](audioSession, "setCategory:error:", v12, &v21);
    v14 = v21;

    if (!v13)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v14, CFSTR("SecureConnection-AudioPasscode"), v14);
      }
      else
      {
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v14, CFSTR("SecureConnection-AudioPasscode"), v19);
      }
    }
    v15 = self->_audioSession;
    getAVAudioSessionModeDefault[0]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    v17 = -[AVAudioSession setMode:error:](v15, "setMode:error:", v16, &v20);
    v18 = v20;

    if (!v17)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v18, CFSTR("SecureConnection-AudioPasscode"), v18);
      }
      else
      {
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v18, CFSTR("SecureConnection-AudioPasscode"), v19);
      }
    }

  }
}

- (void)_runAudioPasscodeLogMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_apcMetricsLogged)
  {
    if (self->_apcStartTicks)
    {
      mach_absolute_time();
      v3 = UpTicksToMilliseconds();
      v9[0] = CFSTR("secured");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apcSecured);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v4;
      v9[1] = CFSTR("skipped");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apcSkip);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v5;
      v9[2] = CFSTR("timeouts");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_apcTimeoutCount);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2] = v6;
      v9[3] = CFSTR("totalMs");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[3] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HDSMetricsLog(CFSTR("com.apple.sharing.HomePodAudioPasscode"), v8);

      self->_apcMetricsLogged = 1;
    }
  }
}

- (int)_runSiriPasscode
{
  int siriPasscodeState;
  int v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  siriPasscodeState = self->_siriPasscodeState;
  do
  {
    v4 = siriPasscodeState;
    switch(siriPasscodeState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_24;
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_siriPasscodeState)
        {
LABEL_24:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v11 = v10;
            if (os_signpost_enabled(v9))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SiriPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        self->_siriPasscodeState = 10;
        break;
      case 4:
        self->_sfSessionSecured = 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_21;
        }
        break;
      case 10:
        self->_siriPasscodeState = 11;
        -[HDSSetupSession _runSiriPasscodeInitRequest](self, "_runSiriPasscodeInitRequest");
        break;
      case 11:
        if (self->_siriPasscodeInitDone)
        {
          v5 = 12;
          goto LABEL_18;
        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
LABEL_21:
          LogPrintF();
        }
        break;
      case 12:
        self->_siriPasscodeState = 13;
        -[HDSSetupSession _runSiriPasscodeStartPairSetup](self, "_runSiriPasscodeStartPairSetup");
        break;
      case 13:
        if (self->_siriPasscodeSecured)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v8 = v7;
            if (os_signpost_enabled(v6))
            {
              *(_WORD *)v13 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_END, v8, "SiriPasscode", (const char *)&unk_22F7B8AEE, v13, 2u);
            }
          }

          v5 = 4;
LABEL_18:
          self->_siriPasscodeState = v5;
        }
        break;
      default:
        break;
    }
    siriPasscodeState = self->_siriPasscodeState;
  }
  while (siriPasscodeState != v4);
  return v4;
}

- (void)_runSiriPasscodeInitRequest
{
  id v3;
  SFSession *sfSession;
  _QWORD v5[5];

  self->_siriPasscodeInitDone = 0;
  self->_pairSetupFlags = 1024;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F68, CFSTR("aa"));
  if (self->_forcedCLIPasscode)
    -[HDSSetupSession forcePassCode:](self, "forcePassCode:");
  if (IsAppleInternalBuild() && -[NSString length](self->_forcedPasscode, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_forcedPasscode, CFSTR("saFixedPIN"));
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__HDSSetupSession__runSiriPasscodeInitRequest__block_invoke;
  v5[3] = &unk_24FCD4618;
  v5[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_aa"), &unk_24FCE3D90, v3, v5);

}

_BYTE *__46__HDSSetupSession__runSiriPasscodeInitRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_runSiriPasscodeInitResponse:error:", a4, a2);
  return result;
}

- (void)_runSiriPasscodeInitResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    if (!self->_siriPasscodeState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SiriPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_END, v14, "SiriPasscode", (const char *)&unk_22F7B8AEE, v15, 2u);
      }
    }

    self->_siriPasscodeState = 3;
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v8, CFSTR("SiriPasscodeInitResponse"));
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_siriPasscodeInitDone = 1;
    -[HDSSetupSession _run](self, "_run");
  }

}

- (void)_runSiriPasscodeStartPairSetup
{
  SFSession *sfSession;
  uint64_t v3;
  _QWORD v4[5];

  sfSession = self->_sfSession;
  v3 = self->_pairSetupFlags | 0x80008;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSSetupSession__runSiriPasscodeStartPairSetup__block_invoke;
  v4[3] = &unk_24FCD4138;
  v4[4] = self;
  -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", v3, v4);
}

void __49__HDSSetupSession__runSiriPasscodeStartPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 24))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 452))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriPasscode", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)v13 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SiriPasscode", (const char *)&unk_22F7B8AEE, v13, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 452) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("SiriPasscodePairSetup"));
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 448) = 1;
      v11 = *(_QWORD **)(a1 + 32);
      v12 = v11[197];
      if (v12)
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(v12 + 16))(v11[197], 70, 0);
        v11 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v11, "_run");
    }
  }

}

- (int)_runPairSetup
{
  int pairSetupState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  SFSession *sfSession;
  _QWORD v11[6];
  uint8_t buf[16];

  pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4 && pairSetupState != 2)
  {
    if (pairSetupState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PairSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      *(_QWORD *)&self->_pairSetupFlags = 0x100000000;
      v8 = mach_absolute_time();
      sfSession = self->_sfSession;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __32__HDSSetupSession__runPairSetup__block_invoke;
      v11[3] = &unk_24FCD4AB0;
      v11[4] = self;
      v11[5] = v8;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", 524296, v11);
    }
  }
  return self->_pairSetupState;
}

void __32__HDSSetupSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint8_t v20[16];
  uint8_t buf[16];
  uint8_t v22[16];
  uint8_t v23[16];

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) = v4;
    v5 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      if (!*(_DWORD *)(v5 + 476))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PairSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PairSetup", (const char *)&unk_22F7B8AEE, v20, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 476) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("PairSetup"));
    }
    else
    {
      *(_BYTE *)(v5 + 280) = 1;
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 476))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v14 = v13;
          if (os_signpost_enabled(v12))
          {
            *(_WORD *)v23 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PairSetup", (const char *)&unk_22F7B8AEE, v23, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PairSetup", (const char *)&unk_22F7B8AEE, v22, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 476) = 4;
      v18 = *(_QWORD **)(a1 + 32);
      v19 = v18[197];
      if (v19)
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(v19 + 16))(v18[197], 70, 0);
        v18 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v18, "_run");
    }
  }

}

- (int)_runBasicConfig
{
  int basicConfigState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint8_t v14[16];
  uint8_t buf[16];

  basicConfigState = self->_basicConfigState;
  if (basicConfigState != 4 && basicConfigState != 2)
  {
    if (basicConfigState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 80, 0);
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UserWaitTime", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      if (!self->_basicConfigState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            *(_WORD *)v14 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "BasicConfig", (const char *)&unk_22F7B8AEE, v14, 2u);
          }
        }

      }
      self->_basicConfigState = 1;
      v12 = mach_absolute_time();
      self->_userWaitStartTicks = v12;
      self->_configureStartTicks = v12;
      self->_basicConfigStartTicks = v12;
      -[HDSSetupSession _runBasicConfigSendRequest](self, "_runBasicConfigSendRequest");
    }
  }
  return self->_basicConfigState;
}

- (void)_runBasicConfigSendRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  NSString *selectedSiriLanguageCode;
  NSString *v40;
  int v41;
  int siriDataSharing;
  uint64_t v43;
  void *v44;
  void *v45;
  NSString *v46;
  AFVoiceInfo *selectedSiriVoice;
  AFVoiceInfo *v48;
  NSString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL8 v63;
  void *v64;
  const char *v65;
  SFSession *sfSession;
  const char *v67;
  _QWORD v68[5];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3F80, CFSTR("op"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", softLink_AXSVoiceOverTouchEnabled[0]());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("voe"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  softLink_AXSVoiceOverTouchSpeakingRate[0]();
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("vosr"));

  objc_msgSend((Class)getAXSettingsClass_0[0](), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "touchAccommodationsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("taE"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "touchAccommodationsHoldDurationEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("taHE"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "touchAccommodationsHoldDuration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("taHD"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "touchAccommodationsIgnoreRepeatEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("taIRE"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "touchAccommodationsIgnoreRepeatDuration");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("taIRD"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "touchAccommodationsTapActivationMethod"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("taTAM"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "touchAccommodationsTapActivationTimeout");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("taTAT"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "voiceOverDoubleTapInterval");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("vodti"));

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63918]) == 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("eca"));

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638E0]) == 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("dsub"));

  if (self->_liveOn)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("liveOn"));

  }
  if (self->_appleStoreMode)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("appleStore"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_locationEnabled);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("lsEn"));

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("lang"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("locale"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", *MEMORY[0x24BDBCB48]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("tempUnit"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_stereoPairRole)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("msRo"));

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "effectiveBoolValueForSetting:", CFSTR("newsAllowed")) == 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("newsAllowed"));

  if (!self->_siriLanguagePicked)
  {
    v40 = 0;
LABEL_35:
    v41 = 1;
    goto LABEL_43;
  }
  selectedSiriLanguageCode = self->_selectedSiriLanguageCode;
  if (selectedSiriLanguageCode)
  {
    v40 = selectedSiriLanguageCode;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v67 = (const char *)v40;
      LogPrintF();
    }
    goto LABEL_35;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("siriD"));
  v40 = 0;
  v41 = 2;
LABEL_43:
  self->_siriSettingState = v41;
  siriDataSharing = self->_siriDataSharing;
  if (siriDataSharing == 6)
  {
    v43 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    if (siriDataSharing != 5)
      goto LABEL_48;
    v43 = MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("siriDS"), v67);
LABEL_48:
  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v40)
  {
    v46 = v40;

LABEL_51:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("siriLL"), v67);
    goto LABEL_52;
  }
  objc_msgSend(v44, "languageCode");
  v46 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

  if (v46)
    goto LABEL_51;
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v46 = 0;
LABEL_52:
  selectedSiriVoice = self->_selectedSiriVoice;
  if (selectedSiriVoice)
  {
    v48 = selectedSiriVoice;
    if (v40)
    {
LABEL_54:
      v49 = v40;

LABEL_57:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("siriVL"), v67);
      goto LABEL_58;
    }
  }
  else
  {
    objc_msgSend(v45, "outputVoice");
    v48 = (AFVoiceInfo *)(id)objc_claimAutoreleasedReturnValue();

    if (v40)
      goto LABEL_54;
  }
  -[AFVoiceInfo languageCode](v48, "languageCode", v67);
  v49 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

  if (v49)
    goto LABEL_57;
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v49 = 0;
LABEL_58:
  v50 = -[AFVoiceInfo gender](v48, "gender");
  if (v50)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("siriVG"));

  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[AFVoiceInfo name](v48, "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("siriVN"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("time"));

  v54 = (const __CFString *)*MEMORY[0x24BDBD568];
  if (CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce12HourTime"), (CFStringRef)*MEMORY[0x24BDBD568], 0))
  {
    v55 = 12;
  }
  else if (CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce24HourTime"), v54, 0))
  {
    v55 = 24;
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("timeCycle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", softLinkTMIsAutomaticTimeEnabled[0]() != 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("timeAuto"));

  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "name");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("tz"));
  }
  else if (gLogCategory_HDSSetupSession <= 60
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", softLinkTMIsAutomaticTimeZoneEnabled[0]() != 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("tzAuto"));

  v61 = (void *)WiFiCopyCurrentNetworkInfoEx();
  if (v61 && (int)CFDictionaryGetInt64Ranged() >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("wifiCh"));

  }
  v63 = -[HDSSetupSession isJSEnabled](self, "isJSEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("user_js_enabled"));

  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      v65 = "no";
      if (v63)
        v65 = "yes";
      v67 = v65;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v67 = (const char *)v3;
      LogPrintF();
    }
  }
  sfSession = self->_sfSession;
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __45__HDSSetupSession__runBasicConfigSendRequest__block_invoke;
  v68[3] = &unk_24FCD5338;
  v68[4] = self;
  -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v3, v68, v67);

}

uint64_t __45__HDSSetupSession__runBasicConfigSendRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runBasicConfigReceiveResponse:error:", a4, a3);
}

- (void)_runBasicConfigReceiveResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  int Int64Ranged;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  double basicConfigSecs;
  void (**progressHandler)(id, uint64_t, _QWORD);
  double v30;
  uint8_t buf[8];
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
    goto LABEL_38;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD1100];
    v17 = Int64Ranged;
    v32 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("?");
    if (v18)
      v20 = (const __CFString *)v18;
    v33[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v21);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_38:
      if (!self->_basicConfigState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v10 = v9;
          if (os_signpost_enabled(v8))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_basicConfigState = 3;
      -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("BasicConfig"));

      goto LABEL_34;
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v30 = *(double *)&v6;
    LogPrintF();
  }
  if (!self->_basicConfigState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v24 = v23;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_END, v27, "BasicConfig", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_basicConfigState = 4;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_basicConfigSecs = basicConfigSecs;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_31;
      basicConfigSecs = self->_basicConfigSecs;
    }
    v30 = basicConfigSecs;
    LogPrintF();
  }
LABEL_31:
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 90, 0);
  -[HDSSetupSession _run](self, "_run", *(_QWORD *)&v30);
LABEL_34:

}

- (int)_runAppleMusic
{
  int preflightAppleMusicState;
  int appleMusicState;
  void *v6;
  void *v7;
  char v8;
  int v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  unint64_t v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  unint64_t v23;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  NSObject *v34;
  unint64_t v35;
  os_signpost_id_t v36;
  unint64_t v37;
  uint8_t buf[16];

  preflightAppleMusicState = self->_preflightAppleMusicState;
  if (preflightAppleMusicState != 4 && preflightAppleMusicState != 2)
  {
    if (preflightAppleMusicState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return self->_preflightAppleMusicState;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    appleMusicState = self->_appleMusicState;
    if (appleMusicState == 2)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v18 = v17;
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v13 = objc_claimAutoreleasedReturnValue();
      v19 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_64;
      v15 = v19;
      if (!os_signpost_enabled(v13))
        goto LABEL_64;
      *(_WORD *)buf = 0;
      goto LABEL_63;
    }
    if (appleMusicState == 6)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_64;
      v15 = v14;
      if (!os_signpost_enabled(v13))
        goto LABEL_64;
      *(_WORD *)buf = 0;
LABEL_63:
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
LABEL_64:

      v9 = 2;
      self->_preflightAppleMusicState = 2;
      return v9;
    }
    if (!self->_deviceGUID || !self->_deviceSerialNumber)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v13 = objc_claimAutoreleasedReturnValue();
      v23 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_64;
      v15 = v23;
      if (!os_signpost_enabled(v13))
        goto LABEL_64;
      *(_WORD *)buf = 0;
      goto LABEL_63;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Music"), 0, 0);
    objc_msgSend(v6, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInstalled");

    if ((v8 & 1) != 0)
    {
      if (self->_promptForAppleMusicHandler)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_preflightAppleMusicState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v33 = v32;
            if (os_signpost_enabled(v31))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        self->_preflightAppleMusicState = 1;
        (*((void (**)(void))self->_promptForAppleMusicHandler + 2))();

        return self->_preflightAppleMusicState;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v36 = v35;
          if (os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v28 = objc_claimAutoreleasedReturnValue();
      v37 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v37 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v30 = v37, !os_signpost_enabled(v28)))
      {
LABEL_95:

        v9 = 2;
        self->_preflightAppleMusicState = 2;

        return v9;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_preflightAppleMusicState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_95;
      v30 = v29;
      if (!os_signpost_enabled(v28))
        goto LABEL_95;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_END, v30, "AppleMusic", (const char *)&unk_22F7B8AEE, buf, 2u);
    goto LABEL_95;
  }
  return self->_preflightAppleMusicState;
}

- (int)_runTRSessionStart
{
  int trSessionState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  TROperationQueue *v8;
  TROperationQueue *trOperationQueue;
  NSMutableArray *v10;
  NSMutableArray *trOperations;
  TRSession *v12;
  TRSession *trSession;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  NSObject *v21;
  unint64_t v22;
  os_signpost_id_t v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint8_t buf[8];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  trSessionState = self->_trSessionState;
  if (trSessionState == 4 || trSessionState == 2)
    return self->_trSessionState;
  if (!trSessionState)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_14;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_trSessionState)
    {
LABEL_14:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_trSessionState = 1;
    v8 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_0[0]());
    trOperationQueue = self->_trOperationQueue;
    self->_trOperationQueue = v8;

    if (self->_trOperationQueue)
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      trOperations = self->_trOperations;
      self->_trOperations = v10;

      -[SFSession trSession](self->_sfSession, "trSession");
      v12 = (TRSession *)objc_claimAutoreleasedReturnValue();
      trSession = self->_trSession;
      self->_trSession = v12;

      if (self->_trSession)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (!self->_trSessionState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "TRSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "TRSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        self->_trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_HDSSetupSession > 90
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_45;
      }
    }
    else if (gLogCategory_HDSSetupSession > 90
           || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_45;
    }
    LogPrintF();
LABEL_45:
    if (!self->_trSessionState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v23 = v22;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "TRSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v24, OS_SIGNPOST_INTERVAL_END, v26, "TRSessionStart", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_trSessionState = 3;
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD1100];
    v35 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = CFSTR("?");
    if (v29)
      v31 = (const __CFString *)v29;
    v36[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, -6700, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v33, CFSTR("TRSessionStart"));

    return self->_trSessionState;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runWiFiSetup
{
  int wifiSetupState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationWiFiSetup *v8;
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  _QWORD v17[5];
  uint8_t buf[16];

  wifiSetupState = self->_wifiSetupState;
  if (wifiSetupState == 4)
  {
    if (self->_prefPrototypeForceUpdate)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFSession sendRequestID:options:request:responseHandler:](self->_sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_hds_fu"), 0, MEMORY[0x24BDBD1B8], &__block_literal_global_1126);
      if (!self->_wifiSetupState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v15 = v14;
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_wifiSetupState = 3;
    }
  }
  else if (wifiSetupState)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_15;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_wifiSetupState)
    {
LABEL_15:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_wifiSetupState = 1;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 200, 0);
    -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
    v8 = (SFDeviceOperationWiFiSetup *)objc_alloc_init(MEMORY[0x24BE90158]);
    wifiSetupOperation = self->_wifiSetupOperation;
    self->_wifiSetupOperation = v8;

    -[SFDeviceOperationWiFiSetup setDispatchQueue:](self->_wifiSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceOperationWiFiSetup setSfSession:](self->_wifiSetupOperation, "setSfSession:", self->_sfSession);
    -[SFDeviceOperationWiFiSetup setSkipReachability:](self->_wifiSetupOperation, "setSkipReachability:", self->_peerSupportsCaptiveNetworks);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __32__HDSSetupSession__runWiFiSetup__block_invoke;
    v17[3] = &unk_24FCD4138;
    v17[4] = self;
    -[SFDeviceOperationWiFiSetup setCompletionHandler:](self->_wifiSetupOperation, "setCompletionHandler:", v17);
    -[SFDeviceOperationWiFiSetup activate](self->_wifiSetupOperation, "activate");
  }
  return self->_wifiSetupState;
}

void __32__HDSSetupSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  id *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  uint64_t v26;
  os_signpost_id_t v27;
  void *v28;
  id *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  os_signpost_id_t v33;
  NSObject *v34;
  uint64_t v35;
  os_signpost_id_t v36;
  id *v37;
  void *v38;
  dispatch_time_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 640);
  if (v5)
  {
    if (v3)
    {
      ++*(_QWORD *)(v4 + 656);
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v42 = v3;
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648) - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
        LogPrintF();
      }
      v8 = objc_msgSend(v3, "code", v42, v43);
      v9 = *(_QWORD *)(a1 + 32);
      if (v8 == -71159)
      {
        if (!*(_DWORD *)(v9 + 680))
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
          if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v12 = v11;
            if (os_signpost_enabled(v10))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 680) = 3;
        v16 = *(id **)(a1 + 32);
        objc_msgSend(v16[80], "wiFiRetryMetrics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_logWiFiRetryMetrics:", v17);

        v18 = *(void **)(a1 + 32);
        v19 = CFSTR("WiFiSetupTimeOut");
        goto LABEL_20;
      }
      if (*(_QWORD *)(v9 + 656) >= *(_QWORD *)(v9 + 648))
      {
        if (!*(_DWORD *)(v9 + 680))
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
          if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v24 = v23;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_END, v27, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 680) = 3;
        if (objc_msgSend(v3, "code") == 301009)
        {
          v18 = *(void **)(a1 + 32);
          v19 = CFSTR("WiFiSetup");
LABEL_20:
          objc_msgSend(v18, "_reportError:label:", v3, v19);
          goto LABEL_52;
        }
        if (objc_msgSend(v3, "code") != -71157)
          objc_msgSend(v3, "code");
        NSErrorNestedF();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(id **)(a1 + 32);
        objc_msgSend(v29[80], "wiFiRetryMetrics");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_logWiFiRetryMetrics:", v30);

        objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v28, CFSTR("WiFiSetup"));
      }
      else
      {
        *(_DWORD *)(v9 + 680) = 0;
        v20 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v20 + 1363))
        {
          objc_msgSend(*(id *)(v20 + 640), "wiFiRetryMetrics");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v20, "_logWiFiRetryMetrics:", v21);

        }
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v39 = dispatch_time(0, 1000000000 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664));
        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(NSObject **)(v40 + 1488);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __32__HDSSetupSession__runWiFiSetup__block_invoke_2;
        block[3] = &unk_24FCD3FE8;
        block[4] = v40;
        dispatch_after(v39, v41, block);
      }
    }
    else
    {
      objc_msgSend(v5, "metricTotalSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 688) = v6;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "metricWiFiSetupSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 696) = v7;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 680))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v33 = v32;
          if (os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v36 = v35;
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v34, OS_SIGNPOST_INTERVAL_END, v36, "WiFiSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 680) = 4;
      v37 = *(id **)(a1 + 32);
      objc_msgSend(v37[80], "wiFiRetryMetrics");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_logWiFiRetryMetrics:", v38);

      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
LABEL_52:

}

uint64_t __32__HDSSetupSession__runWiFiSetup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __32__HDSSetupSession__runWiFiSetup__block_invoke_1125(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (int)_runBonjourTest
{
  int bonjourTestState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  HDSBonjourTest *v7;
  HDSBonjourTest *bonjourTestOperation;
  _QWORD v10[5];
  id v11;
  id buf[2];

  bonjourTestState = self->_bonjourTestState;
  if (bonjourTestState != 4)
  {
    if (bonjourTestState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_11;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_bonjourTestState)
      {
LABEL_11:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "BonjourTest", (const char *)&unk_22F7B8AEE, (uint8_t *)buf, 2u);
          }
        }

      }
      self->_bonjourTestState = 1;
      objc_initWeak(buf, self);
      -[HDSBonjourTest invalidate](self->_bonjourTestOperation, "invalidate");
      v7 = objc_alloc_init(HDSBonjourTest);
      bonjourTestOperation = self->_bonjourTestOperation;
      self->_bonjourTestOperation = v7;

      -[HDSBonjourTest setDispatchQueue:](self->_bonjourTestOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[HDSBonjourTest setSfSession:](self->_bonjourTestOperation, "setSfSession:", self->_sfSession);
      -[HDSBonjourTest setTimeout:](self->_bonjourTestOperation, "setTimeout:", 16.0);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __34__HDSSetupSession__runBonjourTest__block_invoke;
      v10[3] = &unk_24FCD53A0;
      objc_copyWeak(&v11, buf);
      v10[4] = self;
      -[HDSBonjourTest setCompletionHandler:](self->_bonjourTestOperation, "setCompletionHandler:", v10);
      -[HDSBonjourTest activate](self->_bonjourTestOperation, "activate");
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
  return self->_bonjourTestState;
}

void __34__HDSSetupSession__runBonjourTest__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 672);
    if (v4)
    {
      if (!*(_BYTE *)(v3 + 24))
      {
        objc_msgSend(v4, "metricTotalSeconds");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = v5;
        v6 = *(_QWORD *)(a1 + 32);
        if (!*(_DWORD *)(v6 + 1436))
        {
          v7 = objc_msgSend(*(id *)(v6 + 672), "bonjourTestState");
          v6 = *(_QWORD *)(a1 + 32);
          if (v7)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v8 = objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
            if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v10 = v9;
              if (os_signpost_enabled(v8))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BonjourTest", (const char *)&unk_22F7B8AEE, buf, 2u);
              }
            }

            v6 = *(_QWORD *)(a1 + 32);
          }
        }
        if (objc_msgSend(*(id *)(v6 + 672), "bonjourTestState") == 2
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState") == 3
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState") == 4
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState") == 5
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState") == 6
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState") == 7)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
          if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v13 = v12;
            if (os_signpost_enabled(v11))
            {
              *(_WORD *)v14 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "BonjourTest", (const char *)&unk_22F7B8AEE, v14, 2u);
            }
          }

        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1436) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "bonjourTestState");
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }

}

- (void)captiveConfirmed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDSSetupSession_captiveConfirmed__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__HDSSetupSession_captiveConfirmed__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1576);
  if (v2)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 200, 0);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 744) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "showWebSheet");
}

- (int)_runCaptiveJoin
{
  int captiveJoinState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  SFDeviceOperationCNJSetup *v14;
  SFDeviceOperationCNJSetup *captiveJoin;
  _QWORD v17[5];
  uint8_t buf[16];

  captiveJoinState = self->_captiveJoinState;
  if (captiveJoinState != 4 && captiveJoinState != 2)
  {
    if (captiveJoinState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_peerSupportsCaptiveNetworks)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_captiveJoinState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Reachability", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_captiveJoinState = 1;
      -[SFDeviceOperationCNJSetup invalidate](self->_captiveJoin, "invalidate");
      v14 = (SFDeviceOperationCNJSetup *)objc_alloc_init(MEMORY[0x24BE90138]);
      captiveJoin = self->_captiveJoin;
      self->_captiveJoin = v14;

      -[SFDeviceOperationCNJSetup setDispatchQueue:](self->_captiveJoin, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationCNJSetup setSfSession:](self->_captiveJoin, "setSfSession:", self->_sfSession);
      -[SFDeviceOperationCNJSetup setIsSetup:](self->_captiveJoin, "setIsSetup:", 1);
      -[SFDeviceOperationCNJSetup setPresentingViewController:](self->_captiveJoin, "setPresentingViewController:", self->_presentingViewController);
      -[SFDeviceOperationCNJSetup setPromptForConfirmationHandler:](self->_captiveJoin, "setPromptForConfirmationHandler:", self->_promptForCaptiveNetworkHandler);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __34__HDSSetupSession__runCaptiveJoin__block_invoke;
      v17[3] = &unk_24FCD4138;
      v17[4] = self;
      -[SFDeviceOperationCNJSetup setCompletionHandler:](self->_captiveJoin, "setCompletionHandler:", v17);
      -[SFDeviceOperationCNJSetup activate](self->_captiveJoin, "activate");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Reachability", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "Reachability", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_captiveJoinState = 2;
    }
  }
  return self->_captiveJoinState;
}

void __34__HDSSetupSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 1488);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__HDSSetupSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __34__HDSSetupSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  uint64_t v22;
  os_signpost_id_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (*(_BYTE *)(v2 + 712))
    {
      if (!*(_DWORD *)(v2 + 728))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
        if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Reachability", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)v32 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_END, v9, "Reachability", (const char *)&unk_22F7B8AEE, v32, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 728) = 3;
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorNestedF();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_reportError:label:", v17, CFSTR("CaptiveNetwork"));
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 720), "reachabilityError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 728))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
        if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v20 = v19;
          if (os_signpost_enabled(v18))
          {
            *(_WORD *)v31 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "Reachability", (const char *)&unk_22F7B8AEE, v31, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v23 = v22;
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)v30 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v21, OS_SIGNPOST_INTERVAL_END, v23, "Reachability", (const char *)&unk_22F7B8AEE, v30, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 728) = 3;
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorNestedF();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_reportError:label:", v26, CFSTR("Reachability"));

    }
  }
  else
  {
    if (!*(_DWORD *)(v2 + 728))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)v29 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Reachability", (const char *)&unk_22F7B8AEE, v29, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v28 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "Reachability", (const char *)&unk_22F7B8AEE, v28, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 728) = 4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 720), "metricTotalSeconds");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 736) = v16;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 736);
      LogPrintF();
    }
    v24 = *(_QWORD **)(a1 + 40);
    v25 = v24[197];
    if (v25)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v25 + 16))(v24[197], 200, 0);
      v24 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v24, "_run", v27);
  }
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4 && trSetupConfigurationState != 2)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_14;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_trSetupConfigurationState)
      {
LABEL_14:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRSetupConfiguration", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_trSetupConfigurationState = 1;
      self->_trSetupConfigurationStartTicks = mach_absolute_time();
      v8 = (void *)objc_msgSend(objc_alloc((Class)getTRSetupConfigurationOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v8);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __43__HDSSetupSession__runTRSetupConfiguration__block_invoke;
      v11[3] = &unk_24FCD4290;
      v11[4] = self;
      v12 = v8;
      v9 = v8;
      objc_msgSend(v9, "setCompletionBlock:", v11);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v9);

    }
  }
  return self->_trSetupConfigurationState;
}

void __43__HDSSetupSession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 1488);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__HDSSetupSession__runTRSetupConfiguration__block_invoke_2;
  v4[3] = &unk_24FCD4290;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __43__HDSSetupSession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  os_signpost_id_t v21;
  NSObject *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  void *v25;
  uint8_t v26[16];
  uint8_t buf[16];
  uint8_t v28[16];
  uint8_t v29[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 752))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 792) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      getTRSetupConfigurationOperationNeedsNetworkKey[0]();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 800) = CFDictionaryGetInt64() != 0;
      getTRSetupConfigurationOperationUnauthenticatedServicesKey[0]();
      CFSetGetTypeID();
      CFDictionaryGetTypedValue();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 808);
      *(_QWORD *)(v5 + 808) = v4;

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "debugDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v15 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v15 + 464) == 4)
      {
        v16 = (void *)objc_msgSend(*(id *)(v15 + 808), "mutableCopy");
        objc_msgSend(v16, "removeObject:", &unk_24FCE3F98);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 808);
        *(_QWORD *)(v17 + 808) = v16;

      }
      getTRSetupConfigurationOperationUseAIDAKey[0]();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 816) = CFDictionaryGetInt64() != 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 776))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v21 = v20;
          if (os_signpost_enabled(v19))
          {
            *(_WORD *)v29 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "TRSetupConfiguration", (const char *)&unk_22F7B8AEE, v29, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v24 = v23;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)v28 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_END, v24, "TRSetupConfiguration", (const char *)&unk_22F7B8AEE, v28, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 776) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 776))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v9 = v8;
          if (os_signpost_enabled(v7))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TRSetupConfiguration", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)v26 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "TRSetupConfiguration", (const char *)&unk_22F7B8AEE, v26, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 776) = 3;
      v13 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_reportError:label:", v14, CFSTR("TRSetupConfig"));

    }
  }
}

- (int)_runBackgroundActivation
{
  int bgActivationState;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  HDSDeviceActivationOperation *v9;
  HDSDeviceActivationOperation *v10;
  _QWORD v12[5];
  HDSDeviceActivationOperation *v13;
  SEL v14;
  uint8_t buf[16];

  bgActivationState = self->_bgActivationState;
  if (bgActivationState != 4 && bgActivationState != 2)
  {
    if (bgActivationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 40)
        goto LABEL_14;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_bgActivationState)
      {
LABEL_14:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DeviceActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_bgActivationState = 1;
      v9 = objc_alloc_init(HDSDeviceActivationOperation);
      -[HDSDeviceActivationOperation setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      -[HDSDeviceActivationOperation setSfSession:](v9, "setSfSession:", self->_sfSession);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __43__HDSSetupSession__runBackgroundActivation__block_invoke;
      v12[3] = &unk_24FCD53F0;
      v12[4] = self;
      v13 = v9;
      v14 = a2;
      v10 = v9;
      -[HDSDeviceActivationOperation setCompletionHandler:](v10, "setCompletionHandler:", v12);
      -[HDSDeviceActivationOperation activate](v10, "activate");

    }
  }
  return self->_bgActivationState;
}

void __43__HDSSetupSession__runBackgroundActivation__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __43__HDSSetupSession__runBackgroundActivation__block_invoke_2;
  block[3] = &unk_24FCD53C8;
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(v6 + 1488);
  block[1] = 3221225472;
  v13 = v5;
  v14 = v6;
  v16 = a3;
  v9 = v7;
  v10 = a1[6];
  v15 = v9;
  v17 = v10;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __43__HDSSetupSession__runBackgroundActivation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __CFString *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  if (gLogCategory_HDSSetupSession <= 40
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (%@)"), *(_QWORD *)(a1 + 32));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    else
    {
      v20 = &stru_24FCD5B38;
      LogPrintF();
    }
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v2, CFSTR("BackgroundActivation"));
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
    case 2:
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 876))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
        if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v5 = v4;
          if (os_signpost_enabled(v3))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DeviceActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v8 = v7;
        if (os_signpost_enabled(v6))
        {
          *(_WORD *)v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_END, v8, "DeviceActivation", (const char *)&unk_22F7B8AEE, v23, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 876) = 4;
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 872) = 4;
      objc_msgSend(*(id *)(a1 + 48), "metricTotalSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 880) = v9;
      break;
    case 1:
    case 3:
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 876))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
        if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)v22 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DeviceActivation", (const char *)&unk_22F7B8AEE, v22, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v15 = v14;
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)v21 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "DeviceActivation", (const char *)&unk_22F7B8AEE, v21, 2u);
        }
      }

      v16 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v16 + 1417))
        v17 = 2;
      else
        v17 = 3;
      *(_DWORD *)(v16 + 876) = v17;
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 872) = 0;
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("HDSSetupSession.m"), 6703, CFSTR("Invalid result"));

      break;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_run", v20);
}

- (int)_runTRActivation
{
  int trActivationState;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[16];

  trActivationState = self->_trActivationState;
  if (trActivationState != 4 && trActivationState != 2)
  {
    if (trActivationState || self->_bgActivationState == 1)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_trActivationState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TRDeviceActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_trActivationState = 1;
      v8 = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 210, 0);
      v10 = (void *)objc_msgSend(objc_alloc((Class)getTRActivationOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v10);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __35__HDSSetupSession__runTRActivation__block_invoke;
      v13[3] = &unk_24FCD5248;
      v14 = v10;
      v15 = v8;
      v13[4] = self;
      v11 = v10;
      objc_msgSend(v11, "setCompletionBlock:", v13);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v11);

    }
  }
  return self->_trActivationState;
}

void __35__HDSSetupSession__runTRActivation__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = __35__HDSSetupSession__runTRActivation__block_invoke_2;
  block[3] = &unk_24FCD5248;
  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = *(NSObject **)(v1 + 1488);
  block[1] = 3221225472;
  v4 = a1[6];
  block[4] = v1;
  v7 = v4;
  v6 = v2;
  dispatch_async(v3, block);

}

void __35__HDSSetupSession__runTRActivation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  uint8_t v17[16];
  uint8_t buf[16];
  uint8_t v19[16];
  uint8_t v20[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 752))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getTRActivationOperationIsActivatedKey[0]();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 872))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)v20 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "TRDeviceActivation", (const char *)&unk_22F7B8AEE, v20, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)v19 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_END, v16, "TRDeviceActivation", (const char *)&unk_22F7B8AEE, v19, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 872) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 872))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "TRDeviceActivation", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v9 = v8;
        if (os_signpost_enabled(v7))
        {
          *(_WORD *)v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_END, v9, "TRDeviceActivation", (const char *)&unk_22F7B8AEE, v17, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 872) = 3;
      objc_msgSend(*(id *)(a1 + 40), "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        getTRActivationOperationErrorKey[0]();
        CFErrorGetTypeID();
        CFDictionaryGetTypedValue();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301003, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v10, CFSTR("TRActivation"));

    }
  }
}

- (int)_runTRiCloudAuthentication
{
  void *v3;
  int v4;

  if (!-[NSSet containsObject:](self->_trUnauthServices, "containsObject:", &unk_24FCE3FB0))
    return 4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24FCE3FB0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSSetupSession _runTRAuthentication:](self, "_runTRAuthentication:", v3);

  return v4;
}

- (int)_runTROtherAuthentication
{
  if (!self->_trAuthenticationStateReset)
  {
    self->_trAuthenticationState = 0;
    self->_trAuthenticationStateReset = 1;
  }
  return -[HDSSetupSession _runTRAuthentication:](self, "_runTRAuthentication:", self->_trUnauthServices);
}

- (int)_runTRAuthentication:(id)a3
{
  id v4;
  char v5;
  int trAuthenticationState;
  char v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSString *appleIDPassword;
  id v16;
  int v17;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  char v23;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "containsObject:", &unk_24FCE3F98);
  trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v8 = v5;
      v19 = v4;
      FPrintF();
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v19 = v4;
        LogPrintF();
      }
      objc_msgSend((id)objc_opt_class(), "signpostLog", v19);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Auth", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      if (self->_progressHandler
        && -[NSSet containsObject:](self->_trUnauthServices, "containsObject:", &unk_24FCE3FB0))
      {
        (*((void (**)(void))self->_progressHandler + 2))();
      }
      v12 = (void *)objc_msgSend(objc_alloc((Class)getTRAuthenticationOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v12);
      objc_msgSend(v12, "setShouldIgnoreAuthFailures:", 0);
      objc_msgSend(v12, "setShouldUseAIDA:", self->_trUseAIDA);
      objc_msgSend(v12, "setTargetedServices:", v4);
      objc_msgSend(v12, "setShouldSetupHomePod:", 1);
      if (self->_canDoV2TermsAndConditions && self->_termsAndConditionsServersActive)
        v13 = _os_feature_enabled_impl();
      else
        v13 = 0;
      objc_msgSend(v12, "setCanDoTermsAndConditions:", v13);
      -[NSUUID UUIDString](self->_sessionID, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSessionID:", v14);

      objc_msgSend(v12, "setPresentingChildViewController:", self->_presentingChildViewController);
      if (IsAppleInternalBuild())
      {
        if (self->_isCLIMode)
        {
          appleIDPassword = self->_appleIDPassword;
          if (appleIDPassword)
          {
            if (-[NSString length](appleIDPassword, "length"))
            {
              if (gLogCategory_HDSSetupSession <= 30
                && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              objc_msgSend(v12, "setIsCLIMode:", self->_isCLIMode);
              objc_msgSend(v12, "setRawPassword:", self->_appleIDPassword);
            }
          }
        }
      }
      if (self->_presentingViewController)
        objc_msgSend(v12, "setPresentingViewController:");
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __40__HDSSetupSession__runTRAuthentication___block_invoke;
      v20[3] = &unk_24FCD4358;
      v20[4] = self;
      v21 = v12;
      v22 = v4;
      v23 = v8;
      v16 = v12;
      objc_msgSend(v16, "setCompletionBlock:", v20);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v16);

    }
  }
  v17 = self->_trAuthenticationState;

  return v17;
}

void __40__HDSSetupSession__runTRAuthentication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 1488);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__HDSSetupSession__runTRAuthentication___block_invoke_2;
  v5[3] = &unk_24FCD4358;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 56);
  dispatch_async(v4, v5);

}

void __40__HDSSetupSession__runTRAuthentication___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 752))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904) = v2;
    *(double *)(*(_QWORD *)(a1 + 32) + 912) = *(double *)(*(_QWORD *)(a1 + 32) + 904)
                                              + *(double *)(*(_QWORD *)(a1 + 32) + 912);
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v3, OS_SIGNPOST_INTERVAL_END, v5, "Auth", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getTRAuthenticationOperationUnauthenticatedServicesKey[0]();
    CFSetGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "mutableCopy");
    objc_msgSend(v8, "minusSet:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "unionSet:", v7);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 808), v8);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      getTRAuthenticationOperationErrorKey[0]();
      CFErrorGetTypeID();
      CFDictionaryGetTypedValue();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        NSErrorWithOSStatusF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getTROperationErrorDomain[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      v12 = objc_msgSend(v9, "code");

      if (v12 == -12002)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1744);
        if (v13)
        {
          (*(void (**)(void))(v13 + 16))();
        }
        else if (gLogCategory_HDSSetupSession <= 30
               && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_65;
      }
    }
    else
    {

    }
    if (_os_feature_enabled_impl() && *(_BYTE *)(a1 + 56))
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "_logiTunesAuthRetryMetrics:durationSeconds:authType:retryAttempt:", v9, objc_msgSend(*(id *)(a1 + 40), "authType"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1364), *(double *)(*(_QWORD *)(a1 + 32) + 904));
    }
    if (v6 && !objc_msgSend(v7, "count"))
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v21 = *(void **)(*(_QWORD *)(a1 + 32) + 904);
        v20 = *(void **)(a1 + 48);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 888) = 4;
      objc_msgSend(*(id *)(a1 + 48), "anyObject", v20, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          v20 = v16;
          LogPrintF();
        }
        if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", &unk_24FCE3F98, v20))
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904);
        }
        else if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", &unk_24FCE3FB0))
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 824) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 904);
        }
      }
      goto LABEL_64;
    }
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v20 = v7;
      v21 = v6;
      LogPrintF();
    }
    if (_os_feature_enabled_impl())
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(a1 + 56))
        goto LABEL_44;
      v15 = *(_DWORD *)(v14 + 1364);
      if (v15 <= 0)
      {
        *(_DWORD *)(v14 + 1364) = v15 + 1;
        if (gLogCategory_HDSSetupSession <= 60
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 888) = 0;
        v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24FCE3A80);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 808);
        *(_QWORD *)(v18 + 808) = v17;

LABEL_64:
        objc_msgSend(*(id *)(a1 + 32), "_run", v20, v21);
        goto LABEL_65;
      }
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(a1 + 56))
        goto LABEL_44;
    }
    if (!*(_QWORD *)(v14 + 632))
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 888) = 2;
      goto LABEL_64;
    }
LABEL_44:
    *(_DWORD *)(v14 + 888) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v9, CFSTR("TRAuth"), v20, v21);
LABEL_65:

  }
}

- (int)_runCDPSetup:(BOOL)a3
{
  int result;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationCDPSetup *v10;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  _QWORD v12[5];
  uint8_t buf[16];

  result = self->_cdpState;
  if (result != 4)
  {
    if (result)
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_26;
      if (gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
        goto LABEL_25;
    }
    else
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_11;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_cdpState)
      {
LABEL_11:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v8 = v7;
          if (os_signpost_enabled(v6))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CDPSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 236, 0);
      -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
      v10 = (SFDeviceOperationCDPSetup *)objc_alloc_init(MEMORY[0x24BE90130]);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v10;

      -[SFDeviceOperationCDPSetup setDispatchQueue:](self->_cdpSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationCDPSetup setSfSession:](self->_cdpSetupOperation, "setSfSession:", self->_sfSession);
      -[SFDeviceOperationCDPSetup setSkipSetupRequest:](self->_cdpSetupOperation, "setSkipSetupRequest:", self->_trUseAIDA);
      -[SFDeviceOperationCDPSetup setSkipEscrowFetches:](self->_cdpSetupOperation, "setSkipEscrowFetches:", 1);
      if (self->_presentingViewController)
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __32__HDSSetupSession__runCDPSetup___block_invoke;
      v12[3] = &unk_24FCD4138;
      v12[4] = self;
      -[SFDeviceOperationCDPSetup setCompletionHandler:](self->_cdpSetupOperation, "setCompletionHandler:", v12);
      -[SFDeviceOperationCDPSetup activate](self->_cdpSetupOperation, "activate");
      if (gLogCategory_HDSSetupSession > 30
        || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    LogPrintF();
LABEL_25:
    result = self->_cdpState;
  }
LABEL_26:
  if (!a3)
  {
    if (result != 4
      && gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 4;
  }
  return result;
}

void __32__HDSSetupSession__runCDPSetup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 928))
  {
    if (v3)
    {
      if (!*(_DWORD *)(v4 + 944))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CDPSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CDPSetup", (const char *)&unk_22F7B8AEE, v20, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 944) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("CDPSetup"));
    }
    else
    {
      objc_msgSend(*(id *)(v4 + 928), "metricSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 936) = v11;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 944))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v14 = v13;
          if (os_signpost_enabled(v12))
          {
            *(_WORD *)v19 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CDPSetup", (const char *)&unk_22F7B8AEE, v19, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)v18 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_END, v17, "CDPSetup", (const char *)&unk_22F7B8AEE, v18, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 944) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }

}

- (int)_runHomeKitSetup
{
  int homeKitSetupState;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v8;
  int personalRequestsChoice;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  const char *v28;
  void *v29;
  const char *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (!homeKitSetupState)
    {
      if (gLogCategory_HDSSetupSession > 30)
        goto LABEL_11;
      if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (!self->_homeKitSetupState)
      {
LABEL_11:
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v6 = v5;
          if (os_signpost_enabled(v4))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_homeKitSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 234, 0);
      if (!self->_homeKitSetupOperation)
      {
        if (!self->_homeKitSetupState)
        {
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v16 = v15;
            if (os_signpost_enabled(v14))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "HomeKitSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
            }
          }

        }
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "HomeKitSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

        self->_homeKitSetupState = 3;
        NSErrorWithOSStatusF();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v8, CFSTR("HomeKitSetup"));
        goto LABEL_75;
      }
      softLinkIDSCopyLocalDeviceUniqueID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v12 = 0;
        goto LABEL_64;
      }
      personalRequestsChoice = self->_personalRequestsChoice;
      -[HMAccessory uniqueIdentifier](self->_stereoCounterpartAccessory, "uniqueIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = personalRequestsChoice == 6;
      if (personalRequestsChoice == 6 || !v10)
      {
LABEL_63:

LABEL_64:
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          v28 = "no";
          if ((_DWORD)v12)
            v28 = "yes";
          v31 = v28;
          LogPrintF();
        }
        -[HDSDeviceOperationHomeKitSetup setPersonalRequestsEnabled:](self->_homeKitSetupOperation, "setPersonalRequestsEnabled:", v12, v31);
        -[HDSDeviceOperationHomeKitSetup setPauseHandler:](self->_homeKitSetupOperation, "setPauseHandler:", 0);
        -[HDSDeviceOperationHomeKitSetup setTrSession:](self->_homeKitSetupOperation, "setTrSession:", self->_trSession);
        -[SFSession pairedPeer](self->_sfSession, "pairedPeer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSDeviceOperationHomeKitSetup setPairedPeer:](self->_homeKitSetupOperation, "setPairedPeer:", v29);

        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __35__HDSSetupSession__runHomeKitSetup__block_invoke;
        v34[3] = &unk_24FCD51F8;
        v34[4] = self;
        -[HDSDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v34);
        -[HDSDeviceOperationHomeKitSetup resume](self->_homeKitSetupOperation, "resume");
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_homeKitStartTicks = mach_absolute_time();
LABEL_75:

        return self->_homeKitSetupState;
      }
      -[HDSSetupSession selectedHome](self, "selectedHome");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13
        && gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(v13, "owner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        if (v13)
        {
          objc_msgSend(v20, "assistantAccessControlForHome:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
LABEL_51:
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            objc_msgSend(v22, "accessories");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            if (v12)
            {
              v32 = v21;
              v33 = v13;
              v24 = *(_QWORD *)v36;
              while (2)
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v36 != v24)
                    objc_enumerationMutation(v23);
                  objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "uniqueIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "isEqual:", v11);

                  if (v27)
                  {
                    self->_personalRequestsChoice = 6;
                    v12 = 1;
                    goto LABEL_61;
                  }
                }
                v12 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
                if (v12)
                  continue;
                break;
              }
LABEL_61:
              v21 = v32;
              v13 = v33;
            }

            goto LABEL_63;
          }
        }
      }
      else if (gLogCategory_HDSSetupSession <= 90
             && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v22 = 0;
      goto LABEL_51;
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_homeKitSetupState;
}

void __35__HDSSetupSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  os_signpost_id_t v21;
  NSObject *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  const __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  os_signpost_id_t v28;
  NSObject *v29;
  uint64_t v30;
  os_signpost_id_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 952);
  if (v7)
  {
    if (v5)
    {
      if (gLogCategory_HDSSetupSession <= 90
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v34 = v5;
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 964))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v21 = v20;
          if (os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "HomeKitSetup", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v24 = v23;
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)v37 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_END, v24, "HomeKitSetup", (const char *)&unk_22F7B8AEE, v37, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 964) = 3;
      if (v6)
        v25 = v6;
      else
        v25 = CFSTR("NoLabel");
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v5, v25, v34);
    }
    else
    {
      objc_msgSend(v7, "homeKitSelectedRoomName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 976);
      *(_QWORD *)(v9 + 976) = v8;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "metricNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) = v11;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "setupDeviceNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984) = v12;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "addDeviceNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992) = v13;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "assignRoomNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000) = v14;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "personalRequestsNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008) = v15;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "ulhNonUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016) = v16;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "odeonSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = v17;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "metricUserSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032) = v18;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v34 = *(id *)(*(_QWORD *)(a1 + 32) + 968);
        LogPrintF();
      }
      if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 964))
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)v36 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HomeKitSetup", (const char *)&unk_22F7B8AEE, v36, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v31 = v30;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v29, OS_SIGNPOST_INTERVAL_END, v31, "HomeKitSetup", (const char *)&unk_22F7B8AEE, v35, 2u);
        }
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 964) = 4;
      mach_absolute_time();
      UpTicksToSecondsF();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216) = v32;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v34 = *(id *)(*(_QWORD *)(a1 + 32) + 1216);
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 952), "stereoPairSeconds", v34);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040) = v33;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }

}

- (int)_runHomePodSoftwareUpdate
{
  int result;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  HMAccessorySoftwareUpdateControllerV2 *v20;
  HMAccessorySoftwareUpdateControllerV2 *softwareUpdateController;
  HMAccessorySoftwareUpdateControllerV2 *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  uint64_t v31;
  const char *v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t buf[16];

  result = self->_homepodSoftwareUpdateState;
  if (!result)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomePodSoftwareUpdate", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_homepodSoftwareUpdateState = 1;
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_forceSoftwareUpdateForADP || self->_homePodSUState && (self->_homePodProductVersion & 0xFFFFFFFE) == 2)
    {
      if (!self->_homepodSoftwareUpdateState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v9 = v8;
          if (os_signpost_enabled(v7))
          {
            *(_WORD *)v36 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HomePodSoftwareUpdate", (const char *)&unk_22F7B8AEE, v36, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled(v10))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v10, OS_SIGNPOST_INTERVAL_END, v12, "HomePodSoftwareUpdate", (const char *)&unk_22F7B8AEE, v35, 2u);
        }
      }

      self->_homepodSoftwareUpdateState = 4;
      v13 = self->_forceSoftwareUpdateForADP || self->_homePodSUState != 3;
      -[HDSDeviceOperationHomeKitSetup homeKitAccessory](self->_homeKitSetupOperation, "homeKitAccessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v15, "UUIDString");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = "no";
        if (v13)
          v18 = "yes";
        v31 = v16;
        v32 = v18;
        LogPrintF();

      }
      -[HDSSetupSession selectedHome](self, "selectedHome", v31, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "softwareUpdateController");
      v20 = (HMAccessorySoftwareUpdateControllerV2 *)objc_claimAutoreleasedReturnValue();
      softwareUpdateController = self->_softwareUpdateController;
      self->_softwareUpdateController = v20;

      v22 = self->_softwareUpdateController;
      -[HDSDeviceOperationHomeKitSetup homeKitAccessory](self->_homeKitSetupOperation, "homeKitAccessory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySoftwareUpdateControllerV2 scanForSoftwareUpdateRepeatedlyOnAccessory:andInstallUpdate:](v22, "scanForSoftwareUpdateRepeatedlyOnAccessory:andInstallUpdate:", v24, v13);

      return self->_homepodSoftwareUpdateState;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_homepodSoftwareUpdateState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)v34 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "HomePodSoftwareUpdate", (const char *)&unk_22F7B8AEE, v34, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)v33 = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_END, v30, "HomePodSoftwareUpdate", (const char *)&unk_22F7B8AEE, v33, 2u);
        }
      }

      result = 2;
      self->_homepodSoftwareUpdateState = 2;
    }
  }
  return result;
}

- (int)_runMultiUserEnable
{
  int multiUserEnableState;
  int v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  uint8_t *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  unint64_t v11;
  os_signpost_id_t v12;
  int v13;
  HDSSetupSession *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  int multiUserEnableStepState;
  int v21;
  BOOL v22;
  int v23;
  int v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  NSObject *v28;
  unint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  uint8_t v35[16];
  uint8_t buf[2];
  uint8_t v37[16];
  uint8_t v38[16];
  __int16 v39;
  uint8_t v40[16];

  multiUserEnableState = self->_multiUserEnableState;
  while (2)
  {
    v4 = multiUserEnableState;
    switch(multiUserEnableState)
    {
      case 0:
        if (gLogCategory_HDSSetupSession > 30)
          goto LABEL_41;
        if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (!self->_multiUserEnableState)
        {
LABEL_41:
          objc_msgSend((id)objc_opt_class(), "signpostLog");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = -[HDSSetupSession signpostID](self, "signpostID");
          if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v27 = v26;
            if (os_signpost_enabled(v25))
            {
              *(_WORD *)v40 = 0;
              _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MultiUserEnablement", (const char *)&unk_22F7B8AEE, v40, 2u);
            }
          }

        }
        v13 = 10;
        goto LABEL_46;
      case 10:
        self->_multiUserEnableState = 11;
        -[HDSSetupSession _runMultiUserEnableHome](self, "_runMultiUserEnableHome");
        goto LABEL_60;
      case 11:
        if (self->_multiUserEnableStepState == 1)
          goto LABEL_60;
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_19;
        v7 = v6;
        if (!os_signpost_enabled(v5))
          goto LABEL_19;
        v39 = 0;
        v8 = (uint8_t *)&v39;
        v9 = v5;
        v10 = v7;
        goto LABEL_18;
      case 12:
        if (gLogCategory_HDSSetupSession > 30)
        {
          v24 = 12;
        }
        else
        {
          if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
            LogPrintF();
          v24 = self->_multiUserEnableState;
          if (!v24)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v30 = v29;
              if (os_signpost_enabled(v28))
              {
                *(_WORD *)v38 = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MultiUserEnablement", (const char *)&unk_22F7B8AEE, v38, 2u);
              }
            }

            v24 = self->_multiUserEnableState;
          }
          if ((v24 - 1) <= 5)
          {
            objc_msgSend((id)objc_opt_class(), "signpostLog");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = -[HDSSetupSession signpostID](self, "signpostID");
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v33 = v32;
              if (os_signpost_enabled(v31))
              {
                *(_WORD *)v37 = 0;
                _os_signpost_emit_with_name_impl(&dword_22F74D000, v31, OS_SIGNPOST_INTERVAL_END, v33, "MultiUserEnablement", (const char *)&unk_22F7B8AEE, v37, 2u);
              }
            }

            v24 = self->_multiUserEnableState;
          }
        }
        self->_multiUserEnableState = v24 + 1;
        v14 = self;
        v15 = CFSTR("root.siri.identifyVoice");
        v16 = 0;
        goto LABEL_59;
      case 13:
        if (self->_multiUserEnableStepState == 1)
          goto LABEL_60;
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v5 = objc_claimAutoreleasedReturnValue();
        v11 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_19;
        v12 = v11;
        if (!os_signpost_enabled(v5))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v8 = buf;
        v9 = v5;
        v10 = v12;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MultiUserEnablement", (const char *)&unk_22F7B8AEE, v8, 2u);
LABEL_19:

        if (self->_multiUserEnableStepState == 4)
          v13 = self->_multiUserEnableState + 1;
        else
          v13 = 2;
LABEL_46:
        self->_multiUserEnableState = v13;
        goto LABEL_60;
      case 14:
        self->_multiUserEnableState = 15;
        v14 = self;
        v15 = CFSTR("root.home.dismissedIdentifyVoiceOnboarding");
        v16 = 1;
LABEL_59:
        -[HDSSetupSession _runMultiUserEnableEnableSettingStart:privateSettings:](v14, "_runMultiUserEnableEnableSettingStart:privateSettings:", v15, v16);
        goto LABEL_60;
      case 15:
        if (self->_multiUserEnableStepState == 1)
          goto LABEL_60;
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v19 = v18;
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)v35 = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "MultiUserEnablement", (const char *)&unk_22F7B8AEE, v35, 2u);
          }
        }

        multiUserEnableStepState = self->_multiUserEnableStepState;
        v21 = gLogCategory_HDSSetupSession;
        v22 = multiUserEnableStepState == 4;
        if (multiUserEnableStepState == 4)
          v23 = 4;
        else
          v23 = 2;
        self->_multiUserEnableState = v23;
        if (v22)
        {
          if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
LABEL_38:
            LogPrintF();
        }
        else if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_38;
        }
LABEL_60:
        multiUserEnableState = self->_multiUserEnableState;
        if (multiUserEnableState != v4)
          continue;
        return v4;
      default:
        goto LABEL_60;
    }
  }
}

- (void)_runMultiUserEnableHome
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  _QWORD v14[5];
  uint8_t buf[16];

  -[HDSSetupSession selectedHome](self, "selectedHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_multiUserEnableStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    v7 = MEMORY[0x24BDAC760];
    self->_multiUserEnableStepState = 1;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __42__HDSSetupSession__runMultiUserEnableHome__block_invoke;
    v14[3] = &unk_24FCD4138;
    v14[4] = self;
    objc_msgSend(v3, "enableMultiUserWithCompletionHandler:", v14);
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_multiUserEnableStepState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_multiUserEnableStepState = 2;
  }

}

void __42__HDSSetupSession__runMultiUserEnableHome__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 1488);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HDSSetupSession__runMultiUserEnableHome__block_invoke_2;
  v7[3] = &unk_24FCD4290;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __42__HDSSetupSession__runMultiUserEnableHome__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 1088))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v17, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1088) = 2;
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", *(_QWORD *)(a1 + 32), CFSTR("MultiUser"));
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 40) + 1088))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v16, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v15, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1088) = 4;
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (void)_runMultiUserEnableEnableSettingStart:(id)a3 privateSettings:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  int recognizeVoiceEnabled;
  const char *v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  NSObject *v23;
  unint64_t v24;
  os_signpost_id_t v25;
  NSObject *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  NSObject *v29;
  unint64_t v30;
  os_signpost_id_t v31;
  NSObject *v32;
  unint64_t v33;
  os_signpost_id_t v34;
  NSObject *v35;
  unint64_t v36;
  os_signpost_id_t v37;
  NSObject *v38;
  unint64_t v39;
  os_signpost_id_t v40;
  NSObject *v41;
  unint64_t v42;
  os_signpost_id_t v43;
  NSObject *v44;
  unint64_t v45;
  os_signpost_id_t v46;
  unint64_t v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  const char *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  uint8_t buf[16];

  v6 = a3;
  -[HDSSetupSession selectedHome](self, "selectedHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userSettingsForHome:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      objc_msgSend(v10, "privateSettings");
    else
      objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v34 = v33;
          if (os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v37 = v36;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v35, OS_SIGNPOST_INTERVAL_END, v37, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_multiUserEnableStepState = 2;
      goto LABEL_94;
    }
    objc_msgSend(v11, "rootGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v40 = v39;
          if (os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v40, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v43 = v42;
        if (os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v41, OS_SIGNPOST_INTERVAL_END, v43, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

      self->_multiUserEnableStepState = 2;
      goto LABEL_93;
    }
    -[HDSSetupSession _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (!self->_multiUserEnableStepState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v17 = v16;
          if (os_signpost_enabled(v15))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      self->_multiUserEnableStepState = 1;
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("root.siri.identifyVoice")))
      {
        recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
        if (recognizeVoiceEnabled)
        {
          if (gLogCategory_HDSSetupSession <= 30)
          {
            if (gLogCategory_HDSSetupSession != -1
              || (v48 = _LogCategory_Initialize(), recognizeVoiceEnabled = self->_recognizeVoiceEnabled, v48))
            {
              if (recognizeVoiceEnabled == 6)
                v19 = "yes";
              else
                v19 = "no";
              v51 = v6;
              v52 = v19;
              LogPrintF();
              recognizeVoiceEnabled = self->_recognizeVoiceEnabled;
            }
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", recognizeVoiceEnabled == 6, v51, v52);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke;
          v55[3] = &unk_24FCD4160;
          v55[4] = self;
          v56 = v6;
          objc_msgSend(v14, "updateValue:completionHandler:", v49, v55);

          v50 = v56;
LABEL_91:

          goto LABEL_92;
        }
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("root.home.dismissedIdentifyVoiceOnboarding"))
        && !self->_hasExistingHomePod)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_1240;
        v53[3] = &unk_24FCD4160;
        v53[4] = self;
        v54 = v6;
        objc_msgSend(v14, "updateValue:completionHandler:", MEMORY[0x24BDBD1C8], v53);
        v50 = v54;
        goto LABEL_91;
      }
      if (!self->_multiUserEnableStepState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v22 = v21;
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v25 = v24, !os_signpost_enabled(v23)))
      {
LABEL_86:

        self->_multiUserEnableStepState = 2;
LABEL_92:

LABEL_93:
LABEL_94:

        goto LABEL_95;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!self->_multiUserEnableStepState)
      {
        objc_msgSend((id)objc_opt_class(), "signpostLog");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = -[HDSSetupSession signpostID](self, "signpostID");
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v46 = v45;
          if (os_signpost_enabled(v44))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22F74D000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v46, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
          }
        }

      }
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v23 = objc_claimAutoreleasedReturnValue();
      v47 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v47 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_86;
      v25 = v47;
      if (!os_signpost_enabled(v23))
        goto LABEL_86;
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_22F74D000, v23, OS_SIGNPOST_INTERVAL_END, v25, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
    goto LABEL_86;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_multiUserEnableStepState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v28 = v27;
      if (os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v28, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v29, OS_SIGNPOST_INTERVAL_END, v31, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_multiUserEnableStepState = 2;
LABEL_95:

}

void __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2;
  block[3] = &unk_24FCD42E0;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v17, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088) = 2;
    objc_msgSend(*(id *)(a1 + 48), "_logMetricsForSoftError:label:", *(_QWORD *)(a1 + 32), CFSTR("MultiUser"));
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v16, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v15, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088) = 4;
  return objc_msgSend(*(id *)(a1 + 48), "_run");
}

void __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_1240(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2_1241;
  block[3] = &unk_24FCD42E0;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__HDSSetupSession__runMultiUserEnableEnableSettingStart_privateSettings___block_invoke_2_1241(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088))
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
      if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v17 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v17, 2u);
      }
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088) = 2;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088))
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v16, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "HomeKitEnableMultiUser", (const char *)&unk_22F7B8AEE, v15, 2u);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 1088) = 4;
  return objc_msgSend(*(id *)(a1 + 48), "_run");
}

- (int)_runFinishStart
{
  int result;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  double configureTimeSecs;
  double v8;
  uint8_t buf[16];

  result = self->_finishState;
  if (!result)
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_7;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (!self->_finishState)
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    self->_finishState = 1;
    self->_finishStartTicks = mach_absolute_time();
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_configureTimeSecs = configureTimeSecs;
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_15;
    if (gLogCategory_HDSSetupSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_15;
      configureTimeSecs = self->_configureTimeSecs;
    }
    v8 = configureTimeSecs;
    LogPrintF();
LABEL_15:
    -[HDSSetupSession _runFinishRequest](self, "_runFinishRequest", *(_QWORD *)&v8);
    return self->_finishState;
  }
  return result;
}

- (void)_runFinishRequest
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  const void *v9;
  SFSession *sfSession;
  id v11;
  _QWORD v12[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FCE3FC8, CFSTR("op"));
  -[HDSSetupSession selectedSiriLanguageCode](self, "selectedSiriLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_hasExistingHomePod
    && !self->_prefForceSiriGreeting
    && gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (IsAppleInternalBuild() && -[NSString length](self->_forcedPasscode, "length"))
  {
    if (gLogCategory_HDSSetupSession > 30)
      goto LABEL_22;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_22:
  if ((self->_stereoPairRole & 0xFFFFFFFE) != 2)
  {
LABEL_29:
    v5 = 1;
    goto LABEL_30;
  }
  if (!self->_prefStereoWait)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  v5 = 3;
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("finF"));

  v7 = self->_homeKitSelectedRoomName;
  if (v7)
  {
    if ((self->_testFlags & 0x800000) == 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fnm"));
      v8 = _CSCopyLocalHostnameForComputerName();
      if (v8)
      {
        v9 = (const void *)v8;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hnm"));
        CFRelease(v9);
      }
    }
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v11 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__HDSSetupSession__runFinishRequest__block_invoke;
  v12[3] = &unk_24FCD5338;
  v12[4] = self;
  -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v3, v12, v11);

}

void __36__HDSSetupSession__runFinishRequest__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  int Int64Ranged;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if (Int64Ranged)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD1100];
      v11 = Int64Ranged;
      v16 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v17[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v15);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_runFinishResponse:error:", v7, v6);

}

- (void)_runFinishResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  NSString *v20;
  double userWaitTimeSecs;
  NSObject *v22;
  unint64_t v23;
  os_signpost_id_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  const char *v28;
  uint64_t stereoPairRole;
  const char *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  void (**progressHandler)(id, uint64_t, _QWORD);
  double v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (!self->_finishState)
    {
      objc_msgSend((id)objc_opt_class(), "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[HDSSetupSession signpostID](self, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F74D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v11, OS_SIGNPOST_INTERVAL_END, v13, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

    self->_finishState = 3;
    -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("Finish"));
    -[HDSSetupSession _cleanup](self, "_cleanup");
    goto LABEL_60;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v38 = *(double *)&v6;
    LogPrintF();
  }
  if (!self->_finishState)
  {
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[HDSSetupSession signpostID](self, "signpostID");
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F74D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "Finish", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  self->_finishState = 4;
  if (self->_personalRequestsChoice == 6)
  {
    CFPrefs_SetValue();
    CFPreferencesAppSynchronize(CFSTR("com.apple.Sharing"));
    notify_post("com.apple.Sharing.prefsChanged");
  }
  v20 = self->_deviceSerialNumber;
  if (v20)
  {
    if (gLogCategory_HDSSetupSession < 31
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend((Class)getAMSDeviceClass[0](), "registerCompanionWithSerialNumber:", v20);
  }

  mach_absolute_time();
  UpTicksToSecondsF();
  self->_userWaitTimeSecs = userWaitTimeSecs;
  if (gLogCategory_HDSSetupSession < 31)
  {
    if (gLogCategory_HDSSetupSession != -1)
    {
LABEL_33:
      v38 = userWaitTimeSecs;
      LogPrintF();
      goto LABEL_35;
    }
    if (_LogCategory_Initialize())
    {
      userWaitTimeSecs = self->_userWaitTimeSecs;
      goto LABEL_33;
    }
  }
LABEL_35:
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v22, OS_SIGNPOST_INTERVAL_END, v24, "UserWaitTime", (const char *)&unk_22F7B8AEE, buf, 2u);
    }
  }

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = -[HDSSetupSession signpostID](self, "signpostID");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v27 = v26;
    if (os_signpost_enabled(v25))
    {
      if (self->_userOptedToHH2)
        v28 = "yes";
      else
        v28 = "no";
      stereoPairRole = self->_stereoPairRole;
      if (stereoPairRole > 3)
        v30 = "?";
      else
        v30 = off_24FCD5818[stereoPairRole];
      *(_DWORD *)buf = 136315394;
      v42 = v28;
      v43 = 2080;
      v44 = v30;
      _os_signpost_emit_with_name_impl(&dword_22F74D000, v25, OS_SIGNPOST_EVENT, v27, "SetupComplete", "hh2=%s stereoRole=%s", buf, 0x16u);
    }
  }

  mach_absolute_time();
  UpTicksToSecondsF();
  self->_finishSecs = v31;
  CFDictionaryGetDouble();
  self->_iTunesWaitSecs = v32;
  CFDictionaryGetDouble();
  self->_mediaSystemWaitSecs = v33;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_totalSecs = v34;
  if (!self->_logMetricsCalled)
  {
    -[HDSSetupSession _logErrorMetrics:inLabel:](self, "_logErrorMetrics:inLabel:", 0, CFSTR("Finish"));
    -[HDSSetupSession _logMetrics:](self, "_logMetrics:", 0);
    -[HDSSetupSession _logUsageMetrics:](self, "_logUsageMetrics:", 0);
    -[HDSSetupSession _logPerformanceMetrics:](self, "_logPerformanceMetrics:", 0);
    -[HDSSetupSession _logHomeKitPerformanceMetrics](self, "_logHomeKitPerformanceMetrics");
  }
  v35 = objc_alloc_init(MEMORY[0x24BE900E8]);
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __44__HDSSetupSession__runFinishResponse_error___block_invoke;
  v39[3] = &unk_24FCD4160;
  v39[4] = self;
  v36 = v35;
  v40 = v36;
  objc_msgSend(v36, "reenableProxCardType:completion:", 33, v39);
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      -[SFSession identifier](self->_sfSession, "identifier", *(_QWORD *)&v38);
      v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      LogPrintF();

    }
  }
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 96, 0);
  -[HDSSetupSession _cleanupSession](self, "_cleanupSession", *(_QWORD *)&v38);

LABEL_60:
}

void __44__HDSSetupSession__runFinishResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:");
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v3);

}

- (void)_handlePeerEvent:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  int Int64Ranged;
  int v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void (**progressHandler)(id, uint64_t);
  int v11;
  void (**v12)(id, uint64_t, _QWORD);
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  if ((v4 & 1) != 0)
    goto LABEL_44;
  if (-[HDSSetupSession sysDropEnabled](self, "sysDropEnabled")
    && -[SysDropSession sysDropActivated](self->_sysDropSession, "sysDropActivated"))
  {
    -[SysDropSession handlePeerEvent:flags:](self->_sysDropSession, "handlePeerEvent:flags:", v13, v4);
    goto LABEL_55;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v7 = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetInt64())
  {
    self->_homePodSoftwareUpdateUpdateInstalled = 1;
  }
  else if (!self->_homePodSoftwareUpdateUpdateInstalled)
  {
    goto LABEL_13;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSSetupSession _updateSFSessionErrorHandlerForSUBS](self, "_updateSFSessionErrorHandlerForSUBS");
LABEL_13:
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      SFDeviceSetupProgressEventToString(Int64Ranged);
      LogPrintF();
    }
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (Int64Ranged == 901)
  {
    if (self->_isCLIMode)
      goto LABEL_44;
    if (self->_homePodSoftwareUpdateUpdateInstalled)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_homePodSoftwareUpdateCancelled)
      {
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_44;
      }
      if (v7)
      {
        NSErrorWithOSStatusF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSSetupSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("SU-No-Setup error encountered, SU terminated"), 0);

        goto LABEL_44;
      }
    }
    progressHandler = (void (**)(id, uint64_t))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 901);
    goto LABEL_44;
  }
  if (Int64Ranged != 905)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_55;
    }
LABEL_53:
    LogPrintF();
    goto LABEL_55;
  }
  if (!self->_isCLIMode)
  {
    v8 = (void (**)(id, uint64_t))self->_progressHandler;
    if (v8)
      v8[2](v8, 905);
  }
LABEL_44:
  v11 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    SFDeviceSetupProgressEventToString(v11);
    LogPrintF();
  }
  if (v11 != 600)
  {
    if (gLogCategory_HDSSetupSession > 30
      || gLogCategory_HDSSetupSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  v12 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (v12)
    v12[2](v12, 96, 0);
LABEL_55:

}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if ((v15 & 1) != 0)
        {
          v20 = v13;
          goto LABEL_19;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
        continue;
      break;
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "groups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_11:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v8);
      -[HDSSetupSession _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", v6, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:
    v21 = v20;
  }
  else
  {
LABEL_17:
    v21 = 0;
  }

  return v21;
}

- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke;
  v4[3] = &unk_24FCD4268;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

void __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v2 = (void *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass_1[0]()), "initWithOptions:", 0);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke_2;
  v6[3] = &unk_24FCD5418;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v6[4] = v4;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v5, "updateiCloudSwitchState:completionHandler:", v3, v6);

}

void __51__HDSSetupSession__homeKitUpdateiCloudSwitchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_logMetricsForSoftError:label:", v3, CFSTR("Preflight-iCloud"));
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 40), "status");
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupSession <= 30
         && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

- (void)_logiTunesAuthRetryMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 retryAttempt:(int)a6
{
  id v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v34;
  void *v35;
  _QWORD v36[12];
  _QWORD v37[14];

  v37[12] = *MEMORY[0x24BDAC8D0];
  if (!self->_testFlags)
  {
    v8 = a3;
    v9 = objc_msgSend(v8, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "underlyingErrors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v34 = v13;
    objc_msgSend(v13, "domain");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = CFSTR("duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a4 * 1000.0));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    v36[1] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v35 = (void *)v11;
    if (v10)
      v19 = v10;
    else
      v19 = CFSTR("0");
    v37[1] = v17;
    v37[2] = v19;
    v36[2] = CFSTR("errorCodeString");
    v36[3] = CFSTR("errorDomain");
    if (v11)
      v20 = (const __CFString *)v11;
    else
      v20 = CFSTR("NoDomain");
    v37[3] = v20;
    v36[4] = CFSTR("underlyingErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v15)
      v23 = (const __CFString *)v15;
    else
      v23 = CFSTR("0");
    v24 = (void *)v15;
    v37[4] = v21;
    v37[5] = v23;
    v36[5] = CFSTR("underlyingErrorCodeString");
    v36[6] = CFSTR("underlyingErrorDomain");
    if (v16)
      v25 = v16;
    else
      v25 = CFSTR("NoDomain");
    v37[6] = v25;
    v36[7] = CFSTR("failureType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[7] = v26;
    v36[8] = CFSTR("retryAttempt");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[8] = v27;
    v37[9] = &unk_24FCE3F20;
    v36[9] = CFSTR("retryCount");
    v36[10] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 == 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[11] = CFSTR("sessionID");
    v37[10] = v28;
    v37[11] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    HDSMetricsLog(CFSTR("com.apple.homedevicesetup.iTunesRetry"), v29);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logWiFiRetryMetrics:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t Int64;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  const __CFString *wifiOUI;
  uint64_t v19;
  void *v20;
  const __CFString *wifiSecurityString;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  HDSSetupSession *v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[14];
  _QWORD v48[14];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && !self->_testFlags)
  {
    if (gLogCategory_HDSSetupSession <= 30)
    {
      if (gLogCategory_HDSSetupSession != -1 || (v6 = v4, v7 = _LogCategory_Initialize(), v4 = v6, v7))
      {
        v5 = v4;
        LogPrintF();
        v4 = v5;
      }
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v4;
    obj = v4;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v44;
      v33 = self;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(obj);
          v41 = v8;
          CFDictionaryGetDouble();
          v10 = v9;
          Int64 = CFDictionaryGetInt64();
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = CFDictionaryGetInt64();
          v39 = CFDictionaryGetInt64();
          v35 = v12 != 0;
          -[NSUUID UUIDString](self->_sessionID, "UUIDString", v29);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (id)Int64;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = Int64;
          v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v47[0] = CFSTR("cca");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_wifiCCA);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = v37;
          v47[1] = CFSTR("channel");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_wifiChannel);
          v17 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v17;
          wifiOUI = (const __CFString *)self->_wifiOUI;
          if (!wifiOUI)
            wifiOUI = CFSTR("None");
          v48[1] = v17;
          v48[2] = wifiOUI;
          v47[2] = CFSTR("oui");
          v47[3] = CFSTR("rssi");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_wifiRSSI);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          wifiSecurityString = (const __CFString *)self->_wifiSecurityString;
          if (!wifiSecurityString)
            wifiSecurityString = CFSTR("None");
          v48[3] = v19;
          v48[4] = wifiSecurityString;
          v47[4] = CFSTR("securityStr");
          v47[5] = CFSTR("duration");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v10 * 1000.0));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v48[5] = v22;
          v47[6] = CFSTR("errorCode");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v48[6] = v23;
          v48[7] = v14;
          v38 = (void *)v14;
          v47[7] = CFSTR("errorCodeString");
          v47[8] = CFSTR("errorDomain");
          v48[8] = v42;
          v47[9] = CFSTR("failureType");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v39);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v48[9] = v24;
          v47[10] = CFSTR("retryAttempt");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wifiNumRetries);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48[10] = v25;
          v47[11] = CFSTR("retryCount");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wifiMaxAttempts);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v48[11] = v26;
          v47[12] = CFSTR("success");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v47[13] = CFSTR("sessionID");
          v48[12] = v27;
          v48[13] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addEntriesFromDictionary:", v28);

          HDSMetricsLog(CFSTR("com.apple.sharing.wifiretry"), v16);
          if (gLogCategory_HDSSetupSession <= 30
            && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
          {
            v29 = v16;
            LogPrintF();
          }

          v8 = v41 + 1;
          self = v33;
        }
        while (v34 != v41 + 1);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v34);
    }

    v4 = v30;
  }

}

- (void)_logMetricsForSoftError:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSDictionary *additionalMetrics;
  void *v11;
  void *v12;
  const __CFString *deviceBuildVersion;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!self->_testFlags)
  {
    v6 = a4;
    v7 = a3;
    v8 = objc_msgSend(v7, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    additionalMetrics = self->_additionalMetrics;
    if (additionalMetrics)
      v11 = (void *)-[NSDictionary mutableCopy](additionalMetrics, "mutableCopy");
    else
      v11 = (void *)objc_opt_new();
    v12 = v11;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("sessionID"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

    if (self->_deviceBuildVersion)
      deviceBuildVersion = (const __CFString *)self->_deviceBuildVersion;
    else
      deviceBuildVersion = CFSTR("?");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", deviceBuildVersion, CFSTR("setupDeviceBuild"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("setupDeviceModel"));
    objc_msgSend(v7, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("setupDescription"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("setupErrorCode"));
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("setupErrorDomain"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 == 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("success"));

    HDSMetricsLog(CFSTR("com.apple.hdsErrors"), v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logErrorMetrics:(id)a3 inLabel:(id)a4
{
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  const __CFString *deviceBuildVersion;
  const __CFString *v28;
  const __CFString *deviceModel;
  void *v30;
  __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  __CFString *v56;
  _QWORD v57[20];
  _QWORD v58[22];

  v58[20] = *MEMORY[0x24BDAC8D0];
  if (!self->_testFlags)
  {
    v6 = (__CFString *)a4;
    v7 = a3;
    v8 = objc_msgSend(v7, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "underlyingErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v11, "code");
    objc_msgSend(v11, "domain");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = CFSTR("NoUnderlyingError");
    v56 = v14;

    v53 = v11;
    objc_msgSend(v11, "underlyingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v16, "code");
    objc_msgSend(v16, "domain");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = CFSTR("NoUnderlyingError");
    v55 = v19;

    v52 = v16;
    objc_msgSend(v16, "underlyingErrors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v21, "code");
    v51 = v21;
    objc_msgSend(v21, "domain");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = CFSTR("NoUnderlyingError");
    v42 = v24;

    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v58[0] = v25;
    v57[0] = CFSTR("sessionID");
    v57[1] = CFSTR("apcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_apcState);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v50;
    v57[2] = CFSTR("isHH2");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userOptedToHH2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v48;
    v57[3] = CFSTR("role");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_stereoPairRole);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v47;
    v57[4] = CFSTR("spcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_siriPasscodeState);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v44;
    v57[5] = CFSTR("websheet");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didShowCaptiveSheet);
    v26 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v26;
    deviceBuildVersion = (const __CFString *)self->_deviceBuildVersion;
    v28 = CFSTR("?");
    if (!deviceBuildVersion)
      deviceBuildVersion = CFSTR("?");
    v58[5] = v26;
    v58[6] = deviceBuildVersion;
    v57[6] = CFSTR("setupDeviceBuild");
    v57[7] = CFSTR("setupDeviceModel");
    deviceModel = (const __CFString *)self->_deviceModel;
    if (!deviceModel)
      deviceModel = CFSTR("?");
    v54 = (void *)v9;
    if (v9)
      v28 = (const __CFString *)v9;
    v58[7] = deviceModel;
    v58[8] = v28;
    v57[8] = CFSTR("setupErrorCodeString");
    v57[9] = CFSTR("setupErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v30;
    v57[10] = CFSTR("errorDomain");
    objc_msgSend(v7, "domain");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v32 = CFSTR("No domain");
    if (v31)
      v32 = v31;
    v33 = CFSTR("Unknown");
    if (v6)
      v33 = v6;
    if (v8)
    {
      v34 = 0;
    }
    else
    {
      v33 = CFSTR("NoError");
      v34 = 1;
    }
    v58[10] = v32;
    v58[11] = v33;
    v57[11] = CFSTR("errorLabel");
    v57[12] = CFSTR("setupUnderlyingErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v49);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58[12] = v35;
    v58[13] = v56;
    v57[13] = CFSTR("setupUnderlyingErrorDomain");
    v57[14] = CFSTR("setupUnderlyingErrorCode3");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v46);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[14] = v36;
    v58[15] = v55;
    v57[15] = CFSTR("setupUnderlyingErrorDomain3");
    v57[16] = CFSTR("setupUnderlyingErrorCode4");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v43);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58[16] = v37;
    v58[17] = v42;
    v57[17] = CFSTR("setupUnderlyingErrorDomain4");
    v57[18] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[18] = v38;
    v57[19] = CFSTR("isCLIMode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_isCLIMode);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58[19] = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "addEntriesFromDictionary:", v40);
    HDSMetricsLog(CFSTR("com.apple.HomeDeviceSetup.Error"), v45);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logMetrics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  NSDictionary *additionalMetrics;
  id v18;
  uint64_t v19;
  const __CFString *deviceBuildVersion;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *deviceModel;
  const __CFString *v26;
  void *v27;
  void *v28;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[41];
  _QWORD v70[43];

  v70[41] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_testFlags)
  {
    v6 = objc_msgSend(v4, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "underlyingErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v9, "code");

    v67 = v5;
    objc_msgSend(v5, "underlyingErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "domain");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NoUnderlyingError");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    additionalMetrics = self->_additionalMetrics;
    if (additionalMetrics)
      v18 = (id)-[NSDictionary mutableCopy](additionalMetrics, "mutableCopy");
    else
      v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v63 = (void *)v16;
    v70[0] = v16;
    v68 = v18;
    v69[0] = CFSTR("sessionID");
    v69[1] = CFSTR("activateMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_activationSecs * 1000.0));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v62;
    v69[2] = CFSTR("amsOptimizationSec");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_amsOptimizationSecs);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v61;
    v69[3] = CFSTR("amsSucceeded");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_amsActivationState == 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v60;
    v69[4] = CFSTR("apcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_apcState);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v59;
    v69[5] = CFSTR("authMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ((self->_trAuthenticationTotalSecs + self->_amsOptimizationSecs) * 1000.0));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v70[5] = v58;
    v69[6] = CFSTR("iTunesAuthMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iTunesAuthMs * 1000.0));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v70[6] = v57;
    v69[7] = CFSTR("iCloudAuthMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iCloudAuthMs * 1000.0));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v70[7] = v56;
    v69[8] = CFSTR("basicConfigMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_basicConfigSecs * 1000.0));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v70[8] = v55;
    v69[9] = CFSTR("bonjourTestMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_wifiBonjourTestSecs * 1000.0));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v70[9] = v54;
    v69[10] = CFSTR("finishMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_finishSecs * 1000.0));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70[10] = v53;
    v69[11] = CFSTR("homeKitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitSetupSecs * 1000.0));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v70[11] = v52;
    v69[12] = CFSTR("homeKitHDSMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitHDSMs * 1000.0));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v70[12] = v51;
    v69[13] = CFSTR("isHH2");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userOptedToHH2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v70[13] = v50;
    v69[14] = CFSTR("iTunesWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iTunesWaitSecs * 1000.0));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v70[14] = v49;
    v69[15] = CFSTR("mediaSystemWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_mediaSystemWaitSecs * 1000.0));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v70[15] = v48;
    v69[16] = CFSTR("netMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ((self->_wifiSetupSecs + self->_reachabilitySecs) * 1000.0));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v70[16] = v47;
    v69[17] = CFSTR("numberOfHomePodsInHome");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomePodsInHome);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v70[17] = v46;
    v69[18] = CFSTR("numberOfHomePodsInAccount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomePodsInAccount);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v70[18] = v45;
    v69[19] = CFSTR("numberOfHomes");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomes);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v70[19] = v44;
    v69[20] = CFSTR("pairMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_pairSetupSecs * 1000.0));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v70[20] = v43;
    v69[21] = CFSTR("role");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_stereoPairRole);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v70[21] = v42;
    v69[22] = CFSTR("setupConfigMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_trSetupConfigurationSecs * 1000.0));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v70[22] = v41;
    v69[23] = CFSTR("spcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_siriPasscodeState);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v70[23] = v40;
    v69[24] = CFSTR("totalMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_totalSecs * 1000.0));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v70[24] = v39;
    v69[25] = CFSTR("wifiMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_wifiSetupStepSecs * 1000.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v70[25] = v38;
    v69[26] = CFSTR("reachabilityMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_reachabilitySecs * 1000.0));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v70[26] = v37;
    v69[27] = CFSTR("websheet");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didShowCaptiveSheet);
    v19 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v19;
    deviceBuildVersion = (const __CFString *)self->_deviceBuildVersion;
    if (!deviceBuildVersion)
      deviceBuildVersion = CFSTR("?");
    v70[27] = v19;
    v70[28] = deviceBuildVersion;
    v69[28] = CFSTR("setupDeviceBuild");
    v69[29] = CFSTR("isV2Terms");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_termsAndConditionsV2Shown);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v70[29] = v35;
    v69[30] = CFSTR("automaticSoftwareUpdateAgreed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_automaticSoftwareUpdateAgreed);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v70[30] = v34;
    v69[31] = CFSTR("softwareUpdateAgreed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_softwareUpdateAgreed);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70[31] = v21;
    v69[32] = CFSTR("homePodSUState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodSUState);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70[32] = v22;
    v69[33] = CFSTR("homePodProductVersion");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodProductVersion);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    deviceModel = (const __CFString *)self->_deviceModel;
    if (!deviceModel)
      deviceModel = CFSTR("?");
    v70[33] = v23;
    v70[34] = deviceModel;
    v69[34] = CFSTR("setupDeviceModel");
    v69[35] = CFSTR("setupErrorCodeString");
    v66 = (void *)v7;
    if (v7)
      v26 = (const __CFString *)v7;
    else
      v26 = CFSTR("?");
    v70[35] = v26;
    v69[36] = CFSTR("setupErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v70[36] = v27;
    v69[37] = CFSTR("setupUnderlyingErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v64);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v70[37] = v28;
    v65 = v15;
    v70[38] = v15;
    v69[38] = CFSTR("setupUnderlyingErrorDomain");
    v69[39] = CFSTR("isCLIMode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCLIMode);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v70[39] = v29;
    v69[40] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v70[40] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addEntriesFromDictionary:", v31);

    if (self->_cdpEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_cdpSetupSecs * 1000.0));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v32, CFSTR("cdpSetupMs"));

    }
    v5 = v67;
    if (v67)
    {
      objc_msgSend(v67, "domain");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setObject:forKeyedSubscript:", v33, CFSTR("errorDomain"));

    }
    HDSMetricsLog(CFSTR("com.apple.sharing.ASSetupSuccess"), v68);
    HDSMetricsLog(CFSTR("com.apple.HomeDeviceSetup.SetupCompleted"), v68);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logUsageMetrics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *deviceModel;
  const __CFString *deviceBuildVersion;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[28];
  _QWORD v46[30];

  v46[28] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_testFlags)
  {
    v6 = objc_msgSend(v4, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[HDSSetupSession expressSetupState](self, "expressSetupState");
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v42 = (void *)v9;
    v46[0] = v9;
    v45[0] = CFSTR("sessionID");
    v45[1] = CFSTR("apcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_apcState);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v41;
    v45[2] = CFSTR("spcState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_siriPasscodeState);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v40;
    v45[3] = CFSTR("isHH2");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userOptedToHH2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v39;
    v45[4] = CFSTR("isCLIMode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCLIMode);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v38;
    v45[5] = CFSTR("amsSucceeded");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_amsActivationState == 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v37;
    v45[6] = CFSTR("role");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_stereoPairRole);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v36;
    v45[7] = CFSTR("numberOfHomePodsInHome");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomePodsInHome);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v34;
    v45[8] = CFSTR("numberOfHomePodsInAccount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomePodsInAccount);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[8] = v33;
    v45[9] = CFSTR("numberOfHomes");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfHomes);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[9] = v32;
    v45[10] = CFSTR("websheet");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didShowCaptiveSheet);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[10] = v31;
    v45[11] = CFSTR("automaticSoftwareUpdateAgreed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_automaticSoftwareUpdateAgreed);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[11] = v30;
    v45[12] = CFSTR("softwareUpdateAgreed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_softwareUpdateAgreed);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[12] = v29;
    v45[13] = CFSTR("homePodSUState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodSUState);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[13] = v28;
    v45[14] = CFSTR("odeonState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_odeonState);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[14] = v27;
    v45[15] = CFSTR("homePodProductVersion");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homePodProductVersion);
    v10 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v10;
    v44 = v5;
    deviceModel = (const __CFString *)self->_deviceModel;
    if (!deviceModel)
      deviceModel = CFSTR("?");
    v46[15] = v10;
    v46[16] = deviceModel;
    v45[16] = CFSTR("setupDeviceModel");
    v45[17] = CFSTR("setupDeviceBuild");
    deviceBuildVersion = (const __CFString *)self->_deviceBuildVersion;
    if (!deviceBuildVersion)
      deviceBuildVersion = CFSTR("?");
    v46[17] = deviceBuildVersion;
    v45[18] = CFSTR("rmvState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rmvSelectionState);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46[18] = v25;
    v45[19] = CFSTR("soundRecognitionState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_soundRecognitionSelectionState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[19] = v13;
    v45[20] = CFSTR("siriSettingState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_siriSettingState);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[20] = v14;
    v45[21] = CFSTR("personalRequestsState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_personalRequestsSelectionState);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[21] = v15;
    v45[22] = CFSTR("activeDeviceState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_activeDeviceSelectionState);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[22] = v16;
    v45[23] = CFSTR("locationSelectionState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_locationSelectionState);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[23] = v17;
    v45[24] = CFSTR("expressSetupState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v43 = (void *)v7;
    if (v7)
      v20 = (const __CFString *)v7;
    else
      v20 = CFSTR("?");
    v46[24] = v18;
    v46[25] = v20;
    v45[25] = CFSTR("setupErrorCodeString");
    v45[26] = CFSTR("setupErrorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[26] = v21;
    v45[27] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[27] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addEntriesFromDictionary:", v23);

    v5 = v44;
    if (v44)
    {
      objc_msgSend(v44, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v24, CFSTR("errorDomain"));

    }
    HDSMetricsLog(CFSTR("com.apple.HDSUsage"), v35);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logPerformanceMetrics:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *deviceModel;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[32];
  _QWORD v44[34];

  v44[32] = *MEMORY[0x24BDAC8D0];
  if (!self->_testFlags)
  {
    v4 = objc_msgSend(a3, "code");
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = self->_basicConfigSecs
       + self->_wifiSetupSecs
       + self->_reachabilitySecs
       + self->_wifiBonjourTestSecs
       + self->_trSetupConfigurationSecs
       + self->_cdpSetupSecs
       + self->_activationSecs
       + self->_iCloudAuthMs
       + self->_iTunesAuthMs
       + self->_setupDeviceSecs
       + self->_addDeviceSecs;
    v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v42 = (void *)v5;
    v43[0] = CFSTR("sessionID");
    v44[0] = v5;
    v43[1] = CFSTR("userWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_userWaitTimeSecs * 1000.0));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v41;
    v43[2] = CFSTR("configureTimeMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_configureTimeSecs * 1000.0));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v40;
    v43[3] = CFSTR("role");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_stereoPairRole);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v39;
    v43[4] = CFSTR("activateMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_activationSecs * 1000.0));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v38;
    v43[5] = CFSTR("amsOptimizationSec");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_amsOptimizationSecs);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[5] = v37;
    v43[6] = CFSTR("authMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ((self->_trAuthenticationTotalSecs + self->_amsOptimizationSecs) * 1000.0));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v36;
    v43[7] = CFSTR("iTunesAuthMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iTunesAuthMs * 1000.0));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[7] = v35;
    v43[8] = CFSTR("iCloudAuthMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iCloudAuthMs * 1000.0));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[8] = v33;
    v43[9] = CFSTR("basicConfigMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_basicConfigSecs * 1000.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[9] = v32;
    v43[10] = CFSTR("bonjourTestMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_wifiBonjourTestSecs * 1000.0));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[10] = v31;
    v43[11] = CFSTR("finishMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_finishSecs * 1000.0));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[11] = v30;
    v43[12] = CFSTR("homeKitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitSetupSecs * 1000.0));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[12] = v29;
    v43[13] = CFSTR("homeKitHDSMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitHDSMs * 1000.0));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[13] = v28;
    v43[14] = CFSTR("iTunesWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_iTunesWaitSecs * 1000.0));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[14] = v27;
    v43[15] = CFSTR("mediaSystemWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_mediaSystemWaitSecs * 1000.0));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[15] = v26;
    v43[16] = CFSTR("netMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", ((self->_wifiSetupSecs + self->_reachabilitySecs) * 1000.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[16] = v25;
    v43[17] = CFSTR("pairMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_pairSetupSecs * 1000.0));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[17] = v24;
    v43[18] = CFSTR("setupConfigMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_trSetupConfigurationSecs * 1000.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[18] = v23;
    v43[19] = CFSTR("totalMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_totalSecs * 1000.0));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[19] = v22;
    v43[20] = CFSTR("wifiMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_wifiSetupStepSecs * 1000.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[20] = v21;
    v43[21] = CFSTR("setupDeviceNonUserMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_setupDeviceSecs * 1000.0));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[21] = v20;
    v43[22] = CFSTR("addDeviceMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_addDeviceSecs * 1000.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44[22] = v19;
    v43[23] = CFSTR("assignRoomMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_assignRoomSecs * 1000.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[23] = v18;
    v43[24] = CFSTR("personalRequestsMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_personalRequestSecs * 1000.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[24] = v17;
    v43[25] = CFSTR("ulhNonUserMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_ulhNonUserWaitSecs * 1000.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44[25] = v7;
    v43[26] = CFSTR("odeonStepMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_odeonSecs * 1000.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44[26] = v8;
    v43[27] = CFSTR("reachabilityMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_reachabilitySecs * 1000.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[27] = v9;
    v43[28] = CFSTR("setupUntilConfiguringMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v6 * 1000.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44[28] = v10;
    v43[29] = CFSTR("odeonState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_odeonState);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    deviceModel = CFSTR("?");
    if (self->_deviceModel)
      deviceModel = (const __CFString *)self->_deviceModel;
    v44[29] = v11;
    v44[30] = deviceModel;
    v43[30] = CFSTR("setupDeviceModel");
    v43[31] = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4 == 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[31] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addEntriesFromDictionary:", v15);

    if (self->_cdpEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_cdpSetupSecs * 1000.0));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v16, CFSTR("cdpSetupMs"));

    }
    HDSMetricsLog(CFSTR("com.apple.HomeDeviceSetupPerformance"), v34);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_logHomeKitPerformanceMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[13];
  _QWORD v18[15];

  v18[13] = *MEMORY[0x24BDAC8D0];
  if (!self->_testFlags)
  {
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("sessionID");
    v18[0] = v16;
    v17[1] = CFSTR("homeKitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitSetupSecs * 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v15;
    v17[2] = CFSTR("homeKitHDSMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitHDSMs * 1000.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    v17[3] = CFSTR("setupDeviceNonUserMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_setupDeviceSecs * 1000.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v13;
    v17[4] = CFSTR("addDeviceMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_addDeviceSecs * 1000.0));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = v3;
    v17[5] = CFSTR("assignRoomMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_assignRoomSecs * 1000.0));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = v4;
    v17[6] = CFSTR("personalRequestsMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_personalRequestSecs * 1000.0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[6] = v5;
    v17[7] = CFSTR("ulhNonUserMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_ulhNonUserWaitSecs * 1000.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[7] = v6;
    v17[8] = CFSTR("odeonStepMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_odeonSecs * 1000.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[8] = v7;
    v17[9] = CFSTR("nonUserWaitMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_nonUserWaitSecs * 1000.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[9] = v8;
    v17[10] = CFSTR("hkDataSyncMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitDataSyncSecs * 1000.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[10] = v9;
    v17[11] = CFSTR("stereoPairMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_stereoPairSecs * 1000.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[11] = v10;
    v17[12] = CFSTR("hkAccessoryDataSyncMs");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_homeKitAccessoryDataSyncSecs * 1000.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[12] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HDSMetricsLog(CFSTR("com.apple.HDSHomeKitPerformance"), v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)logMetricsForDismissal:(id)a3 dismissType:(int)a4 cardName:(id)a5 cardDuration:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  NSString *deviceModel;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v7 = *(_QWORD *)&a4;
  v26[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (!self->_testFlags)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v24 = objc_msgSend(v9, "code");
    -[NSUUID UUIDString](self->_sessionID, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v25[0] = CFSTR("cardDuration");
    v13 = (void *)MEMORY[0x24BDD16E0];
    mach_absolute_time();
    UpTicksToSecondsF();
    objc_msgSend(v13, "numberWithUnsignedInt:", (v14 * 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v25[1] = CFSTR("dismissType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v16;
    v25[2] = CFSTR("totalDuration");
    v17 = (void *)MEMORY[0x24BDD16E0];
    mach_absolute_time();
    UpTicksToSecondsF();
    objc_msgSend(v17, "numberWithUnsignedInt:", (v18 * 1000.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = CFSTR("sessionID");
    v26[2] = v19;
    v26[3] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v20);

    if (v10)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("cardName"));
    deviceModel = self->_deviceModel;
    if (deviceModel)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", deviceModel, CFSTR("homePodModel"));
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("errorCode"));

      objc_msgSend(v9, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("errorDomain"));

    }
    HDSMetricsLog(CFSTR("com.apple.HomeDeviceSetup.cardDismiss"), v12);
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_promptForPINWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  const __CFString *v6;
  NSString *apcPasscode;
  NSString *v8;
  NSString *p_isa;
  int v10;
  const __CFString *v11;
  OS_dispatch_source *apcTimer;
  NSObject *v13;
  OS_dispatch_source *v14;
  void (**promptForPINHandler)(id, const __CFString *, _QWORD);
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;

  v4 = *(_QWORD *)&a4;
  v6 = (const __CFString *)(self->_pairSetupFlags | a3);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v17 = &unk_22F7A1F71;
    v18 = v4;
    v16 = v6;
    LogPrintF();
  }
  if ((self->_pairSetupFlags & 0x800) != 0)
  {
    if ((int)v4 > 0 || (v6 & 0x10000) != 0)
    {
      apcPasscode = self->_apcPasscode;
      self->_apcPasscode = 0;

    }
    v8 = self->_apcPasscode;
    p_isa = v8;
    if (v8)
    {
      v19 = (const __CFString *)v8;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v10 = IsAppleInternalBuild();
        v11 = CFSTR("*");
        if (v10)
          v11 = v19;
        v16 = v11;
        LogPrintF();
      }
      -[SFSession pairSetupTryPIN:](self->_sfSession, "pairSetupTryPIN:", v19, v16, v17, v18);
      p_isa = &v19->isa;
    }
    else
    {
      apcTimer = self->_apcTimer;
      if (apcTimer)
      {
        v13 = apcTimer;
        dispatch_source_cancel(v13);
        v14 = self->_apcTimer;
        self->_apcTimer = 0;

        p_isa = 0;
      }
      self->_apcTryingPasscode = 0;
    }

  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    promptForPINHandler = (void (**)(id, const __CFString *, _QWORD))self->_promptForPINHandler;
    if (promptForPINHandler)
      promptForPINHandler[2](promptForPINHandler, v6, v4);
  }
}

- (BOOL)_recognizeVoiceAlreadyEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v15;

  -[HDSSetupSession selectedHome](self, "selectedHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userSettingsForHome:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "rootGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = 0;
      goto LABEL_8;
    }
    -[HDSSetupSession _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", CFSTR("root.siri.identifyVoice"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFGetInt64();

      if (v12)
      {
        v13 = 1;
LABEL_7:

LABEL_8:
LABEL_9:

        goto LABEL_10;
      }
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v10, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else if (gLogCategory_HDSSetupSession <= 30
           && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = 0;
    goto LABEL_7;
  }
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)_startSysDropSysdiagnoseRequest:(id)a3
{
  id v4;
  void *v5;
  SFSession *sfSession;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  sfSession = self->_sfSession;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HDSSetupSession__startSysDropSysdiagnoseRequest___block_invoke;
  v8[3] = &unk_24FCD5440;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("sysdrop_sys_start"), &unk_24FCE3DB8, v5, v8);

}

void __51__HDSSetupSession__startSysDropSysdiagnoseRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_startSysDropMode:", *(_QWORD *)(a1 + 40));

}

- (void)_startSysDropMode:(id)a3
{
  SysDropSession *sysDropSession;
  id v5;

  sysDropSession = self->_sysDropSession;
  v5 = a3;
  -[SysDropSession setStartedFromSetup:](sysDropSession, "setStartedFromSetup:", 1);
  -[SysDropSession setSetupError:](self->_sysDropSession, "setSetupError:", v5);

  -[SysDropSession setSfSession:](self->_sysDropSession, "setSfSession:", self->_sfSession);
  -[SysDropSession activate](self->_sysDropSession, "activate");
}

- (BOOL)_isPreflightError:(id)a3
{
  int v3;
  BOOL result;

  v3 = NSErrorToOSStatus();
  result = 1;
  if ((v3 - 301000) > 0x1B || ((1 << (v3 + 56)) & 0x8160C61) == 0)
    return v3 == -71138;
  return result;
}

- (void)_reportError:(id)a3 label:(id)a4
{
  void *v4;
  id v6;
  id v8;
  id v9;
  int v10;
  double v11;
  NSDictionary *additionalMetrics;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**progressHandler)(id, uint64_t, void *);
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v6 = a3;
  v31[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = gLogCategory_HDSSetupSession;
  if (gLogCategory_HDSSetupSession <= 30)
  {
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
    {
      -[SFSession identifier](self->_sfSession, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v10 = gLogCategory_HDSSetupSession;
  }
  if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  FPrintF();
  if (!self->_mainError)
    objc_storeStrong((id *)&self->_mainError, v6);
  if (self->_totalSecs == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_totalSecs = v11;
  }
  if (objc_msgSend(v8, "code", v9, v8) != -6723)
  {
    if (!self->_logMetricsCalled)
    {
      self->_logMetricsCalled = 1;
      -[HDSSetupSession _logMetrics:](self, "_logMetrics:", v8);
      -[HDSSetupSession _logErrorMetrics:inLabel:](self, "_logErrorMetrics:inLabel:", v8, v9);
      -[HDSSetupSession _logUsageMetrics:](self, "_logUsageMetrics:", v8);
      -[HDSSetupSession _logPerformanceMetrics:](self, "_logPerformanceMetrics:", v8);
      -[HDSSetupSession _logHomeKitPerformanceMetrics](self, "_logHomeKitPerformanceMetrics");
      additionalMetrics = self->_additionalMetrics;
      if (additionalMetrics)
        v13 = (id)-[NSDictionary mutableCopy](additionalMetrics, "mutableCopy");
      else
        v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v6 = v13;
      v31[0] = v9;
      v30[0] = CFSTR("label");
      v30[1] = CFSTR("errDomain");
      objc_msgSend(v8, "domain");
      v14 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v14;
      v15 = CFSTR("?");
      if (v14)
        v15 = (const __CFString *)v14;
      v31[1] = v15;
      v30[2] = CFSTR("errCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "code"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v16;
      v30[3] = CFSTR("totalMs");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_totalSecs * 1000.0));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v18);

      HDSMetricsLog(CFSTR("com.apple.sharing.ASSetupError"), v6);
    }
    if (isInternalBuild()
      && self->_homePodSysDropCapable
      && _os_feature_enabled_impl()
      && (v6 = (id)0x24FCD3000, +[HDSDefaults sysDropEnabled](HDSDefaults, "sysDropEnabled"))
      && !-[SysDropSession sysDropActivated](self->_sysDropSession, "sysDropActivated")
      && !self->_isCLIMode
      && !self->_isConnectionError
      && (!-[HDSSetupSession _isPreflightError:](self, "_isPreflightError:", v8)
       || +[HDSDefaults sysDropForceErrorEarlyEnabled](HDSDefaults, "sysDropForceErrorEarlyEnabled")
       && objc_msgSend(v8, "code") == 301006))
    {
      -[HDSSetupSession _startSysDropSysdiagnoseRequest:](self, "_startSysDropSysdiagnoseRequest:", v8);
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SysDropSession setSysDropFailed:](self->_sysDropSession, "setSysDropFailed:", 1);
      -[HDSSetupSession _cleanupSession](self, "_cleanupSession");
      progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
      if (progressHandler)
      {
        v28 = CFSTR("eo");
        v20 = v8;
        if (!v8)
        {
          v21 = (void *)MEMORY[0x24BDD1540];
          v22 = *MEMORY[0x24BDD1100];
          v26 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
          v23 = objc_claimAutoreleasedReturnValue();
          v6 = (id)v23;
          v24 = CFSTR("?");
          if (v23)
            v24 = (const __CFString *)v23;
          v27 = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, -6700, v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v29 = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        progressHandler[2](progressHandler, 30, v25);

        if (!v8)
        {

        }
      }
    }
  }

}

- (void)_setupAudio
{
  AVAudioSession *v3;
  AVAudioSession *audioSession;
  AVAudioSession *v5;
  int v6;
  id v7;
  const char *v8;
  AVAudioSession *v9;
  void *v10;
  BOOL v11;
  char *v12;
  AVAudioSession *v13;
  void *v14;
  BOOL v15;
  char *v16;
  AVAudioSession *v17;
  BOOL v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  AVAudioPlayer *v25;
  char *v26;
  AVAudioPlayer *audioPlayerStart;
  void *v28;
  id v29;
  AVAudioPlayer *v30;
  char *v31;
  AVAudioPlayer *audioPlayerStep;
  const char *v33;
  char *v34;
  uint64_t v35;
  id v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  id v41;
  id v42;

  objc_msgSend((Class)getAVAudioSessionClass[0](), "sharedInstance");
  v3 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  audioSession = self->_audioSession;
  self->_audioSession = v3;

  v5 = self->_audioSession;
  v42 = 0;
  v6 = -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](v5, "setEligibleForBTSmartRoutingConsideration:error:", 0, &v42);
  v7 = v42;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    v8 = "no";
    if (v6)
      v8 = "yes";
    v33 = v8;
    v36 = v7;
    LogPrintF();
  }
  v9 = self->_audioSession;
  getAVAudioSessionCategoryAmbient[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v11 = -[AVAudioSession setCategory:error:](v9, "setCategory:error:", v10, &v41);
  v12 = (char *)v41;

  if (!v11)
  {
    -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v12, CFSTR("PreSetup-SetupAudio"));
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v33 = v12;
      LogPrintF();
    }
  }
  v13 = self->_audioSession;
  getAVAudioSessionModeDefault[0]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  v15 = -[AVAudioSession setMode:error:](v13, "setMode:error:", v14, &v40);
  v16 = v40;

  if (!v15)
  {
    -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v16, CFSTR("PreSetup-SetupAudio"));
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v33 = v16;
      LogPrintF();
    }
  }
  v17 = self->_audioSession;
  v39 = v16;
  v18 = -[AVAudioSession setActive:error:](v17, "setActive:error:", 1, &v39, v33, v36);
  v19 = v39;

  if (!v18)
  {
    -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v19, CFSTR("PreSetup-SetupAudio"));
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v34 = v19;
      LogPrintF();
    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionInterruptionNotification[0]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_audioSessionInterrupted_, v21, self->_audioSession);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HomeDeviceSetup"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLForResource:withExtension:", CFSTR("HomePodSetupSource1-b238.m4a"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = objc_alloc((Class)getAVAudioPlayerClass[0]());
    v38 = v19;
    v25 = (AVAudioPlayer *)objc_msgSend(v24, "initWithContentsOfURL:error:", v23, &v38);
    v26 = v38;

    audioPlayerStart = self->_audioPlayerStart;
    self->_audioPlayerStart = v25;

    -[AVAudioPlayer setDelegate:](self->_audioPlayerStart, "setDelegate:", self);
    -[AVAudioPlayer prepareToPlay](self->_audioPlayerStart, "prepareToPlay");
    if (!self->_audioPlayerStart)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v26, CFSTR("PreSetup-SetupAudio"), v26);
      }
      else
      {
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v26, CFSTR("PreSetup-SetupAudio"), v35);
      }
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v26 = v19;
  }
  objc_msgSend(v22, "URLForResource:withExtension:", CFSTR("HomePodSetupSource2-b238.m4a"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_alloc((Class)getAVAudioPlayerClass[0]());
    v37 = v26;
    v30 = (AVAudioPlayer *)objc_msgSend(v29, "initWithContentsOfURL:error:", v28, &v37);
    v31 = v37;

    audioPlayerStep = self->_audioPlayerStep;
    self->_audioPlayerStep = v30;

    -[AVAudioPlayer setDelegate:](self->_audioPlayerStep, "setDelegate:", self);
    -[AVAudioPlayer prepareToPlay](self->_audioPlayerStep, "prepareToPlay");
    if (!self->_audioPlayerStep)
    {
      if (gLogCategory_HDSSetupSession <= 60
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v31, CFSTR("PreSetup-SetupAudio"), v31);
      }
      else
      {
        -[HDSSetupSession _logMetricsForSoftError:label:](self, "_logMetricsForSoftError:label:", v31, CFSTR("PreSetup-SetupAudio"), v35);
      }
    }
  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 60
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v31 = v26;
  }

}

- (unint64_t)_peerDeviceSupportedStereoPairVersions
{
  if (-[SFDevice deviceModelCode](self->_peerDevice, "deviceModelCode") == 5)
    return 2;
  if (-[SFDevice deviceModelCode](self->_peerDevice, "deviceModelCode") != 6)
    return 1;
  if (-[SFDevice deviceType](self->_peerDevice, "deviceType") == 2)
    return 8;
  return 4;
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  HDSSetupSession *v10;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HDSSetupSession_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  v8[3] = &unk_24FCD4290;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

void __56__HDSSetupSession_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_logMetricsForSoftError:label:", v2, CFSTR("SecureConnection-AudioPasscode"));
    if (gLogCategory_HDSSetupSession > 60)
      goto LABEL_10;
    if (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_HDSSetupSession <= 60
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_10:
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = 0;

  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HDSSetupSession_audioPlayerDidFinishPlaying_successfully___block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __60__HDSSetupSession_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

  }
}

- (void)audioSessionInterrupted:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HDSSetupSession_audioSessionInterrupted___block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __43__HDSSetupSession_audioSessionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

  }
}

- (void)forcePassCode:(id)a3
{
  NSString *v4;
  NSString *forcedPasscode;
  id v6;

  v6 = a3;
  if (IsAppleInternalBuild())
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    forcedPasscode = self->_forcedPasscode;
    self->_forcedPasscode = v4;

  }
}

- (void)forceCLIPassCode:(id)a3
{
  NSString *v4;
  NSString *forcedCLIPasscode;
  id v6;

  v6 = a3;
  if (IsAppleInternalBuild())
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    forcedCLIPasscode = self->_forcedCLIPasscode;
    self->_forcedCLIPasscode = v4;

  }
}

- (void)cancelSoftwareUpdateNoSetup
{
  id v3;
  SFSession *sfSession;
  _QWORD v5[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodSoftwareUpdateCancelled && self->_homePodSoftwareUpdateUpdateInstalled)
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_homePodSoftwareUpdateCancelled = 1;
    sfSession = self->_sfSession;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke;
    v5[3] = &unk_24FCD4618;
    v5[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("unsetup_hp_sunosetup_cancel_su"), &unk_24FCE3DE0, v3, v5);
  }

}

void __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 1488);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke_2;
  v15[3] = &unk_24FCD43D0;
  v16 = v8;
  v17 = v7;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __46__HDSSetupSession_cancelSoftwareUpdateNoSetup__block_invoke_2(uint64_t a1)
{
  uint64_t Int64;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1325) = 0;
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 48), "_reportError:label:", *(_QWORD *)(a1 + 40), CFSTR("SUBS purge error"));
  }
  else
  {
    Int64 = CFDictionaryGetInt64();
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      v5 = *(_QWORD *)(a1 + 56);
      LogPrintF();
    }
    if (Int64)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1325) = 0;
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1, v5, CFSTR("spe"), CFSTR("unsetup_hp_su_applying"), &unk_24FCE3FE0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[1] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "_handlePeerEvent:flags:", v4, 0);
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 48), "homePodSoftwareUpdateNonSetupDidComplete");
    }
  }
}

- (BOOL)isJSEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  id v12;

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodCapableOfJS)
  {
    -[HDSSetupSession selectedHome](self, "selectedHome");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        v11 = objc_msgSend(v3, "siriPhraseOptions");
        LogPrintF();
      }
      -[HDSSetupSession _homePodsInSelectedHome](self, "_homePodsInSelectedHome", v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = objc_msgSend(v3, "siriPhraseOptions") != 1;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        objc_msgSend((Class)getVTPreferencesClass_0[0](), "sharedPreferences");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v8 = objc_msgSend(v7, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, &v12);
        v9 = v12;

        v6 = v8 != 0;
        if (gLogCategory_HDSSetupSession <= 30
          && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

      }
    }
    else
    {
      if (gLogCategory_HDSSetupSession <= 30
        && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = 0;
    }

  }
  else
  {
    if (gLogCategory_HDSSetupSession <= 30
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 0;
  }
  return v6;
}

- (void)startAirDropSysdiagnose
{
  -[SysDropSession startAirDropSysdiagnose](self->_sysDropSession, "startAirDropSysdiagnose");
}

- (BOOL)isCompanionSiriLanguageSupportedByHomePod
{
  return -[NSArray count](self->_siriLanguageCodes, "count") == 0;
}

- (BOOL)_isVoiceRecognitionSupported
{
  void *v3;
  NSArray *multiUserSupportedLanguages;
  NSArray *v5;
  NSArray *v6;
  BOOL v7;

  -[HDSSetupSession selectedSiriLanguageCode](self, "selectedSiriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  multiUserSupportedLanguages = self->_multiUserSupportedLanguages;
  if (multiUserSupportedLanguages)
  {
    v5 = multiUserSupportedLanguages;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v3)
    v7 = -[NSArray containsObject:](v5, "containsObject:", v3);
  else
    v7 = 0;
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v7;
}

- (void)loadMultiUserSupportedLanguages
{
  id v3;
  _QWORD v4[5];

  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = objc_alloc_init((Class)getAFSettingsConnectionClass_0[0]());
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke;
  v4[3] = &unk_24FCD5270;
  v4[4] = self;
  objc_msgSend(v3, "fetchSupportedMultiUserLanguageCodes:", v4);

}

void __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (gLogCategory_HDSSetupSession <= 90
      && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1488);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke_2;
    block[3] = &unk_24FCD4290;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    dispatch_async(v7, block);

  }
}

void __50__HDSSetupSession_loadMultiUserSupportedLanguages__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupSession <= 30
    && (gLogCategory_HDSSetupSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 512), *(id *)(a1 + 32));
}

- (BOOL)acceptedMusicTerms
{
  return self->_acceptedMusicTerms;
}

- (void)setAcceptedMusicTerms:(BOOL)a3
{
  self->_acceptedMusicTerms = a3;
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (void)setAdditionalMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (NSArray)availableHomes
{
  return self->_availableHomes;
}

- (void)setAvailableHomes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1464);
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (BOOL)isHPApp
{
  return self->_isHPApp;
}

- (void)setIsHPApp:(BOOL)a3
{
  self->_isHPApp = a3;
}

- (BOOL)delayForOdeonStereoPair
{
  return self->_delayForOdeonStereoPair;
}

- (void)setDelayForOdeonStereoPair:(BOOL)a3
{
  self->_delayForOdeonStereoPair = a3;
}

- (unint64_t)delayForOdeonStereoPairSeconds
{
  return self->_delayForOdeonStereoPairSeconds;
}

- (void)setDelayForOdeonStereoPairSeconds:(unint64_t)a3
{
  self->_delayForOdeonStereoPairSeconds = a3;
}

- (NSString)appleIDPassword
{
  return self->_appleIDPassword;
}

- (void)setAppleIDPassword:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDPassword, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)hasExistingHomePodInAccount
{
  return self->_hasExistingHomePodInAccount;
}

- (void)setHasExistingHomePodInAccount:(BOOL)a3
{
  self->_hasExistingHomePodInAccount = a3;
}

- (BOOL)hasExistingHomePod
{
  return self->_hasExistingHomePod;
}

- (void)setHasExistingHomePod:(BOOL)a3
{
  self->_hasExistingHomePod = a3;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)liveOn
{
  return self->_liveOn;
}

- (void)setLiveOn:(BOOL)a3
{
  self->_liveOn = a3;
}

- (int)homePodProductVersion
{
  return self->_homePodProductVersion;
}

- (void)setHomePodProductVersion:(int)a3
{
  self->_homePodProductVersion = a3;
}

- (int)homePodSUState
{
  return self->_homePodSUState;
}

- (void)setHomePodSUState:(int)a3
{
  self->_homePodSUState = a3;
}

- (NSError)mainError
{
  return self->_mainError;
}

- (void)setMainError:(id)a3
{
  objc_storeStrong((id *)&self->_mainError, a3);
}

- (BOOL)pauseAfterPreAuth
{
  return self->_pauseAfterPreAuth;
}

- (void)setPauseAfterPreAuth:(BOOL)a3
{
  self->_pauseAfterPreAuth = a3;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_peerFeatureFlags = a3;
}

- (NSDictionary)preAuthResponse
{
  return self->_preAuthResponse;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingChildViewController, a3);
}

- (unsigned)stereoCounterpartColor
{
  return self->_stereoCounterpartColor;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (BOOL)touchRemoteEnabled
{
  return self->_touchRemoteEnabled;
}

- (void)setTouchRemoteEnabled:(BOOL)a3
{
  self->_touchRemoteEnabled = a3;
}

- (BOOL)userOptedToHH2
{
  return self->_userOptedToHH2;
}

- (void)setUserOptedToHH2:(BOOL)a3
{
  self->_userOptedToHH2 = a3;
}

- (BOOL)homePodSoftwareUpdateNonSetupWasCompleted
{
  return self->_homePodSoftwareUpdateNonSetupWasCompleted;
}

- (void)setHomePodSoftwareUpdateNonSetupWasCompleted:(BOOL)a3
{
  self->_homePodSoftwareUpdateNonSetupWasCompleted = a3;
}

- (BOOL)forceSoftwareUpdateForADP
{
  return self->_forceSoftwareUpdateForADP;
}

- (void)setForceSoftwareUpdateForADP:(BOOL)a3
{
  self->_forceSoftwareUpdateForADP = a3;
}

- (BOOL)homePodIsSUNoSetup
{
  return self->_homePodIsSUNoSetup;
}

- (void)setHomePodIsSUNoSetup:(BOOL)a3
{
  self->_homePodIsSUNoSetup = a3;
}

- (BOOL)homePodCanSUNoSetup
{
  return self->_homePodCanSUNoSetup;
}

- (void)setHomePodCanSUNoSetup:(BOOL)a3
{
  self->_homePodCanSUNoSetup = a3;
}

- (BOOL)homePodSaysNeedsSUNoSetup
{
  return self->_homePodSaysNeedsSUNoSetup;
}

- (void)setHomePodSaysNeedsSUNoSetup:(BOOL)a3
{
  self->_homePodSaysNeedsSUNoSetup = a3;
}

- (double)homePodSUNoSetupEstTime
{
  return self->_homePodSUNoSetupEstTime;
}

- (void)setHomePodSUNoSetupEstTime:(double)a3
{
  self->_homePodSUNoSetupEstTime = a3;
}

- (int)homePodSUNoSetupState
{
  return self->_homePodSUNoSetupState;
}

- (void)setHomePodSUNoSetupState:(int)a3
{
  self->_homePodSUNoSetupState = a3;
}

- (SysDropSession)sysDropSession
{
  return self->_sysDropSession;
}

- (void)setSysDropSession:(id)a3
{
  objc_storeStrong((id *)&self->_sysDropSession, a3);
}

- (id)preAuthHandler
{
  return self->_preAuthHandler;
}

- (void)setPreAuthHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1568);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1576);
}

- (id)promptForAppleMusicHandler
{
  return self->_promptForAppleMusicHandler;
}

- (void)setPromptForAppleMusicHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1584);
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1592);
}

- (id)promptForHomeiCloudHandler
{
  return self->_promptForHomeiCloudHandler;
}

- (void)setPromptForHomeiCloudHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1600);
}

- (id)promptForiTunesSignInHandler
{
  return self->_promptForiTunesSignInHandler;
}

- (void)setPromptForiTunesSignInHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1608);
}

- (id)promptForLocationAlreadyEnabledHandler
{
  return self->_promptForLocationAlreadyEnabledHandler;
}

- (void)setPromptForLocationAlreadyEnabledHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1616);
}

- (id)promptForLocationEnableHandler
{
  return self->_promptForLocationEnableHandler;
}

- (void)setPromptForLocationEnableHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1624);
}

- (id)promptForPersonalRequestsHandler
{
  return self->_promptForPersonalRequestsHandler;
}

- (void)setPromptForPersonalRequestsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1632);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1640);
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1648);
}

- (id)promptForSiriEnableHandler
{
  return self->_promptForSiriEnableHandler;
}

- (void)setPromptForSiriEnableHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1656);
}

- (id)promptForSiriVoiceSelectionHandler
{
  return self->_promptForSiriVoiceSelectionHandler;
}

- (void)setPromptForSiriVoiceSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1664);
}

- (id)promptForSetupCompletionHandler
{
  return self->_promptForSetupCompletionHandler;
}

- (void)setPromptForSetupCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1672);
}

- (id)promptForSoundRecognitionHandler
{
  return self->_promptForSoundRecognitionHandler;
}

- (void)setPromptForSoundRecognitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1680);
}

- (id)promptForVoiceRecognitionHandler
{
  return self->_promptForVoiceRecognitionHandler;
}

- (void)setPromptForVoiceRecognitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1688);
}

- (id)promptForAutomaticSoftwareUpdateHandler
{
  return self->_promptForAutomaticSoftwareUpdateHandler;
}

- (void)setPromptForAutomaticSoftwareUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1696);
}

- (id)promptForSoftwareUpdateHandler
{
  return self->_promptForSoftwareUpdateHandler;
}

- (void)setPromptForSoftwareUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1704);
}

- (id)promptForTermsHandler
{
  return self->_promptForTermsHandler;
}

- (void)setPromptForTermsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1712);
}

- (id)promptForHomePodSoftwareUpdateNonSetupAck
{
  return self->_promptForHomePodSoftwareUpdateNonSetupAck;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupAck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1720);
}

- (id)promptForHomePodSoftwareUpdateNonSetupCompleted
{
  return self->_promptForHomePodSoftwareUpdateNonSetupCompleted;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1728);
}

- (id)promptForHomePodSoftwareUpdateNonSetupCancelled
{
  return self->_promptForHomePodSoftwareUpdateNonSetupCancelled;
}

- (void)setPromptForHomePodSoftwareUpdateNonSetupCancelled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1736);
}

- (id)promptForTermsAndConditionsV2Disagree
{
  return self->_promptForTermsAndConditionsV2Disagree;
}

- (void)setPromptForTermsAndConditionsV2Disagree:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1744);
}

- (id)promptForCaptiveNetworkHandler
{
  return self->_promptForCaptiveNetworkHandler;
}

- (void)setPromptForCaptiveNetworkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1752);
}

- (id)promptForTVAudioHandler
{
  return self->_promptForTVAudioHandler;
}

- (void)setPromptForTVAudioHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1760);
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1768);
}

- (id)promptToShareSettingsHandler
{
  return self->_promptToShareSettingsHandler;
}

- (void)setPromptToShareSettingsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1776);
}

- (id)promptForSiriLanguageHandler
{
  return self->_promptForSiriLanguageHandler;
}

- (void)setPromptForSiriLanguageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1784);
}

- (id)promptForStereoRoleHandler
{
  return self->_promptForStereoRoleHandler;
}

- (void)setPromptForStereoRoleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1792);
}

- (id)promptForSetupPSGHandler
{
  return self->_promptForSetupPSGHandler;
}

- (void)setPromptForSetupPSGHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1800);
}

- (id)promptForStereoMultipleHandler
{
  return self->_promptForStereoMultipleHandler;
}

- (void)setPromptForStereoMultipleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1808);
}

- (id)deviceColorFoundHandler
{
  return self->_deviceColorFoundHandler;
}

- (void)setDeviceColorFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1816);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceColorFoundHandler, 0);
  objc_storeStrong(&self->_promptForStereoMultipleHandler, 0);
  objc_storeStrong(&self->_promptForSetupPSGHandler, 0);
  objc_storeStrong(&self->_promptForStereoRoleHandler, 0);
  objc_storeStrong(&self->_promptForSiriLanguageHandler, 0);
  objc_storeStrong(&self->_promptToShareSettingsHandler, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForTVAudioHandler, 0);
  objc_storeStrong(&self->_promptForCaptiveNetworkHandler, 0);
  objc_storeStrong(&self->_promptForTermsAndConditionsV2Disagree, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupCancelled, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupCompleted, 0);
  objc_storeStrong(&self->_promptForHomePodSoftwareUpdateNonSetupAck, 0);
  objc_storeStrong(&self->_promptForTermsHandler, 0);
  objc_storeStrong(&self->_promptForSoftwareUpdateHandler, 0);
  objc_storeStrong(&self->_promptForAutomaticSoftwareUpdateHandler, 0);
  objc_storeStrong(&self->_promptForVoiceRecognitionHandler, 0);
  objc_storeStrong(&self->_promptForSoundRecognitionHandler, 0);
  objc_storeStrong(&self->_promptForSetupCompletionHandler, 0);
  objc_storeStrong(&self->_promptForSiriVoiceSelectionHandler, 0);
  objc_storeStrong(&self->_promptForSiriEnableHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForPersonalRequestsHandler, 0);
  objc_storeStrong(&self->_promptForLocationEnableHandler, 0);
  objc_storeStrong(&self->_promptForLocationAlreadyEnabledHandler, 0);
  objc_storeStrong(&self->_promptForiTunesSignInHandler, 0);
  objc_storeStrong(&self->_promptForHomeiCloudHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_promptForAppleMusicHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_preAuthHandler, 0);
  objc_storeStrong((id *)&self->_sysDropSession, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_preAuthResponse, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_mainError, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleIDPassword, 0);
  objc_storeStrong((id *)&self->_availableHomes, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_wifiSecurityString, 0);
  objc_storeStrong((id *)&self->_wifiOUI, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_roomsInPSG, 0);
  objc_storeStrong((id *)&self->_psgsInSelectedRoom, 0);
  objc_storeStrong((id *)&self->_psgHelper, 0);
  objc_storeStrong((id *)&self->_softwareUpdateController, 0);
  objc_storeStrong((id *)&self->_forcedCLIPasscode, 0);
  objc_storeStrong((id *)&self->_homePodProductVersionString, 0);
  objc_storeStrong((id *)&self->_existingHomepodInSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_bonjourTestOperation, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_deviceBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_multiUserSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_forcedPasscode, 0);
  objc_storeStrong((id *)&self->_apcTimer, 0);
  objc_storeStrong((id *)&self->_apcPasscode, 0);
  objc_storeStrong((id *)&self->_apcListener, 0);
  objc_storeStrong((id *)&self->_companionSiriLanguageCode, 0);
  objc_storeStrong((id *)&self->_siriEnablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_siriEnablementConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedSiriVoice, 0);
  objc_storeStrong((id *)&self->_selectedSiriLanguageCode, 0);
  objc_storeStrong((id *)&self->_siriLanguageCodes, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_potentialTVs, 0);
  objc_storeStrong((id *)&self->_stereoCounterpartAccessory, 0);
  objc_storeStrong((id *)&self->_potentialStereoCounterparts, 0);
  objc_storeStrong((id *)&self->_appleMusicTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_iTunesUserID, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iCloudUserID, 0);
  objc_storeStrong((id *)&self->_iCloudAccount, 0);
  objc_storeStrong((id *)&self->_iCloudAccountStore, 0);
  objc_storeStrong(&self->_audioPlayerCompletion, 0);
  objc_storeStrong((id *)&self->_audioPlayerStep, 0);
  objc_storeStrong((id *)&self->_audioPlayerStart, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
}

@end
