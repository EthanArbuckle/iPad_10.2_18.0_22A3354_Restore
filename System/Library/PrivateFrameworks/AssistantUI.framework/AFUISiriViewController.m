@implementation AFUISiriViewController

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4
{
  return -[AFUISiriViewController initWithConnection:configuration:requestSource:](self, "initWithConnection:configuration:requestSource:", a3, a4, 0);
}

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  AFUISiriViewController *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = -[AFUISiriViewController initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:](self, "initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:", v9, v8, a5, 0, 0, v10);

  return v11;
}

- (AFUISiriViewController)initWithConnection:(id)a3 configuration:(id)a4 requestSource:(int64_t)a5 displayConfiguration:(id)a6 edgeLightViewProvider:(id)a7 instrumentationHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  AFUISiriViewController *v19;
  AFUISiriViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *remoteViewControllerDispatchQueue;
  AFUISiriSession *v29;
  AFUISiriSession *session;
  uint64_t v31;
  SRUIFDelayedActionCommandCache *delayedActionCommandCache;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *uiAppearanceRecordQueue;
  CGSize v36;
  AFUINetworkAvailabilityStateMachine *v37;
  AFUINetworkAvailabilityStateMachine *networkAvailabilityStateMachine;
  uint64_t v39;
  AFUISiriTapPanDismissalPolicyManager *v40;
  AFUISiriTapPanDismissalPolicyManager *tapPanDismissalPolicyManager;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  SASActivationInstrumentation *activationInstrumentation;
  id v49;
  objc_super v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 buf;
  void *(*v56)(uint64_t);
  void *v57;
  uint64_t *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v49 = a6;
  v16 = a7;
  v17 = a8;
  v18 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[AFUISiriViewController initWithConnection:configuration:requestSource:displayConfi"
                                    "guration:edgeLightViewProvider:instrumentationHandler:]";
    _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v50.receiver = self;
  v50.super_class = (Class)AFUISiriViewController;
  v19 = -[AFUISiriViewController initWithNibName:bundle:](&v50, sel_initWithNibName_bundle_, 0, 0);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_configuration, a4);
    v20->_currentRequestSource = a5;
    objc_storeStrong((id *)&v20->_currentDisplayConfiguration, a6);
    objc_storeWeak((id *)&v20->_edgeLightViewProvider, v16);
    v20->_statusBarStyle = AFDeviceSupportsSystemAssistantExperience() ^ 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, sel__statusBarFrameDidChange_, *MEMORY[0x24BEBDF90], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v20, sel__applicationWillResignActive_, *MEMORY[0x24BEBE010], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v20, sel__applicationWillEnterForeground_, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v20, sel__applicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

    if (-[SASRequestOptions isTypeToSiriRequest](v20->_currentRequestOptions, "isTypeToSiriRequest"))
    {
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v26 = (_QWORD *)getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr;
      v54 = getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr;
      if (!getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v56 = __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke;
        v57 = &unk_24D7A1A28;
        v58 = &v51;
        __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke((uint64_t)&buf);
        v26 = (_QWORD *)v52[3];
      }
      _Block_object_dispose(&v51, 8);
      if (!v26)
        -[AFUISiriViewController initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:].cold.1();
      objc_msgSend(v25, "addObserver:selector:name:object:", v20, sel__willEnterFullScreenScreenshotMode_, *v26, 0);

    }
    v27 = dispatch_queue_create("Siri Remote View Controller Message Queue", 0);
    remoteViewControllerDispatchQueue = v20->_remoteViewControllerDispatchQueue;
    v20->_remoteViewControllerDispatchQueue = (OS_dispatch_queue *)v27;

    dispatch_set_target_queue((dispatch_object_t)v20->_remoteViewControllerDispatchQueue, MEMORY[0x24BDAC9B8]);
    -[AFUISiriViewController _suspendRemoteViewControllerDispatchQueue](v20, "_suspendRemoteViewControllerDispatchQueue");
    -[AFUISiriViewController _beginDelayingPresentation:cancellationHandler:](v20, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_9, 3.0);
    v29 = -[AFUISiriSession initWithConnection:delegateQueue:]([AFUISiriSession alloc], "initWithConnection:delegateQueue:", v14, v20->_remoteViewControllerDispatchQueue);
    session = v20->_session;
    v20->_session = v29;

    -[AFUISiriSession setLocalDataSource:](v20->_session, "setLocalDataSource:", v20);
    -[AFUISiriSession setLocalDelegate:](v20->_session, "setLocalDelegate:", v20);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BEA8638]), "initWithDelegate:", v20);
    delayedActionCommandCache = v20->_delayedActionCommandCache;
    v20->_delayedActionCommandCache = (SRUIFDelayedActionCommandCache *)v31;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create(0, v33);
    uiAppearanceRecordQueue = v20->_uiAppearanceRecordQueue;
    v20->_uiAppearanceRecordQueue = (OS_dispatch_queue *)v34;

    v20->_turnsOnScreenOnAppearance = 1;
    v36 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v20->_hostedPresentationFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v20->_hostedPresentationFrame.size = v36;
    v20->_statusBarDeferralState = 0;
    v20->_requestCancellationReason = 0;
    v20->_requestedBlurVisible = 0;
    v37 = -[AFUINetworkAvailabilityStateMachine initWithDelegate:]([AFUINetworkAvailabilityStateMachine alloc], "initWithDelegate:", v20);
    networkAvailabilityStateMachine = v20->_networkAvailabilityStateMachine;
    v20->_networkAvailabilityStateMachine = v37;

    if (objc_msgSend(v15, "siriViewMode") == 7)
    {
      if (SiriUIDeviceIsPad() && !AFDeviceSupportsSystemAssistantExperience())
      {
        v39 = 0;
      }
      else if (AFDeviceSupportsSystemAssistantExperience())
      {
        v39 = 3;
      }
      else
      {
        v39 = 1;
      }
      v40 = -[AFUISiriTapPanDismissalPolicyManager initWithPolicy:delegate:]([AFUISiriTapPanDismissalPolicyManager alloc], "initWithPolicy:delegate:", v39, v20);
      tapPanDismissalPolicyManager = v20->_tapPanDismissalPolicyManager;
      v20->_tapPanDismissalPolicyManager = v40;

    }
    v20->_hasDonatedDismissalToBiome = 0;
    v20->_immersiveExperienceOn = 0;
    objc_storeStrong((id *)&v20->_viewHostingInstrumentationHandler, a8);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "defaultMessageStream");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_alloc(MEMORY[0x24BE907B8]);
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE907C0]), "initWithAnalyticsStream:", v43);
    v46 = objc_msgSend(v44, "initWithSender:", v45);
    activationInstrumentation = v20->_activationInstrumentation;
    v20->_activationInstrumentation = (SASActivationInstrumentation *)v46;

    v20->_dismissalReason = 0;
  }

  return v20;
}

uint64_t __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 0;
}

- (id)_initForTesting
{
  id v3;
  void *v4;
  AFUISiriViewController *v5;

  v3 = objc_alloc_init(MEMORY[0x24BE09170]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA84F0]), "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", 2, 1, 1, 7, 0);
  v5 = -[AFUISiriViewController initWithConnection:configuration:requestSource:](self, "initWithConnection:configuration:requestSource:", v3, v4, 8);

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  SRUIFDelayedActionCommandCache *delayedActionCommandCache;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  AFUISiriViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AFUISiriViewController dealloc]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  delayedActionCommandCache = self->_delayedActionCommandCache;
  self->_delayedActionCommandCache = 0;

  self->_siriSessionWantsToEnd = 1;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  if (-[SASRequestOptions isTypeToSiriRequest](self->_currentRequestOptions, "isTypeToSiriRequest"))
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

  }
  -[AFUISiriViewController _resumeRemoteViewControllerDispatchQueue](self, "_resumeRemoteViewControllerDispatchQueue");
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController dealloc](&v7, sel_dealloc);
}

- (id)underlyingConnection
{
  void *v2;
  void *v3;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "underlyingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)viewMode
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AFUISiriViewController _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AFUISiriViewController _configuration](self, "_configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "siriViewMode");

  return v5;
}

- (void)setEyesFree:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_eyesFree != a3)
  {
    v3 = a3;
    self->_eyesFree = a3;
    -[AFUISiriViewController _session](self, "_session");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEyesFree:", v3);

  }
}

- (void)setEdgeLightViewProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEdgeLightViewProvider:", v4);

}

- (void)setReceivedIncomingPhoneCall:(BOOL)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *dismissalUserInfo;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_receivedIncomingPhoneCall != a3)
  {
    self->_receivedIncomingPhoneCall = a3;
    SiriUIDismissalReasonStringFromReason();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BEA8560];
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    dismissalUserInfo = self->_dismissalUserInfo;
    self->_dismissalUserInfo = v5;

  }
}

- (void)_setPunchingOut:(BOOL)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *dismissalUserInfo;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_punchingOut != a3)
  {
    self->_punchingOut = a3;
    SiriUIDismissalReasonStringFromReason();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BEA8560];
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    dismissalUserInfo = self->_dismissalUserInfo;
    self->_dismissalUserInfo = v5;

  }
}

- (void)requestStatusBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void (**v8)(id, _QWORD);
  _BOOL4 v9;
  int v10;
  void *v11;
  char v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a5;
  if (_os_feature_enabled_impl()
    || !-[AFUISiriViewController statusBarEnabled](self, "statusBarEnabled")
    || (!-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode")
      ? (-[AFUISiriViewController viewMode](self, "viewMode") != 4
       ? (v9 = -[AFUISiriViewController viewMode](self, "viewMode") == 8)
       : (v9 = 1))
      : (v9 = 0),
        -[AFUISiriViewController viewMode](self, "viewMode") == 7 ? (v10 = 1) : (v10 = v9),
        v6
     && v10
     && (-[AFUISiriViewController _compactSiriView](self, "_compactSiriView"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "shouldRequestStatusBar"),
         v11,
         (v12 & 1) == 0)))
  {
LABEL_19:
    if (v8)
      v8[2](v8, 0);
    goto LABEL_21;
  }
  if (v6)
  {
    if (self->_shouldShowVoiceActivationMaskView)
    {
      v13 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = "-[AFUISiriViewController requestStatusBarVisible:animated:completion:]";
        _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Not showing the status bar as voiceActivationMaskView is visible", (uint8_t *)&v14, 0xCu);
      }
      self->_statusBarDeferralState = 1;
      goto LABEL_19;
    }
    if (self->_showsStatusBar != v6)
    {
      self->_showsStatusBar = v6;
      -[AFUISiriViewController _showStatusBarAnimated:completion:](self, "_showStatusBarAnimated:completion:", v5, v8);
    }
  }
  else if (self->_showsStatusBar)
  {
    self->_showsStatusBar = 0;
    -[AFUISiriViewController _hideStatusBarAnimated:completion:](self, "_hideStatusBarAnimated:completion:", v5, v8);
  }
LABEL_21:

}

- (void)setHostedPresentationFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGRect *p_hostedPresentationFrame;
  double v9;
  double v10;
  BOOL v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_hostedPresentationFrame = &self->_hostedPresentationFrame;
  if (!CGRectEqualToRect(self->_hostedPresentationFrame, a3)
    || ((-[AFUISiriViewController preferredContentSize](self, "preferredContentSize"), width == v10)
      ? (v11 = height == v9)
      : (v11 = 0),
        v11))
  {
    p_hostedPresentationFrame->origin.x = x;
    p_hostedPresentationFrame->origin.y = y;
    p_hostedPresentationFrame->size.width = width;
    p_hostedPresentationFrame->size.height = height;
    -[AFUISiriViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
  }
}

- (BOOL)isProcessingAcousticIdRequest
{
  void *v2;
  char v3;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProcessingAcousticIdRequest");

  return v3;
}

- (void)enterUITrackingMode
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController enterUITrackingMode]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 564, CFSTR("%@ can only be used on the main thread"), v5);

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInUITrackingMode:", 1);

}

- (void)exitUITrackingMode
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController exitUITrackingMode]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 569, CFSTR("%@ can only be used on the main thread"), v5);

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInUITrackingMode:", 0);

}

- (void)proximityStatusChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController proximityStatusChanged:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 574, CFSTR("%@ can only be used on the main thread"), v8);

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInUITrackingMode:", v3);

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisabled:", v3);

}

- (void)cancelSpeechRecordingIfNecessary
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __58__AFUISiriViewController_cancelSpeechRecordingIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_siriView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "siriSessionState");

    WeakRetained = v5;
    if (v3 == 1)
    {
      objc_msgSend(v5, "_session");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancelSpeechRequest");

      WeakRetained = v5;
    }
  }

}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id location;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController animatedAppearanceWithFactory:completion:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 600, CFSTR("%@ can only be used on the main thread"), v18);

  }
  if (-[AFUISiriViewController currentSource](self, "currentSource") != 18
    && -[AFUISiriViewController currentSource](self, "currentSource") != 19)
  {
    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "foregroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackdropVisible:", 0);

  }
  -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetOrbViewToSiriSessionState");

  -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "animateInEdgeLight");
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x24BE0BF08];
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke;
  v21[3] = &unk_24D7A1D90;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke_2;
  v19[3] = &unk_24D7A2188;
  v16 = v8;
  v20 = v16;
  objc_msgSend(v14, "animateWithFactory:actions:completion:", v7, v21, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_compactSiriView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentViewsAlpha:", 1.0);

    objc_msgSend(v7, "_fullSiriView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_siriView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentViewsAlpha:", 1.0);

    objc_msgSend(v4, "foregroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    objc_msgSend(v4, "setBackdropVisible:", 1);
    WeakRetained = v7;
  }

}

uint64_t __67__AFUISiriViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController animatedDisappearanceWithFactory:completion:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 637, CFSTR("%@ can only be used on the main thread"), v18);

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foregroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 1.0);

  -[AFUISiriViewController _setFullScreenDimmingLayerVisible:animated:](self, "_setFullScreenDimmingLayerVisible:animated:", 0, 1);
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestBlurVisible:reason:fence:", 0, 0, 0);

  -[AFUISiriViewController _orbViewControllingView](self, "_orbViewControllingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animateOrbViewToOffWithCompletion:", 0);

  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke;
  v23[3] = &unk_24D7A1D90;
  objc_copyWeak(&v25, &location);
  v14 = v7;
  v24 = v14;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v23);
  v15 = (void *)MEMORY[0x24BE0BF08];
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_2;
  v21[3] = &unk_24D7A1D90;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_3;
  v19[3] = &unk_24D7A2188;
  v16 = v8;
  v20 = v16;
  objc_msgSend(v15, "animateWithFactory:actions:completion:", v14, v21, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_remoteViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(v3, "animatedDisappearanceDidBeginWithDuration:reason:", v4[154]);

    WeakRetained = v4;
  }

}

void __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  CGAffineTransform v15;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_siriView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentViewsAlpha:", 0.0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_fullSiriView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackdropVisible:", 0);

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 1232);
    v9 = v8 == 24 || v8 == 6;
    if (v9 && objc_msgSend(*(id *)(v7 + 1336), "inputType") != 1)
    {
      v10 = objc_loadWeakRetained(v2);
      objc_msgSend(v10, "_compactSiriView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "remoteContentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CGAffineTransformMakeScale(&v15, 0.9, 0.9);
      objc_msgSend(v12, "setTransform:", &v15);

    }
  }
  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "_carPlaySiriView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "animateOutEdgeLight");
}

uint64_t __70__AFUISiriViewController_animatedDisappearanceWithFactory_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFUISiriViewController animatedDisappearanceWithFactory:completion:]_block_invoke_3";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation animated disappearance finished: %@", (uint8_t *)&v8, 0x16u);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)requestStatusBarVisible:(BOOL)a3
{
  -[AFUISiriViewController requestStatusBarVisible:animated:completion:](self, "requestStatusBarVisible:animated:completion:", a3, 0, 0);
}

- (void)_setInFluidDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v3 = a3;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInFluidDismissal:", v3);

  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInFluidDismissal:", v3);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__AFUISiriViewController__setInFluidDismissal___block_invoke;
  v7[3] = &unk_24D7A1C20;
  objc_copyWeak(&v8, &location);
  v9 = v3;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__AFUISiriViewController__setInFluidDismissal___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInFluidDismissal:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setFluidDismissalState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double Height;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  AFUISiriViewController *v37;
  CGAffineTransform v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController setFluidDismissalState:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 696, CFSTR("%@ can only be used on the main thread"), v31);

  }
  if (objc_msgSend(v5, "transitionPhase") != 1)
  {
    if (AFDeviceSupportsSystemAssistantExperience())
      -[AFUISceneHostingViewController setClippingDisabled:](self->_remoteViewController, "setClippingDisabled:", 1);
    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "foregroundContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundBlurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = AFDeviceSupportsSystemAssistantExperience();
      -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
        objc_msgSend(v12, "remoteContentView");
      else
        objc_msgSend(v12, "foregroundContainerView");
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v14;
    }
    if (v5)
    {
      -[AFUISiriViewController _thresholdForBarSwipeDismissal](self, "_thresholdForBarSwipeDismissal");
      v16 = v15;
      objc_msgSend(v5, "contentRect");
      Height = CGRectGetHeight(v44);
      if (v16 <= Height)
      {
        v20 = Height;
        -[AFUISiriViewController _setInFluidDismissal:](self, "_setInFluidDismissal:", 1);
        if (AFDeviceSupportsSystemAssistantExperience())
        {
          if (-[SASRequestOptions inputType](self->_currentRequestOptions, "inputType") != 1)
          {
            -[AFUISiriViewController _homeGestureFractionCompleteFromCurrentYPosition:yPositionAtCompletion:](self, "_homeGestureFractionCompleteFromCurrentYPosition:yPositionAtCompletion:", v20, v16);
            CGAffineTransformMakeScale(&v43, (1.0 - v21) * 0.05 + 0.95, (1.0 - v21) * 0.05 + 0.95);
            objc_msgSend(v7, "setTransform:", &v43);
          }
        }
        else
        {
          objc_initWeak(&location, self);
          v22 = MEMORY[0x24BDAC760];
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke;
          v39[3] = &unk_24D7A1D90;
          objc_copyWeak(&v41, &location);
          v23 = v5;
          v40 = v23;
          +[AFUIUtilities animateUsingSpringWithStiffness:damping:animations:](AFUIUtilities, "animateUsingSpringWithStiffness:damping:animations:", v39, 746.28, 60.1);
          objc_msgSend(v23, "contentRect");
          v24 = CGRectGetHeight(v45);
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bounds");
          v26 = v24 / CGRectGetHeight(v46);

          if (v26 > 0.0)
          {
            CGAffineTransformMakeScale(&v38, v26, v26);
            objc_msgSend(v7, "setTransform:", &v38);
            objc_msgSend(v23, "contentRect");
            UIRectGetCenter();
            objc_msgSend(v7, "setCenter:");
          }
          objc_msgSend(v23, "backgroundWeighting");
          if (v27 < 2.22044605e-16)
          {
            -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "animateOrbViewToOffWithCompletion:", 0);

            v35[0] = v22;
            v35[1] = 3221225472;
            v35[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke_2;
            v35[3] = &unk_24D7A2ED0;
            v36 = v9;
            v37 = self;
            +[AFUIUtilities animateUsingSpringWithStiffness:damping:animations:](AFUIUtilities, "animateUsingSpringWithStiffness:damping:animations:", v35, 194.96, 30.72);

          }
          objc_destroyWeak(&v41);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        -[AFUISiriViewController _setInFluidDismissal:](self, "_setInFluidDismissal:", 0);
        -[AFUISiriViewController _dismissWithReason:](self, "_dismissWithReason:", 6);
        objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logEventWithType:context:", 1450, 0);

      }
      -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fadeOutCurrentAura");

    }
    else
    {
      -[AFUISiriViewController _setInFluidDismissal:](self, "_setInFluidDismissal:", 0);
      v19 = (void *)MEMORY[0x24BEBDB00];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __49__AFUISiriViewController_setFluidDismissalState___block_invoke_3;
      v32[3] = &unk_24D7A2410;
      v32[4] = self;
      v33 = v9;
      v34 = v7;
      objc_msgSend(v19, "performWithoutAnimation:", v32);

    }
  }

}

