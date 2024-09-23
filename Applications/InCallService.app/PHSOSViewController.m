@implementation PHSOSViewController

+ (id)getSetOfSOSDismissalAssertions
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("PHSOSCallAssertionReason"), CFSTR("PHAlertRestingScreenAssertionReason"), 0);
}

+ (BOOL)isSOSDismissalAssertionActive
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSViewController getSetOfSOSDismissalAssertions](PHSOSViewController, "getSetOfSOSDismissalAssertions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
  v4 = objc_msgSend(v2, "intersectsSet:", v3);

  return v4;
}

+ (id)getSetOfCallBufferDismissalAssertions
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("PHCallBufferScreenAssertionReason"), CFSTR("PHSliderSwipeCallBufferScreenAssertionReason"), 0);
}

+ (BOOL)isCallBufferDismissalAssertionActive
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSViewController getSetOfCallBufferDismissalAssertions](PHSOSViewController, "getSetOfCallBufferDismissalAssertions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
  v4 = objc_msgSend(v2, "intersectsSet:", v3);

  return v4;
}

+ (void)releaseAllCallBufferDismissalAssertions
{
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHCallBufferScreenAssertionReason"));
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHSliderSwipeCallBufferScreenAssertionReason"));
}

- (PHSOSViewController)initWithSOSHandles:(id)a3
{
  id v5;
  PHSOSViewController *v6;
  CoreTelephonyClient *v7;
  CoreTelephonyClient *coreTelephonyClient;
  CNKCoreAnalyticsReporter *v9;
  CNKCoreAnalyticsReporter *analyticsReporter;
  PHAudioDeviceController *v11;
  PHAudioDeviceController *audioDeviceController;
  uint64_t v13;
  SOSCoreAnalyticsReporting *coreAnalyticsReporter;
  uint64_t v15;
  TUAudioRoute *priorSystemAudioRoute;
  void *v17;
  uint64_t v18;
  NSString *sessionId;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  CTStewieStateMonitor *v31;
  CTStewieStateMonitor *stewieStateMonitor;
  uint64_t v33;
  CTStewieState *stewieState;
  id v35;
  NSObject *v36;
  CTStewieState *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  NSArray *sosHandles;
  int64_t sosMode;
  id v46;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  int64_t v52;

  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PHSOSViewController;
  v6 = -[PHSOSViewController init](&v48, "init");
  if (v6)
  {
    v7 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", &_dispatch_main_q);
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = v7;

    v9 = objc_opt_new(CNKCoreAnalyticsReporter);
    analyticsReporter = v6->_analyticsReporter;
    v6->_analyticsReporter = v9;

    objc_storeStrong((id *)&v6->_sosHandles, a3);
    v6->_sosTrigger = (int64_t)+[SOSUtilities mostRecentlyUsedSOSTriggerMechanism](SOSUtilities, "mostRecentlyUsedSOSTriggerMechanism");
    v6->_isPendingAudioSessionActivation = 1;
    v11 = objc_alloc_init(PHAudioDeviceController);
    audioDeviceController = v6->_audioDeviceController;
    v6->_audioDeviceController = v11;

    -[PHAudioDeviceController setDelegate:](v6->_audioDeviceController, "setDelegate:", v6);
    v13 = objc_claimAutoreleasedReturnValue(+[SOSCoreAnalyticsReporter sharedInstance](SOSCoreAnalyticsReporter, "sharedInstance"));
    coreAnalyticsReporter = v6->_coreAnalyticsReporter;
    v6->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v13;

    v6->_priorSystemVolume = -1.0;
    v15 = objc_claimAutoreleasedReturnValue(-[PHAudioDeviceController currentRoute](v6->_audioDeviceController, "currentRoute"));
    priorSystemAudioRoute = v6->_priorSystemAudioRoute;
    v6->_priorSystemAudioRoute = (TUAudioRoute *)v15;

    v6->_callDialStartTime = -1.0;
    v6->_timeTillActive = -1.0;
    v6->_callAutoDialled = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    sessionId = v6->_sessionId;
    v6->_sessionId = (NSString *)v18;

    v6->_sessionStartTime = CFAbsoluteTimeGetCurrent();
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("PHSOSCallAssertionReason"));

    if (v21)
    {
      objc_storeStrong((id *)&v6->_launchedForAssertionReason, CFSTR("PHSOSCallAssertionReason"));
      switch(v6->_sosTrigger)
      {
        case 0:
          v22 = sub_1000C5588();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_1001A90F4();

          goto LABEL_7;
        case 1:
        case 2:
LABEL_7:
          if (+[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled")&& sub_10005A154()&& (v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController coreTelephonyClient](v6, "coreTelephonyClient")), v25 = +[SOSUtilities shouldForceDisableAutoCallForClient:](SOSUtilities, "shouldForceDisableAutoCallForClient:", v24), v24, !v25))
          {
            v26 = 1;
          }
          else
          {
            v26 = 2;
          }
          v6->_sosMode = v26;
          v27 = 352;
          v28 = 2;
          break;
        case 3:
          v6->_sosMode = 2;
          v27 = 352;
          v28 = 1;
          break;
        case 7:
          v27 = 32;
          v28 = 8;
          break;
        default:
          v40 = sub_1000C5588();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_1001A9080(&v6->_sosTrigger, v41);

          v27 = 32;
          v28 = 2;
          break;
      }
      *(Class *)((char *)&v6->super.super.super.isa + v27) = (Class)v28;
      v6->_shouldDropBioAuthTokenOnDismiss = 1;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions"));
      v30 = objc_msgSend(v29, "containsObject:", CFSTR("PHAlertRestingScreenAssertionReason"));

      if (v30)
      {
        objc_storeStrong((id *)&v6->_launchedForAssertionReason, CFSTR("PHAlertRestingScreenAssertionReason"));
        v6->_sosMode = 10;
        v31 = (CTStewieStateMonitor *)objc_msgSend(objc_alloc((Class)CTStewieStateMonitor), "initWithDelegate:queue:", v6, &_dispatch_main_q);
        stewieStateMonitor = v6->_stewieStateMonitor;
        v6->_stewieStateMonitor = v31;

        -[CTStewieStateMonitor start](v6->_stewieStateMonitor, "start");
        v33 = objc_claimAutoreleasedReturnValue(-[CTStewieStateMonitor getState](v6->_stewieStateMonitor, "getState"));
        stewieState = v6->_stewieState;
        v6->_stewieState = (CTStewieState *)v33;

        v35 = sub_1000C5588();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v6->_stewieState;
          *(_DWORD *)buf = 138412290;
          v50 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Stewie state on launch: %@", buf, 0xCu);
        }

      }
      else
      {
        v38 = sub_1000C5588();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_1001A9120();

        v6->_sosMode = 2;
      }
    }
    v42 = sub_1000C5588();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      sosHandles = v6->_sosHandles;
      sosMode = v6->_sosMode;
      *(_DWORD *)buf = 138412546;
      v50 = sosHandles;
      v51 = 2048;
      v52 = sosMode;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Initialized PHSOSViewController with sosHandles: %@ sosMode: %ld", buf, 0x16u);
    }

    -[PHSOSViewController addObservers](v6, "addObservers");
    v46 = objc_alloc_init((Class)SPBeaconManager);
    -[PHSOSViewController setBeaconManager:](v6, "setBeaconManager:", v46);

  }
  return v6;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "callStateChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "emergencyCallbackModeChangedNotification:", TUCallCapabilitiesEmergencyCallbackModeChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "interactiveStateChangedNotification:", SOSInteractiveStateChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "buttonPressStateChangedNotification:", SOSButtonPressStateChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "dismissSOSNotification:", SOSDismissSOSNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleNetworkUnavailableAlertDidFinishNotification:", CFSTR("PHNetworkUnavailableAlertDidFinishNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleAlertDisconnectingCallsNotification:", CFSTR("PHAlertDisconnectingCallsNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleCallBufferCompletionNotification:", CFSTR("PHCallBufferCompletionNotification"), 0);

}

- (void)updateSOSHandles:(id)a3
{
  PHSOSNumbersViewController *sosNumbersViewController;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_sosHandles, a3);
  sosNumbersViewController = self->_sosNumbersViewController;
  if (sosNumbersViewController)
    -[PHSOSNumbersViewController updateSOSHandles:](sosNumbersViewController, "updateSOSHandles:", self->_sosHandles);

}

- (BOOL)shouldAllowLockButtonPressesToDismissSOS
{
  if ((id)-[PHSOSViewController sosMode](self, "sosMode") != (id)2
    || self->_currentInteractiveState
    || +[PHSOSViewController isCallBufferDismissalAssertionActive](PHSOSViewController, "isCallBufferDismissalAssertionActive"))
  {
    return 0;
  }
  else
  {
    return !-[PHSOSViewController requestedCallActive](self, "requestedCallActive");
  }
}

- (BOOL)clawButtonPressGapWithinThreshold
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v2 == 0.0)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSOSButtonPressState"));
  objc_msgSend(v4, "getButtonPressGap");
  v6 = v5 <= 3.0;

  return v6;
}

- (void)interactiveStart
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  PHSOSDialSlidingViewModel *v7;

  if ((id)-[PHSOSViewController sosMode](self, "sosMode") != (id)2
    || -[PHSOSViewController requestedCallActive](self, "requestedCallActive"))
  {
    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  if (objc_msgSend(v3, "slidingViewState") == (id)1 || !sub_10005A154())
    goto LABEL_7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController coreTelephonyClient](self, "coreTelephonyClient"));
  if (+[SOSUtilities shouldForceDisableAutoCallForClient:](SOSUtilities, "shouldForceDisableAutoCallForClient:", v4))
  {

LABEL_7:
    goto LABEL_8;
  }
  v5 = -[PHSOSViewController clawButtonPressGapWithinThreshold](self, "clawButtonPressGapWithinThreshold");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    v7 = objc_alloc_init(PHSOSDialSlidingViewModel);
    objc_msgSend(v6, "interactiveStartWithCountdownModel:", v7);

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    -[PHSOSViewController setInteractiveStartTime:](self, "setInteractiveStartTime:");
    return;
  }
LABEL_8:
  if (!-[PHSOSViewController clawButtonPressGapWithinThreshold](self, "clawButtonPressGapWithinThreshold"))
  {
    -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 1);
    -[PHSOSViewController setClawResolution:](self, "setClawResolution:", 7);
    -[PHSOSViewController submitSOSResolutionMetric:](self, "submitSOSResolutionMetric:", 0);
  }
}