void __49__AFUISiriViewController_setFluidDismissalState___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_siriView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentWeighting");
  objc_msgSend(v2, "setContentViewsAlpha:");

}

uint64_t __49__AFUISiriViewController_setFluidDismissalState___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "transitionToPrivateStyle:", -2);
  return objc_msgSend(*(id *)(a1 + 40), "_setFullScreenDimmingLayerVisible:animated:", 0, 0);
}

void __49__AFUISiriViewController_setFluidDismissalState___block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  _OWORD v6[3];

  objc_msgSend(a1[4], "_fullSiriView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimBackdropSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "transitionToSettings:", v3);
  v4 = a1[6];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6[0] = *MEMORY[0x24BDBD8B8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v4, "setTransform:", v6);
  objc_msgSend(a1[6], "setAlpha:", 1.0);
  objc_msgSend(a1[6], "frame");
  objc_msgSend(a1[6], "setFrame:", 0.0, 0.0);

}

- (void)noteFluidDismissalCompletedWithSuccess:(BOOL)a3
{
  if (!a3)
    -[AFUISceneHostingViewController setClippingDisabled:](self->_remoteViewController, "setClippingDisabled:", 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (UIView)inputAccessoryView
{
  return 0;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (void)_updateSiriAvailability:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  SiriUIConfiguration *v8;
  SiriUIConfiguration *configuration;
  id v10;

  if (-[AFUISiriViewController _currentSessionAvailabilityState](self, "_currentSessionAvailabilityState") != a3)
    self->_currentSessionAvailabilityState = a3;
  if (-[AFUISiriViewController _currentSessionAvailabilityState](self, "_currentSessionAvailabilityState") == 1
    || -[AFUISiriViewController _currentSessionAvailabilityState](self, "_currentSessionAvailabilityState") == 3)
  {
    -[AFUISiriViewController _configuration](self, "_configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "siriViewMode");

    if (v6 == 7)
    {
      -[AFUISiriViewController _configuration](self, "_configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriViewController _configuration](self, "_configuration");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (SiriUIConfiguration *)objc_msgSend(v7, "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", 0, 1, 0, 0, objc_msgSend(v10, "showsSensitiveUI"));
      configuration = self->_configuration;
      self->_configuration = v8;

    }
  }
}

- (void)loadView
{
  CGRect *p_hostedPresentationFrame;
  void *v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  void *v13;
  int v14;
  void *v15;
  id WeakRetained;
  AFUISiriRemoteContainerView *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_hostedPresentationFrame = &self->_hostedPresentationFrame;
  if (CGRectEqualToRect(self->_hostedPresentationFrame, *MEMORY[0x24BDBF070]))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = p_hostedPresentationFrame->origin.x;
    y = p_hostedPresentationFrame->origin.y;
    width = p_hostedPresentationFrame->size.width;
    height = p_hostedPresentationFrame->size.height;
  }
  -[AFUISiriViewController _configuration](self, "_configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSystemHostedPresentation");

  if (v14)
  {
    -[AFUISiriViewController _configuration](self, "_configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
    +[AFUISiriViewBuilder buildSiriViewForFrame:configuration:dataSource:delegate:siriContentDelegate:edgeLightViewProvider:instrumentationHandler:](AFUISiriViewBuilder, "buildSiriViewForFrame:configuration:dataSource:delegate:siriContentDelegate:edgeLightViewProvider:instrumentationHandler:", v15, self, self, self, WeakRetained, self->_viewHostingInstrumentationHandler, x, y, width, height);
    v17 = (AFUISiriRemoteContainerView *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AFUISiriRemoteContainerView setFlamesViewDeferred:](v17, "setFlamesViewDeferred:", 1);
    if (-[AFUISiriViewController _shouldShowVoiceActivationMaskViewWithSiriView:requestSource:screenOff:connectedToCarPlay:](self, "_shouldShowVoiceActivationMaskViewWithSiriView:requestSource:screenOff:connectedToCarPlay:", v17, self->_currentRequestSource, -[AFUISiriViewController _isDeviceScreenOn](self, "_isDeviceScreenOn") ^ 1, -[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode")))
    {
      v18 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315138;
        v21 = "-[AFUISiriViewController loadView]";
        _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Requesting show - voiceActivationMaskView", (uint8_t *)&v20, 0xCu);
      }
      -[AFUISiriViewController _showVoiceActivationMaskView:](self, "_showVoiceActivationMaskView:", 1);
      -[AFUISiriRemoteContainerView setVoiceActivationMaskViewVisible:](v17, "setVoiceActivationMaskViewVisible:", 1);
    }
    else
    {
      -[AFUISiriViewController _showVoiceActivationMaskView:](self, "_showVoiceActivationMaskView:", 0);
    }
    if (self->_currentRequestSource == 20)
      -[AFUISiriRemoteContainerView setSiriSessionState:](v17, "setSiriSessionState:", 2);
    if (-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode")
      && -[AFUISiriViewController directActionEvent](self, "directActionEvent"))
    {
      -[AFUISiriRemoteContainerView setSiriSessionState:](v17, "setSiriSessionState:", 2);
    }
  }
  else
  {
    v17 = -[AFUISiriRemoteContainerView initWithFrame:]([AFUISiriRemoteContainerView alloc], "initWithFrame:", x, y, width, height);
  }
  -[AFUISiriViewController setView:](self, "setView:", v17);
  v19 = !self->_shouldShowVoiceActivationMaskView
     && !-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode")
     && -[AFUISiriViewController viewMode](self, "viewMode") != 7;
  if (-[AFUISiriViewController isEyesFree](self, "isEyesFree"))
    v19 = v19 & -[AFUISiriRemoteContainerView shouldRequestStatusBar](v17, "shouldRequestStatusBar");
  -[AFUISiriViewController requestStatusBarVisible:](self, "requestStatusBarVisible:", v19);

}

- (BOOL)_shouldShowVoiceActivationMaskViewWithSiriView:(id)a3 requestSource:(int64_t)a4 screenOff:(BOOL)a5 connectedToCarPlay:(BOOL)a6
{
  _BOOL4 v7;
  char v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  BOOL v14;

  v7 = a5;
  v9 = objc_opt_respondsToSelector();
  v10 = _os_feature_enabled_impl();
  v11 = (v10 ^ 1) & v7;
  if (((v10 ^ 1) & 1) == 0 && v7)
  {
    objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "_backlightLuminance") != 1;

  }
  v14 = v11 & !a6;
  if (a4 != 8)
    v14 = 0;
  return (v9 & 1) != 0 && v14;
}

- (void)_showVoiceActivationMaskView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_shouldShowVoiceActivationMaskView = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriViewController:voiceActivationMaskViewIsVisible:", self, v3);

}

- (id)_siriView
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  char isKindOfClass;

  -[AFUISiriViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  -[AFUISiriViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[AFUISiriViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = 0;
    return v5;
  }
LABEL_5:
  -[AFUISiriViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)_statusBarFrameDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  double v14;
  double v15;
  id location;

  v4 = a3;
  -[AFUISiriViewController _statusBar](self, "_statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;

  if (v7 >= v9)
    v10 = v9;
  else
    v10 = v7;
  if (v7 < v9)
    v7 = v9;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__AFUISiriViewController__statusBarFrameDidChange___block_invoke;
  v11[3] = &unk_24D7A3118;
  objc_copyWeak(&v12, &location);
  v13 = *MEMORY[0x24BDBEFB0];
  v14 = v7;
  v15 = v10;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __51__AFUISiriViewController__statusBarFrameDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatusBarFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_showStatusBarAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24[5];
  id location;
  _QWORD v26[5];

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[AFUISiriViewController _statusBarFrame](self, "_statusBarFrame");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  if (!self->_statusBar)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD980]), "initWithFrame:", v7, v8, v9, v10);
    v16 = (_BYTE *)objc_msgSend(MEMORY[0x24BEBD990], "getStatusBarOverrideData");
    if (v16)
    {
      *v16 = 1;
      v16[64] = 1;
    }
    objc_msgSend(v15, "setLocalDataOverrides:", v16);
    -[AFUISiriViewController _setStatusBar:](self, "_setStatusBar:", v15);
    objc_msgSend(v15, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEdgeAntialiasingMask:", 0);

    objc_msgSend(v15, "requestStyle:", self->_statusBarStyle);
    -[AFUISiriViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_statusBar);

  }
  -[AFUISiriViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bringSubviewToFront:", self->_statusBar);

  v20 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke;
  v26[3] = &unk_24D7A1B30;
  v26[4] = self;
  v21 = MEMORY[0x219A0D984](v26);
  v22 = (void *)v21;
  if (v4)
  {
    -[UIStatusBar setAlpha:](self->_statusBar, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v22, v6, 0.3);
  }
  else
  {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
    if (v6)
      v6[2](v6, 1);
  }
  objc_initWeak(&location, self);
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke_2;
  v23[3] = &unk_24D7A3118;
  objc_copyWeak(v24, &location);
  v24[1] = *(id *)&v11;
  v24[2] = *(id *)&v12;
  v24[3] = *(id *)&v13;
  v24[4] = *(id *)&v14;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

void __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __60__AFUISiriViewController__showStatusBarAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatusBarFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)_hideStatusBarAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__AFUISiriViewController__hideStatusBarAnimated_completion___block_invoke;
  v9[3] = &unk_24D7A1B30;
  v9[4] = self;
  v7 = MEMORY[0x219A0D984](v9);
  v8 = (void *)v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, v6, 0.3);
  }
  else
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    if (v6)
      v6[2](v6, 1);
  }

}

void __60__AFUISiriViewController__hideStatusBarAnimated_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_statusBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_removeStatusBar
{
  void *v3;

  -[AFUISiriViewController _statusBar](self, "_statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[AFUISiriViewController _setStatusBar:](self, "_setStatusBar:", 0);
}

- (CGRect)_statusBarFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultHeight");
  v10 = v9;

  -[AFUISiriViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interfaceOrientation");

  v14 = -[AFUISiriViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & (1 << v13);
  if ((unint64_t)(v13 - 3) >= 2 || v14 == 0)
    v16 = v5;
  else
    v16 = v7;
  v17 = 0.0;
  v18 = 0.0;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)didGainAttentionWithEvent:(int64_t)a3
{
  id v4;

  -[AFUISiriViewController _session](self, "_session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didGainAttentionWithEvent:", a3);

}

- (void)didLoseAttentionWithEvent:(int64_t)a3
{
  id v4;

  -[AFUISiriViewController _session](self, "_session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didLoseAttentionWithEvent:", a3);

}

- (void)_applicationWillResignActive:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__AFUISiriViewController__applicationWillResignActive___block_invoke;
  v5[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v6, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __55__AFUISiriViewController__applicationWillResignActive___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationWillResignActive");

}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__AFUISiriViewController__applicationWillEnterForeground___block_invoke;
  v5[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v6, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __58__AFUISiriViewController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationWillEnterForeground");

}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__AFUISiriViewController__applicationDidBecomeActive___block_invoke;
  v5[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v6, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __54__AFUISiriViewController__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationDidBecomeActive");

}

- (void)_willEnterFullScreenScreenshotMode:(id)a3
{
  -[AFUISiriViewController _dismissWithReason:](self, "_dismissWithReason:", 16);
}

- (void)_recordUIAppearance
{
  NSObject *uiAppearanceRecordQueue;
  void *v4;
  NSString *v5;
  NSString *uiAppearanceUUIDString;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  char v16;

  uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___updateContextSiriActiveStatus_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v16 = 1;
  dispatch_async(uiAppearanceRecordQueue, block);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uiAppearanceUUIDString = self->_uiAppearanceUUIDString;
  self->_uiAppearanceUUIDString = v5;

  if (self->_uiAppearanceUUIDString)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_uiAppearanceUUIDString, CFSTR("UUID"));
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[AFUISiriViewController _siriView](self, "_siriView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "mode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("VIEWMODE"));

    if (AFIsInternalInstall())
    {
      -[AFUISiriViewController _session](self, "_session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "siriSessionInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("SESSIONID"));

    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:", 1406, v7);

  _AFUIRecordSiriBeginEndCoreDuetEvent(self->_uiAppearanceRecordQueue, CFSTR("com.apple.siri.ui.begin"), v7);
  _AFUIRecordSiriBeginEndBiomeEvent(self->_uiAppearanceRecordQueue, CFSTR("com.apple.siri.ui.begin"), v7);

}

- (void)_recordUIDismissal
{
  NSObject *uiAppearanceRecordQueue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary **p_dismissalUserInfo;
  void *v9;
  _QWORD block[4];
  char v11;

  uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___updateContextSiriActiveStatus_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v11 = 0;
  dispatch_async(uiAppearanceRecordQueue, block);
  if (!self->_uiAppearanceUUIDString)
  {
    p_dismissalUserInfo = &self->_dismissalUserInfo;
    if (!self->_dismissalUserInfo)
    {
      v4 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_uiAppearanceUUIDString, CFSTR("UUID"));
  if (AFIsInternalInstall())
  {
    -[AFUISiriViewController _session](self, "_session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("SESSIONID"));

  }
  p_dismissalUserInfo = &self->_dismissalUserInfo;
  if (self->_dismissalUserInfo)
  {
    if (v4)
    {
LABEL_9:
      objc_msgSend(v4, "addEntriesFromDictionary:", *p_dismissalUserInfo);
      goto LABEL_10;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 1409, v4);

  _AFUIRecordSiriBeginEndCoreDuetEvent(self->_uiAppearanceRecordQueue, CFSTR("com.apple.siri.ui.end"), v4);
  -[AFUISiriViewController _triggerPeopleSuggesterLogging](self, "_triggerPeopleSuggesterLogging");

}

- (void)_donateUIDismissalToBiome:(int64_t)a3
{
  _QWORD block[4];
  id v5[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AFUISiriViewController__donateUIDismissalToBiome___block_invoke;
  block[3] = &unk_24D7A3140;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __52__AFUISiriViewController__donateUIDismissalToBiome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1177))
  {
    v11 = WeakRetained;
    if (*((_QWORD *)WeakRetained + 128))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", *((_QWORD *)v11 + 128), CFSTR("UUID"));
      if (AFIsInternalInstall())
      {
        objc_msgSend(v11, "_session");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "siriSessionInfo");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("SESSIONID"));

      }
    }
    else
    {
      v2 = 0;
    }
    SASDismissalReasonGetName();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_24D7A4738;
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "setObject:forKey:", v9, *MEMORY[0x24BEA8560]);

    v10 = *((_QWORD *)v11 + 129);
    if (v10)
    {
      _AFUIRecordSiriBeginEndBiomeEvent(v10, CFSTR("com.apple.siri.ui.end"), v2);
      *((_BYTE *)v11 + 1177) = 1;
    }

    WeakRetained = v11;
  }

}

- (void)_triggerPeopleSuggesterLogging
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *uiAppearanceRecordQueue;
  id v7;
  _QWORD block[4];
  id v9;

  if (AFIsInternalInstall())
  {
    -[AFUISiriViewController _session](self, "_session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "siriSessionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    uiAppearanceRecordQueue = self->_uiAppearanceRecordQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__AFUISiriViewController__triggerPeopleSuggesterLogging__block_invoke;
    block[3] = &unk_24D7A1B30;
    v9 = v5;
    v7 = v5;
    dispatch_async(uiAppearanceRecordQueue, block);

  }
}

void __56__AFUISiriViewController__triggerPeopleSuggesterLogging__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)get_PSSiriNLLoggerClass_softClass;
  v9 = get_PSSiriNLLoggerClass_softClass;
  if (!get_PSSiriNLLoggerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __get_PSSiriNLLoggerClass_block_invoke;
    v5[3] = &unk_24D7A1A28;
    v5[4] = &v6;
    __get_PSSiriNLLoggerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "logPeopleSuggesterDataWithSessionId:", *(_QWORD *)(a1 + 32));

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *dismissalUserInfo;
  objc_super v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFUISiriViewController viewWillAppear:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[AFUISiriViewController _recordUIAppearance](self, "_recordUIAppearance");
  -[SRUIFPlatformHostingInstrumentationHandler appearanceDidChange:machAbsoluteTime:](self->_viewHostingInstrumentationHandler, "appearanceDidChange:machAbsoluteTime:", 0, mach_absolute_time());
  -[AFUISiriViewController _session](self, "_session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyStateManagerPresentationTransitionBegan");

  v15.receiver = self;
  v15.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
  -[AFUISiriViewController _sendBeginAppearanceTransitionIfReadyAnimated:](self, "_sendBeginAppearanceTransitionIfReadyAnimated:", v3);
  v7 = +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState");
  if (v7)
  {
    -[AFUISiriViewController _session](self, "_session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceAudioSessionActive");

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisabled:", v7 != 0);

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFlamesViewDeferred:", SiriUIDeviceShouldDeferFlamesView());

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardDidShowNotification_, *MEMORY[0x24BEBE448], 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__keyboardDidHideNotification_, *MEMORY[0x24BEBE440], 0);
  v16 = *MEMORY[0x24BEA8560];
  SiriUIDismissalReasonStringFromReason();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  dismissalUserInfo = self->_dismissalUserInfo;
  self->_dismissalUserInfo = v13;

}

- ($5902F3589ABA92D8028CA1BE72F4BD0A)_keyboardInfoFromNotification:(SEL)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double MaxY;
  $5902F3589ABA92D8028CA1BE72F4BD0A *result;
  CGFloat Height;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v5 = *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_keyboardInfo.enabled;
  *(_OWORD *)&retstr->var3.origin.y = v5;
  *(_OWORD *)&retstr->var3.size.height = *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.height;
  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEBE468]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  retstr->var3.origin.x = v8;
  retstr->var3.origin.y = v10;
  retstr->var3.size.width = v12;
  retstr->var3.size.height = v14;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  MaxY = CGRectGetMaxY(v20);

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (CGRectGetHeight(v21) == 0.0
    || (v22.origin.x = v9, v22.origin.y = v11, v22.size.width = v13, v22.size.height = v15, CGRectGetMaxY(v22) >= MaxY))
  {
    v24.origin.x = v9;
    v24.origin.y = v11;
    v24.size.width = v13;
    v24.size.height = v15;
    Height = MaxY - CGRectGetMinY(v24);
  }
  else
  {
    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = v13;
    v23.size.height = v15;
    Height = CGRectGetHeight(v23);
  }
  retstr->var4 = Height;
  return result;
}

- (void)_keyboardDidShowNotification:(id)a3
{
  id v4;
  double keyboardHeight;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  if (-[AFUISiriViewController _siriRemoteViewControllerIsEditing](self, "_siriRemoteViewControllerIsEditing"))
    goto LABEL_14;
  keyboardHeight = self->_keyboardInfo.keyboardHeight;
  -[AFUISiriViewController _keyboardInfoFromNotification:](self, "_keyboardInfoFromNotification:", v4);
  *(_OWORD *)&self->_keyboardInfo.enabled = v14;
  *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.y = v15;
  *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.height = v16;
  if (!self->_keyboardInfo.hasBeenShown)
  {
    v6 = self->_keyboardInfo.keyboardHeight;
    objc_msgSend(MEMORY[0x24BEA8508], "heightForWidthSizeClass:", SiriUIIsCompactWidth());
    if (v6 <= v7)
    {
      if (!self->_keyboardInfo.hasBeenShown)
        goto LABEL_11;
    }
    else
    {
      self->_keyboardInfo.hasBeenShown = 1;
    }
  }
  v8 = self->_keyboardInfo.keyboardHeight;
  objc_msgSend(MEMORY[0x24BEA8508], "heightForWidthSizeClass:", SiriUIIsCompactWidth());
  if (v8 == v9)
  {
    v10 = 1;
LABEL_10:
    self->_keyboardInfo.minimized = v10;
    goto LABEL_11;
  }
  v11 = self->_keyboardInfo.keyboardHeight;
  objc_msgSend(MEMORY[0x24BEA8508], "heightForWidthSizeClass:", SiriUIIsCompactWidth());
  if (v11 > v12)
  {
    v10 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if (keyboardHeight != self->_keyboardInfo.keyboardHeight)
  {
    -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "siriKeyboardViewDidChange:", &self->_keyboardInfo);

  }
  -[AFUISiriViewController preloadPluginBundles](self, "preloadPluginBundles");
LABEL_14:

}

- (void)_keyboardDidHideNotification:(id)a3
{
  id v4;
  $AFC7234DB404F59E12F9D07E6C3E3A14 *p_keyboardInfo;
  double keyboardHeight;
  double v7;
  double v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  if (!-[AFUISiriViewController _siriRemoteViewControllerIsEditing](self, "_siriRemoteViewControllerIsEditing"))
  {
    p_keyboardInfo = &self->_keyboardInfo;
    keyboardHeight = self->_keyboardInfo.keyboardHeight;
    -[AFUISiriViewController _keyboardInfoFromNotification:](self, "_keyboardInfoFromNotification:", v4);
    *(_OWORD *)&self->_keyboardInfo.enabled = v10;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.y = v11;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.height = v12;
    if (self->_keyboardInfo.hasBeenShown)
    {
      v7 = self->_keyboardInfo.keyboardHeight;
      objc_msgSend(MEMORY[0x24BEA8508], "heightForWidthSizeClass:", SiriUIIsCompactWidth());
      if (v7 == v8)
        self->_keyboardInfo.minimized = 1;
    }
    if (self->_keyboardInfo.keyboardHeight != keyboardHeight)
    {
      -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "siriKeyboardViewDidChange:", p_keyboardInfo);

    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  os_log_t *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUISiriViewController viewDidAppear:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13.receiver = self;
  v13.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  if (-[SASRequestOptions inputType](self->_currentRequestOptions, "inputType") != 2)
    -[AFUISiriViewController presentRemoteViewControllerIfNecessary](self, "presentRemoteViewControllerIfNecessary");
  -[AFUISiriViewController _sendEndAppearanceTransitionIfReady](self, "_sendEndAppearanceTransitionIfReady");
  -[AFUISiriViewController setVisible:](self, "setVisible:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriViewControllerDidChangeVisibility:", self);

  -[AFUISiriViewController _updateAudioRoutePicker](self, "_updateAudioRoutePicker");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemUptime");
  -[AFUISiriViewController _setViewDidAppearTime:](self, "_setViewDidAppearTime:");

  -[AFUISiriViewController _session](self, "_session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordRequestMetricEvent:withTimestamp:", *MEMORY[0x24BE08F38], self->_viewDidAppearTime);

  -[AFUISiriViewController _session](self, "_session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyStateManagerPresentationTransitionEnded");

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventWithType:context:", 1407, 0);

  if ((AFDeviceSupportsSystemAssistantExperience() & 1) == 0)
    -[SRUIFPlatformHostingInstrumentationHandler appearanceDidChange:machAbsoluteTime:](self->_viewHostingInstrumentationHandler, "appearanceDidChange:machAbsoluteTime:", 1, mach_absolute_time());
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[AFUISiriViewController viewDidAppear:]";
    _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s AFUISiriViewController's view did appear", buf, 0xCu);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[AFUISiriViewController viewWillDisappear:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:context:", 1408, 0);

  -[SRUIFPlatformHostingInstrumentationHandler appearanceDidChange:machAbsoluteTime:](self->_viewHostingInstrumentationHandler, "appearanceDidChange:machAbsoluteTime:", 2, mach_absolute_time());
  -[AFUISiriViewController _session](self, "_session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyStateManagerPresentationTransitionBegan");

  v10.receiver = self;
  v10.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
  self->_viewDisappearing = 1;
  if (-[SiriUIAudioRoutePickerController isShowingPicker](self->_routePickerController, "isShowingPicker"))-[SiriUIAudioRoutePickerController cancelPickerAnimated:](self->_routePickerController, "cancelPickerAnimated:", 1);
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginAppearanceTransition:animated:", 0, v3);

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackdropShouldRasterize:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[AFUISiriViewController viewDidDisappear:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
  self->_viewDisappearing = 0;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelShowingPasscodeUnlock");

  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAppearanceTransition");

  -[AFUISiriViewController _setHasCalledBeginAppearanceTransition:](self, "_setHasCalledBeginAppearanceTransition:", 0);
  -[AFUISiriViewController _setHasCalledEndAppearanceTransition:](self, "_setHasCalledEndAppearanceTransition:", 0);
  -[AFUISiriViewController setVisible:](self, "setVisible:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriViewControllerDidChangeVisibility:", self);

  -[AFUISiriViewController _removeStatusBar](self, "_removeStatusBar");
  -[AFUISiriViewController _session](self, "_session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyStateManagerPresentationTransitionEnded");

  -[AFUISiriViewController _recordUIDismissal](self, "_recordUIDismissal");
  -[SRUIFPlatformHostingInstrumentationHandler appearanceDidChange:machAbsoluteTime:](self->_viewHostingInstrumentationHandler, "appearanceDidChange:machAbsoluteTime:", 3, mach_absolute_time());
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[AFUISiriViewController _informRemoteViewControllerOfParentIfNecessary](self, "_informRemoteViewControllerOfParentIfNecessary");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewSafeAreaInsetsDidChange](&v7, sel_viewSafeAreaInsetsDidChange);
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __53__AFUISiriViewController_viewSafeAreaInsetsDidChange__block_invoke;
    v4[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v5, &location);
    -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __53__AFUISiriViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_fullSiriView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusViewHeight");
  objc_msgSend(v2, "setStatusViewHeight:");

}

- (BOOL)isInitialBringUp
{
  return !self->_active;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (void)_setVoiceTriggerEnabled:(BOOL)a3
{
  int64_t vtEnabledCount;
  int64_t v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[24];
  void *v23;
  _BYTE v24[10];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  vtEnabledCount = self->_vtEnabledCount;
  v5 = vtEnabledCount - 1;
  if (a3)
    v5 = vtEnabledCount + 1;
  self->_vtEnabledCount = v5;
  if (vtEnabledCount == 1)
  {
    v7 = 0;
    v8 = v5 == 0;
  }
  else
  {
    v6 = v5 == 1;
    if (vtEnabledCount)
      v7 = 0;
    else
      v7 = v6;
    if (vtEnabledCount)
      v8 = 0;
    else
      v8 = v6;
  }
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_vtEnabledCount;
    NSStringFromBOOL();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("Disabled");
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "-[AFUISiriViewController _setVoiceTriggerEnabled:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    if (v7)
      v15 = CFSTR("Enabled");
    v23 = (void *)vtEnabledCount;
    *(_WORD *)&buf[22] = 2048;
    if (!v8)
      v15 = CFSTR("No change");
    *(_WORD *)v24 = 2048;
    *(_QWORD *)&v24[2] = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ previousCount:%zd newCount:%zd transitioning:%@ newState:%@", buf, 0x3Eu);

  }
  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v16 = (void *)getVTStateManagerClass_softClass;
    v21 = getVTStateManagerClass_softClass;
    if (!getVTStateManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getVTStateManagerClass_block_invoke;
      v23 = &unk_24D7A1A28;
      *(_QWORD *)v24 = &v18;
      __getVTStateManagerClass_block_invoke((uint64_t)buf);
      v16 = (void *)v19[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v17, "requestVoiceTriggerEnabled:forReason:", v7, CFSTR("Siri is active"), v18);
  }
}

- (void)presentRemoteViewControllerIfNecessary
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __64__AFUISiriViewController_presentRemoteViewControllerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentRemoteViewController");

}

- (void)_presentRemoteViewController
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Display Configuration was nil - falling back to _carScreen", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  uint64_t v6;
  os_log_t *v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    if (v4)
    {
      objc_msgSend(WeakRetained, "_resumeRemoteViewControllerDispatchQueue");
      v8 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_2(v8, v6, (uint64_t)v4);
      objc_msgSend((id)v6, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "siriViewController:didEncounterUnexpectedError:", v6, v4);

      if (objc_msgSend((id)v6, "isBeingPresented"))
        objc_msgSend((id)v6, "dismissViewControllerAnimated:completion:", 0, 0);
    }
    else
    {
      if (WeakRetained[163])
      {
        v18 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v27 = 136315138;
          v28 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
          _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s Remote Scene Controller did succeed in hosting scene", (uint8_t *)&v27, 0xCu);
        }
        objc_msgSend((id)v6, "addChildViewController:", *(_QWORD *)(v6 + 1304));
        objc_msgSend((id)v6, "_sendBeginAppearanceTransitionIfReadyAnimated:", 0);
        v19 = *(void **)(v6 + 1304);
        objc_msgSend((id)v6, "_statusBarFrame");
        objc_msgSend(v19, "setStatusBarFrame:");
        v20 = *(void **)(v6 + 1304);
        objc_msgSend((id)v6, "_fullSiriView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "statusViewHeight");
        objc_msgSend(v20, "setStatusViewHeight:");

        v22 = *(void **)(v6 + 1296);
        objc_msgSend(*(id *)(v6 + 1304), "sessionDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDelegate:", v23);

        objc_msgSend(*(id *)(v6 + 1304), "setSession:", *(_QWORD *)(v6 + 1296));
        objc_msgSend((id)v6, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v6 + 1304), "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setRemoteContentView:", v25);

        objc_msgSend((id)v6, "_informRemoteViewControllerOfParentIfNecessary");
      }
      objc_msgSend((id)v6, "_resumeRemoteViewControllerDispatchQueue");
      objc_msgSend((id)v6, "_sendEndAppearanceTransitionIfReady");
      objc_msgSend((id)v6, "_endDelayingPresentation");
    }
    *(_QWORD *)(v6 + 1112) = 2;
    v26 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315138;
      v28 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
      _os_log_impl(&dword_217514000, v26, OS_LOG_TYPE_DEFAULT, "%s transitioning _remoteViewController connectionState to loaded", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v4;

  if (a3)
  {
    -[AFUISiriRemoteSceneViewController dismissViewControllerAnimated:completion:](self->_remoteViewController, "dismissViewControllerAnimated:completion:", 1, a4);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AFUISiriViewController;
    -[AFUISiriViewController dismissViewControllerAnimated:completion:](&v4, sel_dismissViewControllerAnimated_completion_, 0, a4);
  }
}

- (void)_informRemoteViewControllerOfParentIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  -[AFUISiriViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriRemoteSceneViewController view](self->_remoteViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsView:", v3) & 1) != 0)
  {
    -[AFUISiriViewController parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[AFUISiriRemoteSceneViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);
  }
  else
  {

  }
}

- (void)invalidate
{
  -[AFUISiriRemoteSceneViewController invalidate](self->_remoteViewController, "invalidate");
}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  void (**v7)(id, uint64_t);
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t);
  id v18[3];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, uint64_t))a4;
  -[AFUISiriViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAmbientPresented");

  if (!v9)
    goto LABEL_7;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDimmingViewVisible");

  if (!v11)
    goto LABEL_7;
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFUISiriViewController hasContentAtPoint:completion:]";
    _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s #ambient - dimming layer visible - has content at point", buf, 0xCu);
  }
  if (v7)
  {
    v7[2](v7, 1);
  }
  else
  {
LABEL_7:
    -[AFUISiriViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hitTest:withEvent:", 0, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[AFUISiriRemoteSceneViewController view](self->_remoteViewController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isDescendantOfView:", v15))
      {
        objc_initWeak((id *)buf, self);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke;
        v16[3] = &unk_24D7A3168;
        objc_copyWeak(v18, (id *)buf);
        v18[1] = *(id *)&x;
        v18[2] = *(id *)&y;
        v17 = v7;
        -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v16);

        objc_destroyWeak(v18);
        objc_destroyWeak((id *)buf);
      }
      else if (v7)
      {
        v7[2](v7, 1);
      }

    }
    else if (v7)
    {
      v7[2](v7, 0);
    }

  }
}

void __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_2;
  v4[3] = &unk_24D7A2188;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "hasContentAtPoint:completion:", v4, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

uint64_t __55__AFUISiriViewController_hasContentAtPoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  _QWORD v7[4];
  id v8[3];
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__AFUISiriViewController_didDetectGestureEvent_inRegion___block_invoke;
  v7[3] = &unk_24D7A3190;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v8[2] = (id)a4;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __57__AFUISiriViewController_didDetectGestureEvent_inRegion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDetectGestureEvent:inRegion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setDockFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v17, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v17, "setDockFrame:", v10, v12, v14, v16);
}

- (void)setSystemApertureFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v8[4];
  id v9[5];
  id location;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__AFUISiriViewController_setSystemApertureFrame___block_invoke;
  v8[3] = &unk_24D7A3118;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&x;
  v9[2] = *(id *)&y;
  v9[3] = *(id *)&width;
  v9[4] = *(id *)&height;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __49__AFUISiriViewController_setSystemApertureFrame___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSystemContentFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)requestSystemApertureCollapse
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSystemApertureCollapse");

  }
}

- (void)invalidateSystemApertureAssertion
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateSystemApertureAssertion");

  }
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__AFUISiriViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke;
  v8[3] = &unk_24D7A1D68;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v7 = v6;
  v9 = v7;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __95__AFUISiriViewController_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4
{
  id v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__AFUISiriViewController_compactView_bottomContentInsetDidChange___block_invoke;
  v7[3] = &unk_24D7A3140;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a4;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

void __66__AFUISiriViewController_compactView_bottomContentInsetDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBottomContentInset:", *(double *)(a1 + 40));

}

- (void)compactView:(id)a3 blurVisibilityDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int IsPad;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  id location;

  v4 = a4;
  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "interfaceOrientation") == 1)
    {

    }
    else
    {
      IsPad = SiriUIDeviceIsPad();

      if (!IsPad)
        goto LABEL_6;
    }
    -[AFUISiriViewController setStatusBarEnabled:](self, "setStatusBarEnabled:", 1);
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__AFUISiriViewController_compactView_blurVisibilityDidChange___block_invoke;
    v17[3] = &unk_24D7A31B8;
    objc_copyWeak(&v18, &location);
    v19 = v4;
    -[AFUISiriViewController requestStatusBarVisible:animated:completion:](self, "requestStatusBarVisible:animated:completion:", v4, 1, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
LABEL_6:
  -[AFUISiriViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShouldPassTouchesThroughToSpringBoard:", v4 ^ 1);

  }
  -[AFUISiriViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShareHomeGesture:", v4 ^ 1);

  }
  -[AFUISiriViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "siriViewController:updateHomeAffordanceForBlurVisibilty:", self, v4);

}

void __62__AFUISiriViewController_compactView_blurVisibilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStatusBarEnabled:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_presentDeferredFlamesViewIfNecessary
{
  id v2;

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFlamesViewDeferred:", 0);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)_sendBeginAppearanceTransitionIfReadyAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[AFUISiriViewController _hasCalledBeginAppearanceTransition](self, "_hasCalledBeginAppearanceTransition");

    if (!v7)
    {
      -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginAppearanceTransition:animated:", 1, v3);

      -[AFUISiriViewController _setHasCalledBeginAppearanceTransition:](self, "_setHasCalledBeginAppearanceTransition:", 1);
    }
  }
}