- (void)interactiveStop:(BOOL)a3
{
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A66C;
  v7[3] = &unk_100285E98;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  v5 = objc_retainBlock(v7);
  if ((id)-[PHSOSViewController sosMode](self, "sosMode") == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    objc_msgSend(v6, "interactiveStop:", v5);

  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewController;
  -[PHSOSViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidLoad
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  PHBottomBarButtonConfiguration *v8;
  PHBottomBarButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHSOSViewController;
  -[PHSOSViewController viewDidLoad](&v16, "viewDidLoad");
  if (-[PHAudioDeviceController speakerRouteAvailable](self->_audioDeviceController, "speakerRouteAvailable"))
  {
    -[PHAudioDeviceController pickSpeakerRoute](self->_audioDeviceController, "pickSpeakerRoute");
    v3 = -[PHAudioDeviceController speakerRouteIsPicked](self->_audioDeviceController, "speakerRouteIsPicked");
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if ((v3 & 1) != 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,routed audio through speaker", v15, 2u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_1001A914C();
    }
  }
  else
  {
    v7 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1001A9178();
  }

  v8 = -[PHBottomBarButtonConfiguration initWithAction:]([PHBottomBarButtonConfiguration alloc], "initWithAction:", 18);
  v9 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v8);
  -[PHSOSViewController setCancelButton:](self, "setCancelButton:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v11, "addTarget:action:forEvents:", self, "buttonPressed:", 64);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v12, "addSubview:", v13);

  -[PHSOSViewController setUpCancelButtonConstraints](self, "setUpCancelButtonConstraints");
  -[PHSOSViewController setSosMode:](self, "setSosMode:", self->_sosMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  objc_msgSend(v14, "setCurrentSOSInitiationState:", 1);

  -[PHSOSViewController updateInteractiveState](self, "updateInteractiveState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  PHCountdownView *countdownView;
  PHCheckInView *checkInView;
  objc_super v7;

  v3 = a3;
  countdownView = self->_countdownView;
  if (countdownView)
    -[PHCountdownView pause](countdownView, "pause");
  checkInView = self->_checkInView;
  if (checkInView)
    -[PHCheckInView pause](checkInView, "pause");
  v7.receiver = self;
  v7.super_class = (Class)PHSOSViewController;
  -[PHSOSViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  if (!+[PHSOSViewController isCallBufferDismissalAssertionActive](PHSOSViewController, "isCallBufferDismissalAssertionActive"))
  {
    -[PHSOSViewController setVolumeHUDHiddenPending:](self, "setVolumeHUDHiddenPending:", 0);
    -[PHSOSViewController handleVolumeHUDEnablement](self, "handleVolumeHUDEnablement");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  PHCountdownView *countdownView;
  PHCheckInView *checkInView;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHSOSViewController;
  -[PHSOSViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  countdownView = self->_countdownView;
  if (countdownView)
    -[PHCountdownView resume](countdownView, "resume");
  checkInView = self->_checkInView;
  if (checkInView)
    -[PHCheckInView resume](checkInView, "resume");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[PHSOSViewController setCountdownStartedTime:](self, "setCountdownStartedTime:");
  -[PHSOSViewController setVolumeHUDHiddenPending:](self, "setVolumeHUDHiddenPending:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005AB3C;
  v9[3] = &unk_100285948;
  v9[4] = self;
  objc_msgSend(v8, "waitForRegistrationOfSceneWithType:completion:", 0, v9);

}

- (void)handleVolumeHUDEnablement
{
  unsigned int v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  unsigned int v11;

  v3 = -[PHSOSViewController volumeHUDHiddenPending](self, "volumeHUDHiddenPending");
  v4 = -[PHSOSViewController volumeHUDHiddenCurrently](self, "volumeHUDHiddenCurrently");
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v7)
    {
      v10 = 67109120;
      v11 = !-[PHSOSViewController volumeHUDHiddenCurrently](self, "volumeHUDHiddenCurrently");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setVolumeHUDEnablement,volume HUD enablement already set to %d", (uint8_t *)&v10, 8u);
    }
  }
  else
  {
    if (v7)
    {
      v10 = 67109120;
      v11 = !-[PHSOSViewController volumeHUDHiddenPending](self, "volumeHUDHiddenPending");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setVolumeHUDEnablement,volume HUD enabled:%d", (uint8_t *)&v10, 8u);
    }

    -[PHSOSViewController setVolumeHUDHiddenCurrently:](self, "setVolumeHUDHiddenCurrently:", -[PHSOSViewController volumeHUDHiddenPending](self, "volumeHUDHiddenPending"));
    v6 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v6, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentInCallScene"));
    objc_msgSend(v9, "_setSystemVolumeHUDEnabled:", -[PHSOSViewController volumeHUDHiddenPending](self, "volumeHUDHiddenPending") ^ 1);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)marginPadding
{
  unsigned int v2;
  double result;

  v2 = +[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing");
  result = 24.0;
  if (v2)
    return 16.0;
  return result;
}

- (void)handleNetworkUnavailableAlertDidFinishNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified that network unavailable alert finished, so dismissing SOS", v6, 2u);
  }

  -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
}

- (void)handleAlertDisconnectingCallsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified that SOS should handle alert disconnecting calls", v6, 2u);
  }

  -[PHSOSViewController setShouldHandleAlertCallDisconnection:](self, "setShouldHandleAlertCallDisconnection:", 1);
  -[PHSOSViewController setShouldDropBioAuthTokenOnDismiss:](self, "setShouldDropBioAuthTokenOnDismiss:", 0);
}

- (void)callStateChangedNotification:(id)a3
{
  void *v4;
  unint64_t v5;
  NSString *v6;
  NSString *sosCallUUID;
  NSString *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  double v24;
  double Current;
  double v26;
  double v27;
  double v28;
  int64_t sosMode;
  id v30;
  char *v31;
  unsigned int v32;
  double v33;
  PHSlidingView *slidingView;
  uint8_t v35[8];
  _QWORD v36[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "isConnected") && objc_msgSend(v4, "isSOSOrFakeSOS"))
    -[PHSOSViewController setShouldDropBioAuthTokenOnDismiss:](self, "setShouldDropBioAuthTokenOnDismiss:", 0);
  switch(objc_msgSend(v4, "status"))
  {
    case 1u:
      goto LABEL_8;
    case 3u:
      if (objc_msgSend(v4, "isSOSOrFakeSOS"))
        -[PHSOSViewController removeDismissalAssertionReleasedObserver](self, "removeDismissalAssertionReleasedObserver");
      goto LABEL_7;
    case 4u:
LABEL_7:
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10005B284;
      v36[3] = &unk_100284898;
      v36[4] = self;
      -[PHSOSViewController hideMedicalIDWithCompletion:](self, "hideMedicalIDWithCompletion:", v36);
LABEL_8:
      v5 = -[PHSOSViewController sosMode](self, "sosMode");
      if (v5 <= 8 && ((1 << v5) & 0x107) != 0)
      {
        if (-[PHSOSViewController requestedCallActive](self, "requestedCallActive")
          && objc_msgSend(v4, "isSOSOrFakeSOS"))
        {
          v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callUUID"));
          sosCallUUID = self->_sosCallUUID;
          self->_sosCallUUID = v6;

        }
        if (!-[PHSOSViewController requestedCallActive](self, "requestedCallActive"))
        {
          v8 = self->_sosCallUUID;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callUUID"));
          LOBYTE(v8) = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if ((v8 & 1) == 0)
          {
            v10 = objc_msgSend(v4, "isEmergency");
            v11 = sub_1000C5588();
            v12 = objc_claimAutoreleasedReturnValue(v11);
            v13 = v12;
            if (v10)
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v35 = 0;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,interrupted by other emergency call,deactivating SOS", v35, 2u);
              }

              -[PHSOSViewController setShouldDropBioAuthTokenOnDismiss:](self, "setShouldDropBioAuthTokenOnDismiss:", 0);
              -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
            }
            else
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                sub_1001A91A4();

            }
          }
        }
      }
      if (objc_msgSend(v4, "status") == 1)
      {
        -[PHSOSViewController callDialStartTime](self, "callDialStartTime");
        if (v24 > 0.0)
        {
          Current = CFAbsoluteTimeGetCurrent();
          -[PHSOSViewController callDialStartTime](self, "callDialStartTime");
          -[PHSOSViewController setTimeTillActive:](self, "setTimeTillActive:", vabdd_f64(Current, v26));
        }
        v27 = CFAbsoluteTimeGetCurrent();
        -[PHSOSViewController sessionStartTime](self, "sessionStartTime");
        -[PHSOSViewController setCallConnectTimeSinceSessionStart:](self, "setCallConnectTimeSinceSessionStart:", vabdd_f64(v27, v28));
      }
      goto LABEL_55;
    case 6u:
      if (objc_msgSend(v4, "isSOSOrFakeSOS"))
      {
        -[PHSOSViewController setRequestedCallActive:](self, "setRequestedCallActive:", 0);
        -[PHSOSViewController setCallDisconnectReason:](self, "setCallDisconnectReason:", objc_msgSend(v4, "disconnectedReason"));
      }
      -[PHSOSViewController timeTillActive](self, "timeTillActive");
      if (v14 < 0.0)
      {
        -[PHSOSViewController callDialStartTime](self, "callDialStartTime");
        if (v15 > 0.0)
        {
          v16 = CFAbsoluteTimeGetCurrent();
          -[PHSOSViewController callDialStartTime](self, "callDialStartTime");
          -[PHSOSViewController setTimeTillActive:](self, "setTimeTillActive:", vabdd_f64(v16, v17));
          v18 = CFAbsoluteTimeGetCurrent();
          -[PHSOSViewController sessionStartTime](self, "sessionStartTime");
          -[PHSOSViewController setCallConnectTimeSinceSessionStart:](self, "setCallConnectTimeSinceSessionStart:", vabdd_f64(v18, v19));
        }
      }
      v20 = objc_msgSend(v4, "disconnectedReasonRequiresCallFailureUI");
      v21 = objc_msgSend(v4, "isSOSOrFakeSOS");
      if (v20)
      {
        if (v21)
          -[PHSOSViewController addDismissalAssertionReleasedObserver](self, "addDismissalAssertionReleasedObserver");
        goto LABEL_53;
      }
      if (!v21)
      {
        sosMode = self->_sosMode;
        if (sosMode == 2)
        {
          if (objc_msgSend(v4, "isOutgoing"))
          {
            -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
          }
          else
          {
            slidingView = self->_slidingView;
            self->_slidingView = 0;

            -[PHSOSViewController setSosMode:](self, "setSosMode:", 2);
          }
        }
        else if (sosMode == 4
               && (+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled") & 1) == 0)
        {
          -[PHSOSViewController startSOSNotificationCountdown](self, "startSOSNotificationCountdown");
        }
        goto LABEL_53;
      }
      -[PHSOSViewController setPostCallMode](self, "setPostCallMode");
      v22 = -[PHSOSViewController sosTrigger](self, "sosTrigger");
      if (v22 >= 3)
      {
        if (v22 != 3)
        {
          if (v22 != 7)
          {
            v30 = sub_1000C5588();
            v31 = (char *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
              sub_1001A91D0(self, v31);

          }
          objc_msgSend(v4, "callDuration");
          -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:");
          -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 0);
          goto LABEL_52;
        }
        v23 = +[SOSUtilities isCallWithVolumeLockHoldEnabled](SOSUtilities, "isCallWithVolumeLockHoldEnabled");
      }
      else
      {
        v23 = +[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled");
      }
      v32 = v23;
      objc_msgSend(v4, "callDuration");
      -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:");
      -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 0);
      if (!v32 || (objc_msgSend(v4, "callDuration"), v33 > 12.0))
      {
LABEL_52:
        -[PHSOSViewController submitSOSResolutionMetric:](self, "submitSOSResolutionMetric:", 0);
        goto LABEL_53;
      }
      -[PHSOSViewController raiseAccidentalSOSNotification](self, "raiseAccidentalSOSNotification");
LABEL_53:
      if (objc_msgSend(v4, "isSOSOrFakeSOS"))
      {
        -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 10);
        -[PHSOSViewController submitSOSUserActivityMetric](self, "submitSOSUserActivityMetric");
      }
LABEL_55:

      return;
    default:
      goto LABEL_55;
  }
}

- (void)dismissalAssertionReleasedNotification:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallRootViewController dismissalAssertions](PHInCallRootViewController, "dismissalAssertions", a3));
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"));

  if ((v5 & 1) == 0)
  {
    -[PHSOSViewController setPostCallMode](self, "setPostCallMode");
    -[PHSOSViewController removeDismissalAssertionReleasedObserver](self, "removeDismissalAssertionReleasedObserver");
  }
}

- (void)removeDismissalAssertionReleasedObserver
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PHDismissalAssertionReleasedNotification"), 0);

}

- (void)addDismissalAssertionReleasedObserver
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "dismissalAssertionReleasedNotification:", CFSTR("PHDismissalAssertionReleasedNotification"), 0);

}