- (void)_sendEndAppearanceTransitionIfReady
{
  void *v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  id v7;

  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v7 = v3,
        v4 = -[AFUISiriViewController _hasCalledBeginAppearanceTransition](self, "_hasCalledBeginAppearanceTransition"),
        v3 = v7,
        v4))
  {
    v5 = -[AFUISiriViewController _hasCalledEndAppearanceTransition](self, "_hasCalledEndAppearanceTransition");

    if (!v5)
    {
      -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endAppearanceTransition");

      -[AFUISiriViewController _setHasCalledEndAppearanceTransition:](self, "_setHasCalledEndAppearanceTransition:", 1);
    }
  }
  else
  {

  }
}

- (void)_enqueueRemoteViewControllerMessageBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_remoteViewControllerDispatchQueue, a3);
}

- (id)siriRemoteViewController:(id)a3 bulletinWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[AFUISiriViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:bulletinWithIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)lockStateForSiriRemoteViewController:(id)a3
{
  void *v4;
  unint64_t v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lockStateForSiriViewController:", self);

  return v5;
}

- (void)siriRemoteViewControllerDidFinishDismissing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[AFUISiriViewController siriRemoteViewControllerDidFinishDismissing:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[AFUISiriViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriViewControllerDidFinishDismissing:", self);

  }
}

- (void)siriRemoteViewController:(id)a3 invalidatedForReason:(unint64_t)a4 explanation:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = 7;
  if (a4 != 4)
    v6 = 0;
  if (a4 == 5)
    v7 = 23;
  else
    v7 = v6;
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BE09488];
  if (a5)
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = a5;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = a5;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[AFUISiriViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "siriViewController:didEncounterUnexpectedError:", self, v13);

}

- (int64_t)siriRemoteViewControllerRequestsActivationSource:(id)a3
{
  return self->_currentRequestSource;
}

- (void)dismissSiriRemoteViewController:(id)a3 userInfo:(id)a4 withReason:(int64_t)a5
{
  id v8;
  NSDictionary *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSDictionary *dismissalUserInfo;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSDictionary *)a4;
  v10 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    SASDismissalReasonGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[AFUISiriViewController dismissSiriRemoteViewController:userInfo:withReason:]";
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #punchout #activation dismissal requested %@", (uint8_t *)&v14, 0x16u);

  }
  dismissalUserInfo = v9;
  if (!v9)
    dismissalUserInfo = self->_dismissalUserInfo;
  objc_storeStrong((id *)&self->_dismissalUserInfo, dismissalUserInfo);
  -[AFUISiriViewController _dismissWithReason:](self, "_dismissWithReason:", a5);

}

- (void)setShouldDismissForTapOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForTapOutsideContent:", v3);

  }
}

- (void)setShouldDismissForTapsOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForTapsOutsideContent:", v3);

  }
}

- (void)setShouldDismissForSwipesOutsideContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDismissForSwipesOutsideContent:", v3);

  }
}

- (void)setShouldPassTouchesThroughToSpringBoard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldPassTouchesThroughToSpringBoard:", v3);

  }
}

- (void)resetGestureBehaviors
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetGestureBehaviors");

  }
}

- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestBlurVisible:reason:fence:", v6, a4, v8);

}

- (void)siriRemoteViewController:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reduceOrbOpacity:", v4);

}

- (void)siriRemoteViewControllerDidPresentKeyboard:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriViewControllerDidPresentKeyboard:", self);

  }
}

- (void)startGuidedAccessForRemoteViewController:(id)a3
{
  id v4;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startGuidedAccessForSiriViewController:", self);

}

- (void)siriRemoteViewController:(id)a3 startRequestWithOptions:(id)a4
{
  -[AFUISiriViewController startRequestWithOptions:](self, "startRequestWithOptions:", a4);
}

- (void)userRelevantEventDidOccurInSiriRemoteViewController:(id)a3
{
  id v4;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userRelevantEventDidOccurInSiriViewController:", self);

}

- (void)siriRemoteViewController:(id)a3 didRequestCurrentTextInputWithReplyHandler:(id)a4
{
  SiriUIKeyboardView *inputAccessoryView;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    inputAccessoryView = self->_inputAccessoryView;
    v6 = a4;
    -[SiriUIKeyboardView textField](inputAccessoryView, "textField");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a4 + 2))(v6, v7);

  }
}

- (void)siriRemoteViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  -[AFUISiriViewController _siriView](self, "_siriView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "siriSessionState");

  -[AFUISiriTapPanDismissalPolicyManager idleAndQuietDidChange:forSessionState:](self->_tapPanDismissalPolicyManager, "idleAndQuietDidChange:forSessionState:", v4, v7);
  -[AFUISiriViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriViewController:siriIdleAndQuietStatusDidChange:", self, v4);

  -[AFUISiriSession idleAndQuietStatusDidChange:](self->_session, "idleAndQuietStatusDidChange:", v4);
}

- (void)siriRemoteViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  -[AFUISiriViewController _setStatusViewHidden:](self, "_setStatusViewHidden:", a4);
}

- (void)siriRemoteViewController:(id)a3 setTypeToSiriViewHidden:(BOOL)a4
{
  -[AFUISiriViewController _setTypeToSiriViewHidden:](self, "_setTypeToSiriViewHidden:", a4);
}

- (void)siriRemoteViewController:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5
{
  -[AFUISiriViewController _setFullScreenDimmingLayerVisible:animated:](self, "_setFullScreenDimmingLayerVisible:animated:", a4, a5);
}

- (void)_setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[AFUISiriViewController _siriView](self, "_siriView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "siriSessionState");

  -[AFUISiriTapPanDismissalPolicyManager dimmingLayerVisibilityDidChange:forSessionState:](self->_tapPanDismissalPolicyManager, "dimmingLayerVisibilityDidChange:forSessionState:", v5, v8);
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFullScreenDimmingLayerVisible:animated:", v5, v4);

}

- (void)siriRemoteViewController:(id)a3 inputTypeDidChange:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  -[AFUISiriTapPanDismissalPolicyManager inputTypeDidChange:](self->_tapPanDismissalPolicyManager, "inputTypeDidChange:", a4);
  -[AFUISiriViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInputType:", a4);

  }
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AFUISiriViewController delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShouldPassTouchesThroughToSpringBoard:", a4 != 1);

    }
  }
}

- (void)siriRemoteViewController:(id)a3 setStatusViewDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisabled:", v4);

}

- (void)siriRemoteViewController:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatusViewUserInteractionEnabled:", v4);

}

- (void)siriRemoteViewController:(id)a3 willPresentViewControllerWithStatusBarStyle:(int64_t)a4
{
  void *v5;

  -[UIStatusBar requestStyle:animated:](self->_statusBar, "requestStyle:animated:", a4, 1);
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  self->_remoteViewControllerIsPresenting = 1;
}

- (void)siriRemoteViewController:(id)a3 didPresentViewControllerWithStatusBarStyle:(int64_t)a4
{
  id v5;

  NSStringFromSelector(sel_supportedInterfaceOrientations);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController didChangeValueForKey:](self, "didChangeValueForKey:", v5);

}

- (void)siriRemoteViewController:(id)a3 willDismissViewControllerWithStatusBarStyle:(int64_t)a4
{
  id v5;

  -[UIStatusBar requestStyle:animated:](self->_statusBar, "requestStyle:animated:", self->_statusBarStyle, 0);
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController willChangeValueForKey:](self, "willChangeValueForKey:", v5);

}

- (void)siriRemoteViewController:(id)a3 didDismissViewControllerWithStatusBarStyle:(int64_t)a4
{
  id v5;

  -[UIStatusBar requestStyle:animated:](self->_statusBar, "requestStyle:animated:", self->_statusBarStyle, 0);
  self->_remoteViewControllerIsPresenting = 0;
  -[AFUISiriViewController _updateInterfaceOrientationAnimated:](self, "_updateInterfaceOrientationAnimated:", 1);
  NSStringFromSelector(sel_supportedInterfaceOrientations);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController didChangeValueForKey:](self, "didChangeValueForKey:", v5);

}

- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  -[AFUISiriViewController requestStatusBarVisible:animated:completion:](self, "requestStatusBarVisible:animated:completion:", !a4, a5, 0);
}

- (void)siriRemoteViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[AFUISiriViewController requestStatusBarVisible:animated:completion:](self, "requestStatusBarVisible:animated:completion:", !a4, a5, a6);
}

- (void)siriRemoteViewController:(id)a3 setHelpButtonEmphasized:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHelpButtonEmphasized:", v4);

}

- (void)siriRemoteViewController:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBugReportingAvailable:", v4);

}

- (void)siriRemoteViewController:(id)a3 setRequestHandlingStatus:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[AFUISiriViewController _siriView](self, "_siriView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequestHandlingStatus:", a4);

  }
}

- (void)siriRemoteViewController:(id)a3 handlePasscodeUnlockWithCompletion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a4;
  if ((-[AFUISiriViewController lockStateForSiriRemoteViewController:](self, "lockStateForSiriRemoteViewController:", a3) & 2) != 0)
  {
    -[AFUISiriViewController handlePasscodeUnlockWithCompletion:](self, "handlePasscodeUnlockWithCompletion:", v6);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __86__AFUISiriViewController_siriRemoteViewController_handlePasscodeUnlockWithCompletion___block_invoke;
    v7[3] = &unk_24D7A1BA8;
    v8 = v6;
    -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v7);

  }
}

uint64_t __86__AFUISiriViewController_siriRemoteViewController_handlePasscodeUnlockWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)siriRemoteViewController:(id)a3 willStartTest:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriViewController:willStartTest:", self, v8);

  }
}

- (void)siriRemoteViewController:(id)a3 didFinishTest:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriViewController:didFinishTest:", self, v8);

  }
}

- (void)siriRemoteViewController:(id)a3 failTest:(id)a4 withReason:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[AFUISiriViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriViewController:failTest:withReason:", self, v11, v7);

  }
}

- (void)siriRemoteViewControllerDidPresentUserInterface:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  -[AFUISiriViewController _session](self, "_session", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE08F40];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  objc_msgSend(v5, "recordRequestMetricEvent:withTimestamp:", v3);

}

- (void)siriRemoteViewControllerPulseHelpButton:(id)a3
{
  id v3;

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pulseHelpButton");

}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[AFUISiriViewController _setPunchingOut:](self, "_setPunchingOut:", 1);
  -[AFUISiriViewController delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openURL:bundleId:inPlace:completion:", v12, v11, v6, v10);

}

- (void)siriRemoteViewControllerDidDetectMicButtonTap:(id)a3
{
  -[AFUISiriViewController _handleMicButtonTapFromSource:](self, "_handleMicButtonTapFromSource:", 3);
}

- (void)siriRemoteViewControllerDidDetectMicButtonLongPressBegan:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:](self, "_handleMicButtonLongPressBeganFromSource:", 3);
}

- (void)siriRemoteViewControllerDidDetectMicButtonLongPressEnded:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:](self, "_handleMicButtonLongPressEndedFromSource:", 3);
}

- (void)siriRemoteViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4
{
  id v6;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:didChangePresentationPeekMode:", self, a4);

}

- (void)siriRemoteViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriViewController:didChangePresentationVisualState:", self, a4);

  }
}

- (void)siriRemoteViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AFUISiriViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:willChangeKeyboardVisibility:", self, v4);

}

- (void)siriRemoteViewControllerDidPresentConversationFromBreadcrumb:(id)a3
{
  id v3;

  self->_presentedConversationFromBreadcrumb = 1;
  -[AFUISiriViewController _siriView](self, "_siriView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSiriSessionState:", 0);

}

- (void)siriRemoteViewControllerDidResetTextInput:(id)a3
{
  id v3;

  -[SiriUIKeyboardView textField](self->_inputAccessoryView, "textField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24D7A4738);

}

- (void)siriRemoteViewControllerRequestsHIDEventDefferal:(id)a3
{
  id v3;

  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDeferringHIDEventsIfNeeded");

}

- (void)siriRemoteViewControllerCancelHIDEventDefferal:(id)a3
{
  id v3;

  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndPauseDeferringHIDEvents");

}

- (void)siriRemoteViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  void *v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a4;
  -[AFUISiriViewController _setSiriRemoteViewControllerIsEditing:](self, "_setSiriRemoteViewControllerIsEditing:", 1);
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDeferringHIDEventsIfNeeded");

  v6[2](v6, 1);
}

- (void)siriRemoteViewControllerWillBeginEditing:(id)a3
{
  uint64_t v4;
  BOOL v5;

  v4 = 1;
  -[AFUISiriViewController _setSiriRemoteViewControllerIsEditing:](self, "_setSiriRemoteViewControllerIsEditing:", 1);
  v5 = -[AFUISiriViewController _statusViewHidden](self, "_statusViewHidden");
  self->_statusViewWasHiddenBeforeEditingStarted = v5;
  if (!v5)
    v4 = objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") ^ 1;
  -[AFUISiriViewController _setStatusViewHidden:](self, "_setStatusViewHidden:", v4);
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "_deactivateReachability");
}

- (void)siriRemoteViewControllerDidEndEditing:(id)a3
{
  _BOOL8 v4;
  id v5;

  -[AFUISiriViewController _setSiriRemoteViewControllerIsEditing:](self, "_setSiriRemoteViewControllerIsEditing:", 0);
  v4 = self->_unlockScreenVisible || self->_statusViewWasHiddenBeforeEditingStarted;
  -[AFUISiriViewController _setStatusViewHidden:](self, "_setStatusViewHidden:", v4);
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAndPauseDeferringHIDEvents");

}

- (void)siriRemoteViewController:(id)a3 requestsPresentation:(id)a4
{
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "siriViewController:requestsPresentation:", self, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)siriRemoteViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD))a5;
  -[AFUISiriViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      SASDismissalReasonGetName();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[AFUISiriViewController siriRemoteViewController:requestsDismissalWithReason:withCompletion:]";
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v8, "siriViewController:requestsDismissalWithReason:withCompletion:", self, a4, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

- (void)siriRemoteViewController:(id)a3 presentedIntentWithBundleId:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "siriViewController:presentedIntentWithBundleId:", self, v6);

}

- (void)siriRemoteViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriViewController:didUpdateAudioCategoriesDisablingVolumeHUD:", self, v7);

  }
}

- (void)siriRemoteViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriViewController:sceneDidActivateWithIdentifier:", self, v7);

  }
}

- (void)siriRemoteViewControllerDidDeactivateScene:(id)a3
{
  void *v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriViewControllerDidDeactivateScene:", self);

  }
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[AFUISiriViewController _setStatusViewHidden:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s _setStatusViewHidden: %@", (uint8_t *)&v14, 0x16u);

  }
  self->_statusViewHidden = v3;
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStatusViewHidden:", self->_statusViewHidden);

  -[AFUISiriViewController _siriView](self, "_siriView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAuxiliaryViewsHidden:animated:", self->_statusViewHidden, 1);

  }
  -[AFUISiriViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "siriViewController:didHideStatusView:", self, self->_statusViewHidden);

}

- (void)_setTypeToSiriViewHidden:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SiriUIKeyboardView setHidden:](self->_inputAccessoryView, "setHidden:");
  if (v3)
  {
    -[SiriUIKeyboardView resignFirstResponder](self->_inputAccessoryView, "resignFirstResponder");
    -[AFUISiriViewController resignFirstResponder](self, "resignFirstResponder");
  }
  else
  {
    -[AFUISiriViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (double)_thresholdForBarSwipeDismissal
{
  double v2;

  -[AFUISiriViewController _screenHeight](self, "_screenHeight");
  return v2 + v2 / -15.0;
}

- (double)_screenHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AFUISiriViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "interfaceOrientation");

  v15 = v5;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  if ((unint64_t)(v14 - 1) > 1)
    return CGRectGetWidth(*(CGRect *)&v15);
  else
    return CGRectGetHeight(*(CGRect *)&v15);
}

- (double)_homeGestureFractionCompleteFromCurrentYPosition:(double)a3 yPositionAtCompletion:(double)a4
{
  double v7;
  double v8;
  double v9;

  -[AFUISiriViewController _screenHeight](self, "_screenHeight");
  v8 = v7 - a4;
  -[AFUISiriViewController _screenHeight](self, "_screenHeight");
  return fmin((v9 - a3) / v8, 1.0);
}

- (void)keyboardView:(id)a3 didReceiveText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startRequestForText:", v5);

}

- (void)tapPanDismissalPolicyManager:(id)a3 dismissalPolicyDidChange:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[AFUISiriViewController setShouldDismissForTapOutsideContent:](self, "setShouldDismissForTapOutsideContent:", a4);
  -[AFUISiriViewController setShouldDismissForTapsOutsideContent:](self, "setShouldDismissForTapsOutsideContent:", v4);
  -[AFUISiriViewController setShouldDismissForSwipesOutsideContent:](self, "setShouldDismissForSwipesOutsideContent:", v4);
}