- (void)interactiveStateChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B448;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateInteractiveState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "currentSOSInteractiveState");

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = -[PHSOSViewController currentInteractiveState](self, "currentInteractiveState");
    v9 = 2048;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController attempting to set currentInteractiveState from %lu to %lu", (uint8_t *)&v7, 0x16u);
  }

  if ((id)-[PHSOSViewController currentInteractiveState](self, "currentInteractiveState") != v4)
  {
    -[PHSOSViewController setCurrentInteractiveState:](self, "setCurrentInteractiveState:", v4);
    if (v4)
    {
      if (v4 == (id)1)
        -[PHSOSViewController interactiveStart](self, "interactiveStart");
    }
    else
    {
      -[PHSOSViewController interactiveStop:](self, "interactiveStop:", 1);
    }
  }
}

- (void)buttonPressStateChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSOSButtonPressState"));
  -[PHSOSViewController setCurrentButtonPressState:](self, "setCurrentButtonPressState:", v5);

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController currentButtonPressState](self, "currentButtonPressState"));
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,currentButtonPressState:%{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)dismissSOSNotification:(id)a3
{
  unsigned int v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v4 = -[PHSOSViewController shouldAllowLockButtonPressesToDismissSOS](self, "shouldAllowLockButtonPressesToDismissSOS", a3);
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController attempting to dismiss SOS due to lock button press; shouldAllowLockButtonPressesToDismissSOS: %d",
      (uint8_t *)v7,
      8u);
  }

  if (v4)
    -[PHSOSViewController deactivateSOSWithSOSDismissalType:](self, "deactivateSOSWithSOSDismissalType:", 1);
}

- (void)setPostCallMode
{
  id v3;
  unsigned int v4;

  if (-[PHSOSViewController shouldHandleAlertCallDisconnection](self, "shouldHandleAlertCallDisconnection"))
  {
    -[PHSOSViewController setShouldHandleAlertCallDisconnection:](self, "setShouldHandleAlertCallDisconnection:", 0);
LABEL_3:
    -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
    return;
  }
  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7
    && -[PHSOSViewController alreadyVisitedRestingScreen](self, "alreadyVisitedRestingScreen"))
  {
    goto LABEL_3;
  }
  v3 = objc_alloc_init((Class)SOSContactsManager);
  v4 = objc_msgSend(v3, "hasValidContactsToMessage");

  if (v4)
    -[PHSOSViewController setSosMode:](self, "setSosMode:", 4);
  else
    -[PHSOSViewController setPostContactNotificationMode](self, "setPostContactNotificationMode");
}

- (void)setPostContactNotificationMode
{
  PHSOSViewController *v3;
  uint64_t v4;

  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7)
  {
    if (-[PHSOSViewController isUserResponsive](self, "isUserResponsive"))
    {
      -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
      return;
    }
    v3 = self;
    v4 = 9;
  }
  else
  {
    v3 = self;
    v4 = 7;
  }
  -[PHSOSViewController setSosMode:](v3, "setSosMode:", v4);
}

- (void)setSosMode:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController nameForSOSMode:](self, "nameForSOSMode:", a3));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating SOS mode to %@", (uint8_t *)&v8, 0xCu);

  }
  self->_sosMode = a3;
  switch(a3)
  {
    case 0:
      -[PHSOSViewController showSOSNumbersList](self, "showSOSNumbersList");
      break;
    case 1:
      -[PHSOSViewController showSOSDialCountdown](self, "showSOSDialCountdown");
      break;
    case 2:
      -[PHSOSViewController showSOSDialSliding](self, "showSOSDialSliding");
      break;
    case 3:
      -[PHSOSViewController showSOSDialCanceled](self, "showSOSDialCanceled");
      break;
    case 4:
      -[PHSOSViewController showSOSNotificationCountdown](self, "showSOSNotificationCountdown");
      break;
    case 5:
      -[PHSOSViewController showSOSNotified](self, "showSOSNotified");
      break;
    case 6:
      -[PHSOSViewController showSOSNotificationCanceled](self, "showSOSNotificationCanceled");
      break;
    case 7:
      -[PHSOSViewController presentMedicalID](self, "presentMedicalID");
      break;
    case 8:
      -[PHSOSViewController showCheckInView](self, "showCheckInView");
      break;
    case 9:
      -[PHSOSViewController showRestingView](self, "showRestingView");
      break;
    case 10:
      -[PHSOSViewController showAlertRestingView](self, "showAlertRestingView");
      break;
    default:
      break;
  }
  -[PHSOSViewController sendFlowStateUpdateForCurrentSOSMode](self, "sendFlowStateUpdateForCurrentSOSMode");
}

- (void)sendFlowStateUpdateForCurrentSOSMode
{
  __CFString *v3;
  uint64_t v4;
  id v5;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v3 == CFSTR("PHSOSCallAssertionReason"))
  {
    switch(-[PHSOSViewController sosMode](self, "sosMode"))
    {
      case 0:
      case 5:
      case 6:
        return;
      case 1:
        v4 = 2;
        goto LABEL_12;
      case 2:
        v4 = 13;
        goto LABEL_12;
      case 3:
        v4 = 6;
        goto LABEL_12;
      case 4:
        v4 = 5;
        goto LABEL_12;
      case 7:
        v4 = 8;
        goto LABEL_12;
      case 8:
        v4 = 1;
        goto LABEL_12;
      case 9:
        v4 = 9;
        goto LABEL_12;
      case 0xALL:
        v4 = 11;
        goto LABEL_12;
      default:
        v4 = 0;
LABEL_12:
        v5 = (id)objc_claimAutoreleasedReturnValue(+[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance"));
        objc_msgSend(v5, "updateSOSFlowState:", v4);

        break;
    }
  }
}

- (id)nameForSOSMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return &stru_10028DC20;
  else
    return off_100286170[a3];
}

- (PHSOSNumbersViewController)sosNumbersViewController
{
  PHSOSNumbersViewController *sosNumbersViewController;
  PHSOSNumbersViewController *v4;
  void *v5;
  PHSOSNumbersViewController *v6;
  PHSOSNumbersViewController *v7;
  void *v8;

  sosNumbersViewController = self->_sosNumbersViewController;
  if (!sosNumbersViewController)
  {
    v4 = [PHSOSNumbersViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
    v6 = -[PHSOSNumbersViewController initWithSOSHandles:](v4, "initWithSOSHandles:", v5);
    v7 = self->_sosNumbersViewController;
    self->_sosNumbersViewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self->_sosNumbersViewController, "view"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PHSOSNumbersViewController setDelegate:](self->_sosNumbersViewController, "setDelegate:", self);
    sosNumbersViewController = self->_sosNumbersViewController;
  }
  return sosNumbersViewController;
}

- (PHCheckInView)checkInView
{
  PHCheckInView *checkInView;
  PHCheckInView *v4;
  PHCheckInView *v5;

  checkInView = self->_checkInView;
  if (!checkInView)
  {
    v4 = objc_alloc_init(PHCheckInView);
    v5 = self->_checkInView;
    self->_checkInView = v4;

    -[PHCheckInView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkInView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    checkInView = self->_checkInView;
  }
  return checkInView;
}

- (PHSOSRestingView)restingView
{
  PHSOSRestingView *restingView;
  PHSOSRestingView *v4;
  PHSOSRestingView *v5;

  restingView = self->_restingView;
  if (!restingView)
  {
    v4 = objc_alloc_init(PHSOSRestingView);
    v5 = self->_restingView;
    self->_restingView = v4;

    -[PHSOSRestingView setTranslatesAutoresizingMaskIntoConstraints:](self->_restingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    restingView = self->_restingView;
  }
  return restingView;
}

- (PHSOSAlertRestingView)alertRestingView
{
  PHSOSAlertRestingView *alertRestingView;
  PHSOSAlertRestingView *v4;
  PHSOSAlertRestingView *v5;

  alertRestingView = self->_alertRestingView;
  if (!alertRestingView)
  {
    v4 = objc_alloc_init(PHSOSAlertRestingView);
    v5 = self->_alertRestingView;
    self->_alertRestingView = v4;

    -[PHSOSAlertRestingView setTranslatesAutoresizingMaskIntoConstraints:](self->_alertRestingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    alertRestingView = self->_alertRestingView;
  }
  return alertRestingView;
}

- (PHCountdownView)countdownView
{
  PHCountdownView *countdownView;
  PHCountdownView *v4;
  PHCountdownView *v5;

  countdownView = self->_countdownView;
  if (!countdownView)
  {
    v4 = objc_alloc_init(PHCountdownView);
    v5 = self->_countdownView;
    self->_countdownView = v4;

    -[PHCountdownView setTranslatesAutoresizingMaskIntoConstraints:](self->_countdownView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    countdownView = self->_countdownView;
  }
  return countdownView;
}

- (PHSlidingView)slidingView
{
  PHSlidingView *slidingView;
  PHSlidingView *v4;
  PHSlidingView *v5;

  slidingView = self->_slidingView;
  if (!slidingView)
  {
    v4 = objc_alloc_init(PHSlidingView);
    v5 = self->_slidingView;
    self->_slidingView = v4;

    -[PHSlidingView setDelegate:](self->_slidingView, "setDelegate:", self);
    -[PHSlidingView setTranslatesAutoresizingMaskIntoConstraints:](self->_slidingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    slidingView = self->_slidingView;
  }
  return slidingView;
}

- (UILabel)infoLabel
{
  UILabel *infoLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  infoLabel = self->_infoLabel;
  if (!infoLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_infoLabel;
    self->_infoLabel = v4;

    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_infoLabel, "setTextAlignment:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
    -[UILabel setFont:](self->_infoLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_infoLabel, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 0);
    infoLabel = self->_infoLabel;
  }
  return infoLabel;
}

- (HKHealthStore)healthStore
{
  HKHealthStore *healthStore;
  HKHealthStore *v4;
  HKHealthStore *v5;

  healthStore = self->_healthStore;
  if (!healthStore)
  {
    v4 = (HKHealthStore *)objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("HKHealthStore"), CFSTR("HealthKit")));
    v5 = self->_healthStore;
    self->_healthStore = v4;

    healthStore = self->_healthStore;
  }
  return healthStore;
}

- (void)dialEmergencyCall
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 > 1)
  {
    if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7
      && !-[PHSOSViewController isUserResponsive](self, "isUserResponsive"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = -1;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10005BF88;
      v9[3] = &unk_100285EC0;
      v9[4] = &v10;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

      v6 = v11[3];
      if (v6 < 0)
      {
        v7 = sub_1000C5588();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_1001A9238();

        v6 = 0;
        v11[3] = 0;
      }
      -[PHSOSViewController dialSOSNumberAtIndex:](self, "dialSOSNumberAtIndex:", v6);
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      -[PHSOSViewController setSosMode:](self, "setSosMode:", 0);
    }
  }
  else
  {
    -[PHSOSViewController dialSOSNumberAtIndex:](self, "dialSOSNumberAtIndex:", 0);
  }
}

- (void)dialSOSNumberAtIndex:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  int64_t v40;
  __int16 v41;
  void *v42;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
    *(_DWORD *)buf = 134218242;
    v40 = a3;
    v41 = 2112;
    v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "index: %ld self.sosHandles: %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[PHSOSViewController setDateOfCall:](self, "setDateOfCall:", v8);

  v9 = +[TUCall shouldMakeFakeSOSCall](TUCall, "shouldMakeFakeSOSCall");
  v10 = objc_alloc((Class)TUDialRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "providerManager"));
  v13 = v12;
  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "telephonyProvider"));
    v15 = objc_msgSend(v10, "initWithProvider:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", CFSTR("+14089619342")));
    objc_msgSend(v15, "setHandle:", v16);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "emergencyProvider"));
    v15 = objc_msgSend(v10, "initWithProvider:", v17);

    objc_msgSend(v15, "setDialType:", 1);
    objc_msgSend(v15, "setSOS:", 1);
  }
  v18 = -[PHSOSViewController sosTrigger](self, "sosTrigger");
  v19 = 3;
  v20 = 3;
  switch(v18)
  {
    case 0:
    case 1:
    case 2:
      goto LABEL_19;
    case 3:
      goto LABEL_17;
    case 5:
      v19 = 13;
      goto LABEL_18;
    case 7:
      v21 = -[PHSOSViewController isUserResponsive](self, "isUserResponsive", 3);
      if (v21)
        v19 = 12;
      else
        v19 = 10;
      if (v21)
        v20 = 3;
      else
        v20 = 4;
      goto LABEL_19;
    default:
      v22 = sub_1000C5588();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1001A9264(self);

LABEL_17:
      v19 = 4;
LABEL_18:
      v20 = 3;
LABEL_19:
      objc_msgSend(v15, "setOriginatingUIType:", v19);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));
      v25 = v24 == CFSTR("PHSOSCallAssertionReason");

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance"));
        objc_msgSend(v26, "updateSOSFlowState:", v20);

      }
      if ((objc_msgSend(v15, "isRTTAvailable") & 1) != 0
        || objc_msgSend(v15, "isTTYAvailable"))
      {
        objc_msgSend(v15, "setTtyType:", 2);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
      if ((unint64_t)objc_msgSend(v27, "count") <= a3)
      {

      }
      else
      {
        v28 = +[TUCall shouldMakeFakeSOSCall](TUCall, "shouldMakeFakeSOSCall");

        if ((v28 & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", a3));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "handle"));
          objc_msgSend(v15, "setHandle:", v31);

          if ((objc_msgSend(v15, "isValid") & 1) == 0)
          {
            v32 = sub_1000C5588();
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v40 = (int64_t)v15;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[WARN] Dial request %@ is invalid using the chosen handle. Falling back to using a default emergency number", buf, 0xCu);
            }

            objc_msgSend(v15, "setHandle:", 0);
          }
        }
      }
      v34 = sub_1000C5588();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (int64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "SOSViewController is launching dial request for SOS call: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      -[PHSOSViewController setRequestedCallActive:](self, "setRequestedCallActive:", 1);
      -[PHSOSViewController setCallDialStartTime:](self, "setCallDialStartTime:", CFAbsoluteTimeGetCurrent());
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10005C55C;
      v37[3] = &unk_100285EE8;
      objc_copyWeak(&v38, (id *)buf);
      objc_msgSend(v36, "launchAppForDialRequest:completion:", v15, v37);

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);

      return;
  }
}

- (void)notifyEmergencyContacts
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)buf, 2u);
  }

  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked"))
      v5 = 2;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  objc_initWeak(buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005C710;
  v7[3] = &unk_100285F10;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v6, "startSendingLocationUpdateForReason:withCompletion:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)willStartSendingLocationUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  objc_msgSend(v2, "willStartSendingLocationUpdate");

}

- (void)showSOSNumbersList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v5, 0);

  -[PHSOSViewController setUpSOSNumbersListViewConstraints](self, "setUpSOSNumbersListViewConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[PHSOSViewController willStartSendingLocationUpdate](self, "willStartSendingLocationUpdate");
}

- (void)showCheckInView
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
  CFAbsoluteTime Current;
  void *v13;
  _QWORD v14[5];
  id v15[2];
  id location;
  _QWORD v17[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v4, 0);

  -[PHSOSViewController setUpCheckInViewConstraints](self, "setUpCheckInViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  -[PHSOSViewController willStartSendingLocationUpdate](self, "willStartSendingLocationUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController getCheckInViewModel](self, "getCheckInViewModel"));
  if (objc_msgSend(v8, "sosVoiceMessageType"))
  {
    -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sceneManager"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005CAF8;
    v17[3] = &unk_100285948;
    v17[4] = self;
    objc_msgSend(v11, "waitForRegistrationOfSceneWithType:completion:", 0, v17);

  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005CB20;
  v14[3] = &unk_100285F38;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&Current;
  v14[4] = self;
  objc_msgSend(v13, "start:completion:", v8, v14);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

- (id)getCheckInViewModel
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = +[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked");
  v3 = off_1002833C0;
  if (!v2)
    v3 = off_1002833C8;
  return objc_alloc_init(*v3);
}

- (void)handleVolumeChanges
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  _DWORD v6[2];

  v3 = -[PHSOSViewController volumeMaxedPending](self, "volumeMaxedPending");
  if (v3 == -[PHSOSViewController volumeMaxedCurrently](self, "volumeMaxedCurrently"))
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = -[PHSOSViewController volumeMaxedCurrently](self, "volumeMaxedCurrently");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleVolumeChanges,volume level already set,maxed:%d", (uint8_t *)v6, 8u);
    }

  }
  else if (-[PHSOSViewController volumeMaxedPending](self, "volumeMaxedPending"))
  {
    -[PHSOSViewController setVolumeMaxedCurrently:](self, "setVolumeMaxedCurrently:", 1);
    -[PHSOSViewController setSystemVolumeToMax](self, "setSystemVolumeToMax");
  }
  else
  {
    -[PHSOSViewController setVolumeMaxedCurrently:](self, "setVolumeMaxedCurrently:", 0);
    -[PHSOSViewController restoreSystemVolumeLevel](self, "restoreSystemVolumeLevel");
  }
}

- (void)setSystemVolumeToMax
{
  float v3;
  void *v4;
  double v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  float v13;
  uint8_t buf[4];
  double v15;

  if (+[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.countdown.subtle"), 0))v3 = 0.4;
  else
    v3 = 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioDeviceController sharedSystemController](PHAudioDeviceController, "sharedSystemController"));
  v13 = 0.0;
  if ((objc_msgSend(v4, "getVolume:forCategory:", &v13, CFSTR("Audio/Video")) & 1) == 0)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001A9300();

    v13 = -1.0;
  }
  *(float *)&v5 = v3;
  v8 = objc_msgSend(v4, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v5);
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,changed volume from %f to max", buf, 0xCu);
    }

    *(float *)&v12 = v13;
    -[PHSOSViewController setPriorSystemVolume:](self, "setPriorSystemVolume:", v12);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001A92D4();

  }
}

- (void)restoreSystemVolumeLevel
{
  float v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  float v9;
  double v10;
  int v11;
  double v12;

  -[PHSOSViewController priorSystemVolume](self, "priorSystemVolume");
  if (v3 >= 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioDeviceController sharedSystemController](PHAudioDeviceController, "sharedSystemController"));
    -[PHSOSViewController priorSystemVolume](self, "priorSystemVolume");
    v5 = objc_msgSend(v4, "setVolumeTo:forCategory:", CFSTR("Audio/Video"));
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[PHSOSViewController priorSystemVolume](self, "priorSystemVolume");
        v11 = 134217984;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,set volume back to %f", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_1001A932C(self, v8);
    }

    LODWORD(v10) = -1.0;
    -[PHSOSViewController setPriorSystemVolume:](self, "setPriorSystemVolume:", v10);

  }
}

- (id)getSOSDialCountdownViewModel
{
  unint64_t v3;
  id v4;
  NSObject *v5;
  __objc2_class *v6;
  id v7;
  char *v8;

  v3 = -[PHSOSViewController sosTrigger](self, "sosTrigger");
  if (v3 < 3)
  {
LABEL_11:
    v6 = PHSOSDialCountdownViewModel;
    return objc_alloc_init(v6);
  }
  if (v3 != 7)
  {
    if (v3 == 3)
    {
      v4 = sub_1000C5588();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1001A9418();

    }
    else
    {
      v7 = sub_1000C5588();
      v8 = (char *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
        sub_1001A93B0(self, v8);

    }
    goto LABEL_11;
  }
  v6 = PHSOSKappaDialCountdownViewModel;
  return objc_alloc_init(v6);
}

- (void)showSOSDialCountdown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v4, 0);

  -[PHSOSViewController setUpCountdownViewConstraints](self, "setUpCountdownViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STOP"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  -[PHSOSViewController willStartSendingLocationUpdate](self, "willStartSendingLocationUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController getSOSDialCountdownViewModel](self, "getSOSDialCountdownViewModel"));
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D2B4;
  v10[3] = &unk_100285F60;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "start:showSlider:completion:", v8, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)showSOSDialSliding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v4, 0);

  -[PHSOSViewController setUpSlidingViewConstraints](self, "setUpSlidingViewConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  -[PHSOSViewController setCallDialStartTime:](self, "setCallDialStartTime:", -1.0);
  -[PHSOSViewController setTimeTillActive:](self, "setTimeTillActive:", -1.0);
  -[PHSOSViewController setCallAutoDialled:](self, "setCallAutoDialled:", 0);
  -[PHSOSViewController setClawSwipeAfterRTCTimeout:](self, "setClawSwipeAfterRTCTimeout:", 0);
  -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSOSButtonPressState"));
  -[PHSOSViewController setCurrentButtonPressState:](self, "setCurrentButtonPressState:", v9);

  objc_initWeak(location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005D77C;
  v27[3] = &unk_100285F60;
  objc_copyWeak(&v28, location);
  v10 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005D8F0;
  v25[3] = &unk_100285F88;
  objc_copyWeak(&v26, location);
  v11 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10005D93C;
  v23[3] = &unk_100284F60;
  objc_copyWeak(&v24, location);
  v12 = objc_retainBlock(v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005D980;
  v21[3] = &unk_100285F88;
  objc_copyWeak(&v22, location);
  v13 = objc_retainBlock(v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  objc_msgSend(v14, "setAnimatedSlidingButtonCompletionBlock:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  objc_msgSend(v15, "setShouldMaxVolumeCompletionBlock:", v12);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  objc_msgSend(v16, "setPowerDownCompletionBlock:", v13);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005D9B8;
  v18[3] = &unk_100285FD0;
  objc_copyWeak(&v20, location);
  v17 = v11;
  v19 = v17;
  -[PHSOSViewController fetchMedicalIDWithCompletion:](self, "fetchMedicalIDWithCompletion:", v18);
  -[PHSOSViewController startStatusHeartbeatTimer](self, "startStatusHeartbeatTimer");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(location);
}

- (void)showSOSDialCanceled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_CANCELED"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v7, 1);

  -[PHSOSViewController setUpInfoLabelConstraints](self, "setUpInfoLabelConstraints");
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 2500000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005DC04;
  v9[3] = &unk_100285F88;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)showSOSNotified
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SOS_NOTIFIED"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v7, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v10, 1);

  -[PHSOSViewController setUpInfoLabelConstraints](self, "setUpInfoLabelConstraints");
  objc_initWeak(&location, self);
  v11 = dispatch_time(0, 2000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005DDF4;
  v12[3] = &unk_100285F88;
  objc_copyWeak(&v13, &location);
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)showSOSNotificationCanceled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOS_NOTIFICATION_CANCELED"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v7, 1);

  -[PHSOSViewController setUpInfoLabelConstraints](self, "setUpInfoLabelConstraints");
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 2000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005DF74;
  v9[3] = &unk_100285F88;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)showSOSNotificationCountdown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("STOP"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v7, 0);

  -[PHSOSViewController setUpCountdownViewConstraints](self, "setUpCountdownViewConstraints");
  if ((+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled") & 1) != 0)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not starting notification countdown due to ECBM mode being shown.", v10, 2u);
    }

  }
  else
  {
    -[PHSOSViewController startSOSNotificationCountdown](self, "startSOSNotificationCountdown");
  }
}