- (void)_handleMicButtonTapFromSource:(int64_t)a3
{
  void *v6;
  SASActivationInstrumentation *activationInstrumentation;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!-[AFUISiriSession attendingState](self->_session, "attendingState")
    || -[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode"))
  {
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __56__AFUISiriViewController__handleMicButtonTapFromSource___block_invoke;
    v28[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v28[4] = a3;
    objc_msgSend(v6, "logEventWithType:contextProvider:", 1412, v28);

    activationInstrumentation = self->_activationInstrumentation;
    SASRequestSourceGetName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASActivationInstrumentation buttonTapWithIdentifier:associateWithButtonDown:](activationInstrumentation, "buttonTapWithIdentifier:associateWithButtonDown:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFUISiriViewController _siriView](self, "_siriView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "siriSessionState");

    v12 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      SRUIFSiriSessionStateGetDescription();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v30 = "-[AFUISiriViewController _handleMicButtonTapFromSource:]";
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);

    }
    -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (-[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView"),
          (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "disabled");

      if ((v27 & 1) != 0)
      {
LABEL_22:

        return;
      }
    }
    switch(v11)
    {
      case 0:
        if (!-[AFUISiriSession attendingState](self->_session, "attendingState"))
          goto LABEL_14;
        if (!-[AFUISiriSession attendingState](self->_session, "attendingState"))
          goto LABEL_17;
        goto LABEL_11;
      case 1:
LABEL_11:
        -[AFUISiriViewController _session](self, "_session");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stopRecordingSpeech");

        -[AFUISiriViewController _session](self, "_session");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stopAttending");

        -[AFUISiriViewController _informRemoteViewControllerOfOrbViewTapToCancelRequest](self, "_informRemoteViewControllerOfOrbViewTapToCancelRequest");
        break;
      case 2:
        -[AFUISiriViewController _session](self, "_session");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cancelSpeechRequest");

        -[AFUISiriViewController _informRemoteViewControllerOfOrbViewTapToCancelRequest](self, "_informRemoteViewControllerOfOrbViewTapToCancelRequest");
        -[AFUISiriViewController delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v25, "siriViewControllerSpeechRequestCancelledFromSiriOrb");

        break;
      case 3:
LABEL_14:
        v19 = objc_alloc(MEMORY[0x24BE907F0]);
        -[AFUISiriViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithRequestSource:uiPresentationIdentifier:", 3, v20);

        objc_msgSend(v21, "setActivationEventInstrumentationIdenifier:", v9);
        -[AFUISiriViewController startRequestWithOptions:](self, "startRequestWithOptions:", v21);
        -[AFUISiriViewController delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "siriViewControllerSpeechRequestStartedFromSiriOrb");

        break;
      default:
LABEL_17:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 2211, CFSTR("Unknown Siri status session state %ld"), v11);

        break;
    }
    goto LABEL_22;
  }
  v18 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[AFUISiriViewController _handleMicButtonTapFromSource:]";
    _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button taps in fluid configurations - orb will bounce instead", buf, 0xCu);
  }
}

id __56__AFUISiriViewController__handleMicButtonTapFromSource___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  SASRequestSourceGetName();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("requestSource");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_informRemoteViewControllerOfOrbViewTapToCancelRequest
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__AFUISiriViewController__informRemoteViewControllerOfOrbViewTapToCancelRequest__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __80__AFUISiriViewController__informRemoteViewControllerOfOrbViewTapToCancelRequest__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didReceiveOrbViewTapToCancelRequest");

}

- (void)_handleMicButtonLongPressBeganFromSource:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id *p_triggerUpdater;
  NSObject *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  SASActivationInstrumentation *activationInstrumentation;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (-[AFUISiriSession attendingState](self->_session, "attendingState")
    && !-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode"))
  {
    v26 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
      _os_log_impl(&dword_217514000, v26, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button long press start in fluid configurations - orb will bounce instead", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__AFUISiriViewController__handleMicButtonLongPressBeganFromSource___block_invoke;
    v27[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v27[4] = a3;
    objc_msgSend(v5, "logEventWithType:contextProvider:", 1410, v27);

    -[AFUISiriViewController _siriView](self, "_siriView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "siriSessionState");

    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      SRUIFSiriSessionStateGetDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);

    }
    if (v7 <= 3 && v7 != 1)
    {
      p_triggerUpdater = &self->_triggerUpdater;
      if (self->_triggerUpdater)
      {
        v13 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
          _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s Old trigger released", buf, 0xCu);
        }
        (*((void (**)(void))*p_triggerUpdater + 2))();
        v14 = *p_triggerUpdater;
        *p_triggerUpdater = 0;

      }
      -[AFUISiriViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[AFUISiriViewController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "siriViewControllerSpeechRequestStartedFromSiriOrb");

      }
      activationInstrumentation = self->_activationInstrumentation;
      SASRequestSourceGetName();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASActivationInstrumentation buttonDownWithIdentifier:](activationInstrumentation, "buttonDownWithIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc(MEMORY[0x24BE907F0]);
      -[AFUISiriViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithRequestSource:uiPresentationIdentifier:", a3, v22);

      objc_msgSend(v23, "setActivationEventInstrumentationIdenifier:", v20);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE907F8]), "initWithRequestOptions:updateHandle:", v23, &self->_triggerUpdater);
      v25 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:]";
        _os_log_impl(&dword_217514000, v25, OS_LOG_TYPE_DEFAULT, "%s Starting new request with trigger", buf, 0xCu);
      }
      -[AFUISiriViewController startRequestWithActivationTrigger:](self, "startRequestWithActivationTrigger:", v24);

    }
  }
}

id __67__AFUISiriViewController__handleMicButtonLongPressBeganFromSource___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  SASRequestSourceGetName();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("requestSource");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_handleMicButtonLongPressEndedFromSource:(int64_t)a3
{
  void *v5;
  SASActivationInstrumentation *activationInstrumentation;
  void *v7;
  id v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id triggerUpdater;
  NSObject *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[AFUISiriSession attendingState](self->_session, "attendingState")
    && !-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode"))
  {
    v16 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
      _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - ignoring mic button long press end in fluid configurations - orb will bounce instead", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __67__AFUISiriViewController__handleMicButtonLongPressEndedFromSource___block_invoke;
    v17[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v17[4] = a3;
    objc_msgSend(v5, "logEventWithType:contextProvider:", 1411, v17);

    activationInstrumentation = self->_activationInstrumentation;
    SASRequestSourceGetName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[SASActivationInstrumentation buttonUpWithIdentifier:](activationInstrumentation, "buttonUpWithIdentifier:", v7);

    -[AFUISiriViewController _siriView](self, "_siriView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriSessionState");

    v10 = (os_log_t *)MEMORY[0x24BE08FB0];
    v11 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      SRUIFSiriSessionStateGetDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s  sessionState: %@", buf, 0x16u);

    }
    if (self->_triggerUpdater)
    {
      v14 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:]";
        _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s Trigger released", buf, 0xCu);
      }
      (*((void (**)(void))self->_triggerUpdater + 2))();
      triggerUpdater = self->_triggerUpdater;
      self->_triggerUpdater = 0;

    }
  }
}

id __67__AFUISiriViewController__handleMicButtonLongPressEndedFromSource___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  SASRequestSourceGetName();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("requestSource");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_handleSiriDidActivateFromSource:(int64_t)a3
{
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__AFUISiriViewController__handleSiriDidActivateFromSource___block_invoke;
  v5[3] = &unk_24D7A3140;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __59__AFUISiriViewController__handleSiriDidActivateFromSource___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriDidActivateFromSource:", *(_QWORD *)(a1 + 40));

}

- (void)handlePasscodeUnlockWithCompletion:(id)a3
{
  -[AFUISiriViewController handlePasscodeUnlockAndCancelRequest:withCompletion:](self, "handlePasscodeUnlockAndCancelRequest:withCompletion:", 1, a3);
}

- (void)handlePasscodeUnlockAndCancelRequest:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v4 = a3;
  v6 = a4;
  -[AFUISiriViewController _configuration](self, "_configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "siriViewMode");

  if (v8)
  {
    -[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:](self, "_handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:", v4, 0, v6);
  }
  else
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __78__AFUISiriViewController_handlePasscodeUnlockAndCancelRequest_withCompletion___block_invoke;
      v10[3] = &unk_24D7A3200;
      objc_copyWeak(&v12, &location);
      v13 = v4;
      v11 = v6;
      objc_msgSend(v9, "siriViewController:requestsPresentation:", self, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }

  }
}

void __78__AFUISiriViewController_handlePasscodeUnlockAndCancelRequest_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && a2)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:", *(unsigned __int8 *)(a1 + 48), 1, *(_QWORD *)(a1 + 32));
LABEL_6:
    v5 = v7;
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = v5;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)handleAppUnlockForAppId:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_initWeak(&location, self);
  -[AFUISiriViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke;
  v12[3] = &unk_24D7A2460;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1104] = 1;
    objc_msgSend(WeakRetained, "_remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_2;
    v7[3] = &unk_24D7A3250;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "showAppUnlockForAppId:completion:", v6, v7);

    objc_destroyWeak(&v9);
  }

}

void __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_3;
    v7[3] = &unk_24D7A3228;
    v9 = *(id *)(a1 + 32);
    v10 = a2;
    v8 = v5;
    objc_msgSend(v8, "_enqueueRemoteViewControllerMessageBlock:", v7);

  }
}

uint64_t __65__AFUISiriViewController_handleAppUnlockForAppId_withCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[6]);
  *(_BYTE *)(a1[4] + 1104) = 0;
  return result;
}

- (void)_handlePasscodeUnlockAndCancelRequest:(BOOL)a3 dismissOnFailure:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;
  BOOL v16;
  id location;

  v8 = a5;
  v9 = objc_initWeak(&location, self);
  -[AFUISiriViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke;
  v12[3] = &unk_24D7A32E8;
  objc_copyWeak(&v14, &location);
  v15 = a3;
  v11 = v8;
  v16 = a4;
  v12[4] = self;
  v13 = v11;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  NSObject *v14;
  void *v15;
  os_log_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1104] = 1;
    objc_msgSend(WeakRetained, "_remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriWillShowPasscodeUnlockAndCancelRequest:", *(unsigned __int8 *)(a1 + 56));

    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_UNLOCK_TITLE"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_siriView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v4, "_siriView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_2;
      v25[3] = &unk_24D7A2728;
      v26 = v4;
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_3;
      v21[3] = &unk_24D7A32C0;
      objc_copyWeak(&v23, v2);
      v22 = *(id *)(a1 + 40);
      v24 = *(_BYTE *)(a1 + 57);
      objc_msgSend(v10, "showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:", v7, 0, v25, v21);

      objc_destroyWeak(&v23);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = (os_log_t *)MEMORY[0x24BE08FB0];
      if (v12)
      {
        (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
        v14 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:]_block_invoke";
          _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot present unlock screen. Sending SiriUIUnlockResultFailure to completion handler.", buf, 0xCu);
        }
      }
      objc_msgSend(v4, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInteractionEnabled:", 1);

      v16 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(a1 + 32);
        v18 = v16;
        objc_msgSend(v17, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "debugDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v28 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:]_block_invoke";
        v29 = 2112;
        v30 = v20;
        _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s  %@Current view cannot show passcode unlock flow.", buf, 0x16u);

      }
    }

  }
}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_4;
    v10[3] = &unk_24D7A3278;
    v7 = WeakRetained;
    v11 = v7;
    v13 = a2;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v7, "_enqueueRemoteViewControllerMessageBlock:", v10);
    if (a2 && *(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_6;
      v9[3] = &__block_descriptor_40_e8_v12__0B8l;
      v9[4] = a2;
      objc_msgSend(v8, "siriViewController:requestsDismissalWithReason:withCompletion:", v7, 54, v9);

    }
  }

}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriWillHidePasscodeUnlockForResult:", *(_QWORD *)(a1 + 48));

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_5;
  v5[3] = &unk_24D7A1B30;
  v6 = v4;
  objc_msgSend(v6, "_enqueueRemoteViewControllerMessageBlock:", v5);

}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_5(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1104) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_remoteViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriDidHidePasscodeUnlock");

}

void __96__AFUISiriViewController__handlePasscodeUnlockAndCancelRequest_dismissOnFailure_withCompletion___block_invoke_6(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFUISiriViewController _handlePasscodeUnlockAndCancelRequest:dismissOnFailure:withCompletion:]_block_invoke_6";
    v8 = 2048;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s Dismissed siri for unlock result: %lu dismissal result: %d", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)showPasscodeUnlockScreenForRequest:(id)a3 unlockCompletion:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  self->_unlockScreenVisible = 1;
  v8 = objc_msgSend(v6, "requiresUserInteraction");
  v9 = *MEMORY[0x24BE08FB0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[AFUISiriViewController showPasscodeUnlockScreenForRequest:unlockCompletion:]";
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s Passcode unlock screen for handoff authentication.", buf, 0xCu);
    }
    objc_msgSend(v6, "handoffOriginDeviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_REMOTE_AUTHENTICATION_TITLE"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_REMOTE_AUTHENTICATION_SUBTITLE"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[AFUISiriViewController showPasscodeUnlockScreenForRequest:unlockCompletion:]";
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s Passcode unlock screen for cold boot authentication.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_FIRST_UNLOCK_TITLE"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }

  -[AFUISiriViewController _siriView](self, "_siriView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__AFUISiriViewController_showPasscodeUnlockScreenForRequest_unlockCompletion___block_invoke;
  v20[3] = &unk_24D7A3250;
  objc_copyWeak(&v22, &location);
  v19 = v7;
  v21 = v19;
  objc_msgSend(v18, "showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:", v13, v17, 0, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __78__AFUISiriViewController_showPasscodeUnlockScreenForRequest_unlockCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1104) = 0;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }

}

- (void)defrost
{
  objc_msgSend(MEMORY[0x24BE09170], "defrost");
}

- (void)preheat
{
  id v2;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheat");

}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  self->_currentRequestSource = a3;
  self->_siriSessionWantsToEnd = 0;
  -[AFUISiriViewController underlyingConnection](self, "underlyingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willPresentUI");

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__AFUISiriViewController_siriWillActivateFromSource___block_invoke;
  v6[3] = &unk_24D7A3140;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v6);
  if (a3 != 47)
    -[AFUISiriViewController preloadPluginBundles](self, "preloadPluginBundles");
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __53__AFUISiriViewController_siriWillActivateFromSource___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriWillActivateFromSource:", *(_QWORD *)(a1 + 40));

}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  void *v5;
  id v6;

  self->_currentRequestSource = a3;
  if (!self->_active)
  {
    self->_active = 1;
    -[AFUISiriViewController _setVoiceTriggerEnabled:](self, "_setVoiceTriggerEnabled:", 1);
  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriDidActivateFromSource:", a3);

  }
  else
  {
    -[AFUISiriViewController _handleSiriDidActivateFromSource:](self, "_handleSiriDidActivateFromSource:", a3);
  }
}

- (void)siriWillBePresented:(int64_t)a3
{
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  if (self->_remoteViewController)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__AFUISiriViewController_siriWillBePresented___block_invoke;
    v5[3] = &unk_24D7A3140;
    objc_copyWeak(v6, &location);
    v6[1] = (id)a3;
    -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
    objc_destroyWeak(v6);
  }
  objc_destroyWeak(&location);
}

void __46__AFUISiriViewController_siriWillBePresented___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriWillBePresented:", *(_QWORD *)(a1 + 40));

}

- (int64_t)currentSource
{
  return self->_currentRequestSource;
}

- (void)siriDidDeactivate
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[AFUISiriViewController siriDidDeactivate]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  self->_active = 0;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  v6 = v5;
  -[AFUISiriViewController _viewDidAppearTime](self, "_viewDidAppearTime");
  v8 = v6 - v7;

  v9 = objc_alloc(MEMORY[0x24BE09220]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithOriginalCommandId:category:duration:", 0, 0, v10);

  -[AFUISiriViewController _session](self, "_session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordUIMetrics:", v11);

  -[AFUISiriViewController underlyingConnection](self, "underlyingConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didDismissUI");

  -[AFUISiriTapPanDismissalPolicyManager invalidate](self->_tapPanDismissalPolicyManager, "invalidate");
  if (self->_immersiveExperienceOn)
  {
    -[AFUISiriViewController resetGestureBehaviors](self, "resetGestureBehaviors");
    self->_immersiveExperienceOn = 0;
  }
  -[AFUISiriViewController _setVoiceTriggerEnabled:](self, "_setVoiceTriggerEnabled:", 0);
  -[AFUISiriViewController endSession](self, "endSession");

}

- (void)resetContextTypes:(int64_t)a3
{
  id v4;

  -[AFUISiriViewController _session](self, "_session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetContextTypes:", a3);

}

- (void)updateContexts:(int64_t)a3
{
  char v3;
  void *v5;
  id v6;

  v3 = a3;
  if ((a3 & 2) != 0)
  {
    -[AFUISiriViewController _session](self, "_session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlertContext");

  }
  if ((v3 & 1) != 0)
  {
    -[AFUISiriViewController _session](self, "_session");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setApplicationContext");

  }
}

- (void)setAlertContext
{
  -[AFUISiriSession setAlertContext](self->_session, "setAlertContext");
}

- (void)setDeviceInStarkMode:(BOOL)a3
{
  _BOOL4 deviceIsInStarkMode;
  id v5;

  deviceIsInStarkMode = self->_deviceIsInStarkMode;
  if (deviceIsInStarkMode != a3)
  {
    self->_deviceIsInStarkMode = a3;
    -[AFUISiriViewController _updateAudioRoutePicker](self, "_updateAudioRoutePicker");
    deviceIsInStarkMode = self->_deviceIsInStarkMode;
  }
  if (deviceIsInStarkMode)
  {
    -[AFUISiriViewController _session](self, "_session");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceInStarkMode:", self->_deviceIsInStarkMode);

  }
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_supportsCarPlayVehicleData != a3)
  {
    v3 = a3;
    -[AFUISiriViewController _session](self, "_session");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsCarPlayVehicleData:", v3);

  }
}

- (void)setAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_announcementRequestsPermittedWhilePresentationActive != a3)
  {
    v3 = a3;
    self->_announcementRequestsPermittedWhilePresentationActive = a3;
    -[AFUISiriViewController _session](self, "_session");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnnouncementRequestsPermittedByPresentationWhileActive:", v3);

  }
}

- (BOOL)_isLaunchListeningEnabled
{
  return 0;
}

- (void)_dismissWithReason:(int64_t)a3
{
  id v5;

  self->_dismissalReason = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSiriViewController:withReason:", self, a3);

}

- (void)deactivateScene
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__AFUISiriViewController_deactivateScene__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__AFUISiriViewController_deactivateScene__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deactivateScene");

}

- (void)reactivateScene
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__AFUISiriViewController_reactivateScene__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__AFUISiriViewController_reactivateScene__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reactivateScene");

}

- (void)setCarDNDActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[AFUISiriViewController setCarDNDActive:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #carDnd setting carDNDActive to %@", (uint8_t *)&v9, 0x16u);

  }
  self->_carDNDActive = v3;
  -[AFUISiriViewController _session](self, "_session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCarDNDActive:", v3);

}

- (void)setSiriRequestCancellationReason:(int64_t)a3
{
  self->_requestCancellationReason = a3;
}

- (void)startRequestWithOptions:(id)a3
{
  -[AFUISiriViewController startRequestWithOptions:completion:](self, "startRequestWithOptions:completion:", a3, 0);
}