- (void)startSOSNotificationCountdown
{
  unsigned int v3;
  __objc2_class **v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7)
  {
    v3 = +[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked");
    v4 = off_1002833D0;
    if (v3)
      v4 = off_1002833D8;
  }
  else
  {
    v4 = &off_1002833E0;
  }
  v5 = objc_alloc_init(*v4);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005E200;
  v7[3] = &unk_100285F60;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "start:showSlider:completion:", v5, 0, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)showRestingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __objc2_class *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  -[PHSOSViewController setAlreadyVisitedRestingScreen:](self, "setAlreadyVisitedRestingScreen:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v7, 0);

  -[PHSOSViewController setUpRestingViewConstraints](self, "setUpRestingViewConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities mostRecentSOSStatus](SOSUtilities, "mostRecentSOSStatus"));
  v9 = v8;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeOfDetection")), v10, v10))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeOfDetection"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController dateOfCall](self, "dateOfCall"));

    if (!v12)
      goto LABEL_7;
    v11 = objc_claimAutoreleasedReturnValue(-[PHSOSViewController dateOfCall](self, "dateOfCall"));
  }
  v13 = (void *)v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  objc_msgSend(v14, "setDateOfSOSEvent:", v13);

LABEL_7:
  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked"))
      v15 = PHSOSKappaRestingViewModel;
    else
      v15 = PHSOSKappaMaskedRestingViewModel;
  }
  else
  {
    v15 = PHSOSNewtonRestingViewModel;
  }
  v16 = objc_alloc_init(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  objc_msgSend(v17, "setViewModel:", v16);

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005E534;
  v22[3] = &unk_100285F60;
  objc_copyWeak(&v23, &location);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  objc_msgSend(v18, "setCompletionHandler:", v22);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005E630;
  v20[3] = &unk_100285FF8;
  objc_copyWeak(&v21, &location);
  -[PHSOSViewController fetchMedicalIDWithCompletion:](self, "fetchMedicalIDWithCompletion:", v20);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v19 == CFSTR("PHSOSCallAssertionReason"))
    -[PHSOSViewController startStatusHeartbeatTimer](self, "startStatusHeartbeatTimer");
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)startStatusHeartbeatTimer
{
  __CFString *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  -[PHSOSViewController clearStatusHeartbeatTimer](self, "clearStatusHeartbeatTimer");
  if (((id)-[PHSOSViewController sosMode](self, "sosMode") == (id)2
     || (id)-[PHSOSViewController sosMode](self, "sosMode") == (id)9)
    && (v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason")),
        v3,
        v3 == CFSTR("PHSOSCallAssertionReason")))
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,starting status heartbeat timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005E850;
    v9[3] = &unk_100284DC8;
    objc_copyWeak(&v10, buf);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v9, 30.0));
    -[PHSOSViewController setStatusHeartbeatTimer:](self, "setStatusHeartbeatTimer:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
  else
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,not starting status heartbeat timer", (uint8_t *)buf, 2u);
    }

  }
}

- (void)clearStatusHeartbeatTimer
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController statusHeartbeatTimer](self, "statusHeartbeatTimer"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,clearing status heartbeat timer", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController statusHeartbeatTimer](self, "statusHeartbeatTimer"));
    objc_msgSend(v6, "invalidate");

    -[PHSOSViewController setStatusHeartbeatTimer:](self, "setStatusHeartbeatTimer:", 0);
  }
}

- (void)showAlertRestingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __objc2_class *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_10028DC20, CFSTR("InCallService")));
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  -[PHSOSViewController transitionToView:animated:](self, "transitionToView:animated:", v7, 0);

  -[PHSOSViewController setUpAlertRestingViewConstraints](self, "setUpAlertRestingViewConstraints");
  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked"))
      v8 = PHSOSKappaAlertRestingViewModel;
    else
      v8 = PHSOSKappaMaskedAlertRestingViewModel;
  }
  else
  {
    v8 = PHSOSNewtonAlertRestingViewModel;
  }
  v9 = objc_alloc_init(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  objc_msgSend(v10, "setViewModel:", v9);

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005EC20;
  v14[3] = &unk_100285F60;
  objc_copyWeak(&v15, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  objc_msgSend(v11, "setCompletionHandler:", v14);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005ED5C;
  v12[3] = &unk_100285FF8;
  objc_copyWeak(&v13, &location);
  -[PHSOSViewController fetchMedicalIDWithCompletion:](self, "fetchMedicalIDWithCompletion:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (BOOL)shouldShowMedicalID:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;

  v3 = a3;
  v4 = (void *)CUTWeakLinkClass(CFSTR("FMDFMIPManager"), CFSTR("FindMyDevice"));
  v5 = objc_msgSend(v3, "hasAnyData");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharedInstance"));
    v7 = objc_msgSend(v6, "lostModeIsActive") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)fetchMedicalIDWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController healthStore](self, "healthStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005EED8;
  v7[3] = &unk_100286048;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchMedicalIDDataWithCompletion:", v7);

}

- (void)loadMedicalIDWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to load medical ID data...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F09C;
  v8[3] = &unk_100286070;
  objc_copyWeak(&v10, buf);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[PHSOSViewController fetchMedicalIDWithCompletion:](self, "fetchMedicalIDWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

- (void)hideMedicalIDWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](self->_medicalIDNavigationController, "presentingViewController"));

  if (v4)
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_medicalIDNavigationController, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (void)presentMedicalID
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  if (+[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not presenting medical ID because going to present ECBM dialer", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    objc_initWeak(buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005F4E4;
    v7[3] = &unk_100285F88;
    objc_copyWeak(&v8, buf);
    v5 = objc_retainBlock(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController medicalIDNavigationController](self, "medicalIDNavigationController"));

    if (v6)
      ((void (*)(_QWORD *))v5[2])(v5);
    else
      -[PHSOSViewController loadMedicalIDWithCompletion:](self, "loadMedicalIDWithCompletion:", v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)transitionToView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", v7);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005F7A0;
    v13[3] = &unk_100285158;
    v13[4] = self;
    v14 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005F8A0;
    v11[3] = &unk_100284DF0;
    v11[4] = self;
    v12 = v14;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v13, v11, 0.600000024, 0.0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController currentView](self, "currentView"));
    objc_msgSend(v9, "removeFromSuperview");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
    objc_msgSend(v10, "addSubview:", v7);

    -[PHSOSViewController setCurrentView:](self, "setCurrentView:", v7);
  }

}

- (void)buttonPressed:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  switch(-[PHSOSViewController sosMode](self, "sosMode", a3))
  {
    case 0:
    case 3:
    case 6:
    case 7:
    case 0xALL:
      goto LABEL_2;
    case 1:
    case 8:
      -[PHSOSViewController setIsUserResponsive:](self, "setIsUserResponsive:", 1);
      goto LABEL_4;
    case 2:
      -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 1);
      -[PHSOSViewController interactiveStartTime](self, "interactiveStartTime");
      v7 = v6;
      v8 = -1.0;
      if (v7 > 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", -1.0);
        v10 = v9;
        -[PHSOSViewController interactiveStartTime](self, "interactiveStartTime");
        v8 = v10 - v11;
      }
      -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
      v13 = objc_msgSend(v12, "slidingViewState");

      switch((unint64_t)v13)
      {
        case 0uLL:
          -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 6);
          -[PHSOSViewController submitSOSUserActivityMetric](self, "submitSOSUserActivityMetric");
          goto LABEL_15;
        case 1uLL:
LABEL_15:
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
          v18 = objc_msgSend(v17, "slidingViewState");

          if (v18 == (id)1)
            -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 7);
          goto LABEL_17;
        case 2uLL:
          -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 8);
          -[PHSOSViewController submitSOSUserActivityMetric](self, "submitSOSUserActivityMetric");
          -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 0);
          -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
          -[PHSOSViewController setClawResolution:](self, "setClawResolution:", 1);
          -[PHSOSViewController raiseAccidentalSOSNotification](self, "raiseAccidentalSOSNotification");
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
          objc_msgSend(v21, "clearReleaseToCallState");

          -[PHSOSViewController setSosMode:](self, "setSosMode:", 3);
          return;
        case 3uLL:
LABEL_17:
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
          v20 = objc_msgSend(v19, "slidingViewState");

          if (v20 == (id)3)
          {
            -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 6);
            -[PHSOSViewController submitSOSUserActivityMetric](self, "submitSOSUserActivityMetric");
          }
          -[PHSOSViewController setClawResolution:](self, "setClawResolution:", 2);
          -[PHSOSViewController interactiveStop:](self, "interactiveStop:", 0);
          goto LABEL_2;
        case 4uLL:
        case 5uLL:
          -[PHSOSViewController setClawResolution:](self, "setClawResolution:", 2);
          goto LABEL_2;
        default:
          return;
      }
    case 4:
LABEL_4:
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      -[PHSOSViewController setCountdownPausedTime:](self, "setCountdownPausedTime:");
      if ((id)-[PHSOSViewController sosMode](self, "sosMode") == (id)8)
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
      else
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
      v5 = v4;
      objc_msgSend(v4, "pause");

      -[PHSOSViewController showConfirmationAlert](self, "showConfirmationAlert");
      break;
    case 5:
      -[PHSOSViewController setPostContactNotificationMode](self, "setPostContactNotificationMode");
      break;
    case 9:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController coreAnalyticsReporter](self, "coreAnalyticsReporter"));
      v15 = -[PHSOSViewController sosTrigger](self, "sosTrigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
      objc_msgSend(v14, "reportSOSRestingResponse:restingResponse:hasMedicalID:", v15, 2, objc_msgSend(v16, "hasMedicalIDSlider"));

LABEL_2:
      -[PHSOSViewController deactivateSOS](self, "deactivateSOS");
      break;
    default:
      return;
  }
}

- (void)showConfirmationAlert
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[5];
  _QWORD v19[5];

  if ((id)-[PHSOSViewController sosMode](self, "sosMode") == (id)1
    || (id)-[PHSOSViewController sosMode](self, "sosMode") == (id)8
    || (id)-[PHSOSViewController sosMode](self, "sosMode") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("STOP_CALLING");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("STOP_NOTIFYING_EMERGENCY_CONTACTS");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10028DC20, CFSTR("InCallService")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005FE54;
  v19[3] = &unk_100286098;
  v19[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, v19));
  objc_msgSend(v7, "addAction:", v10);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005FEF8;
  v18[3] = &unk_100286098;
  v18[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 2, v18));
  objc_msgSend(v7, "addAction:", v11);

  -[PHSOSViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006019C;
  v14[3] = &unk_1002860C0;
  v12 = v7;
  v15 = v12;
  objc_copyWeak(&v16, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, 5.0));
  -[PHSOSViewController setConfirmationTimeoutTimer:](self, "setConfirmationTimeoutTimer:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)deactivateSOS
{
  -[PHSOSViewController deactivateSOSWithSOSDismissalType:](self, "deactivateSOSWithSOSDismissalType:", 0);
}

- (void)deactivateSOSWithSOSDismissalType:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  PHAudioDeviceController *audioDeviceController;
  void *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Releasing SOS Dismissal Assertion", buf, 2u);
  }

  -[PHSOSViewController clearStatusHeartbeatTimer](self, "clearStatusHeartbeatTimer");
  -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 0);
  -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
  +[PHSOSViewController releaseAllCallBufferDismissalAssertions](PHSOSViewController, "releaseAllCallBufferDismissalAssertions");
  if (-[PHSOSViewController shouldDropBioAuthTokenOnDismiss](self, "shouldDropBioAuthTokenOnDismiss"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
    objc_msgSend(v7, "didDismissSOSBeforeSOSCall:", a3);

    v8 = 6;
  }
  else
  {
    v8 = 10;
  }
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v9 == CFSTR("PHSOSCallAssertionReason"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance"));
    objc_msgSend(v10, "updateSOSFlowState:", v8);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", v11);

  if (!+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive"))
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setting SOSInitiationState to Idle", v22, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
    objc_msgSend(v14, "setCurrentSOSInitiationState:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
    objc_msgSend(v16, "setActivationContext:", 0);

  }
  if (!+[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive")&& self->_priorSystemAudioRoute)
  {
    v17 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,restoring audio route", v21, 2u);
    }

    audioDeviceController = self->_audioDeviceController;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUAudioRoute uniqueIdentifier](self->_priorSystemAudioRoute, "uniqueIdentifier"));
    -[PHAudioDeviceController pickRouteWithUID:](audioDeviceController, "pickRouteWithUID:", v20);

  }
}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000605E4;
  v3[3] = &unk_100285F88;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)raiseAccidentalSOSNotification
{
  __CFString *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v3 == CFSTR("PHSOSCallAssertionReason")
    && ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)1
     || (id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)2
     || (id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)3))
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Raising possible accidental SOS notification", buf, 2u);
    }

    v6 = objc_alloc_init((Class)UNMutableNotificationContent);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities accidentalCallNotificationTitle](SOSUtilities, "accidentalCallNotificationTitle"));
    objc_msgSend(v6, "setTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SOSUtilities accidentalCallNotificationBody](SOSUtilities, "accidentalCallNotificationBody"));
    objc_msgSend(v6, "setBody:", v8);

    v9 = (void *)SOSSettingsURLBaseString;
    v10 = objc_msgSend(SOSSettingsURLSourceKey, "UTF8String");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("&%s=%s"), v10, objc_msgSend(SOSSettingsURLSourceAccCallNotification, "UTF8String")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
    objc_msgSend(v6, "setDefaultActionURL:", v12);

    objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("com.apple.SOSNotification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.SOSNotificationId"), v6, 0, 6));
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created SOS notification request:%@", buf, 0xCu);
    }

    v16 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.SOSNotification"), v17, v18, 0x20000));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v19));
    objc_msgSend(v16, "setNotificationCategories:", v20);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000609D8;
    v21[3] = &unk_1002860E8;
    v21[4] = self;
    objc_msgSend(v16, "addNotificationRequest:withCompletionHandler:", v13, v21);

  }
}

- (void)handleCallBufferCompletionNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleCallBufferCompletionNotification,entered", buf, 2u);
  }

  -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 0);
  -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  if (v7)
  {
    -[PHSOSViewController setSlidingViewEntryReason:](self, "setSlidingViewEntryReason:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHCallBufferCompletionReasonKey")));
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == (id)1)
    {
      v14 = sub_1000C5588();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,PHCallBufferCompletionReasonCancelled", v22, 2u);
      }

      -[PHSOSViewController interactiveStartTime](self, "interactiveStartTime");
      v17 = v16;
      v18 = -1.0;
      if (v17 > 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", -1.0);
        v20 = v19;
        -[PHSOSViewController interactiveStartTime](self, "interactiveStartTime");
        v18 = v20 - v21;
      }
      -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:", v18);
      -[PHSOSViewController setWasCallCancelled:](self, "setWasCallCancelled:", 1);
      -[PHSOSViewController setClawResolution:](self, "setClawResolution:", 6);
      -[PHSOSViewController setSosMode:](self, "setSosMode:", 3);
      -[PHSOSViewController raiseAccidentalSOSNotification](self, "raiseAccidentalSOSNotification");
      -[PHSOSViewController setSlidingViewExitReason:](self, "setSlidingViewExitReason:", 9);
      -[PHSOSViewController submitSOSUserActivityMetric](self, "submitSOSUserActivityMetric");
    }
    else if (!v9)
    {
      v10 = sub_1000C5588();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,PHCallBufferCompletionReasonTimeout", v23, 2u);
      }

      -[PHSOSViewController clearStatusHeartbeatTimer](self, "clearStatusHeartbeatTimer");
      -[PHSOSViewController willStartSendingLocationUpdate](self, "willStartSendingLocationUpdate");
      -[PHSOSViewController dialEmergencyCall](self, "dialEmergencyCall");
    }
  }
  else
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,nil userInfo,Early return", v24, 2u);
    }

  }
}

- (void)handleAnimationSlidingCompletionResponse
{
  double v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  __CFString **v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v3 == 0.0)
    goto LABEL_2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosHandles](self, "sosHandles"));
    v6 = objc_msgSend(v5, "count");

    if ((unint64_t)v6 > 1)
    {
      -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 0);
      -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
LABEL_2:
      -[PHSOSViewController clearStatusHeartbeatTimer](self, "clearStatusHeartbeatTimer");
      -[PHSOSViewController willStartSendingLocationUpdate](self, "willStartSendingLocationUpdate");
      -[PHSOSViewController dialEmergencyCall](self, "dialEmergencyCall");
      return;
    }
    -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 1);
    -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
    v7 = -[PHSOSViewController callAutoDialled](self, "callAutoDialled");
    v8 = off_100287108;
    if (!v7)
      v8 = off_100287110;
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", *v8);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("PHCallBufferNotification"), 0, 0);

  }
  else
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] PHSOSViewController,animatedSliderCompletion,no SOS handles.Unexpected.return", buf, 2u);
    }

    -[PHSOSViewController setVolumeMaxedPending:](self, "setVolumeMaxedPending:", 0);
    -[PHSOSViewController handleVolumeChanges](self, "handleVolumeChanges");
  }
}

- (void)sosNumbersViewController:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[PHSOSViewController dialSOSNumberAtIndex:](self, "dialSOSNumberAtIndex:", objc_msgSend(a4, "row", a3));
}

- (void)dismissMedicalIDViewController
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController medicalIDNavigationController](self, "medicalIDNavigationController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100060F64;
  v4[3] = &unk_100284898;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  -[PHSOSViewController dismissMedicalIDViewController](self, "dismissMedicalIDViewController", a3);
}

- (void)showPowerDownFindMyInfoAlertWithProceed:(id)a3 cancelCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_TITLE"), &stru_10028DC20, CFSTR("InCallService")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY"), &stru_10028DC20, CFSTR("InCallService")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19, v9, 1));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000611C8;
  v23[3] = &unk_100286110;
  v24 = v5;
  v15 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v23));
  objc_msgSend(v14, "addAction:", v16);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000611DC;
  v21[3] = &unk_100286110;
  v22 = v6;
  v17 = v6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v21));
  objc_msgSend(v14, "addAction:", v18);

  -[PHSOSViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)didTapFindMy
{
  -[PHSOSViewController showPowerDownFindMyAlert](self, "showPowerDownFindMyAlert");
}

- (void)showPowerDownFindMyAlert
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
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_TITLE"), &stru_10028DC20, CFSTR("InCallService")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE"), &stru_10028DC20, CFSTR("InCallService")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_BUTTON"), &stru_10028DC20, CFSTR("InCallService")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100061400;
  v15[3] = &unk_100286098;
  v15[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v15));
  objc_msgSend(v11, "addAction:", v12);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100061408;
  v14[3] = &unk_100286098;
  v14[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v14));
  objc_msgSend(v11, "addAction:", v13);

  -[PHSOSViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)userAcknowledgedFindMyInfo
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController beaconManager](self, "beaconManager"));
  objc_msgSend(v3, "setUserHasAcknowledgedFindMy:completion:", 1, &stru_100286130);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  objc_msgSend(v4, "didAcknowledgeFindMyInfo");

}

- (void)didTapTemporarilyDisableFindMy
{
  _QWORD *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[5];

  -[PHSOSViewController userAcknowledgedFindMyInfo](self, "userAcknowledgedFindMyInfo");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000615B8;
  v11[3] = &unk_1002848C0;
  v11[4] = self;
  v3 = objc_retainBlock(v11);
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting passcode for FindMy temp disable", v10, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_PASSCODE_TITLE"), &stru_10028DC20, CFSTR("InCallService")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_DISABLE_PASSCODE_SUBTITLE"), &stru_10028DC20, CFSTR("InCallService")));

  SBSRequestPasscodeCheckUI(v7, v9, v3);
}

- (BOOL)allowsMenuButtonDismissal
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "callPassingTest:", &stru_100286150));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)allowsOtherAlertsToStackOnTop
{
  return 1;
}

- (BOOL)allowsBanners
{
  return 1;
}

- (BOOL)allowsOrientationChangeEvents
{
  return 0;
}

- (unint64_t)desiredButtonEvents
{
  return 1;
}

- (unint64_t)desiredSceneButtonEvents
{
  return 0;
}

- (BOOL)desiresLockButtonEvents
{
  return 1;
}

- (void)stateChanged:(id)a3
{
  id v4;
  __CFString *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 == CFSTR("PHAlertRestingScreenAssertionReason"))
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Stewie state changed: %@", (uint8_t *)&v11, 0xCu);
    }

    if ((id)-[PHSOSViewController sosMode](self, "sosMode") == (id)10)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController stewieState](self, "stewieState"));
      if ((objc_msgSend(v9, "activeServices") & 1) != 0)
      {
        v10 = objc_msgSend(v4, "activeServices");

        if ((v10 & 1) == 0)
          -[PHSOSViewController setSosMode:](self, "setSosMode:", 9);
      }
      else
      {

      }
    }
    -[PHSOSViewController setStewieState:](self, "setStewieState:", v4);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001A9508();

  }
}

- (void)setUpCancelButtonConstraints
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
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  +[PHCallViewController _bottomBarBottomMarginForView:](PHCallViewController, "_bottomBarBottomMarginForView:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -v13));

  v16[0] = v7;
  v16[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)setUpCheckInViewConstraints
{
  double v3;
  double v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = objc_alloc_init((Class)NSMutableArray);
  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));
  objc_msgSend(v30, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -v4));
  objc_msgSend(v30, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v30, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v30, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController checkInView](self, "checkInView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v30, "addObject:", v29);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
}

- (void)setUpRestingViewConstraints
{
  double v3;
  double v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = objc_alloc_init((Class)NSMutableArray);
  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));
  objc_msgSend(v30, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -v4));
  objc_msgSend(v30, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v30, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v30, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController restingView](self, "restingView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v30, "addObject:", v29);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
}

- (void)setUpAlertRestingViewConstraints
{
  double v3;
  double v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = objc_alloc_init((Class)NSMutableArray);
  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));
  objc_msgSend(v30, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -v4));
  objc_msgSend(v30, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v30, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v30, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController alertRestingView](self, "alertRestingView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v30, "addObject:", v29);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
}

- (void)setUpCountdownViewConstraints
{
  double v3;
  double v4;
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
  _QWORD v31[5];

  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -v4));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController countdownView](self, "countdownView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));

  v31[0] = v9;
  v31[1] = v14;
  v31[2] = v19;
  v31[3] = v24;
  v31[4] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)setUpSlidingViewConstraints
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
  _QWORD v29[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  v29[0] = v7;
  v29[1] = v12;
  v29[2] = v17;
  v29[3] = v22;
  v29[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)setUpSOSNumbersListViewConstraints
{
  double v3;
  double v4;
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
  void *v35;
  void *v36;
  _QWORD v37[5];

  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -v4));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v27, 52.0));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sosNumbersViewController](self, "sosNumbersViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController cancelButton](self, "cancelButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, -28.0));

  v37[0] = v36;
  v37[1] = v15;
  v37[2] = v21;
  v37[3] = v28;
  v37[4] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

}