- (void)startRequestWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  _BOOL4 v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  _BOOL4 v27;
  int v28;
  int v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  AFUISiriViewController *v36;
  NSObject *v37;
  void *v38;
  int64_t currentRequestSource;
  int v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(id, void *);
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id location;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  AFUISiriViewController *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v49 = (void (**)(id, void *))a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController startRequestWithOptions:completion:]");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 2601, CFSTR("%@ can only be used on the main thread"), v48);

  }
  -[AFUISiriViewController _systemState](self, "_systemState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateIfNeededWithSystemState:", v8);

  -[AFUISiriViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "siriViewController:willStartRequestWithOptions:", self, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;
  self->_recordingStartedOnRoute = 0;
  self->_dismissalReason = 0;
  -[AFUISiriViewController _setPunchingOut:](self, "_setPunchingOut:", 0);
  if (v12)
  {
    objc_initWeak(&location, self);
    v13 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke;
    v52[3] = &unk_24D7A1D90;
    objc_copyWeak(&v54, &location);
    v14 = v12;
    v53 = v14;
    -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v52);
    if (objc_msgSend(v14, "requestSource") == 23)
    {
      v50[0] = v13;
      v50[1] = 3221225472;
      v50[2] = __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke_2;
      v50[3] = &unk_24D7A1AB8;
      objc_copyWeak(&v51, &location);
      -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v50);
      objc_destroyWeak(&v51);
    }
    v15 = -[AFUISiriViewController _deviceSupportsZLL](self, "_deviceSupportsZLL");
    v16 = objc_msgSend(v14, "inputType");
    v17 = objc_msgSend(v14, "isInitialBringUp");
    if ((objc_msgSend(v14, "predictedRecordRouteIsZLL") & 1) != 0)
    {
      -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v16 == 2)
        v20 = v17;
      else
        v20 = 0;
      objc_msgSend(v18, "setHelpButtonDeferred:", v20);
    }
    else
    {
      -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHelpButtonDeferred:", 0);
    }

    if (AFDeviceSupportsSystemAssistantExperience()
      && objc_msgSend(v14, "isForStark")
      && objc_msgSend(v14, "isInitialBringUp"))
    {
      -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "initializeEdgeLightForRequest:", v14);

    }
    v24 = objc_msgSend(v14, "requestSource");
    v25 = objc_msgSend(v14, "requestSource");
    v26 = 0;
    if (v25 <= 0x2C && ((1 << v25) & 0x100010000107) != 0)
      v26 = objc_msgSend(v14, "predictedRecordRouteIsZLL");
    v27 = v16 == 2 && v15;
    v28 = v27 & v17;
    if (v24 == 8)
      v29 = 1;
    else
      v29 = v26;
    v30 = v28 & v29;
    if ((v28 & v29) == 1)
    {
      v31 = mach_absolute_time();
      -[AFUISiriViewController _siriView](self, "_siriView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSiriSessionState:", 1);

      -[AFUISiriViewController _session](self, "_session");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "launchedIntoListeningAtTime:", (double)v31);

      v34 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "systemUptime");
      objc_msgSend(v34, "numberWithDouble:");
      v36 = (AFUISiriViewController *)objc_claimAutoreleasedReturnValue();

      v37 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
        v58 = 2112;
        v59 = v36;
        _os_log_impl(&dword_217514000, v37, OS_LOG_TYPE_DEFAULT, "%s Launched into listening mode. Setting recording start time to: %@", buf, 0x16u);
      }
      -[AFUISiriViewController _setRecordingStartedTimeValue:](self, "_setRecordingStartedTimeValue:", v36);

    }
    -[AFUISiriViewController _session](self, "_session");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "startRequestWithOptions:completion:", v14, v49);

    -[AFUISiriViewController _setCurrentRequestOptions:](self, "_setCurrentRequestOptions:", v14);
    objc_msgSend(v7, "timestamp");
    AFMachAbsoluteTimeAddTimeInterval();
    currentRequestSource = self->_currentRequestSource;
    v40 = 1;
    if (currentRequestSource != 8 && currentRequestSource != 44)
      v40 = objc_msgSend(v7, "isVoiceTriggerRequest");
    v41 = objc_msgSend(v7, "requestSource");
    if (v40)
    {
      objc_msgSend(v7, "speechRequestOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      SRUIFInstrumentVoiceLaunchSignpost();

    }
    else
    {
      if ((unint64_t)(v41 - 1) < 2)
        goto LABEL_44;
      if (v41 == 47)
      {
        SRUIFInstrumentQuickTypeGestureLaunchSignpost();
        goto LABEL_46;
      }
      if (v41 == 22)
LABEL_44:
        SRUIFInstrumentButtonLaunchSignpost();
    }
LABEL_46:
    if ((v30 & 1) == 0)
    {
      v43 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
        _os_log_impl(&dword_217514000, v43, OS_LOG_TYPE_DEFAULT, "%s Not launching into listening mode. Setting recording start time back to nil.", buf, 0xCu);
      }
      -[AFUISiriViewController _setRecordingStartedTimeValue:](self, "_setRecordingStartedTimeValue:", 0);
      if (v16 == 2)
        v44 = v17;
      else
        v44 = 0;
      if (v44 == 1 && !-[AFUISiriViewController isEyesFree](self, "isEyesFree"))
      {
        -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setFlamesViewPaused:", 1);

      }
    }
    if (objc_msgSend(v14, "isInitialBringUp"))
    {
      -[AFUISiriViewController _session](self, "_session");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      objc_msgSend(v46, "recordRequestMetricEvent:withTimestamp:", *MEMORY[0x24BE08F30]);

    }
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
    goto LABEL_58;
  }
  v21 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFUISiriViewController startRequestWithOptions:completion:]";
    v58 = 2112;
    v59 = self;
    _os_log_impl(&dword_217514000, v21, OS_LOG_TYPE_DEFAULT, "%s %@ not starting request because delegate returned nil requestOptions", buf, 0x16u);
  }
  if (v49)
  {
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("No UI request options."), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2](v49, v22);

  }
LABEL_58:
  if (!objc_msgSend(v7, "isInitialBringUp") || objc_msgSend(v7, "isForUIFree"))
    -[AFUISiriViewController _presentRemoteViewController](self, "_presentRemoteViewController");

}

void __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequestOptions:", *(_QWORD *)(a1 + 32));

}

void __61__AFUISiriViewController_startRequestWithOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriWillActivateFromSource:", 23);

}

- (void)stopRequestWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriViewController _session](self, "_session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRequestWithOptions:", v4);

}

- (void)didReceiveButtonUpWithRequestOptions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriViewController:didReceiveButtonUpWithRequestOptions:", self, v7);

  }
}

- (void)updateRequestOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AFUISiriViewController _session](self, "_session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateRequestOptions:", v5);

  -[AFUISiriViewController _setCurrentRequestOptions:](self, "_setCurrentRequestOptions:", v5);
}

- (SASRequestOptions)currentRequestOptions
{
  return self->_currentRequestOptions;
}

- (void)_setCurrentRequestOptions:(id)a3
{
  SASRequestOptions **p_currentRequestOptions;
  id v5;

  p_currentRequestOptions = &self->_currentRequestOptions;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", *p_currentRequestOptions) & 1) == 0)
    objc_storeStrong((id *)p_currentRequestOptions, a3);

}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__AFUISiriViewController_preloadPresentationBundleWithIdentifier___block_invoke;
  v6[3] = &unk_24D7A1D90;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __66__AFUISiriViewController_preloadPresentationBundleWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preloadPresentationBundleWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)preloadPluginBundles
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__AFUISiriViewController_preloadPluginBundles__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__AFUISiriViewController_preloadPluginBundles__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preloadPluginBundles");

}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  AFUISiriViewController *v19;
  id v20[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (AFIsInternalInstall())
  {
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[AFUISiriViewController _configuration](self, "_configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "showsSensitiveUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("AFUIPresentationPropertiesShowsSensitiveUIKey"));

    v9 = v10;
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__AFUISiriViewController_showPresentationWithIdentifier_properties_lockState___block_invoke;
  v16[3] = &unk_24D7A3310;
  objc_copyWeak(v20, &location);
  v14 = v8;
  v17 = v14;
  v15 = v9;
  v20[1] = (id)a5;
  v18 = v15;
  v19 = self;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v16);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

void __78__AFUISiriViewController_showPresentationWithIdentifier_properties_lockState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_remoteViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showPresentationWithIdentifier:properties:lockState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 48), "_updateRemoteViewControllerStateForAppearance");
    WeakRetained = v4;
  }

}

- (void)_updateRemoteViewControllerStateForAppearance
{
  void *v3;
  id v4;

  -[AFUISceneHostingViewController configuration](self->_remoteViewController, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  if ((objc_msgSend(v4, "foreground") & 1) == 0)
  {
    objc_msgSend(v4, "setForeground:", 1);
    -[AFUISceneHostingViewController updateSceneWithConfiguration:](self->_remoteViewController, "updateSceneWithConfiguration:", v4);
  }

}

- (void)setLockState:(unint64_t)a3
{
  id v4;

  -[AFUISiriViewController _session](self, "_session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockState:", a3);

}

- (void)handleViewFullyRevealed
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[AFUISiriViewController handleViewFullyRevealed]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUISiriViewController.m"), 2825, CFSTR("%@ can only be used on the main thread"), v5);

  }
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackdropVisible:", 1);

}

- (void)shortTapActionWithRequestOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__AFUISiriViewController_shortTapActionWithRequestOptions___block_invoke;
  v6[3] = &unk_24D7A1D90;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __59__AFUISiriViewController_shortTapActionWithRequestOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveShortTapActionWithRequestOptions:", *(_QWORD *)(a1 + 32));

}

- (id)viewServiceApplicationInfo
{
  return -[AFUISiriRemoteSceneViewController viewServiceApplicationInfo](self->_remoteViewController, "viewServiceApplicationInfo");
}

- (void)presentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  _QWORD v7[4];
  id v8[3];
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__AFUISiriViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke;
  v7[3] = &unk_24D7A3190;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v8[2] = (id)a4;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __92__AFUISiriViewController_presentationStateUpdatedFromPresentationState_toPresentationState___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationStateUpdatedFromPresentationState:toPresentationState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _BOOL4 eyesFree;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((SiriUIDeviceIsZoomed() & 1) != 0 || (SiriUIIsAllOrientationsSupported() & 1) == 0)
  {
    if (self->_remoteViewControllerIsPresenting)
      return -[AFUISiriRemoteSceneViewController supportedInterfaceOrientations](self->_remoteViewController, "supportedInterfaceOrientations");
    else
      return 2;
  }
  eyesFree = self->_eyesFree;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("YES");
    if (!eyesFree)
      v6 = CFSTR("NO");
    v8 = 136315394;
    v9 = "-[AFUISiriViewController supportedInterfaceOrientations]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Forcing portrait mode for Siri EyesFree: %@", (uint8_t *)&v8, 0x16u);
  }
  if (eyesFree)
    return 2;
  else
    return 30;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[AFUISiriViewController _statusBar](self, "_statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController _statusBarFrame](self, "_statusBarFrame");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "userInterfaceIdiom"))
  {
    v5 = AFDeviceSupportsSystemAssistantExperience();

    if (!v5)
      return;
    -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentInterfaceOrientation:", -[AFUISiriViewController interfaceOrientation](self, "interfaceOrientation"));
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBlurViewVisible");

  if (v9 && (SiriUIDeviceIsPad() & 1) == 0)
    -[AFUISiriViewController requestStatusBarVisible:](self, "requestStatusBarVisible:", width < height);
  if (width < height)
    v10 = 1;
  else
    v10 = 4;
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orientationWillChangeTo:", v10);

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFlamesViewPaused:", 1);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_24D7A3338;
  v15[4] = self;
  *(double *)&v15[5] = width;
  *(double *)&v15[6] = height;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v14[3] = &unk_24D7A3360;
  v14[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, v14);
  v13.receiver = self;
  v13.super_class = (Class)AFUISiriViewController;
  -[AFUISiriViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

void __77__AFUISiriViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_fullSiriView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlamesViewPaused:", 0);

}

- (void)_holdToTalkTriggerDidReleaseFromSource:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[28];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = -[AFUISiriViewController _isInHoldToTalkMode](self, "_isInHoldToTalkMode");
    -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136315906;
    v27 = "-[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:]";
    v28 = 1024;
    *(_DWORD *)v29 = v8;
    *(_WORD *)&v29[4] = 2112;
    *(_QWORD *)&v29[6] = v9;
    *(_WORD *)&v29[14] = 2048;
    *(_QWORD *)&v29[16] = a3;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s In HTTMode %d, Current options %@, source %ld", (uint8_t *)&v26, 0x26u);

  }
  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requestSource");

  if (-[AFUISiriViewController _isInHoldToTalkMode](self, "_isInHoldToTalkMode")
    && (v11 == a3 || (v11 & 0xFFFFFFFFFFFFFFFELL) == 6))
  {
    v12 = -[AFUISiriViewController _canIgnoreHoldToTalkThreshold](self, "_canIgnoreHoldToTalkThreshold");
    v13 = -[AFUISiriViewController _holdToTalkThresholdHasElapsed](self, "_holdToTalkThresholdHasElapsed");
    v14 = v13;
    if (v12 || v13)
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)MEMORY[0x24BDD16E0];
        v17 = v15;
        objc_msgSend(v16, "numberWithBool:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AFUISiriViewController _isInitialSpeechRequest](self, "_isInitialSpeechRequest"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 136315906;
        v27 = "-[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:]";
        v28 = 2112;
        *(_QWORD *)v29 = v18;
        *(_WORD *)&v29[8] = 2112;
        *(_QWORD *)&v29[10] = v19;
        *(_WORD *)&v29[18] = 2112;
        *(_QWORD *)&v29[20] = v20;
        _os_log_impl(&dword_217514000, v17, OS_LOG_TYPE_DEFAULT, "%s Stopping recording on hold to talk request canIgnoreHoldToTalkThreshold %@, holdToTalkThresholdElapsed %@, isInitialSpeechRequest %@", (uint8_t *)&v26, 0x2Au);

      }
      v21 = objc_alloc(MEMORY[0x24BE907F0]);
      -[AFUISiriViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithRequestSource:uiPresentationIdentifier:", v11, v22);

      -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "homeButtonUpFromBeep");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHomeButtonUpFromBeep:", v25);

      objc_msgSend(v23, "setInitialBringUp:", -[SASRequestOptions isInitialBringUp](self->_currentRequestOptions, "isInitialBringUp"));
      -[AFUISiriViewController _delayForHoldToTalkStopRequestsWithSource:](self, "_delayForHoldToTalkStopRequestsWithSource:", a3);
      -[AFUISiriViewController _stopRequestWithOptions:afterDelay:](self, "_stopRequestWithOptions:afterDelay:", v23);

    }
    else
    {
      -[AFUISiriViewController _transitionToAutomaticEndpointMode](self, "_transitionToAutomaticEndpointMode");
    }
  }
}

- (void)tvRemoteSentButtonDownWhileListening
{
  if (-[SASRequestOptions isATVRemotePTTEligible](self->_currentRequestOptions, "isATVRemotePTTEligible")
    && -[AFUISiriViewController isListening](self, "isListening")
    && !-[AFUISiriViewController _isInHoldToTalkMode](self, "_isInHoldToTalkMode"))
  {
    -[AFUISiriViewController _transitionToManualEndpointMode](self, "_transitionToManualEndpointMode");
  }
}

- (double)_delayForHoldToTalkStopRequestsWithSource:(int64_t)a3
{
  double result;
  double v4;

  result = 0.25;
  if ((unint64_t)a3 <= 0x1F && ((1 << a3) & 0xE0400000) != 0)
  {
    AFPreferencesATVStopRecordingDelay();
    result = fmin(v4, 0.25);
    if (result < 0.0)
      return 0.0;
  }
  return result;
}

- (id)_uiPresentationIdentifier
{
  int v3;
  const __CFString *v5;

  v3 = AFDeviceSupportsSystemAssistantExperience();
  if (self->_deviceIsInStarkMode)
    return CFSTR("com.apple.siri.CarDisplay");
  v5 = CFSTR("com.apple.siri.Compact");
  if (v3)
    v5 = CFSTR("com.apple.siri.SystemAssistantExperience");
  if (self->_eyesFree)
    return CFSTR("com.apple.siri.EyesFree");
  else
    return (id)v5;
}

- (BOOL)_canIgnoreHoldToTalkThreshold
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v6;

  v2 = self;
  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requestSource");

  LOBYTE(v6) = v4 == 22 || v4 == 31;
  if (objc_msgSend(MEMORY[0x24BE091E0], "isTVPushToTalkEnabled"))
  {
    if (v4 == 31 || v4 == 22)
    {
      objc_msgSend(v2, "_currentRequestOptions");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v2, "isATVRemotePTTEligible") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    if (v4 == 31 || v4 == 22)

  }
  return v6;
}

- (BOOL)_isInitialSpeechRequest
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInitialBringUp"))
  {
    -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "inputType") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_holdToTalkThresholdHasElapsed
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  os_log_t *v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  int v22;
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriViewController _recordingStartedTimeValue](self, "_recordingStartedTimeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v19 = *MEMORY[0x24BE08FB0];
    v18 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v22 = 136315138;
    v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    v20 = "%s Recording start time was not set";
LABEL_14:
    _os_log_impl(&dword_217514000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
    v18 = 0;
    goto LABEL_15;
  }
  if (!self->_recordingStartedOnRoute)
  {
    v19 = *MEMORY[0x24BE08FB0];
    v18 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v22 = 136315138;
    v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    v20 = "%s Recording has not started on the audio route";
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  v6 = v5;

  objc_msgSend(v3, "doubleValue");
  v8 = v7;
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s Button up time: %f", (uint8_t *)&v22, 0x16u);
  }
  v11 = v6 - v8;
  v12 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s Start recording to button up time: %f", (uint8_t *)&v22, 0x16u);
  }
  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHomeButtonUpFromBeep:", v14);

  -[AFUISiriViewController _manualEndpointingThreshold](self, "_manualEndpointingThreshold");
  v16 = v15;
  v17 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[AFUISiriViewController _holdToTalkThresholdHasElapsed]";
    v24 = 2048;
    v25 = v16;
    _os_log_impl(&dword_217514000, v17, OS_LOG_TYPE_DEFAULT, "%s Manual endpointing threshold: %f", (uint8_t *)&v22, 0x16u);
  }
  v18 = v11 > v16;
LABEL_15:

  return v18;
}

- (void)_enterHoldToTalkMode
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AFUISiriViewController _enterHoldToTalkMode]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s Entering HTT mode", (uint8_t *)&v5, 0xCu);
  }
  -[AFUISiriViewController _setInHoldToTalkMode:](self, "_setInHoldToTalkMode:", 1);
  if ((objc_msgSend((id)*MEMORY[0x24BEBDF78], "isPPTAvailable") & 1) == 0)
  {
    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureReportBugButtonToShowHoldToTalkState:", 1);

  }
}

- (void)_transitionToAutomaticEndpointMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[AFUISiriViewController _transitionToAutomaticEndpointMode]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s Transitioning to Automatic Endpointing", (uint8_t *)&v6, 0xCu);
  }
  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setUseAutomaticEndpointing:", 1);
  -[AFUISiriViewController updateRequestOptions:](self, "updateRequestOptions:", v5);
  -[AFUISiriViewController _exitHoldToTalkMode](self, "_exitHoldToTalkMode");

}

- (void)_transitionToManualEndpointMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[AFUISiriViewController _transitionToManualEndpointMode]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s Transitioning to HTT mode", (uint8_t *)&v6, 0xCu);
  }
  -[AFUISiriViewController _currentRequestOptions](self, "_currentRequestOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setUseAutomaticEndpointing:", 0);
  -[AFUISiriViewController updateRequestOptions:](self, "updateRequestOptions:", v5);
  -[AFUISiriViewController _enterHoldToTalkMode](self, "_enterHoldToTalkMode");

}

- (void)_exitHoldToTalkMode
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AFUISiriViewController _exitHoldToTalkMode]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s Exiting HTT mode", (uint8_t *)&v5, 0xCu);
  }
  -[AFUISiriViewController _setInHoldToTalkMode:](self, "_setInHoldToTalkMode:", 0);
  if ((objc_msgSend((id)*MEMORY[0x24BEBDF78], "isPPTAvailable") & 1) == 0)
  {
    -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureReportBugButtonToShowHoldToTalkState:", 0);

  }
}

- (double)_manualEndpointingThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manualEndpointingThreshold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

- (void)_activationTriggerDidRelease:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[AFUISiriViewController _activationTriggerDidRelease:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s Trigger target did release", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(v4, "removeTriggerTarget:", self);
  objc_msgSend(v4, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController _holdToTalkTriggerDidReleaseFromSource:](self, "_holdToTalkTriggerDidReleaseFromSource:", objc_msgSend(v6, "requestSource"));

}

- (void)startRequestWithActivationTrigger:(id)a3
{
  -[AFUISiriViewController startRequestWithActivationTrigger:completion:](self, "startRequestWithActivationTrigger:completion:", a3, 0);
}

- (void)startRequestWithActivationTrigger:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = v9;
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v6, "state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[AFUISiriViewController startRequestWithActivationTrigger:completion:]";
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting request with trigger %@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(v6, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController startRequestWithOptions:completion:](self, "startRequestWithOptions:completion:", v13, v7);

  if (objc_msgSend(v6, "state") == 1)
  {
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[AFUISiriViewController startRequestWithActivationTrigger:completion:]";
      _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s Adding trigger target", (uint8_t *)&v20, 0xCu);
    }
    objc_msgSend(v6, "addTriggerTarget:action:", self, sel__activationTriggerDidRelease_);
    -[AFUISiriViewController inputAccessoryView](self, "inputAccessoryView");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[AFUISiriViewController inputAccessoryView](self, "inputAccessoryView"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isHidden"),
          v17,
          v16,
          !v18))
    {
      -[AFUISiriViewController inputAccessoryView](self, "inputAccessoryView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "becomeFirstResponder");

    }
    else
    {
      -[AFUISiriViewController _enterHoldToTalkMode](self, "_enterHoldToTalkMode");
    }
  }

}

- (void)_stopRequestWithOptions:(id)a3 afterDelay:(double)a4
{
  id v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = fmin(a4, 0.25);
  v8 = v7 * 1000000000.0;
  v9 = v7 < 0.0;
  v10 = 0.0;
  if (!v9)
    v10 = v8;
  v11 = dispatch_time(0, (uint64_t)v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__AFUISiriViewController__stopRequestWithOptions_afterDelay___block_invoke;
  v13[3] = &unk_24D7A2ED0;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v13);

}

uint64_t __61__AFUISiriViewController__stopRequestWithOptions_afterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopRequestWithOptions:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isPreventingActivationGesture
{
  void *v2;
  char v3;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPreventingActivationGesture");

  return v3;
}

- (BOOL)isListening
{
  void *v2;
  char v3;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isListening");

  return v3;
}

- (void)endSession
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int64_t requestCancellationReason;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriViewController delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AFUISiriViewController delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "siriViewControllerShouldEndSession:", self),
        v5,
        v4,
        v6))
  {
    requestCancellationReason = self->_requestCancellationReason;
    self->_requestCancellationReason = 0;
    if (requestCancellationReason)
    {
      v8 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        AFRequestCancellationReasonGetName();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[AFUISiriViewController endSession]";
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: endForReason %@", (uint8_t *)&v12, 0x16u);

      }
    }
    -[AFUISiriViewController _session](self, "_session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endForReason:", requestCancellationReason);

  }
}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__AFUISiriViewController_setWaitingForTelephonyToStart___block_invoke;
  v5[3] = &unk_24D7A1C20;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__AFUISiriViewController_setWaitingForTelephonyToStart___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWaitingForTelephonyToStart:", *(unsigned __int8 *)(a1 + 40));

}

- (void)telephonyRequestCompleted
{
  id v2;

  -[AFUISiriViewController _session](self, "_session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "telephonyRequestCompleted");

}

- (void)_suspendRemoteViewControllerDispatchQueue
{
  if (!self->_remoteViewControllerDispatchQueueSuspended)
  {
    dispatch_suspend((dispatch_object_t)self->_remoteViewControllerDispatchQueue);
    self->_remoteViewControllerDispatchQueueSuspended = 1;
  }
}

- (void)_resumeRemoteViewControllerDispatchQueue
{
  if (self->_remoteViewControllerDispatchQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_remoteViewControllerDispatchQueue);
    self->_remoteViewControllerDispatchQueueSuspended = 0;
  }
}

- (float)audioRecordingPowerLevelForSiriView:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[AFUISiriViewController _session](self, "_session", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordingPowerLevel");
  v5 = v4;

  return v5;
}

- (void)siriViewDidRecieveStatusViewTappedAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonTapFromSource:](self, "_handleMicButtonTapFromSource:", 3);
}

- (void)siriViewDidRecieveStatusViewHoldDidBeginAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:](self, "_handleMicButtonLongPressBeganFromSource:", 3);
}

- (void)siriViewDidRecieveStatusViewHoldDidEndAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:](self, "_handleMicButtonLongPressEndedFromSource:", 3);
}

- (void)_handleReportBugAction
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__AFUISiriViewController__handleReportBugAction__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__AFUISiriViewController__handleReportBugAction__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didReceiveReportBugAction");

}

- (void)_handleReportBugLongPressAction
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__AFUISiriViewController__handleReportBugLongPressAction__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__AFUISiriViewController__handleReportBugLongPressAction__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didReceiveBugButtonLongPress");

}

- (void)_handleHelpAction
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__AFUISiriViewController__handleHelpAction__block_invoke;
  v3[3] = &unk_24D7A1AB8;
  objc_copyWeak(&v4, &location);
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__AFUISiriViewController__handleHelpAction__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didReceiveHelpAction");

}

- (BOOL)siriView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[AFUISiriViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "siriViewController:attemptUnlockWithPassword:", self, v5);

  return (char)self;
}

- (void)siriView:(id)a3 didReceiveSiriActivationMessageWithSource:(int64_t)a4
{
  -[AFUISiriViewController _handleSiriDidActivateFromSource:](self, "_handleSiriDidActivateFromSource:", a4);
}

- (BOOL)requestSessionAttendingState
{
  return -[AFUISiriSession attendingState](self->_session, "attendingState");
}

- (id)assistantVersionForSiriView:(id)a3
{
  void *v3;
  void *v4;

  -[AFUISiriSession siriSessionInfo](self->_session, "siriSessionInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activeAccountForSiriView:(id)a3
{
  void *v3;
  void *v4;

  -[AFUISiriSession siriSessionInfo](self->_session, "siriSessionInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)userAccountCountForSiriView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[AFUISiriSession siriSessionInfo](self->_session, "siriSessionInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userAccountCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)_setShowAudioRoutePicker:(BOOL)a3
{
  char v4;
  _QWORD v5[5];
  char v6;

  if (a3)
    v4 = !-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode");
  else
    v4 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__AFUISiriViewController__setShowAudioRoutePicker___block_invoke;
  v5[3] = &unk_24D7A1A90;
  v5[4] = self;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

void __51__AFUISiriViewController__setShowAudioRoutePicker___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fullSiriView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowAudioRoutePicker:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_setAudioRoutePickerBluetoothOn:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__AFUISiriViewController__setAudioRoutePickerBluetoothOn___block_invoke;
  v3[3] = &unk_24D7A1A90;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __58__AFUISiriViewController__setAudioRoutePickerBluetoothOn___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fullSiriView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAudioRoutePickerBluetoothOn:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_didDetectAudioRoutePickerTap
{
  void *v3;
  id v4;

  -[AFUISiriViewController _session](self, "_session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSpeechRequest");

  -[AFUISiriViewController _routePickerController](self, "_routePickerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showPickerFromViewController:animated:", self, 1);

}

- (id)_routePickerController
{
  SiriUIAudioRoutePickerController *routePickerController;
  id v4;
  SiriUIAudioRoutePickerController *v5;
  SiriUIAudioRoutePickerController *v6;

  routePickerController = self->_routePickerController;
  if (!routePickerController)
  {
    v4 = objc_alloc(MEMORY[0x24BEA84D8]);
    v5 = (SiriUIAudioRoutePickerController *)objc_msgSend(v4, "initWithCategory:mode:delegate:", *MEMORY[0x24BE094C8], CFSTR("SpeechRecognition"), self);
    v6 = self->_routePickerController;
    self->_routePickerController = v5;

    routePickerController = self->_routePickerController;
  }
  return routePickerController;
}

- (BOOL)siriViewShouldSupportTextInput:(id)a3
{
  return 0;
}

- (void)_updateAudioRoutePicker
{
  id v3;

  -[AFUISiriViewController _routePickerController](self, "_routePickerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshRoutes");
  -[AFUISiriViewController _setShowAudioRoutePicker:](self, "_setShowAudioRoutePicker:", objc_msgSend(v3, "hasRoutesToPick"));
  -[AFUISiriViewController _setAudioRoutePickerBluetoothOn:](self, "_setAudioRoutePickerBluetoothOn:", objc_msgSend(v3, "bluetoothIsPicked"));

}

- (void)routePickerController:(id)a3 hasRoutesToPick:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[AFUISiriViewController _setShowAudioRoutePicker:](self, "_setShowAudioRoutePicker:", v4);
  if (v4)
    -[AFUISiriViewController _setAudioRoutePickerBluetoothOn:](self, "_setAudioRoutePickerBluetoothOn:", objc_msgSend(v6, "bluetoothIsPicked"));

}

- (void)routePickerControllerPickedNewRoute:(id)a3 isBluetooth:(BOOL)a4
{
  -[AFUISiriViewController _setAudioRoutePickerBluetoothOn:](self, "_setAudioRoutePickerBluetoothOn:", a4);
}

- (void)routePickerControllerWillShow:(id)a3
{
  id v3;

  -[AFUISiriViewController _session](self, "_session", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioRoutePickerWillShow");

}

- (void)routePickerControllerWillDismiss:(id)a3
{
  id v3;

  -[AFUISiriViewController _session](self, "_session", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioRoutePickerWillDismiss");

}

- (int64_t)getDeviceOrientation:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  if ((unint64_t)(v4 - 1) > 5)
    return 0;
  else
    return qword_217563288[v4 - 1];
}

- (BOOL)getUIViewModeIsUIFreeForCurrentRequest
{
  return -[AFUISiriViewController viewMode](self, "viewMode") == 0;
}

- (BOOL)recentButtonPressActivityDetected:(id)a3
{
  void *v4;
  void *v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDeviceEngagementEvents:forDeviceEngagementTimeWindow:", self, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", &unk_24D7B5A20);
  return (char)v4;
}

- (BOOL)isAmbientPresented:(id)a3
{
  void *v3;
  char v4;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAmbientPresented");

  return v4;
}

- (BOOL)recentTouchScreenActivityDetected:(id)a3
{
  void *v4;
  void *v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDeviceEngagementEvents:forDeviceEngagementTimeWindow:", self, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", &unk_24D7B5A38);
  return (char)v4;
}

- (id)bulletinsForSiriSession:(id)a3
{
  void *v4;
  void *v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinsForSiriViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contextAppInfosForSiriSession:(id)a3
{
  void *v4;
  void *v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextAppInfosForSiriViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentCarPlaySupportedOEMAppIDListForSiriSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AFUISiriViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentCarPlaySupportedOEMAppsForSiriViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)starkAppBundleIdentifierContextForSiriSession:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AFUISiriViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "starkAppBundleIdentifierContextForSiriViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isPPTAvailable
{
  return objc_msgSend((id)*MEMORY[0x24BEBDF78], "isPPTAvailable");
}

- (unint64_t)lockStateForSiriSession:(id)a3
{
  void *v4;
  unint64_t v5;

  -[AFUISiriViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lockStateForSiriViewController:", self);

  return v5;
}

- (int64_t)carPlayEnhancedVoiceTriggerModeForSiriSession:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "carPlayEnhancedVoiceTriggerMode");

  return v4;
}

- (void)siriSession:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[AFUISiriViewController siriSession:willProcessAppLaunchWithBundleIdentifier:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v8, 0xCu);
  }
  self->_isProcessingAppLaunch = 1;
  -[AFUISiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriViewController:willProcessAppLaunchWithBundleIdentifier:", self, v5);

}

- (void)siriSession:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[AFUISiriViewController siriSession:failedToLaunchAppWithBundleIdentifier:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v8, 0xCu);
  }
  self->_isProcessingAppLaunch = 0;
  -[AFUISiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriViewController:failedToLaunchAppWithBundleIdentifier:", self, v5);

}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setInputPowerLevel:", v6);

  -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setInputPowerLevel:", v7);

}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4
{
  void *v6;
  double v7;
  double v8;
  id v9;

  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "updateVolumeInputdB:", v7);

  -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v9, "updateVolumeInputdB:", v8);

}

- (void)siriSessionAudioOutputDidChangePowerLevel:(float)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[AFUISiriViewController _compactSiriView](self, "_compactSiriView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setOutputPowerLevel:", v6);

  -[AFUISiriViewController _carPlaySiriView](self, "_carPlaySiriView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setOutputPowerLevel:", v7);

}

- (void)siriSession:(id)a3 didChangeToState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  id v8;
  int64_t currentRequestSource;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  currentRequestSource = self->_currentRequestSource;
  if (currentRequestSource == 20)
  {
    if (!self->_presentedConversationFromBreadcrumb)
      goto LABEL_13;
  }
  else if (a4 == 2 && currentRequestSource == 23)
  {
    goto LABEL_13;
  }
  if (self->_isProcessingAppLaunch && !-[AFUISiriViewController isDeviceInStarkMode](self, "isDeviceInStarkMode"))
  {
    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[AFUISiriViewController siriSession:didChangeToState:event:machAbsoluteTransitionTime:]";
      _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation: trying to change session state while processing an app launch", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSiriSessionState:", a4);

    if (a4 == 1)
    {
      -[AFUISiriViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[AFUISiriViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "siriViewControllerDidChangeToListeningMode:", self);

      }
    }
  }
LABEL_13:

}

- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestWithCompletion:(id)a4
{
  -[AFUISiriViewController siriSession:didReceiveDeviceUnlockRequestAndCancelRequest:withCompletion:](self, "siriSession:didReceiveDeviceUnlockRequestAndCancelRequest:withCompletion:", a3, 1, a4);
}

- (void)siriSession:(id)a3 didReceiveDeviceUnlockRequestAndCancelRequest:(BOOL)a4 withCompletion:(id)a5
{
  -[AFUISiriViewController handlePasscodeUnlockAndCancelRequest:withCompletion:](self, "handlePasscodeUnlockAndCancelRequest:withCompletion:", a4, a5);
}

- (void)siriSession:(id)a3 didReceiveAppUnlockRequestForAppId:(id)a4 withCompletion:(id)a5
{
  -[AFUISiriViewController handleAppUnlockForAppId:withCompletion:](self, "handleAppUnlockForAppId:withCompletion:", a4, a5);
}

- (void)siriSessionDidReceiveDelayedActionCommand:(id)a3 completion:(id)a4
{
  -[SRUIFDelayedActionCommandCache enqueueDelayedActionCommand:completion:](self->_delayedActionCommandCache, "enqueueDelayedActionCommand:completion:", a3, a4);
}

- (void)siriSessionDidReceiveDelayedActionCancelCommand:(id)a3 completion:(id)a4
{
  -[SRUIFDelayedActionCommandCache cancelDelayedActionWithDelayedActionCancelCommand:completion:](self->_delayedActionCommandCache, "cancelDelayedActionWithDelayedActionCancelCommand:completion:", a3, a4);
}

- (void)siriSessionDidResetContext:(id)a3
{
  id v4;

  -[AFUISiriViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerSessionDidResetContext:", self);

}

- (void)siriSessionWillEnd:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AFUISiriViewController siriSessionWillEnd:]";
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[SRUIFDelayedActionCommandCache performDismissalCommands](self->_delayedActionCommandCache, "performDismissalCommands");
}

- (void)siriSessionDidEnd:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  AFUISiriSession *session;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFUISiriViewController siriSessionDidEnd:]";
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[AFUISiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriViewController:didEndSession:", self, v4);

  }
  session = self->_session;
  self->_session = 0;

  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFUISiriViewController siriSessionDidEnd:]";
    _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s Session released from AFUISiriViewController", buf, 0xCu);
  }
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__AFUISiriViewController_siriSessionDidEnd___block_invoke;
  v14[3] = &unk_24D7A1B30;
  v15 = v12;
  v13 = v12;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v14);

}

uint64_t __44__AFUISiriViewController_siriSessionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "siriDidDeactivate");
}