- (void)setUpInfoLabelConstraints
{
  double v3;
  double v4;
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
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  -[PHSOSViewController marginPadding](self, "marginPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -v4));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

  v20 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v21, "bounds");
    v20 = v22 * 0.0599999987;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController infoLabel](self, "infoLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, v20));

  v29[0] = v9;
  v29[1] = v14;
  v29[2] = v19;
  v29[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (void)submitSOSResolutionMetric:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  int64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
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
  double v42;
  void *v43;
  unint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  void *v51;
  unsigned int v52;
  void *v53;
  unsigned int v54;
  void *v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  unsigned int v59;
  void *v60;
  unsigned int v61;
  void *v62;
  unsigned int v63;
  void *v64;
  unsigned int v65;
  void *v66;
  unsigned int v67;
  id v68;
  NSObject *v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  ICSCallAnalyticsLogger *v87;
  uint8_t buf[4];
  unsigned int v89;
  __int16 v90;
  unsigned int v91;
  __int16 v92;
  unsigned int v93;
  __int16 v94;
  unsigned int v95;
  __int16 v96;
  unsigned int v97;
  __int16 v98;
  unsigned int v99;
  __int16 v100;
  unsigned int v101;
  __int16 v102;
  unsigned int v103;
  __int16 v104;
  unsigned int v105;
  __int16 v106;
  uint64_t v107;

  v3 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v5 != CFSTR("PHSOSCallAssertionReason"))
    return;
  v6 = 1;
  switch(-[PHSOSViewController sosTrigger](self, "sosTrigger"))
  {
    case 1:
    case 2:
      v7 = +[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled");
      goto LABEL_5;
    case 3:
      v7 = +[SOSUtilities isCallWithVolumeLockHoldEnabled](SOSUtilities, "isCallWithVolumeLockHoldEnabled");
LABEL_5:
      v6 = (uint64_t)v7;
      break;
    case 5:
    case 7:
      break;
    default:
      v8 = sub_1000C5588();
      v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
        sub_1001A9534(self, v9);

      v6 = 0;
      break;
  }
  v10 = -[PHSOSViewController sosTrigger](self, "sosTrigger");
  if (+[SOSCoreAnalyticsReporter isSensitiveTrigger:](SOSCoreAnalyticsReporter, "isSensitiveTrigger:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v12 = objc_msgSend(v11, "isSafetyDataSubmissionAllowed");

    if (!v12)
      v10 = 9;
  }
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("trigger"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PHSOSViewController wasCallCancelled](self, "wasCallCancelled")));
  objc_msgSend(v13, "setValue:forKey:", v15, CFSTR("callCancelled"));

  -[PHSOSViewController timeTillCancelCall](self, "timeTillCancelCall");
  LODWORD(v17) = vcvtpd_s64_f64(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
  objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("timeTillCancel"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v13, "setValue:forKey:", v19, CFSTR("notificationPosted"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  objc_msgSend(v13, "setValue:forKey:", v20, CFSTR("autoCallEnabled"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PHSOSViewController callDisconnectReason](self, "callDisconnectReason")));
  objc_msgSend(v13, "setValue:forKey:", v21, CFSTR("callDisconnectReason"));

  -[PHSOSViewController timeTillActive](self, "timeTillActive");
  LODWORD(v23) = vcvtpd_s64_f64(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23));
  objc_msgSend(v13, "setValue:forKey:", v24, CFSTR("timeTillActive"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PHSOSViewController callAutoDialled](self, "callAutoDialled")));
  objc_msgSend(v13, "setValue:forKey:", v25, CFSTR("callAutoDialled"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController currentButtonPressState](self, "currentButtonPressState"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController currentButtonPressState](self, "currentButtonPressState"));
    objc_msgSend(v27, "getButtonPressGap");
    v29 = v28;

    LODWORD(v30) = vcvtpd_s64_f64(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30));
    objc_msgSend(v13, "setValue:forKey:", v31, CFSTR("clawButtonPressGap"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", ceil(v29 * 10.0) / 10.0));
    objc_msgSend(v13, "setValue:forKey:", v32, CFSTR("clawButtonPressGapFloat"));

  }
  if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)3
    || (+[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled") & 1) == 0&& ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)2|| (id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)1))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PHSOSViewController clawSwipeAfterRTCTimeout](self, "clawSwipeAfterRTCTimeout")));
    objc_msgSend(v13, "setValue:forKey:", v33, CFSTR("clawSwipeAfterRTCTimeout"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[PHSOSViewController clawResolution](self, "clawResolution")));
    objc_msgSend(v13, "setValue:forKey:", v34, CFSTR("clawResolution"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v35, "wasMounted")));
    objc_msgSend(v13, "setValue:forKey:", v36, CFSTR("wasMounted"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v37, "wasMountedProbability")));
    objc_msgSend(v13, "setValue:forKey:", v38, CFSTR("wasMountedProbability"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v39, "numberOfEpochsForMountProbability")));
    objc_msgSend(v13, "setValue:forKey:", v40, CFSTR("numberEpochs"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    if (!v41)
      goto LABEL_22;
    +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
    if (v42 <= 1.0)
      goto LABEL_22;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
    v44 = (unint64_t)objc_msgSend(v43, "timeToReleaseClaw");

    if ((v44 & 0x8000000000000000) == 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController slidingView](self, "slidingView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v41, "timeToReleaseClaw")));
      objc_msgSend(v13, "setValue:forKey:", v45, CFSTR("timeToReleaseClaw"));

LABEL_22:
    }
  }
  v87 = objc_alloc_init(ICSCallAnalyticsLogger);
  -[ICSCallAnalyticsLogger submitCAMetric:viewId:](v87, "submitCAMetric:viewId:", v13, CFSTR("com.apple.sos.resolution"));
  v46 = sub_1000C5588();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("trigger")));
    v78 = objc_msgSend(v85, "intValue");
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("callCancelled")));
    v76 = objc_msgSend(v83, "intValue");
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("timeTillCancel")));
    v75 = objc_msgSend(v81, "intValue");
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("notificationPosted")));
    v74 = objc_msgSend(v80, "intValue");
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("autoCallEnabled")));
    v73 = objc_msgSend(v79, "intValue");
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("callDisconnectReason")));
    v48 = objc_msgSend(v77, "intValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("timeTillActive")));
    v50 = objc_msgSend(v49, "intValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("callAutoDialled")));
    v52 = objc_msgSend(v51, "intValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("clawButtonPressGap")));
    v54 = objc_msgSend(v53, "intValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("clawButtonPressGapFloat")));
    objc_msgSend(v55, "doubleValue");
    *(_DWORD *)buf = 67111424;
    v89 = v78;
    v90 = 1024;
    v91 = v76;
    v92 = 1024;
    v93 = v75;
    v94 = 1024;
    v95 = v74;
    v96 = 1024;
    v97 = v73;
    v98 = 1024;
    v99 = v48;
    v100 = 1024;
    v101 = v50;
    v102 = 1024;
    v103 = v52;
    v104 = 1024;
    v105 = v54;
    v106 = 2048;
    v107 = v56;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Resolution details,trigger,%d,callCancelled,%d,timeTillCancel,%d,notificationPosted,%d,autoCallEnabled,%d,callDisconnectReason,%d,timeTillActive,%d,callAutoDialled,%d,clawButtonPressGap,%d,clawButtonPressGapFloat,%f", buf, 0x42u);

  }
  v57 = sub_1000C5588();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("clawResolution")));
    v82 = objc_msgSend(v86, "intValue");
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("wasMounted")));
    v59 = objc_msgSend(v84, "intValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("wasMountedProbability")));
    v61 = objc_msgSend(v60, "intValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("numberEpochs")));
    v63 = objc_msgSend(v62, "intValue");
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("timeToReleaseClaw")));
    v65 = objc_msgSend(v64, "intValue");
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("clawSwipeAfterRTCTimeout")));
    v67 = objc_msgSend(v66, "intValue");
    *(_DWORD *)buf = 67110400;
    v89 = v82;
    v90 = 1024;
    v91 = v59;
    v92 = 1024;
    v93 = v61;
    v94 = 1024;
    v95 = v63;
    v96 = 1024;
    v97 = v65;
    v98 = 1024;
    v99 = v67;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Resolution details II,clawResolution,%d,wasMounted,%d,wasMountedProbability,%d,numberEpochs,%d,timeToReleaseClaw,%d, clawSwipeAfterRTCTimeout,%d", buf, 0x26u);

  }
  v68 = sub_1000C5588();
  v69 = objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v70 = +[SOSUtilities isCallWithVolumeLockHoldEnabled](SOSUtilities, "isCallWithVolumeLockHoldEnabled");
    v71 = +[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled");
    v72 = +[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown");
    *(_DWORD *)buf = 67109632;
    v89 = v70;
    v90 = 1024;
    v91 = v71;
    v92 = 1024;
    v93 = v72;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Settings details,isCallWithVolumeLockHoldEnabled:%d,isCallWithSideButtonPressesEnabled:%d,emergencySOSSoundEnabled:%d", buf, 0x14u);
  }

}

- (void)submitSOSUserActivityMetric
{
  __CFString *v3;
  id v4;
  void *v5;
  double Current;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  PHSOSDialSlidingViewModel *v30;
  uint64_t v31;
  void *v32;
  ICSCallAnalyticsLogger *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  void *v44;
  double v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  __int16 v70;
  unsigned int v71;
  __int16 v72;
  unsigned int v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  unsigned int v77;
  __int16 v78;
  unsigned int v79;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController launchedForAssertionReason](self, "launchedForAssertionReason"));

  if (v3 == CFSTR("PHSOSCallAssertionReason"))
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSViewController sessionId](self, "sessionId"));
    objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("sessionId"));

    Current = CFAbsoluteTimeGetCurrent();
    -[PHSOSViewController sessionStartTime](self, "sessionStartTime");
    LODWORD(v8) = vcvtpd_s64_f64(vabdd_f64(Current, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("timeSinceSessionStart"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[PHSOSViewController slidingViewEntryReason](self, "slidingViewEntryReason")));
    objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("entryReason"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[PHSOSViewController slidingViewExitReason](self, "slidingViewExitReason")));
    objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("exitReason"));

    +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
    if (v12 == 0.0
      || (+[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport"), v45 != 0.0)
      && (id)-[PHSOSViewController slidingViewEntryReason](self, "slidingViewEntryReason") == (id)5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PHSOSViewController wasCallCancelled](self, "wasCallCancelled") ^ 1));
      objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("callConnected"));

      if (!-[PHSOSViewController wasCallCancelled](self, "wasCallCancelled"))
      {
        -[PHSOSViewController timeTillCancelCall](self, "timeTillCancelCall");
        LODWORD(v15) = vcvtpd_s64_f64(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
        objc_msgSend(v4, "setValue:forKey:", v16, CFSTR("callDuration"));

        -[PHSOSViewController callConnectTimeSinceSessionStart](self, "callConnectTimeSinceSessionStart");
        LODWORD(v18) = vcvtpd_s64_f64(fabs(v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v18));
        objc_msgSend(v4, "setValue:forKey:", v19, CFSTR("callConnectTimeSinceSessionStart"));

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PHSOSViewController callDisconnectReason](self, "callDisconnectReason")));
      objc_msgSend(v4, "setValue:forKey:", v20, CFSTR("callDisconnectReason"));

    }
    if ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)3
      || (+[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled") & 1) == 0&& ((id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)2|| (id)-[PHSOSViewController sosTrigger](self, "sosTrigger") == (id)1))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentSOSButtonPressState"));
      objc_msgSend(v22, "getButtonPressGap");
      v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", ceil(v24 * 10.0) / 10.0));
      objc_msgSend(v4, "setValue:forKey:", v25, CFSTR("clawButtonPressGapFloat"));

      +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
      if (v26 != 0.0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PHSOSViewController clawSwipeAfterRTCTimeout](self, "clawSwipeAfterRTCTimeout")));
        objc_msgSend(v4, "setValue:forKey:", v27, CFSTR("clawSwipeAfterRTCTimeout"));

      }
      if ((id)-[PHSOSViewController slidingViewExitReason](self, "slidingViewExitReason") == (id)4
        || (id)-[PHSOSViewController slidingViewExitReason](self, "slidingViewExitReason") == (id)7)
      {
        -[PHSOSViewController sliderProgressDuration](self, "sliderProgressDuration");
        v29 = v28;
        v30 = objc_alloc_init(PHSOSDialSlidingViewModel);
        LODWORD(v31) = vcvtpd_s64_f64(v29 * (double)-[PHSOSDialSlidingViewModel countdown](v30, "countdown"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v31));
        objc_msgSend(v4, "setValue:forKey:", v32, CFSTR("sliderProgressDuration"));

      }
    }
    v33 = objc_alloc_init(ICSCallAnalyticsLogger);
    -[ICSCallAnalyticsLogger submitCAMetric:viewId:](v33, "submitCAMetric:viewId:", v4, CFSTR("com.apple.sos.user_activity"));
    v34 = sub_1000C5588();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("sessionId")));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("timeSinceSessionStart")));
      v52 = objc_msgSend(v57, "intValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("entryReason")));
      v50 = objc_msgSend(v56, "intValue");
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("exitReason")));
      v49 = objc_msgSend(v55, "intValue");
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("callConnected")));
      v48 = objc_msgSend(v54, "intValue");
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("callDuration")));
      v47 = objc_msgSend(v53, "intValue");
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("callConnectTimeSinceSessionStart")));
      v46 = objc_msgSend(v51, "intValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("callDisconnectReason")));
      v38 = objc_msgSend(v37, "intValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("clawButtonPressGapFloat")));
      objc_msgSend(v39, "doubleValue");
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("clawSwipeAfterRTCTimeout")));
      v43 = objc_msgSend(v42, "intValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("sliderProgressDuration")));
      *(_DWORD *)buf = 138414850;
      v59 = v36;
      v60 = 1024;
      v61 = v52;
      v62 = 1024;
      v63 = v50;
      v64 = 1024;
      v65 = v49;
      v66 = 1024;
      v67 = v48;
      v68 = 1024;
      v69 = v47;
      v70 = 1024;
      v71 = v46;
      v72 = 1024;
      v73 = v38;
      v74 = 2048;
      v75 = v41;
      v76 = 1024;
      v77 = v43;
      v78 = 1024;
      v79 = objc_msgSend(v44, "intValue");
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,User Activity details,sessionId,%@,timeSinceSessionStart,%d,entryReason,%d,exitReason,%d,callConnected,%d,callDuration,%d,callConnectTimeSinceSessionStart,%d,callDisconnectReason,%d,clawButtonPressGapFloat,%f,clawSwipeAfterRTCTimeout,%d,sliderProgressDuration,%d", buf, 0x4Cu);

    }
  }
}