- (void)siriSessionDidUpdateSessionInfo:(id)a3
{
  id v3;

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)siriSession:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v7;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s Speech recording began on audio route: %@", v21, 0x16u);
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB16B8]))
  {
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
      v11 = "%s Audio route changed to BluetoothHFP";
LABEL_9:
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, v11, v21, 0xCu);
    }
  }
  else
  {
    -[AFUISiriViewController _recordingStartedTimeValue](self, "_recordingStartedTimeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_15;
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
      v11 = "%s Recording start time is not set";
      goto LABEL_9;
    }
  }
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 136315138;
    *(_QWORD *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s Recording start time should be updated", v21, 0xCu);
  }
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo", *(_OWORD *)v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemUptime");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)&v21[4] = "-[AFUISiriViewController siriSession:speechRecordingDidBeginOnAVRecordRoute:]";
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v16;
    _os_log_impl(&dword_217514000, v17, OS_LOG_TYPE_DEFAULT, "%s Updating recording start time to: %@", v21, 0x16u);
  }
  -[AFUISiriViewController _setRecordingStartedTimeValue:](self, "_setRecordingStartedTimeValue:", v16);

LABEL_15:
  -[AFUISiriViewController _presentDeferredFlamesViewIfNecessary](self, "_presentDeferredFlamesViewIfNecessary");
  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFlamesViewPaused:", 0);

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setupOrbIfNeeded");

  -[AFUISiriViewController _fullSiriView](self, "_fullSiriView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHelpButtonDeferred:", 0);

  self->_recordingStartedOnRoute = 1;
}

- (void)siriSessionDidFinishRequestWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AFUISiriViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriViewController:didCompleteRequestWithError:", self, v7);

  }
}

- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSessionShouldExtendAudioSessionForImminentPhoneCall");

  }
}

- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSessionShouldEndExtendAudioSessionForImminentPhoneCall");

  }
}

- (BOOL)shouldNonLocalDelegateHandlePunchouts
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = v3;
    objc_msgSend(v4, "numberWithBool:", -[AFUISiriViewController isVisible](self, "isVisible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFUISiriViewController shouldNonLocalDelegateHandlePunchouts]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s shouldNonLocalDelegateHandlePunchouts isVisible: %@", (uint8_t *)&v8, 0x16u);

  }
  return -[AFUISiriViewController isVisible](self, "isVisible");
}

- (void)handlePunchoutCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "launchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x24BE82670]);

  -[AFUISiriViewController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "punchOutUri");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "openURL:bundleId:inPlace:completion:", v10, v11, v9, v6);
}

- (void)siriSessionImmersiveExperienceRequested
{
  if ((SiriUIDeviceIsPad() & 1) == 0 && !self->_immersiveExperienceOn)
  {
    -[AFUISiriViewController setShouldDismissForTapOutsideContent:](self, "setShouldDismissForTapOutsideContent:", 0);
    -[AFUISiriViewController setShouldDismissForTapsOutsideContent:](self, "setShouldDismissForTapsOutsideContent:", 0);
    -[AFUISiriViewController setShouldDismissForSwipesOutsideContent:](self, "setShouldDismissForSwipesOutsideContent:", 0);
    self->_immersiveExperienceOn = 1;
  }
}

- (void)siriSessionDidReactivateFromFlexibleFollowups
{
  void *v3;
  char v4;
  id v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriViewControllerDidReactivateFromFlexibleFollowups");

  }
}

- (void)siriSessionDidReceiveTakeScreenshotCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "shouldHideSiri"))
  {
    -[AFUISiriViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisableUpdateMask:", 2);

  }
  objc_initWeak(&location, self);
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__AFUISiriViewController_siriSessionDidReceiveTakeScreenshotCommand_completion___block_invoke;
  v13[3] = &unk_24D7A3388;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "takeScreenshotWithCompletion:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __80__AFUISiriViewController_siriSessionDidReceiveTakeScreenshotCommand_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  Class *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisableUpdateMask:", 0);

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (Class *)0x24BE811B8;
    if (!a2)
      v8 = (Class *)0x24BE811A8;
    v9 = objc_alloc_init(*v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)siriSessionDidReceiveSetUpdateMaskCommand:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(id, id);

  v12 = (void (**)(id, id))a4;
  LODWORD(a3) = objc_msgSend(a3, "shouldHideSiri");
  -[AFUISiriViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)a3)
    v10 = 2;
  else
    v10 = 0;
  objc_msgSend(v8, "setDisableUpdateMask:", v10);

  if (v12)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE811B8]);
    v12[2](v12, v11);

  }
}

- (void)siriSessionDidReceiveStartScreenRecordingCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(id, void *);
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isRecording"))
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[AFUISiriViewController siriSessionDidReceiveStartScreenRecordingCommand:completion:]";
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to start recording as it is already in progress", buf, 0xCu);
    }
    v10 = (void *)MEMORY[0x24BE811A8];
    objc_msgSend(v6, "aceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sruif_commandFailedWithRefId:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v12);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke;
    v13[3] = &unk_24D7A33B0;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v7;
    v14 = v6;
    objc_msgSend(v8, "startSystemRecordingWithMicrophoneEnabled:handler:", 0, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke_cold_1();
    v5 = a1 + 40;
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = (void *)MEMORY[0x24BE811A8];
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sruif_commandFailedWithRefId:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v8;

      (*(void (**)(void))(*(_QWORD *)v5 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[AFUISiriViewController siriSessionDidReceiveStartScreenRecordingCommand:completion:]_block_invoke";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s Recording successfully started", (uint8_t *)&v12, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_dismissWithReason:", 9);

    v5 = a1 + 40;
    if (*(_QWORD *)(a1 + 40))
    {
      v10 = (void *)MEMORY[0x24BE811B8];
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sruif_commandSucceededWithRefId:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }

}

- (void)siriSessionDidReceiveStopScreenRecordingCommand:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRecording") & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke;
    v12[3] = &unk_24D7A33D8;
    v14 = v6;
    v13 = v5;
    objc_msgSend(v7, "stopSystemRecording:", v12);

    v8 = v14;
  }
  else
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[AFUISiriViewController siriSessionDidReceiveStopScreenRecordingCommand:completion:]";
      _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to stop recording as there is no recording in progress", buf, 0xCu);
    }
    v10 = (void *)MEMORY[0x24BE811A8];
    objc_msgSend(v5, "aceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sruif_commandFailedWithRefId:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }

}

void __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke_cold_1();
    v5 = a1 + 40;
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = (void *)MEMORY[0x24BE811A8];
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sruif_commandFailedWithRefId:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v10 = (void *)v8;

      (*(void (**)(void))(*(_QWORD *)v5 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[AFUISiriViewController siriSessionDidReceiveStopScreenRecordingCommand:completion:]_block_invoke";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s Recording successfully stopped", (uint8_t *)&v11, 0xCu);
    }
    v5 = a1 + 40;
    if (*(_QWORD *)(a1 + 40))
    {
      v9 = (void *)MEMORY[0x24BE811B8];
      objc_msgSend(*(id *)(a1 + 32), "aceId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sruif_commandSucceededWithRefId:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }

}

- (void)siriSession:(id)a3 initialBringupProcessedWithTurnIdentifier:(id)a4
{
  -[SRUIFPlatformHostingInstrumentationHandler hostingBringUpProcessedWithTurnIdenitfier:](self->_viewHostingInstrumentationHandler, "hostingBringUpProcessedWithTurnIdenitfier:", a4);
}

- (BOOL)headphonesAuthenticated
{
  void *v3;
  void *v4;
  char v5;

  -[AFUISiriViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AFUISiriViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "headphonesAuthenticated");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[AFUISiriViewController _remoteViewController](self, "_remoteViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateToPresentationWithIdentifier:presentationProperties:animated:completion:", v12, v11, v6, v10);

}

- (BOOL)_recordingStartedOnRoute
{
  return self->_recordingStartedOnRoute;
}

- (void)_setRecordingStartedOnRoute:(BOOL)a3
{
  self->_recordingStartedOnRoute = a3;
}

- (id)_configuration
{
  return self->_configuration;
}

- (unint64_t)_currentSessionAvailabilityState
{
  return self->_currentSessionAvailabilityState;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isDeviceScreenOn
{
  void *v2;
  char v3;

  -[AFUISiriViewController _systemState](self, "_systemState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceScreenIsOn");

  return v3;
}

- (id)_systemState
{
  return (id)objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
}

- (void)emitUIStateTransitionForSiriDismissalWithReason:(int64_t)a3
{
  int v5;
  SRUIFPlatformHostingInstrumentationHandler *v6;
  SRUIFPlatformHostingInstrumentationHandler *v7;
  _QWORD v8[4];
  SRUIFPlatformHostingInstrumentationHandler *v9;
  id v10;
  int v11;
  id location;

  objc_initWeak(&location, self);
  -[AFUISiriViewController _donateUIDismissalToBiome:](self, "_donateUIDismissalToBiome:", a3);
  v5 = SASDismissalReasonToSISchemaDismissalReason();
  v6 = self->_viewHostingInstrumentationHandler;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke;
  v8[3] = &unk_24D7A3428;
  objc_copyWeak(&v10, &location);
  v11 = v5;
  v7 = v6;
  v9 = v7;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned int *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke_2;
  v5[3] = &unk_24D7A3400;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "emitUIStateTransitionForSiriDismissalWithDismissalReason:completion:", v4, v5);

}

void __74__AFUISiriViewController_emitUIStateTransitionForSiriDismissalWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE090D0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithTurnIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "hostingDismissalProcessedWithTurnIdenitfier:", v5);
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__AFUISiriViewController_emitInstrumentationEvent___block_invoke;
  v6[3] = &unk_24D7A1D90;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __51__AFUISiriViewController_emitInstrumentationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emitInstrumentationEvent:", *(_QWORD *)(a1 + 32));

}

- (void)emitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__AFUISiriViewController_emitInstrumentationEvent_atTime___block_invoke;
  v8[3] = &unk_24D7A1D68;
  objc_copyWeak(v10, &location);
  v7 = v6;
  v9 = v7;
  v10[1] = (id)a4;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __58__AFUISiriViewController_emitInstrumentationEvent_atTime___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emitInstrumentationEvent:atTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)siriContentDidReceiveOrbTappedAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonTapFromSource:](self, "_handleMicButtonTapFromSource:", 3);
}

- (void)siriContentDidReceiveOrbHoldDidBeginAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressBeganFromSource:](self, "_handleMicButtonLongPressBeganFromSource:", 3);
}

- (void)siriContentDidReceiveOrbHoldDidEndAction:(id)a3
{
  -[AFUISiriViewController _handleMicButtonLongPressEndedFromSource:](self, "_handleMicButtonLongPressEndedFromSource:", 3);
}

- (void)hideVoiceActivationMaskViewIfNecessary
{
  id v2;
  id location;

  if (self->_shouldShowVoiceActivationMaskView)
  {
    self->_shouldShowVoiceActivationMaskView = 0;
    objc_initWeak(&location, self);
    objc_copyWeak(&v2, &location);
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

void __64__AFUISiriViewController_hideVoiceActivationMaskViewIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_siriView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[AFUISiriViewController hideVoiceActivationMaskViewIfNecessary]_block_invoke";
        _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Requesting hide - voiceActivationMaskView", (uint8_t *)&v8, 0xCu);
      }
      objc_msgSend(v2, "_siriView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setVoiceActivationMaskViewVisible:", 0);

    }
    if (v2[142] == 1)
      objc_msgSend(v2, "requestStatusBarVisible:", 1);
    v2[142] = 0;
    objc_msgSend(v2, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriViewController:voiceActivationMaskViewIsVisible:", v2, 0);

  }
}

- (void)animateOrbViewDismissalIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __75__AFUISiriViewController_animateOrbViewDismissalIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_compactSiriView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v5, "_compactSiriView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animateOrbViewDismissalWithCompletion:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    WeakRetained = v5;
  }

}

- (void)commandCache:(id)a3 didSuccessfullyHandleCommandsInDelayedActionCommand:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__AFUISiriViewController_commandCache_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke;
  v9[3] = &unk_24D7A1D90;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[AFUISiriViewController _enqueueRemoteViewControllerMessageBlock:](self, "_enqueueRemoteViewControllerMessageBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __91__AFUISiriViewController_commandCache_didSuccessfullyHandleCommandsInDelayedActionCommand___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSuccessfullyHandleCommandsInDelayedActionCommand:", *(_QWORD *)(a1 + 32));

}

- (id)_fullSiriView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[AFUISiriViewController _siriView](self, "_siriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_compactSiriView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[AFUISiriViewController _siriView](self, "_siriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_carPlaySiriView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[AFUISiriViewController _siriView](self, "_siriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_orbViewControllingView
{
  void *v3;
  char v4;
  void *v5;

  -[AFUISiriViewController _siriView](self, "_siriView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AFUISiriViewController _siriView](self, "_siriView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (AFUISiriViewControllerDataSource)dataSource
{
  return (AFUISiriViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (AFUISiriViewControllerDelegate)delegate
{
  return (AFUISiriViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (BOOL)isDeviceInStarkMode
{
  return self->_deviceIsInStarkMode;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)announcementRequestsPermittedWhilePresentationActive
{
  return self->_announcementRequestsPermittedWhilePresentationActive;
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (BOOL)carDNDActive
{
  return self->_carDNDActive;
}

- (BOOL)receivedIncomingPhoneCall
{
  return self->_receivedIncomingPhoneCall;
}

- (BOOL)turnsOnScreenOnAppearance
{
  return self->_turnsOnScreenOnAppearance;
}

- (void)setTurnsOnScreenOnAppearance:(BOOL)a3
{
  self->_turnsOnScreenOnAppearance = a3;
}

- (BOOL)showsStatusBar
{
  return self->_showsStatusBar;
}

- (void)setShowsStatusBar:(BOOL)a3
{
  self->_showsStatusBar = a3;
}

- (BOOL)statusBarEnabled
{
  return self->_statusBarEnabled;
}

- (void)setStatusBarEnabled:(BOOL)a3
{
  self->_statusBarEnabled = a3;
}

- (AFUISiriEdgelightViewProvider)edgeLightViewProvider
{
  return (AFUISiriEdgelightViewProvider *)objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
}

- (AFUISiriSession)_session
{
  return self->_session;
}

- (AFUISiriRemoteSceneViewController)_remoteViewController
{
  return self->_remoteViewController;
}

- (OS_dispatch_queue)_remoteViewControllerDispatchQueue
{
  return self->_remoteViewControllerDispatchQueue;
}

- (BOOL)_hasCalledBeginAppearanceTransition
{
  return self->_hasCalledBeginAppearanceTransition;
}

- (void)_setHasCalledBeginAppearanceTransition:(BOOL)a3
{
  self->_hasCalledBeginAppearanceTransition = a3;
}

- (BOOL)_hasCalledEndAppearanceTransition
{
  return self->_hasCalledEndAppearanceTransition;
}

- (void)_setHasCalledEndAppearanceTransition:(BOOL)a3
{
  self->_hasCalledEndAppearanceTransition = a3;
}

- (SiriUIAudioRoutePickerController)routePickerController
{
  return self->_routePickerController;
}

- (void)setRoutePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_routePickerController, a3);
}

- (UIStatusBar)_statusBar
{
  return self->_statusBar;
}

- (void)_setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (BOOL)_isInHoldToTalkMode
{
  return self->_inHoldToTalkMode;
}

- (void)_setInHoldToTalkMode:(BOOL)a3
{
  self->_inHoldToTalkMode = a3;
}

- (SASRequestOptions)_currentRequestOptions
{
  return self->_currentRequestOptions;
}

- (NSNumber)_recordingStartedTimeValue
{
  return self->_recordingStartedTimeValue;
}

- (void)_setRecordingStartedTimeValue:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStartedTimeValue, a3);
}

- (double)_viewDidAppearTime
{
  return self->_viewDidAppearTime;
}

- (void)_setViewDidAppearTime:(double)a3
{
  self->_viewDidAppearTime = a3;
}

- (BOOL)isViewDisappearing
{
  return self->_viewDisappearing;
}

- (void)setViewDisappearing:(BOOL)a3
{
  self->_viewDisappearing = a3;
}

- (BOOL)_siriRemoteViewControllerIsEditing
{
  return self->_siriRemoteViewControllerIsEditing;
}

- (void)_setSiriRemoteViewControllerIsEditing:(BOOL)a3
{
  self->_siriRemoteViewControllerIsEditing = a3;
}

- (BOOL)_isPunchingOut
{
  return self->_punchingOut;
}

- (CGRect)hostedPresentationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hostedPresentationFrame.origin.x;
  y = self->_hostedPresentationFrame.origin.y;
  width = self->_hostedPresentationFrame.size.width;
  height = self->_hostedPresentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_statusViewHidden
{
  return self->_statusViewHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingStartedTimeValue, 0);
  objc_storeStrong((id *)&self->_currentRequestOptions, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_routePickerController, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_edgeLightViewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activationInstrumentation, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong((id *)&self->_currentDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_tapPanDismissalPolicyManager, 0);
  objc_storeStrong((id *)&self->_networkAvailabilityStateMachine, 0);
  objc_storeStrong((id *)&self->_dismissalUserInfo, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_uiAppearanceRecordQueue, 0);
  objc_storeStrong((id *)&self->_uiAppearanceUUIDString, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delayedActionCommandCache, 0);
  objc_storeStrong(&self->_triggerUpdater, 0);
}

- (void)initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationName(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AFUISiriViewController.m"), 127, CFSTR("%s"), dlerror());

  __break(1u);
}

void __139__AFUISiriViewController_initWithConnection_configuration_requestSource_displayConfiguration_edgeLightViewProvider_instrumentationHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Timed out waiting for remote view controller to connect.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s AFUISiriViewController deallocated before -[AFUISiriRemoteSceneViewController startHostingSceneForConfiguration:] completionBlock could run.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __54__AFUISiriViewController__presentRemoteViewController__block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 136315650;
  v7 = "-[AFUISiriViewController _presentRemoteViewController]_block_invoke";
  v8 = 2114;
  v9 = (id)objc_opt_class();
  v10 = 2114;
  v11 = a3;
  v5 = v9;
  _os_log_error_impl(&dword_217514000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to obtain remote view controller: %{public}@", (uint8_t *)&v6, 0x20u);

}

void __86__AFUISiriViewController_siriSessionDidReceiveStartScreenRecordingCommand_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Error starting system recording: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __85__AFUISiriViewController_siriSessionDidReceiveStopScreenRecordingCommand_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Error stopping system recording: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