- (BOOL)isPendingAudioSessionActivation
{
  return self->_isPendingAudioSessionActivation;
}

- (void)setIsPendingAudioSessionActivation:(BOOL)a3
{
  self->_isPendingAudioSessionActivation = a3;
}

- (int64_t)sosMode
{
  return self->_sosMode;
}

- (NSArray)sosHandles
{
  return self->_sosHandles;
}

- (void)setSosHandles:(id)a3
{
  objc_storeStrong((id *)&self->_sosHandles, a3);
}

- (int64_t)sosTrigger
{
  return self->_sosTrigger;
}

- (void)setSosTrigger:(int64_t)a3
{
  self->_sosTrigger = a3;
}

- (PHAudioDeviceController)audioDeviceController
{
  return self->_audioDeviceController;
}

- (void)setAudioDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_audioDeviceController, a3);
}

- (PHBottomBarButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setCheckInView:(id)a3
{
  objc_storeStrong((id *)&self->_checkInView, a3);
}

- (void)setRestingView:(id)a3
{
  objc_storeStrong((id *)&self->_restingView, a3);
}

- (void)setAlertRestingView:(id)a3
{
  objc_storeStrong((id *)&self->_alertRestingView, a3);
}

- (void)setCountdownView:(id)a3
{
  objc_storeStrong((id *)&self->_countdownView, a3);
}

- (void)setSlidingView:(id)a3
{
  objc_storeStrong((id *)&self->_slidingView, a3);
}

- (void)setSosNumbersViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sosNumbersViewController, a3);
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (void)setMedicalIDNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, a3);
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
  objc_storeStrong((id *)&self->_currentView, a3);
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (int64_t)currentInteractiveState
{
  return self->_currentInteractiveState;
}

- (void)setCurrentInteractiveState:(int64_t)a3
{
  self->_currentInteractiveState = a3;
}

- (SOSButtonPressState)currentButtonPressState
{
  return self->_currentButtonPressState;
}

- (void)setCurrentButtonPressState:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonPressState, a3);
}

- (BOOL)shouldDropBioAuthTokenOnDismiss
{
  return self->_shouldDropBioAuthTokenOnDismiss;
}

- (void)setShouldDropBioAuthTokenOnDismiss:(BOOL)a3
{
  self->_shouldDropBioAuthTokenOnDismiss = a3;
}

- (BOOL)requestedCallActive
{
  return self->_requestedCallActive;
}

- (void)setRequestedCallActive:(BOOL)a3
{
  self->_requestedCallActive = a3;
}

- (BOOL)volumeHUDHiddenCurrently
{
  return self->_volumeHUDHiddenCurrently;
}

- (void)setVolumeHUDHiddenCurrently:(BOOL)a3
{
  self->_volumeHUDHiddenCurrently = a3;
}

- (BOOL)volumeHUDHiddenPending
{
  return self->_volumeHUDHiddenPending;
}

- (void)setVolumeHUDHiddenPending:(BOOL)a3
{
  self->_volumeHUDHiddenPending = a3;
}

- (BOOL)volumeMaxedCurrently
{
  return self->_volumeMaxedCurrently;
}

- (void)setVolumeMaxedCurrently:(BOOL)a3
{
  self->_volumeMaxedCurrently = a3;
}

- (BOOL)volumeMaxedPending
{
  return self->_volumeMaxedPending;
}

- (void)setVolumeMaxedPending:(BOOL)a3
{
  self->_volumeMaxedPending = a3;
}

- (float)priorSystemVolume
{
  return self->_priorSystemVolume;
}

- (void)setPriorSystemVolume:(float)a3
{
  self->_priorSystemVolume = a3;
}

- (TUAudioRoute)priorSystemAudioRoute
{
  return self->_priorSystemAudioRoute;
}

- (void)setPriorSystemAudioRoute:(id)a3
{
  objc_storeStrong((id *)&self->_priorSystemAudioRoute, a3);
}

- (BOOL)isUserResponsive
{
  return self->_isUserResponsive;
}

- (void)setIsUserResponsive:(BOOL)a3
{
  self->_isUserResponsive = a3;
}

- (BOOL)alreadyVisitedRestingScreen
{
  return self->_alreadyVisitedRestingScreen;
}

- (void)setAlreadyVisitedRestingScreen:(BOOL)a3
{
  self->_alreadyVisitedRestingScreen = a3;
}

- (NSDate)dateOfCall
{
  return self->_dateOfCall;
}

- (void)setDateOfCall:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfCall, a3);
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void)setStewieStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_stewieStateMonitor, a3);
}

- (CTStewieState)stewieState
{
  return self->_stewieState;
}

- (void)setStewieState:(id)a3
{
  objc_storeStrong((id *)&self->_stewieState, a3);
}

- (BOOL)shouldHandleAlertCallDisconnection
{
  return self->_shouldHandleAlertCallDisconnection;
}

- (void)setShouldHandleAlertCallDisconnection:(BOOL)a3
{
  self->_shouldHandleAlertCallDisconnection = a3;
}

- (NSString)launchedForAssertionReason
{
  return self->_launchedForAssertionReason;
}

- (void)setLaunchedForAssertionReason:(id)a3
{
  objc_storeStrong((id *)&self->_launchedForAssertionReason, a3);
}

- (double)countdownStartedTime
{
  return self->_countdownStartedTime;
}

- (void)setCountdownStartedTime:(double)a3
{
  self->_countdownStartedTime = a3;
}

- (double)countdownPausedTime
{
  return self->_countdownPausedTime;
}

- (void)setCountdownPausedTime:(double)a3
{
  self->_countdownPausedTime = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (double)timeTillCancelCall
{
  return self->_timeTillCancelCall;
}

- (void)setTimeTillCancelCall:(double)a3
{
  self->_timeTillCancelCall = a3;
}

- (BOOL)wasCallCancelled
{
  return self->_wasCallCancelled;
}

- (void)setWasCallCancelled:(BOOL)a3
{
  self->_wasCallCancelled = a3;
}

- (double)interactiveStartTime
{
  return self->_interactiveStartTime;
}

- (void)setInteractiveStartTime:(double)a3
{
  self->_interactiveStartTime = a3;
}

- (NSTimer)confirmationTimeoutTimer
{
  return self->_confirmationTimeoutTimer;
}

- (void)setConfirmationTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, a3);
}

- (NSTimer)statusHeartbeatTimer
{
  return self->_statusHeartbeatTimer;
}

- (void)setStatusHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusHeartbeatTimer, a3);
}

- (int)callDisconnectReason
{
  return self->_callDisconnectReason;
}

- (void)setCallDisconnectReason:(int)a3
{
  self->_callDisconnectReason = a3;
}

- (double)callDialStartTime
{
  return self->_callDialStartTime;
}

- (void)setCallDialStartTime:(double)a3
{
  self->_callDialStartTime = a3;
}

- (double)timeTillActive
{
  return self->_timeTillActive;
}

- (void)setTimeTillActive:(double)a3
{
  self->_timeTillActive = a3;
}

- (BOOL)callAutoDialled
{
  return self->_callAutoDialled;
}

- (void)setCallAutoDialled:(BOOL)a3
{
  self->_callAutoDialled = a3;
}

- (NSString)sosCallUUID
{
  return self->_sosCallUUID;
}

- (void)setSosCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sosCallUUID, a3);
}

- (BOOL)clawSwipeAfterRTCTimeout
{
  return self->_clawSwipeAfterRTCTimeout;
}

- (void)setClawSwipeAfterRTCTimeout:(BOOL)a3
{
  self->_clawSwipeAfterRTCTimeout = a3;
}

- (unint64_t)clawResolution
{
  return self->_clawResolution;
}

- (void)setClawResolution:(unint64_t)a3
{
  self->_clawResolution = a3;
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, a3);
}

- (CNKCoreAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (double)sliderProgressDuration
{
  return self->_sliderProgressDuration;
}

- (void)setSliderProgressDuration:(double)a3
{
  self->_sliderProgressDuration = a3;
}

- (double)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(double)a3
{
  self->_sessionStartTime = a3;
}

- (double)callConnectTimeSinceSessionStart
{
  return self->_callConnectTimeSinceSessionStart;
}

- (void)setCallConnectTimeSinceSessionStart:(double)a3
{
  self->_callConnectTimeSinceSessionStart = a3;
}

- (unint64_t)slidingViewEntryReason
{
  return self->_slidingViewEntryReason;
}

- (void)setSlidingViewEntryReason:(unint64_t)a3
{
  self->_slidingViewEntryReason = a3;
}

- (unint64_t)slidingViewExitReason
{
  return self->_slidingViewExitReason;
}

- (void)setSlidingViewExitReason:(unint64_t)a3
{
  self->_slidingViewExitReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_sosCallUUID, 0);
  objc_storeStrong((id *)&self->_statusHeartbeatTimer, 0);
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_launchedForAssertionReason, 0);
  objc_storeStrong((id *)&self->_stewieState, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_dateOfCall, 0);
  objc_storeStrong((id *)&self->_priorSystemAudioRoute, 0);
  objc_storeStrong((id *)&self->_currentButtonPressState, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);
  objc_storeStrong((id *)&self->_sosNumbersViewController, 0);
  objc_storeStrong((id *)&self->_slidingView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_alertRestingView, 0);
  objc_storeStrong((id *)&self->_restingView, 0);
  objc_storeStrong((id *)&self->_checkInView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_audioDeviceController, 0);
  objc_storeStrong((id *)&self->_sosHandles, 0);
}

@end
